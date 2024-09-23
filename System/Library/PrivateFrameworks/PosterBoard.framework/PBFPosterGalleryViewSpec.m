@implementation PBFPosterGalleryViewSpec

+ (id)displayMonitor
{
  if (displayMonitor_onceToken != -1)
    dispatch_once(&displayMonitor_onceToken, &__block_literal_global_43);
  return (id)displayMonitor_displayMonitor;
}

void __42__PBFPosterGalleryViewSpec_displayMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)displayMonitor_displayMonitor;
  displayMonitor_displayMonitor = v0;

}

+ (id)specForScreen:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "specForScreenIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specForDisplayContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke;
  v30[3] = &unk_1E86F7B78;
  v8 = v4;
  v31 = v8;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openSessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  v26 = 3221225472;
  v27 = __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke_2;
  v28 = &unk_1E86F7BA0;
  v15 = v8;
  v29 = v15;
  objc_msgSend(v14, "bs_firstObjectPassingTest:", &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "scene", v25, v26, v27, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_FBSScene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0DC3BF8], "_screenWithFBSDisplayIdentity:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v21 = (void *)v20;
    goto LABEL_5;
  }
  +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "geometryIsEqualTo:", v15))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v21 = 0;
LABEL_5:

  if (v21)
  {
    objc_msgSend(a1, "specForScreen:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PBFLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      +[PBFPosterGalleryViewSpec specForDisplayContext:].cold.1((uint64_t)v8, v23);

    v22 = 0;
  }

  return v22;
}

uint64_t __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PBFGenericDisplayContext displayContextForDisplayIdentifier:](PBFGenericDisplayContext, "displayContextForDisplayIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "geometryIsEqualTo:", *(_QWORD *)(a1 + 32));

  return v7;
}

uint64_t __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PBFGenericDisplayContext displayContextForDisplayIdentifier:](PBFGenericDisplayContext, "displayContextForDisplayIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "geometryIsEqualTo:", *(_QWORD *)(a1 + 32));

  return v8;
}

+ (id)specForScreenIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PBFPosterGalleryViewSpec *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  PBFPosterGalleryViewSpec *v23;
  double v24;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(a1, "displayMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainIdentity");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (specForScreenIdentity__onceToken != -1)
    dispatch_once(&specForScreenIdentity__onceToken, &__block_literal_global_6_0);
  v6 = (id)specForScreenIdentity__specPerDisplayIdentity;
  objc_sync_enter(v6);
  objc_msgSend((id)specForScreenIdentity__specPerDisplayIdentity, "objectForKey:", v4);
  v7 = (PBFPosterGalleryViewSpec *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "displayMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationForIdentity:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "pointScale");
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "_screenWithFBSDisplayIdentity:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = PBFDeviceClassFromUserInterfaceIdiom(objc_msgSend(v21, "userInterfaceIdiom"));
    v23 = [PBFPosterGalleryViewSpec alloc];
    objc_msgSend(v21, "displayCornerRadius");
    v7 = -[PBFPosterGalleryViewSpec initWithReferenceBounds:deviceClass:displayCornerRadius:scale:](v23, "initWithReferenceBounds:deviceClass:displayCornerRadius:scale:", v22, v11, v13, v15, v17, v24, v19);
    objc_msgSend((id)specForScreenIdentity__specPerDisplayIdentity, "setObject:forKey:", v7, v4);

  }
  objc_sync_exit(v6);

  return v7;
}

void __50__PBFPosterGalleryViewSpec_specForScreenIdentity___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)specForScreenIdentity__specPerDisplayIdentity;
  specForScreenIdentity__specPerDisplayIdentity = v0;

}

