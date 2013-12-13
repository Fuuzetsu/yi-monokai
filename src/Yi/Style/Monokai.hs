module Yi.Style.Monokai where

import Data.Bits
import Data.Monoid
import Data.Word

import Yi
import Yi.Style
import Yi.Style.Library

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
  , variableStyle      = withFg monokaiMagenta
  , keywordStyle       = withFg monokaiMagenta
  , stringStyle        = withFg monokaiYellow
  , typeStyle          = withFg monokaiBlueLight
  -- use error style for warnings
  , errorStyle         = withFg monokaiPurpleLight `mappend` withBd True

  , operatorStyle      = withFg monokaiMagenta

  , importStyle        = withFg monokaiMagenta
  -- , preprocessorStyle  = withFg preproc

  }


rgb :: Word32 -> Color
rgb x = RGB (fi (x `shiftR` 16))
            (fi (x `shiftR` 8))
            (fi x)
  where
    fi = fromIntegral


monokaiBlueLight :: Color
monokaiBlueLight = rgb 0x89BDFF

monokaiGrey :: Color
monokaiGrey = rgb 0x595959

monokaiGreyDarker :: Color
monokaiGreyDarker = rgb 0x383830

monokaiGreyDarkest :: Color
monokaiGreyDarkest = rgb 0x141411

monokaiGreyLightest :: Color
monokaiGreyLightest = rgb 0x595959

monokaiGreyLight :: Color
monokaiGreyLight = rgb 0xE6E6E6

monokaiGreen :: Color
monokaiGreen = rgb 0xA6E22A

monokaiGreenLight :: Color
monokaiGreenLight = rgb 0xA6E22E

monokaiGreyDark :: Color
monokaiGreyDark = rgb 0x272822

monokaiMagenta :: Color
monokaiMagenta = rgb 0xF92672

monokaiPurple :: Color
monokaiPurple = rgb 0xAE81FF

monokaiPurpleLight :: Color
monokaiPurpleLight = rgb 0xFD5FF1

monokaiYellow :: Color
monokaiYellow = rgb 0xE6DB74

monokaiYellowDark :: Color
monokaiYellowDark = rgb 0x75715E

monokaiYellowLight :: Color
monokaiYellowLight = rgb 0xF8F8F2
