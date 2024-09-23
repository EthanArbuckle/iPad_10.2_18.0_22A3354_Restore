@implementation PUFeedViewControllerPadSpec

- (BOOL)shouldShowCommentBadgesInCollectionViewType:(int64_t)a3
{
  return a3 == 1;
}

- (void)configureFeedCollectionViewLayout:(id)a3 forCollectionViewType:(int64_t)a4 collectionViewSize:(CGSize)a5 collectionViewContentInset:(UIEdgeInsets *)a6
{
  double height;
  double width;
  id v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  objc_super v18;
  CGRect v19;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = 0.0;
  if (height <= width)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v14 = CGRectGetWidth(v19);

    objc_msgSend(MEMORY[0x1E0D7B560], "layoutMarginWidthInterpolator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForMetric:", v14);
    v12 = v16;

    if (v12 <= 104.0 && width >= 1112.0)
      v12 = 104.0;
  }
  v18.receiver = self;
  v18.super_class = (Class)PUFeedViewControllerPadSpec;
  -[PUFeedViewControllerSpec configureFeedCollectionViewLayout:forCollectionViewType:collectionViewSize:collectionViewContentInset:](&v18, sel_configureFeedCollectionViewLayout_forCollectionViewType_collectionViewSize_collectionViewContentInset_, v11, a4, a6, width + v12 * -2.0, height);
  a6->top = 0.0;
  a6->left = v12;
  a6->bottom = 0.0;
  a6->right = v12;
  if (a4 == 1)
    objc_msgSend(v11, "setShouldFloatOverShortDistances:", 1);

}

- (CGSize)minimumVideoTileSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 144.0;
  v3 = 144.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)largeNumberOfSubjectsForLikes
{
  return 10;
}

- (void)configureCommentSeparatorMetrics:(PUFeedSeparatorMetrics *)a3
{
  CGFloat v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFeedViewControllerPadSpec;
  -[PUFeedViewControllerSpec configureCommentSeparatorMetrics:](&v6, sel_configureCommentSeparatorMetrics_);
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  a3->var1.right = v5;
}

- (CGSize)thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 120.0;
  v3 = 120.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldUseAspectThumbnails
{
  return 1;
}

- (CGSize)thumbnailSizeForImageSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width <= a3.height * 1.01999998)
  {
    if (a3.width * 1.01999998 >= a3.height)
    {
      v4 = 90.0;
      v3 = 90.0;
    }
    else
    {
      v3 = 120.0;
      v4 = 90.0;
    }
  }
  else
  {
    v3 = 90.0;
    v4 = 120.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (int64_t)configurationForSectionHeaderType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  void *v7;

  switch(a3)
  {
    case 1:
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "showGroupIDHeaders");

      goto LABEL_6;
    case 2:
    case 3:
    case 4:
      v5 = 1;
LABEL_6:
      v6 = 1;
      break;
    case 5:
    case 6:
      v5 = 2;
      v6 = 2;
      break;
    default:
      v5 = 0;
      v6 = 0;
      break;
  }
  if (a4)
    return v5;
  else
    return v6;
}

- (void)configureSeparatorMetrics:(PUFeedSeparatorMetrics *)a3 betweenSectionWithInfo:(id)a4 andSectionWithInfo:(id)a5 joined:(BOOL)a6 collectionViewType:(int64_t)a7
{
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUFeedViewControllerPadSpec;
  -[PUFeedViewControllerSpec configureSeparatorMetrics:betweenSectionWithInfo:andSectionWithInfo:joined:collectionViewType:](&v12, sel_configureSeparatorMetrics_betweenSectionWithInfo_andSectionWithInfo_joined_collectionViewType_, a3, a4, a5, a6);
  if (!a7)
  {
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    a3->var1.left = v10;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    a3->var1.right = v11;
  }
}

- (void)getReferenceMaximumLength:(double *)a3 minimumNumberOfTilesToOmit:(int64_t *)a4 forSectionType:(int64_t)a5 collectionViewType:(int64_t)a6
{
  double v6;
  int64_t v7;

  v6 = 0.0;
  if (a5 == 3)
  {
    if (a6 == 1)
      v6 = 2400.0;
    if (!a6)
      v6 = 1200.0;
    v7 = 10;
    if (a3)
      goto LABEL_6;
  }
  else
  {
    v7 = 10;
    if (a5)
      v7 = 0;
    else
      v6 = 6400.0;
    if (a3)
LABEL_6:
      *a3 = v6;
  }
  if (a4)
    *a4 = v7;
}

- (BOOL)shouldHideBarsInLandscape
{
  return 0;
}

- (BOOL)shouldShowInvitationsInPopover
{
  return 1;
}

- (id)gridSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPadSpec);
}

- (id)popoverFeedViewControllerSpec
{
  return objc_alloc_init(PUFeedViewControllerPopoverSpec);
}

- (int64_t)promptStyle
{
  return 1;
}

- (BOOL)shouldUseFullscreenLayout
{
  return 1;
}

