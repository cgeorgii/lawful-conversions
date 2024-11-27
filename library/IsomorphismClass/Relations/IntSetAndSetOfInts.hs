{-# OPTIONS_GHC -Wno-orphans #-}

module IsomorphismClass.Relations.IntSetAndSetOfInts where

import IsomorphismClass.Classes
import IsomorphismClass.Prelude

instance IsSome (Set Int) IntSet where
  to = fromList . toList

instance IsSome IntSet (Set Int) where
  to = fromList . toList

instance Is (Set Int) IntSet

instance Is IntSet (Set Int)
