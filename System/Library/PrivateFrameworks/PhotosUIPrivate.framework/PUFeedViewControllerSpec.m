@implementation PUFeedViewControllerSpec

- (PUFeedViewControllerSpec)init
{
  PUFeedViewControllerSpec *v2;
  PUFeedViewControllerSpec *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFeedViewControllerSpec;
  v2 = -[PUFeedViewControllerSpec init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUFeedViewControllerSpec updateFormats](v2, "updateFormats");
    objc_msgSend(MEMORY[0x1E0DC3F10], "pu_layoutMarginWidthForCurrentScreenSize");
    v3->_standardSideMargins = v4;
  }
  return v3;
}

- (BOOL)canUseSimplePreheatManager
{
  return 0;
}

- (void)updateFormats
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void (**v60)(void *, _QWORD);
  id v61;
  void (**v62)(void *, _QWORD);
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, unsigned int);
  void *v66;
  id v67;
  _QWORD aBlock[4];
  id v69;

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "largestUncroppedNonJPEGThumbnailFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "formatID");

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexSheetUnbakedFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_squareThumbnailFastImageFormat = objc_msgSend(v8, "formatID");

  self->_squareThumbnailQualityImageFormat = 0;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", self->_squareThumbnailFastImageFormat);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  PLPhysicalScreenScale();
  v15 = v11 / v14;
  PLPhysicalScreenScale();
  self->_squareThumbnailMaximumSize.width = v15;
  self->_squareThumbnailMaximumSize.height = v13 / v16;
  *(_DWORD *)&self->_smallTileFastImageFormat = (unsigned __int16)v6;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  v21 = v20;

  PLPhysicalScreenScale();
  v23 = v19 / v22;
  PLPhysicalScreenScale();
  v25 = v21 / v24;
  objc_msgSend(v3, "smallTileSizeTolerance");
  v27 = v26 + 1.0;
  self->_smallTileMaximumFittingSize.width = v23 * v27;
  self->_smallTileMaximumFittingSize.height = v25 * v27;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "masterThumbnailFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  self->_smallTilePanoQualityImageFormat = objc_msgSend(v29, "formatID");

  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", self->_smallTileFastImageFormat);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v31;

  PLPhysicalScreenScale();
  v34 = v32 / v33;
  PLPhysicalScreenScale();
  -[PUFeedViewControllerSpec thumbnailSizeForImageSize:](self, "thumbnailSizeForImageSize:", v34, v34 * 0.75);
  self->_smallTilePanoAspectRatio = v34 / v35;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "masterThumbnailFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  self->_mediumTileFastImageFormat = objc_msgSend(v37, "formatID");

  self->_mediumTileQualityImageFormat = 0;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", self->_mediumTileFastImageFormat);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "size");
  v40 = v39;
  v42 = v41;

  PLPhysicalScreenScale();
  v44 = v40 / v43;
  PLPhysicalScreenScale();
  self->_mediumTileMaximumFillingSize.width = v44;
  self->_mediumTileMaximumFillingSize.height = v42 / v45;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "masterThumbnailFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  self->_largeTileFastImageFormat = objc_msgSend(v47, "formatID");

  self->_largeTileQualityImageFormat = 4011;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v50 = v49;
  v52 = v51;

  self->_largeTileMaximumFillingSize.width = v50 * 0.5;
  self->_largeTileMaximumFillingSize.height = v52 * 0.5;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "masterThumbnailFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  self->_veryLargeTileFastImageFormat = objc_msgSend(v54, "formatID");

  self->_veryLargeTileQualityImageFormat = 4009;
  if ((objc_msgSend(v3, "shouldUseJPEGFastFormatForMediumTiles") & 1) == 0)
  {
    self->_mediumTileFastImageFormat = v6;
    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "masterThumbnailFormat");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    self->_mediumTileQualityImageFormat = objc_msgSend(v56, "formatID");

  }
  if ((objc_msgSend(v3, "shouldUseJPEGFastFormatForLargeTiles") & 1) == 0)
    self->_largeTileFastImageFormat = v6;
  if ((objc_msgSend(v3, "useJPEGImageFormats") & 1) == 0)
  {
    self->_mediumTileFastImageFormat = v6;
    self->_mediumTileQualityImageFormat = 0;
    self->_largeTileFastImageFormat = v6;
    self->_largeTileQualityImageFormat = 0;
    self->_veryLargeTileFastImageFormat = v6;
    self->_veryLargeTileQualityImageFormat = 0;
  }
  if ((objc_msgSend(v3, "useQualityImageFormats") & 1) == 0)
  {
    self->_squareThumbnailQualityImageFormat = 0;
    self->_smallTileQualityImageFormat = 0;
    self->_mediumTileQualityImageFormat = 0;
    self->_largeTileQualityImageFormat = 0;
    self->_veryLargeTileQualityImageFormat = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PUFeedViewControllerSpec_updateFormats__block_invoke;
  aBlock[3] = &unk_1E589F528;
  v59 = v57;
  v69 = v59;
  v60 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v63 = v58;
  v64 = 3221225472;
  v65 = __41__PUFeedViewControllerSpec_updateFormats__block_invoke_2;
  v66 = &unk_1E589F528;
  v67 = v59;
  v61 = v59;
  v62 = (void (**)(void *, _QWORD))_Block_copy(&v63);
  v60[2](v60, self->_squareThumbnailQualityImageFormat);
  v60[2](v60, self->_smallTileQualityImageFormat);
  v60[2](v60, self->_smallTilePanoQualityImageFormat);
  v60[2](v60, self->_mediumTileQualityImageFormat);
  v60[2](v60, self->_largeTileQualityImageFormat);
  v60[2](v60, self->_veryLargeTileQualityImageFormat);
  v62[2](v62, self->_squareThumbnailFastImageFormat);
  v62[2](v62, self->_smallTileFastImageFormat);
  v62[2](v62, self->_mediumTileFastImageFormat);
  v62[2](v62, self->_largeTileFastImageFormat);
  v62[2](v62, self->_veryLargeTileFastImageFormat);
  -[PUFeedViewControllerSpec _setQualityImageFormats:](self, "_setQualityImageFormats:", v61, v63, v64, v65, v66);

}

