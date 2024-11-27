{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.LazyByteStringAndShortByteString where

import qualified Data.ByteString.Lazy
import qualified Data.ByteString.Short
import IsomorphismClass.Classes
import IsomorphismClass.Prelude

instance IsSome Data.ByteString.Lazy.ByteString Data.ByteString.Short.ShortByteString where
  to = Data.ByteString.Lazy.fromStrict . Data.ByteString.Short.fromShort

instance IsSome Data.ByteString.Short.ShortByteString Data.ByteString.Lazy.ByteString where
  to = Data.ByteString.Short.toShort . Data.ByteString.Lazy.toStrict

instance Is Data.ByteString.Lazy.ByteString Data.ByteString.Short.ShortByteString

instance Is Data.ByteString.Short.ShortByteString Data.ByteString.Lazy.ByteString