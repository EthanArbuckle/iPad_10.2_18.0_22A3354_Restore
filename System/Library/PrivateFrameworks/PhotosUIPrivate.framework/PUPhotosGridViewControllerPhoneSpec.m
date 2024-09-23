@implementation PUPhotosGridViewControllerPhoneSpec

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (CGSize)baseInterItemSpacing
{
  double v2;
  double v3;
  CGSize result;

  v2 = 2.0;
  v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)thumbnailImageFormat
{
  int64_t v4;
  unsigned __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  void *v14;

  v4 = -[PUPhotosGridViewControllerSpec sizeSubclass](self, "sizeSubclass");
  if ((unint64_t)(v4 - 2) < 2)
  {
    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "masterThumbnailFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "formatID");

  }
  else if (v4 == 1)
  {
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    if (*(double *)&PUMainScreenScale_screenScale <= 1.0)
      v5 = 3311;
    else
      v5 = 3319;
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewControllerSpec.m"), 138, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v5 = 0;
  }
  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "forceJPEGThumbnailsInDefaultGrid");

  if (!v9)
    return v5;
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "masterThumbnailFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "formatID");

  return v12;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (BOOL)canDisplayOptionsInPopover
{
  return 0;
}

- (id)albumPickerViewControllerSpec
{
  return objc_alloc_init(PUAlbumPickerViewControllerPhoneSpec);
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
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v28.receiver = self;
  v28.super_class = (Class)PUPhotosGridViewControllerPhoneSpec;
  v11 = a3;
  -[PUPhotosGridViewControllerSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v28, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  -[PUPhotosGridViewControllerPhoneSpec gridContentInsets](self, "gridContentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = a4 - v14 - v18;
  v21 = objc_msgSend(MEMORY[0x1E0D7B560], "photosGridLayoutColumnsForWidth:", v20);
  v26 = 0.0;
  v27 = 0.0;
  v22 = (void *)MEMORY[0x1E0D7B560];
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v22, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v21, &v27, &v26, v20, *(double *)&PUMainScreenScale_screenScale);
  v23 = v27;
  v24 = v15 + v26;
  v25 = v19 + v26;
  objc_msgSend(v11, "setItemSize:");
  objc_msgSend(v11, "setInterItemSpacing:", v23, v23);
  objc_msgSend(v11, "setSectionContentInset:", v13, v24, v17, v25);
  objc_msgSend(v11, "setSectionTopPadding:", 9.5);
  objc_msgSend(v11, "setGlobalTopPadding:", 0.0);
  objc_msgSend(v11, "setGlobalBottomPadding:", 4.0);
  objc_msgSend(v11, "setCropType:", 0);
  objc_msgSend(v11, "setCropAmount:", 0.0);

}

- (int64_t)forceLoadInitialSectionCount
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v6 >= v4)
    v7 = v4;
  else
    v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E0D7B560], "photosGridLayoutColumnsForWidth:", v7);
  v9 = (void *)MEMORY[0x1E0D7B560];
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v12 = 0;
  v13 = 0;
  if (v6 >= v4)
    v4 = v6;
  objc_msgSend(v9, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v8, &v13, &v12, v7, *(double *)&PUMainScreenScale_screenScale);
  return vcvtpd_s64_f64(v4 / v10);
}

- (BOOL)canDisplaySlideshowButton
{
  return 0;
}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 0;
}

- (UIEdgeInsets)gridContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[PUPhotosGridViewControllerSpec safeAreaInsets](self, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (v6 > 0.0 && v3 > 0.0)
  {
    -[PUPhotosGridViewControllerSpec layoutMargins](self, "layoutMargins");
    UIEdgeInsetsAdd();
    v5 = v11;
    v7 = v12;
    v9 = v13;
    v10 = v14;
  }
  v15 = v5;
  v16 = v7;
  v17 = v9;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)shouldUseAspectItems
{
  return 0;
}

@end
