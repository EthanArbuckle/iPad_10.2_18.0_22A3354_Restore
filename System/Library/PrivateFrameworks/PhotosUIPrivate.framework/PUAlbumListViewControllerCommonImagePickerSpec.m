@implementation PUAlbumListViewControllerCommonImagePickerSpec

- (unint64_t)stackViewStyle
{
  return 0;
}

- (unint64_t)folderStackViewStyle
{
  return 4;
}

- (BOOL)shouldUseTableView
{
  return 1;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v2 = dbl_1AB0EF290[*(double *)&PUMainScreenScale_screenScale > 1.0];
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)stackSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 70.0;
  v3 = 70.0;
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

  objc_msgSend(v5, "setGridMargin:", 5.0);
  objc_msgSend(v5, "setGridItemSpacing:", 2.0);

}

- (int64_t)cellContentViewLayout
{
  return 0;
}

- (CGSize)cellSizeForBounds:(CGRect)a3
{
  CGFloat width;
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
  CGSize result;

  width = a3.size.width;
  -[PUAlbumListViewControllerSpec _fontManager](self, "_fontManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumListTitleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_scaledValueForValue:", 40.0);
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
  objc_msgSend(v6, "_scaledValueForValue:", 29.0);
  v16 = v15;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v17 = round(v9 * v8) / v9
      + round(v14 * v13) / v14
      + round(*(double *)&PUMainScreenScale_screenScale * v16) / *(double *)&PUMainScreenScale_screenScale;

  v18 = width;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
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

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  UIEdgeInsetsAdd();
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)sectionFooterHeight
{
  return 0.0;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return 0;
}

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return 0;
}

@end