- (PBFPosterGalleryViewSpec)initWithReferenceBounds:(CGRect)a3 deviceClass:(int64_t)a4 displayCornerRadius:(double)a5 scale:(double)a6
{
  CGFloat height;
  double width;
  double y;
  double x;
  PBFPosterGalleryViewSpec *v13;
  PBFPosterGalleryViewSpec *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double sectionHorizontalMargin;
  CGSize v24;
  double v25;
  uint64_t v26;
  UIFont *sectionHeaderTitleFont;
  uint64_t v28;
  UIColor *sectionHeaderTitleColor;
  uint64_t v30;
  UIColor *sectionHeaderSubtitleColor;
  uint64_t v32;
  uint64_t v33;
  UIFont *sectionHeaderSubtitleFont;
  uint64_t v35;
  UIFont *previewCellLabelFont;
  uint64_t v37;
  UIColor *previewCellLabelColor;
  uint64_t v39;
  UIFont *previewCellDescriptionLabelFont;
  uint64_t v41;
  UIColor *previewCellDescriptionLabelColor;
  objc_super v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterGalleryViewSpec;
  v13 = -[PBFPosterGalleryViewSpec init](&v44, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_referenceScale = a6;
    v13->_referenceBounds.origin.x = x;
    v13->_referenceBounds.origin.y = y;
    v13->_referenceBounds.size.width = width;
    v13->_referenceBounds.size.height = height;
    v13->_deviceClass = a4;
    v15 = 20.0;
    if (width > 375.0)
      v15 = 24.0;
    v13->_sectionHorizontalMargin = v15;
    *(_OWORD *)&v13->_sectionVerticalMargin = xmmword_1CBB8E4C0;
    v13->_groupSpacing = 16.0;
    if (a4 == 1)
    {
      v16 = 122.0;
    }
    else
    {
      UIRoundToScale();
      v16 = v17;
    }
    UIRoundToScale();
    v19 = v18;
    v14->_posterContentSize.width = v16;
    v14->_posterContentSize.height = v18;
    v14->_posterHeroContentSize.width = PBFPosterHeroContentSizeForBounds(x, y, width);
    v14->_posterHeroContentSize.height = v20;
    v14->_posterEditingConfirmationContentSize.height = 200.0;
    UIRoundToScale();
    v14->_posterEditingConfirmationContentSize.width = v21;
    if (a4 == 1)
    {
      v22 = v14->_standardSpacing * 3.0;
      sectionHorizontalMargin = v14->_sectionHorizontalMargin;
      v14->_portraitGallerySize.width = v22 + v16 * 4.0 + sectionHorizontalMargin * 2.0;
      v14->_portraitGallerySize.height = 870.0;
      v14->_landscapeGallerySize.width = v22 + v19 * 4.0 + sectionHorizontalMargin * 2.0;
      v14->_landscapeGallerySize.height = 1000.0;
    }
    else
    {
      v24 = (CGSize)*MEMORY[0x1E0C9D820];
      v14->_portraitGallerySize = (CGSize)*MEMORY[0x1E0C9D820];
      v14->_landscapeGallerySize = v24;
    }
    v25 = v16 / width * a5 * 1.35000002;
    if (v25 < 8.0)
      v25 = 8.0;
    v14->_posterCornerRadius = v25;
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC1420]);
    v26 = objc_claimAutoreleasedReturnValue();
    sectionHeaderTitleFont = v14->_sectionHeaderTitleFont;
    v14->_sectionHeaderTitleFont = (UIFont *)v26;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v28 = objc_claimAutoreleasedReturnValue();
    sectionHeaderTitleColor = v14->_sectionHeaderTitleColor;
    v14->_sectionHeaderTitleColor = (UIColor *)v28;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v30 = objc_claimAutoreleasedReturnValue();
    sectionHeaderSubtitleColor = v14->_sectionHeaderSubtitleColor;
    v14->_sectionHeaderSubtitleColor = (UIColor *)v30;

    v32 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1440]);
    v33 = objc_claimAutoreleasedReturnValue();
    sectionHeaderSubtitleFont = v14->_sectionHeaderSubtitleFont;
    v14->_sectionHeaderSubtitleFont = (UIFont *)v33;

    *(_OWORD *)&v14->_sectionHeaderSubtitleTopMargin = xmmword_1CBB8E4D0;
    v14->_sectionHeaderBottomSpacing = 8.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1438]);
    v35 = objc_claimAutoreleasedReturnValue();
    previewCellLabelFont = v14->_previewCellLabelFont;
    v14->_previewCellLabelFont = (UIFont *)v35;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v37 = objc_claimAutoreleasedReturnValue();
    previewCellLabelColor = v14->_previewCellLabelColor;
    v14->_previewCellLabelColor = (UIColor *)v37;

    v14->_previewCellLabelToImageVerticalSpacing = 5.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v32);
    v39 = objc_claimAutoreleasedReturnValue();
    previewCellDescriptionLabelFont = v14->_previewCellDescriptionLabelFont;
    v14->_previewCellDescriptionLabelFont = (UIFont *)v39;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v41 = objc_claimAutoreleasedReturnValue();
    previewCellDescriptionLabelColor = v14->_previewCellDescriptionLabelColor;
    v14->_previewCellDescriptionLabelColor = (UIColor *)v41;

    v14->_previewSmartAlbumCellAdditionalTopMargin = 4.0;
  }
  return v14;
}

