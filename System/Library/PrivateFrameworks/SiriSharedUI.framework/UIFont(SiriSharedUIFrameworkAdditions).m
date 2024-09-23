@implementation UIFont(SiriSharedUIFrameworkAdditions)

+ (uint64_t)sirisharedui_lightWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
}

+ (uint64_t)sirisharedui_thinWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_mediumWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_regularWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", a1, *MEMORY[0x1E0DC1440]);
}

+ (uint64_t)sirisharedui_semiboldWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", a1, *MEMORY[0x1E0DC1448]);
}

+ (uint64_t)sirisharedui_boldWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_lightWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_thinWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_mediumWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_lightWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_thinWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_mediumWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_headerFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 32.0);
}

+ (uint64_t)sirisharedui_largeHeaderFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_subtitleFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 14.0);
}

+ (id)sirisharedui_serverUtteranceFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)sirisharedui_serverUtteranceCorrectionPromptFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

+ (uint64_t)sirisharedui_serverTipFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
}

+ (id)sirisharedui_serverTipPrefixFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)sirisharedui_ratingFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.5, *MEMORY[0x1E0DC1448]);
}

+ (uint64_t)sirisharedui_userUtteranceFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
}

+ (uint64_t)sirisharedui_typedTextInputFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48D0]);
}

+ (uint64_t)sirisharedui_dynamicHeaderFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
}

+ (uint64_t)sirisharedui_dynamicBodyFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)sirisharedui_dynamicTitle0Font
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B48]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v0, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (float)sirisharedui_preferredDynamicBodySize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_scaledValueForValue:", 18.0);
  v2 = round(v1);

  return fmax(v2, 18.0);
}

+ (float)sirisharedui_preferredDynamicBodySubtextSize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_scaledValueForValue:", 14.0);
  v2 = round(v1);

  return fmax(v2, 14.0);
}

+ (uint64_t)sirisharedui_dynamicLightWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", v2);
}

+ (uint64_t)sirisharedui_dynamicThinWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", v2);
}

+ (uint64_t)sirisharedui_dynamicMediumWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", v2);
}

+ (uint64_t)sirisharedui_dynamicLightWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", v2);
}

+ (uint64_t)sirisharedui_dynamicThinWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", v2);
}

+ (uint64_t)sirisharedui_dynamicMediumWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", v2);
}

@end
