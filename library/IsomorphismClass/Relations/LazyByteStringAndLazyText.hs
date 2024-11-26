{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.LazyByteStringAndLazyText where

import qualified Data.ByteString.Lazy
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Encoding
import IsomorphismClass.Classes
import IsomorphismClass.Prelude

instance IsSome Data.ByteString.Lazy.ByteString Data.Text.Lazy.Text where
  to = Data.Text.Lazy.Encoding.encodeUtf8
  maybeFrom = either (const Nothing) Just . Data.Text.Lazy.Encoding.decodeUtf8'
