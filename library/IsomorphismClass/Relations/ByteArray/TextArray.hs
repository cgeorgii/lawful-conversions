{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.ByteArray.TextArray where

#if !MIN_VERSION_text(2,1,0)

import qualified Data.Primitive.ByteArray
import qualified Data.Text.Array
import IsomorphismClass.Classes
import IsomorphismClass.Prelude
import qualified IsomorphismClass.TextCompat.Array

instance PartiallyIsomorphicTo Data.Primitive.ByteArray.ByteArray Data.Text.Array.Array where
  to = IsomorphismClass.TextCompat.Array.toByteArray
  partiallyFrom = Just . to

instance PartiallyIsomorphicTo Data.Text.Array.Array Data.Primitive.ByteArray.ByteArray where
  to = IsomorphismClass.TextCompat.Array.fromByteArray
  partiallyFrom = Just . to

instance IsomorphicTo Data.Primitive.ByteArray.ByteArray Data.Text.Array.Array

instance IsomorphicTo Data.Text.Array.Array Data.Primitive.ByteArray.ByteArray

#endif
