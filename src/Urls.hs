module Urls where

import Utils

import Control.Monad.Reader

urls :: ReaderT Cmds IO ()
urls = do
    pkgs <- cfgGet pkgVers
    liftIO $ mapM_ (putStrLn . createUrl) pkgs

createUrl (pkg, ver) = "http://hackage.haskell.org/packages/archive/" ++ pkg ++ "/" ++ ver ++ "/" ++ pkg ++ ".cabal"