- (void)getFastImageFormat:(unsigned __int16 *)a3 qualityImageFormat:(unsigned __int16 *)a4 forSourceSize:(CGSize)a5 destinationSize:(CGSize)a6 allowCrop:(BOOL)a7
{
  BOOL v7;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double smallTilePanoAspectRatio;
  double v14;
  BOOL v15;
  BOOL v16;
  unsigned __int16 *p_smallTileFastImageFormat;
  uint64_t v18;
  unsigned __int16 v19;

  if (a6.width != a6.height || (a6.width <= self->_squareThumbnailMaximumSize.width ? (v7 = !a7) : (v7 = 1), v7))
  {
    if (a6.width >= a6.height)
      width = a6.width;
    else
      width = a6.height;
    height = self->_smallTileMaximumFittingSize.width;
    if (height >= self->_smallTileMaximumFittingSize.height)
      height = self->_smallTileMaximumFittingSize.height;
    if (width <= height)
    {
      p_smallTileFastImageFormat = &self->_smallTileFastImageFormat;
      smallTilePanoAspectRatio = self->_smallTilePanoAspectRatio;
      v14 = a5.height * smallTilePanoAspectRatio;
      if (a5.height <= a5.width * smallTilePanoAspectRatio)
      {
        v15 = a5.width == v14;
        v16 = a5.width < v14;
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      v18 = 14;
      if (!v16 && !v15)
        v18 = 16;
    }
    else
    {
      if (a6.width >= a6.height)
        v10 = a6.height;
      else
        v10 = a6.width;
      v11 = self->_mediumTileMaximumFillingSize.width;
      if (v11 >= self->_mediumTileMaximumFillingSize.height)
        v11 = self->_mediumTileMaximumFillingSize.height;
      if (v10 <= v11)
      {
        p_smallTileFastImageFormat = &self->_mediumTileFastImageFormat;
        v18 = 20;
      }
      else
      {
        v12 = self->_largeTileMaximumFillingSize.width;
        if (v12 >= self->_largeTileMaximumFillingSize.height)
          v12 = self->_largeTileMaximumFillingSize.height;
        if (v10 <= v12)
        {
          p_smallTileFastImageFormat = &self->_largeTileFastImageFormat;
          v18 = 24;
        }
        else
        {
          p_smallTileFastImageFormat = &self->_veryLargeTileFastImageFormat;
          v18 = 28;
        }
      }
    }
  }
  else
  {
    p_smallTileFastImageFormat = &self->_squareThumbnailFastImageFormat;
    v18 = 10;
  }
  v19 = *(_WORD *)((char *)&self->super.isa + v18);
  if (a3)
    *a3 = *p_smallTileFastImageFormat;
  if (a4)
    *a4 = v19;
}

- (void)configureFeedCollectionViewLayout:(id)a3 forCollectionViewType:(int64_t)a4 collectionViewSize:(CGSize)a5 collectionViewContentInset:(UIEdgeInsets *)a6
{
  double height;
  double width;
  id v10;
  __int128 v11;
  id v12;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  if (a4 == 1)
  {
    v12 = v10;
    objc_msgSend(v10, "setSectionReferenceSize:", 0.0, height);
    objc_msgSend(v12, "setInterTileSpacing:", 2.0, 2.0);
    objc_msgSend(v12, "setShouldFloatSectionHeaders:", 1);
    objc_msgSend(v12, "setShouldFloatWithEase:", 0);
    goto LABEL_5;
  }
  if (!a4)
  {
    v12 = v10;
    objc_msgSend(v10, "setSectionReferenceSize:", width, 0.0);
    objc_msgSend(v12, "setThumbnailSpacing:", 10.0);
    objc_msgSend(v12, "setInterTileSpacing:", 2.0, 2.0);
    objc_msgSend(v12, "setCaptionPadding:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v12, "setNoCaptionSpacing:", 0.0, 25.0);
    objc_msgSend(v12, "setShouldDisplayCaptionsBelowBatches:", 1);
    objc_msgSend(v12, "setShouldFloatThumbnails:", 1);
LABEL_5:
    v10 = v12;
  }
  v11 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&a6->top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&a6->bottom = v11;

}

- (UIEdgeInsets)textInsetsForHeadersAndFootersInSectionType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (!a4 && ((unint64_t)(a3 - 2) < 4 || !a3))
  {
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins", v4);
    v5 = v9;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v7 = v10;
    v6 = 0.0;
    v4 = 0.0;
  }
  v11 = v5;
  result.right = v7;
  result.bottom = v6;
  result.left = v11;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)contentInsetsForSectionType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (!a4 && (unint64_t)a3 <= 5 && ((1 << a3) & 0x32) != 0)
  {
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins", v4);
    v5 = v9;
    -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
    v7 = v10;
    v6 = 0.0;
    v4 = 0.0;
  }
  v11 = v5;
  result.right = v7;
  result.bottom = v6;
  result.left = v11;
  result.top = v4;
  return result;
}

