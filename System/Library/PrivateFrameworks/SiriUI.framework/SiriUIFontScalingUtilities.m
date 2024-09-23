@implementation SiriUIFontScalingUtilities

+ (double)labelLeadingForCurrentScale
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7690]) & 1) != 0)
  {
    v4 = 21.5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76B8]) & 1) != 0)
  {
    v4 = 22.5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76A8]) & 1) != 0)
  {
    v4 = 23.5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76A0]) & 1) != 0)
  {
    v4 = 24.5;
  }
  else
  {
    v4 = 26.0;
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7688]) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7680]) & 1) != 0)
      {
        v4 = 26.5;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7678]) & 1) != 0)
      {
        v4 = 27.5;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6A70], "siriui_serverUtteranceFont");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_scaledValueForValue:", 49.0);
        v7 = round(v6);

        v4 = v7 * 0.5;
      }
    }
  }

  return v4;
}

+ (id)paragraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3
{
  +[SiriUIFontScalingUtilities labelLeadingForCurrentScale](SiriUIFontScalingUtilities, "labelLeadingForCurrentScale");
  return (id)objc_msgSend(a1, "_paragraphStyleWithLeading:textAlignemtn:", a3);
}

+ (id)tallParagraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3
{
  double v5;

  +[SiriUIFontScalingUtilities labelLeadingForCurrentScale](SiriUIFontScalingUtilities, "labelLeadingForCurrentScale");
  return (id)objc_msgSend(a1, "_paragraphStyleWithLeading:textAlignemtn:", a3, ceil(v5 * 1.2));
}

+ (id)_paragraphStyleWithLeading:(double)a3 textAlignemtn:(int64_t)a4
{
  id v6;
  double v7;

  v6 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v6, "setMinimumLineHeight:", a3);
  objc_msgSend(v6, "setMaximumLineHeight:", a3);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  LODWORD(v7) = 1036831949;
  objc_msgSend(v6, "setHyphenationFactor:", v7);
  objc_msgSend(v6, "setAlignment:", a4);
  return v6;
}

@end
