def caesar_cipher(string, rotate)

    # Populate alphabet array
    alphabet = []
    for char in "a".."z" do
        alphabet.push(char)
    end

    # Split string into individual chars
    string_array = string.split('')

    def convert_char(alphabet, char, rotate)
        # If non-alphabet letter return unchanged
        if !alphabet.include?(char.downcase)
            return char
        end
        
        # Check whether alphabet letter is upper or lower case
        upper_case = false
        if char.upcase == char
            upper_case = true
        end
        
        # Convert uppercase chars to downcase
        char.downcase!
        
        # Find index in alphabet
        index = alphabet.find_index(char)
        new_index = index + rotate
        # Wrap alphabet
        if new_index > 25
            new_index = new_index % 26
        end

        # Return char in correct case
        upper_case ? alphabet[new_index].upcase : alphabet[new_index]

    end

    # Convert each char and build return string
    converted_string = ""
    for char in string_array do
        converted_string += convert_char(alphabet, char, rotate)
    end

    converted_string
end

# Get user input for conversion
puts "Enter plaintext to cipher:"
original = gets.chomp
puts "Enter cipher rotation:"
rotation = gets.chomp.to_i

puts caesar_cipher(original, rotation)