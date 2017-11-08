
class SafeForWorkValidator < ActiveModel::EachValidator
    BAD_WORDS = %(darn gosh heck golly)

    def validate_each(record, attribute, value)
        if BAD_WORDS.any? {|word| value.include?(word)}
            record.errors[attribute] << (option[:message] || "it's not safe for work")
        end
    end
end

class User < ActiveRecord::Base
    validaates :username, safe_for_work: true
end

class Admin < ActiveRecord::Base
    validaates :username, safe_for_work: true
end
