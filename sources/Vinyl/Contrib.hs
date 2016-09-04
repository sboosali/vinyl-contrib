{-# LANGUAGE RankNTypes, ConstraintKinds, ScopedTypeVariables #-}
-- {-# LANGUAGE AllowAmbiguousTypes #-} -- TODO

module Vinyl.Contrib where

import Data.Vinyl
import Data.Vinyl.TypeLevel
-- import Data.Vinyl.Functor
-- import Data.Vinyl.Notation
-- import Data.Vinyl.Class.Method

rlift2
 :: forall f as constraint. (RecAll f as constraint)
 => (forall a. (constraint (f a)) => f a -> f a -> f a)
 -> Rec f as
 -> Rec f as
 -> Rec f as

-- rlift2
--  :: (RecAll f as constraint)
--  => (forall a b. (constraint (f a)) => f a -> f a -> f b)
--  -> Rec f as
--  -> Rec f as
--  -> Rec f bs

-- rlift2
--  :: (RecAll f rs constraint)
--  => (forall a b c. (constraint a b) => f a -> f b -> f c)
--  -> Rec f as
--  -> Rec f bs
--  -> Rec f cs

-- rlift2 :: RecAll f rs Eq => (forall a b c. f a -> g b -> h c) -> Rec f as -> Rec g bs -> Rec h cs

rlift2 _ RNil RNil = RNil
rlift2 f (a :& as) (b :& bs) = f a b :& rlift2 f as bs

radd :: RecAll f rs Num => Rec f rs -> Rec f rs -> Rec f rs
radd = rlift2 (+)
