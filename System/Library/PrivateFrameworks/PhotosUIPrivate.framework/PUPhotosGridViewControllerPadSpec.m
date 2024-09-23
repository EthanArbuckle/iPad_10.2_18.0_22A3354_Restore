@implementation PUPhotosGridViewControllerPadSpec

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (CGSize)baseInterItemSpacing
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumSpacing");
  v4 = v3;
  objc_msgSend(v2, "maximumSpacing");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unsigned)thumbnailImageFormat
{
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  if (*(double *)&PUMainScreenScale_screenScale <= 1.0)
    return 3501;
  else
    return 5003;
}

- (int64_t)cellFillMode
{
  return 2;
}

- (int64_t)cellBannerTextAlignment
{
  return 2;
}

- (BOOL)canDisplayOptionsInPopover
{
  return 1;
}

- (BOOL)canDisplayEditActionsInNavigationBar
{
  return 1;
}

- (BOOL)usesStackPopTransition
{
  return 1;
}

- (BOOL)canDisplaySlideshowButton
{
  return 1;
}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 1;
}

- (BOOL)shouldUseAspectItems
{
  return 1;
}

- (id)albumPickerViewControllerSpec
{
  return objc_alloc_init(PUAlbumPickerViewControllerPadSpec);
}

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v31.receiver = self;
  v31.super_class = (Class)PUPhotosGridViewControllerPadSpec;
  v11 = a3;
  -[PUPhotosGridViewControllerSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v31, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  -[PUPhotosGridViewControllerSpec layoutMargins](self, "layoutMargins", v31.receiver, v31.super_class);
  -[PUPhotosGridViewControllerSpec safeAreaInsets](self, "safeAreaInsets");
  UIEdgeInsetsAdd();
  PXEdgeInsetsForEdges();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;

  v23 = PLIsPadMini();
  v24 = 5;
  v25 = 7;
  if (v22 >= a4)
    v25 = 5;
  v26 = 17.0;
  if (v22 < a4)
    v26 = 10.0;
  if (!v23)
    v24 = v25;
  v27 = a4 - (v15 + v19);
  v28 = (double)(v24 - 1);
  v29 = floor((v27 - v28 * v26) / (double)v24);
  v30 = floor((v27 - v29 * (double)v24) / v28);
  objc_msgSend(v11, "setItemSize:", v29, v29);
  objc_msgSend(v11, "setInterItemSpacing:", v30, v30);
  objc_msgSend(v11, "setSectionContentInset:", v13, v15, v17, v19);
  objc_msgSend(v11, "setSectionTopPadding:", 9.5);
  objc_msgSend(v11, "setGlobalTopPadding:", 9.0);
  objc_msgSend(v11, "setGlobalBottomPadding:", 12.0);
  objc_msgSend(v11, "setCropType:", 0);
  objc_msgSend(v11, "setCropAmount:", 0.0);

}

- (BOOL)shouldPlaceDeleteInCenterToolbarPosition
{
  return 1;
}

- (BOOL)wantsBackButtonTitleForPhotoBrowser
{
  return 1;
}

- (BOOL)wantsCustomNavigationTransition
{
  return 1;
}

- (int64_t)sectionHeaderStyle
{
  return 0;
}

@end