- (void)configureCommentSeparatorMetrics:(PUFeedSeparatorMetrics *)a3
{
  void *v4;
  double v5;
  double v6;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudFeedSeparatorHeight");
  v6 = v5;

  a3->var1.top = 10.0;
  a3->var1.bottom = 10.0;
  a3->var0.height = v6 + 10.0 + 10.0;
}

- (BOOL)shouldShowCommentBadgesInCollectionViewType:(int64_t)a3
{
  return 0;
}

- (double)textSpacingBetweenText:(id)a3 detailText:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v6, 20.0);
  v8 = v7;
  v9 = objc_msgSend(v5, "length");
  v10 = (_QWORD *)MEMORY[0x1E0DC1138];
  if (v9)
  {
    objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v11, "descender");
  v14 = v8 + v13;
  objc_msgSend(v12, "ascender");
  v16 = v14 - v15;
  objc_msgSend(v12, "descender");
  v18 = v16 + v17;

  return v18;
}

- (void)configureTextCell:(id)a3 forCaption:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v15 = a3;
  objc_msgSend(v15, "setAttributedText:", v9);
  objc_msgSend(v15, "setNumberOfTextLines:", 0);
  objc_msgSend(v15, "setAttributedDetailText:", v8);
  -[PUFeedViewControllerSpec textSpacingBetweenText:detailText:](self, "textSpacingBetweenText:detailText:", v9, v8);
  v11 = v10;

  objc_msgSend(v15, "setTextDetailTextSpacing:", v11);
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  v13 = v12;
  -[PUFeedViewControllerSpec standardSideMargins](self, "standardSideMargins");
  objc_msgSend(v15, "setContentInsets:", 0.0, v13, 0.0, v14);
  objc_msgSend(v15, "setShouldUseOpaqueBackground:", 1);

}

- (void)configureTextCell:(id)a3 forCommentWithDescriptionPhrase:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  objc_msgSend(v12, "setAttributedText:", v9);
  objc_msgSend(v12, "setNumberOfTextLines:", 0);
  objc_msgSend(v12, "setAttributedDetailText:", v8);
  objc_msgSend(v12, "setShouldUseOpaqueBackground:", 1);
  -[PUFeedViewControllerSpec textSpacingBetweenText:detailText:](self, "textSpacingBetweenText:detailText:", v9, v8);
  v11 = v10;

  objc_msgSend(v12, "setTextDetailTextSpacing:", v11);
}

- (void)configureTextCell:(id)a3 forLikesWithDescriptionPhrase:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  objc_msgSend(v12, "setAttributedText:", v9);
  objc_msgSend(v12, "setNumberOfTextLines:", 0);
  objc_msgSend(v12, "setAttributedDetailText:", v8);
  objc_msgSend(v12, "setShouldUseOpaqueBackground:", 1);
  -[PUFeedViewControllerSpec textSpacingBetweenText:detailText:](self, "textSpacingBetweenText:detailText:", v9, v8);
  v11 = v10;

  objc_msgSend(v12, "setTextDetailTextSpacing:", v11);
}

