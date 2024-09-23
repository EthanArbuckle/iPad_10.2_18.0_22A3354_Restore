@implementation PUFeedViewControllerPhoneSpec

- (BOOL)canUseSimplePreheatManager
{
  return 1;
}

- (void)configureFeedCollectionViewLayout:(id)a3 forCollectionViewType:(int64_t)a4 collectionViewSize:(CGSize)a5 collectionViewContentInset:(UIEdgeInsets *)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUFeedViewControllerPhoneSpec;
  -[PUFeedViewControllerSpec configureFeedCollectionViewLayout:forCollectionViewType:collectionViewSize:collectionViewContentInset:](&v15, sel_configureFeedCollectionViewLayout_forCollectionViewType_collectionViewSize_collectionViewContentInset_, v11, a4, a6, width, height);
  if (a4 == 1)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudFeedSectionHeaderBackgroundImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    objc_msgSend(v11, "setSectionHeaderBackgroundHeight:", v14);

  }
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
  return 5;
}

- (CGSize)thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)configurationForSectionHeaderType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  int64_t v4;
  int64_t v5;
  int64_t v6;

  v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 5)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = qword_1AB0EFA58[v4];
    v6 = qword_1AB0EFA88[v4];
  }
  if (a4)
    return v5;
  else
    return v6;
}

- (UIEdgeInsets)textInsetsForHeadersAndFootersInSectionType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v5 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (a4 != 1)
  {
    if (a4 || (unint64_t)(a3 - 2) >= 4 && a3)
      goto LABEL_9;
LABEL_8:
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins", v5);
    v6 = v9;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v8 = v10;
    v7 = 0.0;
    v5 = 0.0;
    goto LABEL_9;
  }
  if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x29) != 0)
    goto LABEL_8;
LABEL_9:
  v11 = v6;
  result.right = v8;
  result.bottom = v7;
  result.left = v11;
  result.top = v5;
  return result;
}

- (void)getReferenceMaximumLength:(double *)a3 minimumNumberOfTilesToOmit:(int64_t *)a4 forSectionType:(int64_t)a5 collectionViewType:(int64_t)a6
{
  int64_t v6;
  double v7;

  if (a5 != 3)
  {
    if (a5)
    {
      v6 = 0;
      v7 = 0.0;
      if (!a3)
        goto LABEL_13;
    }
    else
    {
      v6 = 10;
      v7 = 3000.0;
      if (!a3)
        goto LABEL_13;
    }
LABEL_12:
    *a3 = v7;
    goto LABEL_13;
  }
  v7 = 1000.0;
  if (a6 != 1)
    v7 = 0.0;
  if (!a6)
    v7 = 500.0;
  v6 = 10;
  if (a3)
    goto LABEL_12;
LABEL_13:
  if (a4)
    *a4 = v6;
}

- (BOOL)shouldHideBarsInLandscape
{
  return 1;
}

- (id)gridSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPhoneSpec);
}

- (int64_t)promptStyle
{
  return 0;
}

- (BOOL)shouldUseFullscreenLayout
{
  return 1;
}

- (id)defaultTextAttributesForCollectionViewType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "cloudFeedWhiteDefaultTextAttributes");
  else
    objc_msgSend(v4, "cloudFeedDefaultTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)emphasizedTextAttributesForCollectionViewType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "cloudFeedWhiteEmphasizedTextAttributes");
  else
    objc_msgSend(v4, "cloudFeedEmphasizedTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL8 v29;
  id v30;
  void *v31;
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
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 1;
  if (a8)
  {
    v23 = v19;
    v24 = v20;
    v25 = v17;
    v26 = v18;
    if (a8 != 1)
      goto LABEL_6;
    v22 = 0;
    v24 = 5.0;
    v26 = 5.0;
  }
  else
  {
    v26 = 6.0;
    v24 = 7.5;
  }
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v25 = v27;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v23 = v28;
LABEL_6:
  v37 = v26;
  v39 = v24;
  if (v15)
  {
    v29 = a9;
    v30 = v15;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityChevronImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTappable:", 1);
    v32 = 2;
    objc_msgSend(v42, "setTappableArea:", 2);
    v17 = 4.5;
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
    if (!v16 || a8)
    {
      v29 = a9;
      objc_msgSend(v42, "setTappable:", 0, *(_QWORD *)&v37, *(_QWORD *)&v39);
      v32 = 0;
      v31 = 0;
      v30 = 0;
    }
    else
    {
      v29 = a9;
      objc_msgSend(v41, "cloudFeedInteractionTextAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v35);
      objc_msgSend(v42, "setTappable:", 1);
      objc_msgSend(v42, "setTappableArea:", 2);

      v32 = 0;
      v31 = 0;
    }
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", *(_QWORD *)&v37, *(_QWORD *)&v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "configureCloudFeedSectionHeaderTextCell:contentInsets:descriptionAttributedText:detailAttributedText:", v42, v21, v30, v38, v25, v40, v23);

  objc_msgSend(v42, "setIconImage:", v31);
  objc_msgSend(v42, "setIconLocation:", v32);
  objc_msgSend(v42, "setIconPadding:", v18, v17, v20, v19);
  objc_msgSend(v42, "setIconOffset:", v33, v34);
  objc_msgSend(v42, "setButtonType:animated:", a7, v29);
  objc_msgSend(v42, "setButtonHorizontalAlignment:", 2);
  objc_msgSend(v42, "setButtonPadding:", 2.0);
  objc_msgSend(v42, "setShouldUseOpaqueBackground:", v22);

}

- (void)configureTextCell:(id)a3 forSectionFooterWithActionText:(id)a4 collectionViewType:(int64_t)a5
{
  __CFString *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSString *v21;
  id v22;

  v7 = (__CFString *)a4;
  v8 = a3;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v7)
    v10 = v7;
  else
    v10 = &stru_1E58AD278;
  objc_msgSend(v22, "cloudFeedDefaultTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v11);

  objc_msgSend(MEMORY[0x1E0D7B160], "activityChevronImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v15 = v14;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v12, 6.0);
  v19 = v18;
  objc_msgSend(v8, "setAttributedText:", v12);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredContentSizeCategory");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfTextLines:", !UIContentSizeCategoryIsAccessibilityCategory(v21));

  objc_msgSend(v8, "setTextAlignment:", 2);
  objc_msgSend(v8, "setIconImage:", v13);
  objc_msgSend(v8, "setIconLocation:", 1);
  objc_msgSend(v8, "setIconPadding:", 0.0, 4.5, 0.0, 0.0);
  objc_msgSend(v8, "setIconOffset:", 0.0, 1.0);
  objc_msgSend(v8, "setContentInsets:", v19, v15, 10.0, v17);
  objc_msgSend(v8, "setShouldUseOpaqueBackground:", 1);

}

- (void)configureTextCell:(id)a3 forSectionGroupHeaderWithText:(id)a4 collectionViewType:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v7 = a4;
  v13 = a3;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v9 = v8;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v11 = v10;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureCloudFeedGroupHeaderTextCell:contentInsets:withText:", v13, v7, 0.0, v9, 12.0, v11);

  objc_msgSend(v13, "setShouldUseOpaqueBackground:", 1);
}

@end
