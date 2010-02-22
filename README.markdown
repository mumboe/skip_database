SkipDatabase
============

Adds functionality to Test::Unit tests descending from ActiveSupport::TestCase to toggle database execution within a single test suite.

Installation
------------

gem install skip_database

Usage
-----

In order to toggle database skipping, run tests with the --skip-database command-line option.

Within test classes descending from ActiveSupport::TestCase, commands executed within the skip_database block are only executed
when the skip-database option is set. Commands within the with_database block are only executed for tests run with database execution.

SkipDatabase uses "UnitRecord":http://github.com/dan-manges/unit-record to raise exceptions when database statements are executed. By default, ActiveRecord::Base is disconnected with the options :stub_associations set to true and :strategy set to :raise.

Immediately after ActiveRecord::Base is disconnected, SkipDatabase requires any files found in test/skip_database/ under the Rails root directory.

Example
-------

  class UserTest < ActiveSupport::TestCase

    def test_user_name_must_be_unique
  
      user = User.new(:first => "Elwin", :last => "Ransom")
    
      # this block won't be executed unless we're skipping the database
      skip_database do
        User.expects(:create!).with(:first => user.first, :last => user.last)
        user.expects(:save).returns false
        user.errors.add(:name, "must be unique")
      end
    
      User.create!(:first => "Elwin", :last => "Ransom")
      assert !user.save
    
      assert_equal user.errors.on(:name), "must be unique"
    end

    # Do not run the following tests when skipping database execution
    with_database do
  
      def test_complex_methods
        Company.build_by_factory(:users => 3, :admin => 1)
      
        users = User.find_by_sql <<-SQL
                                    select * from users
                                    join permissions on permissions.user_id = users.id
                                    join companies on companies.id = users.company_id
                                    where permissions.role = 'user' and companies.active is true
                                  SQL
      
        admins = User.find_by_sql <<-SQL
                                    select * from users
                                    join permissions on permissions.user_id = users.id
                                    join companies on companies.id = users.company_id
                                    where permissions.role = 'admin' and companies.active is true
                                  SQL
      
        assert_equal 2, users.size
        assert_equal 1, admins.size
      end
  
    end

  end

$ ruby test/unit/user_test.rb --skip-database
Loaded suite test/unit/user_test
Started
.
Finished in 0.01123 seconds.

1 tests, 4 assertions, 0 failures, 0 errors

$ ruby test/unit/user_test.rb
Loaded suite test/unit/user_test
Started
..
Finished in 0.31526 seconds.

2 tests, 4 assertions, 0 failures, 0 errors


Copyright (c) 2010 Mike Bradford <mbradford@mumboe.com>, released under the MIT license 
