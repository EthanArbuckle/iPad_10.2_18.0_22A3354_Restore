@implementation TFLinkableHeaderFooterViewSpecification

+ (double)topPaddingFromFirstBaselineForShowingHeader:(BOOL)a3
{
  __n128 v3;
  __n128 v4;
  double result;

  if (a3)
  {
    v3.n128_u64[0] = 0x4046800000000000;
    v4.n128_u64[0] = 0x404E800000000000;
  }
  else
  {
    v3.n128_u64[0] = 20.0;
    v4.n128_u64[0] = 27.0;
  }
  PPMScaledFloatValue(a1, a2, v3, v4);
  return result;
}

+ (double)bottomPaddingForShowingHeader:(BOOL)a3
{
  __n128 v3;
  __n128 v4;
  double result;

  if (a3)
  {
    v3.n128_u64[0] = 10.0;
    v4.n128_u64[0] = 14.0;
  }
  else
  {
    v3.n128_u64[0] = 20.0;
    v4.n128_u64[0] = 27.0;
  }
  PPMScaledFloatValue(a1, a2, v3, v4);
  return result;
}

+ (id)createTextViewFontForTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77D0], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)textViewFontColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

@end
