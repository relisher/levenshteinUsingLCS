function longestCommonSubsequence(firstWord, secondWord)
  local lengthFirst = string.len(firstWord)
  local lengthSecond = string.len(secondWord)
  if (lengthFirst == 0) or (lengthSecond == 0) then
    return 0
  elseif string.sub(firstWord, lengthFirst, lengthFirst) == string.sub(secondWord, lengthSecond, lengthSecond) then
    return longestCommonSubsequence(string.sub(firstWord, 1, lengthFirst -1), string.sub(secondWord, 1, lengthSecond -1 )) + 1
  else
    local possibleLengthOne = longestCommonSubsequence(firstWord, string.sub(secondWord, 1, lengthSecond-1))
    local possibleLengthTwo = longestCommonSubsequence(string.sub(firstWord, 1, lengthFirst-1), secondWord)
    return math.max(possibleLengthOne, possibleLengthTwo)
  end
end
      
 
function levenshtein(firstWord, secondWord)
  lenOne = string.len(firstWord)  
  lenTwo = string.len(secondWord)
 
 -- Below are the base cases
 
  if (lenOne == 0) then
    if (lenTwo == 0) then
      levenshteinLength = 0
    else
      levenshteinLength = lenTwo
    end
  elseif (lenTwo == 0) then
    levenshteinLength = lenOne
  else
    
  -- algorithm for non base cases
  
  -- step 1, find longest common subsequence
  lcs = longestCommonSubsequence(firstWord, secondWord)
  -- step 2, use lcs for solution
  longerLen = math.max(lenOne, lenTwo)
  levenshteinLength = longerLen - lcs 
  end
return levenshteinLength
end


print "Enter the origin word"
wordOne = io.read()
print "Enter the final word"
wordTwo = io.read()

wordOne = string.lower(wordOne)
wordTwo = string.lower(wordTwo)

len = levenshtein(wordOne, wordTwo)
print(len)
