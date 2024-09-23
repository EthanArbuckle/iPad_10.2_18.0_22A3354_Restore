@implementation PXActivitySpec

+ (double)headerDynamicTopToBottomTitleDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)headerDynamicBottomTitleToBottomSubtitleDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)headerDynamicBottomSubtitleToBottomDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)captionDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)invitationAvatarToTextBaselineDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)invitationTextToAlbumTitleBaselineDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)invitationAlbumTitleBottomDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)invitationSubscriberInfoToButtonsDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)invitationButtonToJunkBaselineDynamicDistance
{
  double v2;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return v2 + 22.0;
}

+ (double)invitationJunkBottomDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

+ (double)activityCaptionCellTopToTitleBaselineDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)activityCaptionTitleBaselineToSubtitleBaselineDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)activityCaptionSubtitleBaselineToCellBottomDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)activityCaptionSubtitleBaselineToCellBottomDynamicDistance2
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)activityCaptionCellTopToLikeButtonTopDynamicDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (UIImage)activityChevronImage
{
  if (activityChevronImage_onceToken != -1)
    dispatch_once(&activityChevronImage_onceToken, &__block_literal_global_215524);
  return (UIImage *)(id)activityChevronImage_image;
}

+ (UIImage)invitationHeaderImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.person.crop.fill"));
}

+ (NSDictionary)invitationTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48D0], 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)invitationSubtitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)invitationInfoTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)invitationAlbumTitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)invitationSubscriberInfoTextAttributes
{
  return +[PXActivitySpec invitationReportJunkTextAttributes](PXActivitySpec, "invitationReportJunkTextAttributes");
}

+ (NSDictionary)invitationReportJunkTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48F8], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)invitationReportJunkLinkAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48F8], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)activityCaptionTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)activityCaptionTextEmphasizedAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)activityDateSubtitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)sharedAlbumActivityGadgetCaptionTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (id)activityHeaderTextAttributesForTextColorStyle:(unint64_t)a3
{
  if (a3 == 1)
    +[PXActivitySpec _activityHeaderWhiteTextAttributes](PXActivitySpec, "_activityHeaderWhiteTextAttributes");
  else
    +[PXActivitySpec _activityHeaderTextAttributes](PXActivitySpec, "_activityHeaderTextAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)activityPosterTextAttributesForTextColorStyle:(unint64_t)a3
{
  if (a3 == 1)
    +[PXActivitySpec _activityPosterWhiteTextAttributes](PXActivitySpec, "_activityPosterWhiteTextAttributes");
  else
    +[PXActivitySpec _activityPosterTextAttributes](PXActivitySpec, "_activityPosterTextAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)activityAlbumTitleTextAttributesForTextColorStyle:(unint64_t)a3
{
  if (a3 == 1)
    +[PXActivitySpec _activityAlbumTitleWhiteTextAttributes](PXActivitySpec, "_activityAlbumTitleWhiteTextAttributes");
  else
    +[PXActivitySpec _activityAlbumTitleTextAttributes](PXActivitySpec, "_activityAlbumTitleTextAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)invitationParentViewBackgroundColor:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_activityHeaderTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_activityHeaderWhiteTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  +[PXActivitySpec _activityHeaderTextAttributes](PXActivitySpec, "_activityHeaderTextAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  return v3;
}

+ (id)_activityPosterTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_activityPosterWhiteTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  +[PXActivitySpec _activityPosterTextAttributes](PXActivitySpec, "_activityPosterTextAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  return v3;
}

+ (id)_activityAlbumTitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_activityAlbumTitleWhiteTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  +[PXActivitySpec _activityAlbumTitleTextAttributes](PXActivitySpec, "_activityAlbumTitleTextAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  return v3;
}

void __38__PXActivitySpec_activityChevronImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activityChevronImage_image;
  activityChevronImage_image = v0;

  v2 = (void *)activityChevronImage_image;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageByApplyingSymbolConfiguration:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)activityChevronImage_image;
  activityChevronImage_image = v3;

}

@end