- (void)configureTextCell:(id)a3 forEventWithDescriptionPhrase:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v5 = a4;
  v11 = a3;
  objc_msgSend(v11, "setAttributedText:", v5);
  objc_msgSend(v11, "setNumberOfTextLines:", 0);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v5, *MEMORY[0x1E0DC49E8]);
  v10 = v9;

  objc_msgSend(v11, "setContentInsets:", v10, v6, v7, v8);
  objc_msgSend(v11, "setShouldUseOpaqueBackground:", 1);

}

- (id)defaultTextAttributesForCollectionViewType:(int64_t)a3
{
  return 0;
}

- (id)emphasizedTextAttributesForCollectionViewType:(int64_t)a3
{
  return 0;
}

- (id)defaultSubTitleTextAttributesForCollectionViewType:(int64_t)a3
{
  void *v3;
  void *v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textBlockBelowArtSubTitleTextAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)thumbnailSizeForImageSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)configurationForSectionHeaderType:(int64_t)a3 collectionViewType:(int64_t)a4
{
  return 0;
}

- (void)configureSeparatorMetrics:(PUFeedSeparatorMetrics *)a3 betweenSectionWithInfo:(id)a4 andSectionWithInfo:(id)a5 joined:(BOOL)a6 collectionViewType:(int64_t)a7
{
  _BOOL4 v8;
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  double v22;
  id v23;

  v8 = a6;
  v23 = a4;
  v11 = a5;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudFeedSeparatorHeight");
  v14 = v13;

  if (a7 == 1)
  {
    if (v23 && v11)
    {
      if (v8)
      {
        a3->var1.left = 2.0;
        v22 = 2.0;
      }
      else
      {
        a3->var1.left = 17.0;
        v22 = 17.0;
      }
    }
    else
    {
      v22 = a3->var1.left + 0.0;
    }
    a3->var0.width = v22 + a3->var1.right;
  }
  else if (!a7)
  {
    a3->var1.top = 32.0;
    if (v11)
    {
      if (objc_msgSend(v11, "sectionType") == 1)
        a3->var1.bottom = 12.0;
      if (v23)
      {
        v15 = objc_msgSend(v23, "sectionType");
        if (v15 == objc_msgSend(v11, "sectionType"))
        {
          if (objc_msgSend(v23, "sectionType") == 2)
          {
            a3->var1.top = 12.0;
            v14 = 0.0;
          }
          if (objc_msgSend(v11, "sectionType") == 1)
          {
            a3->var1.top = 12.0;
            +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "showGroupIDHeaders");

            if (v17)
            {
              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "date");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "date");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v18, "isDate:inSameDayAsDate:", v19, v20);

              if ((v21 & 1) == 0)
                a3->var1.top = 32.0;
            }
          }
          if (objc_msgSend(v11, "sectionType") == 4)
            a3->var1.top = 12.0;
        }
      }
    }
    a3->var0.height = v14 + a3->var1.top + a3->var1.bottom;
  }

}

- (double)spacingBetweenSectionWithInfo:(id)a3 andHeaderWithGroupID:(id)a4
{
  return 0.0;
}

- (NSIndexSet)qualityImageFormats
{
  return self->_qualityImageFormats;
}

- (void)_setQualityImageFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CGSize)minimumVideoTileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumVideoTileSize.width;
  height = self->_minimumVideoTileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)largeNumberOfSubjectsForLikes
{
  return self->_largeNumberOfSubjectsForLikes;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldUseAspectThumbnails
{
  return self->_shouldUseAspectThumbnails;
}

- (BOOL)shouldHideBarsInLandscape
{
  return self->_shouldHideBarsInLandscape;
}

- (BOOL)shouldShowInvitationsInPopover
{
  return self->_shouldShowInvitationsInPopover;
}

- (PUFeedViewControllerSpec)popoverFeedViewControllerSpec
{
  return self->_popoverFeedViewControllerSpec;
}

- (PUPhotosGridViewControllerSpec)gridSpec
{
  return self->_gridSpec;
}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (BOOL)shouldUseFullscreenLayout
{
  return self->_shouldUseFullscreenLayout;
}

- (double)standardSideMargins
{
  return self->_standardSideMargins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSpec, 0);
  objc_storeStrong((id *)&self->_popoverFeedViewControllerSpec, 0);
  objc_storeStrong((id *)&self->_qualityImageFormats, 0);
}

uint64_t __41__PUFeedViewControllerSpec_updateFormats__block_invoke(uint64_t result, unsigned int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addIndex:", a2);
  return result;
}

uint64_t __41__PUFeedViewControllerSpec_updateFormats__block_invoke_2(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a2);
}

@end
