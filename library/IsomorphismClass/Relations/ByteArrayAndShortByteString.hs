{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.ByteArrayAndShortByteString where

import qualified Data.ByteString.Short
import qualified Data.ByteString.Short.Internal
import qualified Data.Primitive.ByteArray
import IsomorphismClass.Classes

instance IsSome Data.ByteString.Short.ShortByteString Data.Primitive.ByteArray.ByteArray where
  to (Data.Primitive.ByteArray.ByteArray array) =
    Data.ByteString.Short.Internal.SBS array

instance IsSome Data.Primitive.ByteArray.ByteArray Data.ByteString.Short.ShortByteString where
  to (Data.ByteString.Short.Internal.SBS array) =
    Data.Primitive.ByteArray.ByteArray array

instance Is Data.Primitive.ByteArray.ByteArray Data.ByteString.Short.ShortByteString

instance Is Data.ByteString.Short.ShortByteString Data.Primitive.ByteArray.ByteArray
