-- |
-- Module      :  Yi.Style.Monokai
-- Copyright   :  (c) Mateusz Kowalczyk 2013
-- License     :  BSD3
--
-- Maintainer  :  fuuzetsu@fuuzetsu.co.uk
-- Stability   :  experimental
-- Portability :  portable

module Yi.Style.Monokai
       ( monokaiTheme

         -- * Colours
       , monokaiYellowLight
       , monokaiYellowDark
       , monokaiYellow
       , monokaiPurpleLight
       , monokaiMagenta
       , monokaiGreyDark
       , monokaiGreen
       , monokaiGreyLight
       , monokaiGreyLightest
       , monokaiGreyDarkest
       , monokaiGrey
       , monokaiGreyDarker
       , monokaiBlueLight
       , monokaiPurple
       , monokaiGreenLight
       )
       where

import Data.Bits   (shiftR)
import Data.Monoid (mappend)
import Data.Word   (Word32)
import Yi

-- | The main theme specification. An example use in your @yi.hs@ might
-- look something like
--
-- @
-- main :: IO ()
-- main = yi $ myConfig {
--   defaultKm = defaultKm myConfig
--   , startFrontEnd = start
--   , configUI = (configUI defaultConfig) { configTheme = monokaiTheme }
--   }
-- @
monokaiTheme :: Proto UIStyle
monokaiTheme = defaultTheme `override` \sets _ -> sets
  { baseAttributes     = emptyAttributes { foreground = monokaiYellowLight
                                         , background = monokaiGreyDark
                                         , reverseAttr = False}
  , modelineAttributes = emptyAttributes { foreground = monokaiGreyLight
                                         , background = monokaiGreyLightest
                                         , reverseAttr = False }
  , selectedStyle      = withBg monokaiGreyDarker
  , hintStyle          = withBg monokaiGreyLightest
  , builtinStyle       = withFg monokaiGreen
  , commentStyle       = withFg monokaiYellowDark
  -- constantStyle would be great…
  -- no docstringStyle either?

  -- I hope variableStyle covers functions functions
  --  , variableStyle      = withFg monokaiGreenLight -- monokaiMagenta
  , keywordStyle       = withFg monokaiMagenta
  , stringStyle        = withFg monokaiYellow
  , typeStyle          = withFg monokaiBlueLight
  -- use error style for warnings
  , errorStyle         = withFg monokaiPurpleLight `mappend` withBd True

  , operatorStyle      = withFg monokaiMagenta

  , importStyle        = withFg monokaiMagenta
  -- , preprocessorStyle  = withFg preproc

  }


-- | Convenience function
rgb :: Word32 -> Color
rgb x = RGB (fi (x `shiftR` 16))
            (fi (x `shiftR` 8))
            (fi x)
  where
    fi = fromIntegral

-- | Hex value: 0x89BDFF
monokaiBlueLight :: Color
monokaiBlueLight = rgb 0x89BDFF
-- | Hex value: 0x595959
monokaiGrey :: Color
monokaiGrey = rgb 0x595959

-- | Hex value: 0x383830
monokaiGreyDarker :: Color
monokaiGreyDarker = rgb 0x383830

-- | Hex value: 0x141411
monokaiGreyDarkest :: Color
monokaiGreyDarkest = rgb 0x141411

-- | Hex value: 0x595959
monokaiGreyLightest :: Color
monokaiGreyLightest = rgb 0x595959

-- | Hex value: 0xE6E6E6
monokaiGreyLight :: Color
monokaiGreyLight = rgb 0xE6E6E6

-- | Hex value: 0xA6E22A
monokaiGreen :: Color
monokaiGreen = rgb 0xA6E22A

-- | Hex value: 0xA6E22E
monokaiGreenLight :: Color
monokaiGreenLight = rgb 0xA6E22E

-- | Hex value: 0x272822
monokaiGreyDark :: Color
monokaiGreyDark = rgb 0x272822

-- | Hex value: 0xF92672
monokaiMagenta :: Color
monokaiMagenta = rgb 0xF92672

-- | Hex value: 0xAE81FF
monokaiPurple :: Color
monokaiPurple = rgb 0xAE81FF

-- | Hex value: 0xFD5FF1
monokaiPurpleLight :: Color
monokaiPurpleLight = rgb 0xFD5FF1

-- | Hex value: 0xE6DB74
monokaiYellow :: Color
monokaiYellow = rgb 0xE6DB74

-- | Hex value: 0x75715E
monokaiYellowDark :: Color
monokaiYellowDark = rgb 0x75715E

-- | Hex value: 0xF8F8F2
monokaiYellowLight :: Color
monokaiYellowLight = rgb 0xF8F8F2
