{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.LazyTextBuilderAndStrictTextBuilder where

#if MIN_VERSION_text(2,0,2)

import qualified Data.Text.Encoding
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Builder
import IsomorphismClass.Classes
import IsomorphismClass.Prelude

instance IsSome Data.Text.Lazy.Builder.Builder Data.Text.Encoding.StrictBuilder where
  to = Data.Text.Lazy.Builder.fromText . Data.Text.Encoding.strictBuilderToText

instance IsSome Data.Text.Encoding.StrictBuilder Data.Text.Lazy.Builder.Builder where
  to = Data.Text.Encoding.textToStrictBuilder . Data.Text.Lazy.toStrict . Data.Text.Lazy.Builder.toLazyText

instance Is Data.Text.Lazy.Builder.Builder Data.Text.Encoding.StrictBuilder

instance Is Data.Text.Encoding.StrictBuilder Data.Text.Lazy.Builder.Builder

#endif
