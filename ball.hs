import System.Random (randomRIO)

-- Define a type for the possible answers
data Answer = Yes | No | Maybe | AskAgainLater | CannotPredict deriving Show

-- Function to simulate the 8-ball response
magic8Ball :: IO Answer
magic8Ball = do
    randomNumber <- randomRIO (1 :: Int, 5)  -- Generate a random number between 1 and 5
    return $ case randomNumber of
        1 -> Yes
        2 -> No
        3 -> Maybe
        4 -> AskAgainLater
        5 -> CannotPredict

main :: IO ()
main = do
    putStrLn "Welcome to the Magic 8-Ball!"
    putStrLn "Ask a yes-or-no question, and the 8-ball will provide an answer."
    putStrLn "Type 'exit' to end the simulation."

    -- Loop to repeatedly ask questions until the user decides to exit
    askQuestions

askQuestions :: IO ()
askQuestions = do
    putStr "Your question: "
    question <- getLine

    -- Check if the user wants to exit
    if question == "exit"
        then putStrLn "Exiting the Magic 8-Ball simulation."
        else do
            answer <- magic8Ball
            putStrLn $ "The 8-ball says: " ++ show answer
            askQuestions  -- Recursive call to keep asking questions