- (CGSize)gallerySizeForPadOrientation:(int64_t)a3
{
  int IsPortrait;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  IsPortrait = BSInterfaceOrientationIsPortrait();
  v5 = 232;
  if (IsPortrait)
    v5 = 216;
  v6 = 240;
  if (IsPortrait)
    v6 = 224;
  v7 = *(double *)((char *)&self->super.isa + v6);
  v8 = *(double *)((char *)&self->super.isa + v5);
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)posterContentSizeForOrientation:(int64_t)a3
{
  int IsPortrait;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  IsPortrait = BSInterfaceOrientationIsPortrait();
  v5 = 176;
  if (IsPortrait)
    v6 = 168;
  else
    v6 = 176;
  if (!IsPortrait)
    v5 = 168;
  v7 = *(double *)((char *)&self->super.isa + v5);
  v8 = *(double *)((char *)&self->super.isa + v6);
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)heroSpacingForOrientation:(int64_t)a3
{
  char IsPortrait;
  double result;

  if (self->_deviceClass != 1)
    return self->_standardSpacing;
  IsPortrait = BSInterfaceOrientationIsPortrait();
  result = 14.0;
  if ((IsPortrait & 1) == 0)
    return self->_standardSpacing;
  return result;
}

- (CGRect)referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)referenceScale
{
  return self->_referenceScale;
}

- (CGSize)posterContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_posterContentSize.width;
  height = self->_posterContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)posterHeroContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_posterHeroContentSize.width;
  height = self->_posterHeroContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)posterEditingConfirmationContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_posterEditingConfirmationContentSize.width;
  height = self->_posterEditingConfirmationContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)posterCornerRadius
{
  return self->_posterCornerRadius;
}

- (double)sectionHorizontalMargin
{
  return self->_sectionHorizontalMargin;
}

- (double)sectionVerticalMargin
{
  return self->_sectionVerticalMargin;
}

- (double)standardSpacing
{
  return self->_standardSpacing;
}

- (double)groupSpacing
{
  return self->_groupSpacing;
}

- (UIFont)sectionHeaderTitleFont
{
  return self->_sectionHeaderTitleFont;
}

- (UIColor)sectionHeaderTitleColor
{
  return self->_sectionHeaderTitleColor;
}

- (UIFont)sectionHeaderSubtitleFont
{
  return self->_sectionHeaderSubtitleFont;
}

- (UIColor)sectionHeaderSubtitleColor
{
  return self->_sectionHeaderSubtitleColor;
}

- (double)sectionHeaderSubtitleTopMargin
{
  return self->_sectionHeaderSubtitleTopMargin;
}

- (double)sectionHeaderTopSpacing
{
  return self->_sectionHeaderTopSpacing;
}

- (double)sectionHeaderBottomSpacing
{
  return self->_sectionHeaderBottomSpacing;
}

- (UIFont)previewCellLabelFont
{
  return self->_previewCellLabelFont;
}

- (UIColor)previewCellLabelColor
{
  return self->_previewCellLabelColor;
}

- (double)previewCellLabelToImageVerticalSpacing
{
  return self->_previewCellLabelToImageVerticalSpacing;
}

- (UIFont)previewCellDescriptionLabelFont
{
  return self->_previewCellDescriptionLabelFont;
}

- (UIColor)previewCellDescriptionLabelColor
{
  return self->_previewCellDescriptionLabelColor;
}

- (double)previewSmartAlbumCellAdditionalTopMargin
{
  return self->_previewSmartAlbumCellAdditionalTopMargin;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (CGSize)portraitGallerySize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitGallerySize.width;
  height = self->_portraitGallerySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)landscapeGallerySize
{
  double width;
  double height;
  CGSize result;

  width = self->_landscapeGallerySize.width;
  height = self->_landscapeGallerySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewCellDescriptionLabelColor, 0);
  objc_storeStrong((id *)&self->_previewCellDescriptionLabelFont, 0);
  objc_storeStrong((id *)&self->_previewCellLabelColor, 0);
  objc_storeStrong((id *)&self->_previewCellLabelFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSubtitleColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSubtitleFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleFont, 0);
}

+ (void)specForDisplayContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_FAULT, "Nil matching screen for display context: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