- (id)defaultTextAttributesForCollectionViewType:(int64_t)a3
{
  void *v3;
  void *v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textBlockBelowArtTitleTextAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)emphasizedTextAttributesForCollectionViewType:(int64_t)a3
{
  void *v3;
  void *v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textBlockBelowArtTitleEmphasizedTextAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)configureTextCell:(id)a3 forSectionHeaderWithDescriptionPhrase:(id)a4 streamDisclosureLabel:(id)a5 actionText:(id)a6 buttonType:(int64_t)a7 collectionViewType:(int64_t)a8 animated:(BOOL)a9
{
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  void *v30;
  _BOOL8 v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;

  v42 = a3;
  v15 = a5;
  v16 = a6;
  v18 = *MEMORY[0x1E0DC49E8];
  v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v21 = a4;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8 == 1)
  {
    v28 = 0;
    v24 = 0.0;
    v25 = 5.0;
    v26 = 10.0;
    v27 = 5.0;
  }
  else if (a8)
  {
    v28 = 0;
    v26 = v19;
    v25 = v20;
    v24 = v17;
    v27 = v18;
  }
  else
  {
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v24 = v23;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v25 = round(*(double *)&PUMainScreenScale_screenScale * 7.5) / *(double *)&PUMainScreenScale_screenScale;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v27 = 6.0;
    v28 = 1;
  }
  v41 = v22;
  v37 = v27;
  v39 = v26;
  if (v15)
  {
    v29 = v15;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityChevronImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a9;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v17 = round(*(double *)&PUMainScreenScale_screenScale * 4.5) / *(double *)&PUMainScreenScale_screenScale;
    objc_msgSend(v42, "setTappable:", 1, *(_QWORD *)&v37, *(_QWORD *)&v39, v41);
    v32 = 2;
    objc_msgSend(v42, "setTappableArea:", 2);
    v33 = 0.0;
    v34 = 1.0;
    v19 = 0.0;
    v20 = 0.0;
    v18 = 0.0;
  }
  else
  {
    v33 = *MEMORY[0x1E0DC51A8];
    v34 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v31 = a9;
    if (v16)
    {
      if (a8)
        objc_msgSend(v22, "cloudFeedInteractionTextAttributes");
      else
        objc_msgSend(v22, "cloudFeedInteractionLargerTextAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v35);
      objc_msgSend(v42, "setTappable:", 1);
      objc_msgSend(v42, "setTappableArea:", 2);

      v32 = 0;
      v30 = 0;
    }
    else
    {
      objc_msgSend(v42, "setTappable:", 0);
      v32 = 0;
      v30 = 0;
      v29 = 0;
    }
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", *(_QWORD *)&v37, *(_QWORD *)&v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "configureCloudFeedSectionHeaderTextCell:contentInsets:descriptionAttributedText:detailAttributedText:", v42, v21, v29, v38, v24, v25, v40);

  objc_msgSend(v42, "setIconImage:", v30);
  objc_msgSend(v42, "setIconLocation:", v32);
  objc_msgSend(v42, "setIconPadding:", v18, v17, v20, v19);
  objc_msgSend(v42, "setIconOffset:", v33, v34);
  objc_msgSend(v42, "setButtonType:animated:", a7, v31);
  objc_msgSend(v42, "setButtonSize:", v28);
  objc_msgSend(v42, "setButtonHorizontalAlignment:", 2);
  objc_msgSend(v42, "setButtonPadding:", 5.0);
  objc_msgSend(v42, "setShouldUseOpaqueBackground:", 1);

}

- (void)configureTextCell:(id)a3 forSectionFooterWithActionText:(id)a4 collectionViewType:(int64_t)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSString *v24;
  id v25;

  v8 = (__CFString *)a4;
  v9 = a3;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  if (a5)
    objc_msgSend(v10, "cloudFeedEmphasizedTextAttributes");
  else
    objc_msgSend(v10, "cloudFeedLargerEmphasizedTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v8)
    v13 = v8;
  else
    v13 = &stru_1E58AD278;
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v11);

  objc_msgSend(MEMORY[0x1E0D7B160], "activityChevronImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v16 = round(*(double *)&PUMainScreenScale_screenScale * 4.5) / *(double *)&PUMainScreenScale_screenScale;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v18 = v17;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  if (a5 == 1)
    v20 = 0.0;
  else
    v20 = v19;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v14, 5.0);
  v22 = v21;
  objc_msgSend(v9, "setAttributedText:", v14);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredContentSizeCategory");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfTextLines:", !UIContentSizeCategoryIsAccessibilityCategory(v24));

  objc_msgSend(v9, "setTextAlignment:", 2);
  objc_msgSend(v9, "setIconImage:", v15);
  objc_msgSend(v9, "setIconLocation:", 1);
  objc_msgSend(v9, "setIconPadding:", 0.0, v16, 0.0, 0.0);
  objc_msgSend(v9, "setIconOffset:", 0.0, 1.0);
  objc_msgSend(v9, "setButtonType:", 0);
  objc_msgSend(v9, "setContentInsets:", v22, v18, 5.0, v20);
  objc_msgSend(v9, "setShouldUseOpaqueBackground:", 1);

}

- (void)configureTextCell:(id)a3 forSectionFooterWithDateText:(id)a4 collectionViewType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  NSString *v22;
  id v23;

  v7 = a4;
  v8 = a3;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedStringForCloudFeedGroupHeaderWithText:", v7);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v23, 40.0);
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v23, 14.0);
  v13 = v12;
  objc_msgSend(v23, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ascender");
  v16 = v11 - v15;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v18 = v17;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v20 = v19;
  objc_msgSend(v8, "setAttributedText:", v23);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredContentSizeCategory");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfTextLines:", !UIContentSizeCategoryIsAccessibilityCategory(v22));

  objc_msgSend(v8, "setTextAlignment:", 2);
  objc_msgSend(v8, "setIconImage:", 0);
  objc_msgSend(v8, "setContentInsets:", v16, v18, v13, v20);
  objc_msgSend(v8, "setShouldUseOpaqueBackground:", 1);

}

- (void)configureTextCell:(id)a3 forSectionGroupHeaderWithText:(id)a4 collectionViewType:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  if (a5)
  {
    v10 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v9 = v13;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v11 = v14;
    v12 = 0.0;
    v10 = 0.0;
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureCloudFeedGroupHeaderTextCell:contentInsets:withText:", v16, v8, v10, v9, v12, v11);

  objc_msgSend(v16, "setShouldUseOpaqueBackground:", 1);
}

@end
