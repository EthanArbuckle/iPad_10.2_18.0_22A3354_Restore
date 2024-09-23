@implementation UIFont(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_lightWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:");
}

+ (uint64_t)siriui_thinWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:");
}

+ (uint64_t)siriui_mediumWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:");
}

+ (uint64_t)siriui_lightWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_thinWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_mediumWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_lightWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_thinWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_mediumWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_headerFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 32.0);
}

+ (uint64_t)siriui_largeHeaderFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:");
}

+ (uint64_t)siriui_subtitleFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 14.0);
}

+ (id)siriui_serverUtteranceFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)siriui_serverUtteranceCorrectionPromptFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
}

+ (uint64_t)siriui_serverTipFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
}

+ (id)siriui_serverTipPrefixFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)siriui_ratingFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.5, *MEMORY[0x24BDF7890]);
}

+ (uint64_t)siriui_userUtteranceFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
}

+ (uint64_t)siriui_typedTextInputFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x24BDF77B0], *MEMORY[0x24BDF7658]);
}

+ (uint64_t)siriui_dynamicHeaderFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
}

+ (uint64_t)siriui_dynamicBodyFont
{
  return objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

+ (id)siriui_dynamicTitle0Font
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7840]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v0, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (float)siriui_preferredDynamicBodySize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_scaledValueForValue:", 18.0);
  v2 = round(v1);

  return fmax(v2, 18.0);
}

+ (float)siriui_preferredDynamicBodySubtextSize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_scaledValueForValue:", 14.0);
  v2 = round(v1);

  return fmax(v2, 14.0);
}

+ (uint64_t)siriui_dynamicLightWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", v2);
}

+ (uint64_t)siriui_dynamicThinWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", v2);
}

+ (uint64_t)siriui_dynamicMediumWeightBodySizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", v2);
}

+ (uint64_t)siriui_dynamicLightWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", v2);
}

+ (uint64_t)siriui_dynamicThinWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", v2);
}

+ (uint64_t)siriui_dynamicMediumWeightBodySubtextSizeFont
{
  float v2;

  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", v2);
}

+ (id)siriUI_dynamicSubHeadlineMediumSizeFont
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v0, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)siriUI_dynamicSubHeadlineEmphasizedSizeFont
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v0, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
