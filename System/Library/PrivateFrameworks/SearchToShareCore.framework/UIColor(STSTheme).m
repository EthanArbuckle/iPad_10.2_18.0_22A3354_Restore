@implementation UIColor(STSTheme)

+ (uint64_t)sts_primaryResultTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 1.0);
}

+ (uint64_t)sts_secondaryResultTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.55, 1.0);
}

+ (uint64_t)sts_searchErrorTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.4, 1.0);
}

+ (uint64_t)sts_magnifyingGlassGrayTintColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.55, 0.55, 0.57, 1.0);
}

+ (uint64_t)sts_searchBarBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.1);
}

+ (uint64_t)sts_headerViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

+ (uint64_t)sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
}

+ (uint64_t)sts_defaultBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
}

+ (uint64_t)sts_defaultCellPlaceholderColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.74902, 1.0);
}

+ (uint64_t)sts_detailViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.7);
}

+ (id)sts_colorFromHexString:()STSTheme alpha:
{
  void *v5;
  void *v6;
  int v8;

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (objc_msgSend(v5, "scanHexInt:", &v8))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)BYTE2(v8) / 255.0, (double)BYTE1(v8) / 255.0, (double)v8 / 255.0, a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (uint64_t)sts_providerImageColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.5255, 0.5608, 0.6, 1.0);
}

@end
