@implementation PUAlbumListViewControllerPhoneSpec

- (unint64_t)stackViewStyle
{
  return 5;
}

- (unint64_t)folderStackViewStyle
{
  return 3;
}

- (BOOL)shouldUseTableView
{
  return 0;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = PUPixelSizeFromPointSize(130.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)imageSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 256.0;
  v5 = 256.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)stackSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 130.0;
  v3 = 130.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)configureStackViewWithGridStyle:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "folderCellBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGridBackgroundColor:", v4);

  objc_msgSend(v5, "setGridMargin:", 0.0);
  objc_msgSend(v5, "setGridItemSpacing:", 2.0);

}

- (int64_t)cellContentViewLayout
{
  return 2;
}

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  UIEdgeInsets result;

  v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v9 = *MEMORY[0x1E0DC49E8];
  v10 = v4;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", 0, &v9, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v6 = *((double *)&v9 + 1);
  v5 = *(double *)&v9;
  v8 = *((double *)&v10 + 1);
  v7 = *(double *)&v10;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)stackSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v6 = 0.0;
  v7 = 0.0;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", &v6, 0, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v4 = v6;
  v5 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)cellSizeForStackSize:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat width;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUAlbumListViewControllerSpec _fontManager](self, "_fontManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumListTitleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_scaledValueForValue:", 20.0);
  v8 = v7;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v9 = *(double *)&PUMainScreenScale_screenScale;
  -[PUAlbumListViewControllerSpec _fontManager](self, "_fontManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albumListSubtitleLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_scaledValueForValue:", 20.0);
  v13 = v12;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v14 = *(double *)&PUMainScreenScale_screenScale;
  objc_msgSend(v6, "_scaledValueForValue:", 8.0);
  v16 = v15;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v17 = *(double *)&PUMainScreenScale_screenScale;
  objc_msgSend(v6, "_scaledValueForValue:", 8.0);
  v19 = v18;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v20 = height
      + round(v14 * v13) / v14
      + round(v9 * v8) / v9
      + round(v17 * v16) / v17
      + round(*(double *)&PUMainScreenScale_screenScale * v19) / *(double *)&PUMainScreenScale_screenScale;

  v21 = width;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)configureGridLayout:(id)a3 forLayoutReferenceSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  double v23;
  double v24;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v23 = 0.0;
  v24 = 0.0;
  v21 = 0u;
  v22 = 0u;
  v12 = a3;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", &v23, &v21, width, height, top, left, bottom, right);
  v13 = *((double *)&v21 + 1);
  v15 = *((double *)&v22 + 1);
  v14 = v23;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v16 = floor(*(double *)&PUMainScreenScale_screenScale* ((width - v13 - v15 - (double)(uint64_t)floor((width - v13 - v15 + 8.0) / (v14 + 8.0)) * v14)/ (double)(uint64_t)(vcvtmd_s64_f64((width - v13 - v15 + 8.0) / (v14 + 8.0)) - 1)))/ *(double *)&PUMainScreenScale_screenScale;
  if (*((double *)&v21 + 1) >= *((double *)&v22 + 1))
    v17 = *((double *)&v22 + 1);
  else
    v17 = *((double *)&v21 + 1);
  if (v16 * 0.5 < v17)
    v17 = v16 * 0.5;
  *((double *)&v21 + 1) = *((double *)&v21 + 1) - v17;
  v18 = *((double *)&v21 + 1);
  *((double *)&v22 + 1) = *((double *)&v22 + 1) - v17;
  v23 = v23 + v17 * 2.0;
  v19 = v16 + v17 * -2.0;
  -[PUAlbumListViewControllerPhoneSpec sectionFooterHeight](self, "sectionFooterHeight", v21, (_QWORD)v22);
  objc_msgSend(v12, "setSectionContentInset:", 0.0, v18, v20, *((double *)&v22 + 1));
  objc_msgSend(v12, "setInterItemSpacing:", v19, 0.0);
  -[PUAlbumListViewControllerPhoneSpec cellSizeForStackSize:](self, "cellSizeForStackSize:", v23, v24);
  objc_msgSend(v12, "setItemSize:");

}

- (double)sectionHeaderHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PUAlbumListViewControllerSpec _fontManager](self, "_fontManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumListSectionTitleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_scaledValueForValue:", 34.0);
  v5 = v4;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v6 = round(*(double *)&PUMainScreenScale_screenScale * v5) / *(double *)&PUMainScreenScale_screenScale;

  return v6;
}

- (double)sectionFooterHeight
{
  return 20.0;
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

@end
