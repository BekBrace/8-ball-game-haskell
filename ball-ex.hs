import System.Random (randomRIO)  -- Import randomRIO function from System.Random module

-- Define a type for the possible answers
data Answer = Yes | No | Maybe | AskAgainLater | CannotPredict deriving Show  -- Define an algebraic data type for Magic 8-Ball answers

-- Function to simulate the 8-ball response
magic8Ball :: IO Answer  -- Declare a function that returns an IO action with the type Answer
magic8Ball = do  -- Start of do block for magic8Ball
    randomNumber <- randomRIO (1 :: Int, 5)  -- Generate a random number between 1 and 5
    return $ case randomNumber of  -- Use a case expression to map the random number to an Answer
        1 -> Yes
        2 -> No
        3 -> Maybe
        4 -> AskAgainLater
        5 -> CannotPredict

main :: IO ()  -- Declare the main function with the IO action type
main = do  -- Start of do block for main
    putStrLn "Welcome to the Magic 8-Ball!"  -- Print a welcome message
    putStrLn "Ask a yes-or-no question, and the 8-ball will provide an answer."  -- Print instructions
    putStrLn "Type 'exit' to end the simulation."  -- Print exit instructions

    -- Loop to repeatedly ask questions until the user decides to exit
    askQuestions

askQuestions :: IO ()  -- Declare a function with the IO action type
askQuestions = do  -- Start of do block for askQuestions
    putStr "Your question: "  -- Prompt the user to enter a question
    question <- getLine  -- Read a line of input from the user

    -- Check if the user wants to exit
    if question == "exit"
        then putStrLn "Exiting the Magic 8-Ball simulation."  -- Print exit message
        else do
            answer <- magic8Ball  -- Call the magic8Ball function to get an answer
            putStrLn $ "The 8-ball says: " ++ show answer  -- Print the 8-ball's response
            askQuestions  -- Recursive call to keep asking questions

