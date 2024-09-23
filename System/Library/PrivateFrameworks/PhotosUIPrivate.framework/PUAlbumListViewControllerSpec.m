@implementation PUAlbumListViewControllerSpec

- (PUFontManager)_fontManager
{
  PUFontManager *fontManager;
  PUFontManager *v4;
  PUFontManager *v5;

  fontManager = self->__fontManager;
  if (!fontManager)
  {
    v4 = objc_alloc_init(PUFontManager);
    v5 = self->__fontManager;
    self->__fontManager = v4;

    fontManager = self->__fontManager;
  }
  return fontManager;
}

- (PXLayoutMetricInterpolator)_insetsInterpolator
{
  return (PXLayoutMetricInterpolator *)objc_msgSend(MEMORY[0x1E0D7B560], "albumsGridEdgeInsetsInterpolator");
}

- (PXLayoutMetricInterpolator)_stackWidthInterpolator
{
  return (PXLayoutMetricInterpolator *)objc_msgSend(MEMORY[0x1E0D7B560], "albumsGridItemWidthInterpolator");
}

- (int64_t)imageContentMode
{
  return 1;
}

- (CGSize)contentSizeForViewInPopover
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)cellSizeForBounds:(CGRect)a3
{
  double width;
  double v4;
  CGSize result;

  width = a3.size.width;
  v4 = 44.0;
  result.height = v4;
  result.width = width;
  return result;
}

- (CGSize)cellSizeForStackSize:(CGSize)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewControllerSpec.m"), 107, CFSTR("Method %s is a responsibility of subclass %@"), "-[PUAlbumListViewControllerSpec cellSizeForStackSize:]", v7);

  abort();
}

- (double)cellBackgroundCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CGSize)tileSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 stackViewStyle:(unint64_t)a5
{
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUAlbumListViewControllerSpec stackSizeForLayoutReferenceSize:safeAreaInsets:](self, "stackSizeForLayoutReferenceSize:safeAreaInsets:", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  if (a5 > 6)
  {
    v7 = 0.0;
    v6 = 0.0;
  }
  else if (((1 << a5) & 0x67) == 0)
  {
    if (a5 == 3)
      v8 = 0.5;
    else
      v8 = 0.330000013;
    v6 = v6 * v8;
    v7 = v7 * v8;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)emptyAlbumPlaceholderImageForWindow:(id)a3
{
  UIImage *emptyAlbumPlaceholderImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  if (!emptyAlbumPlaceholderImage)
  {
    -[PUAlbumListViewControllerSpec nameOfEmptyAlbumPlaceholderImage](self, "nameOfEmptyAlbumPlaceholderImage", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:scale:](PUAlbumListViewControllerSpec, "emptyPlaceholderImageForSystemImageNamed:scale:", v5, 3);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emptyAlbumPlaceholderImage;
    self->_emptyAlbumPlaceholderImage = v6;

    emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  }
  return emptyAlbumPlaceholderImage;
}

- (id)emptySharedAlbumPlaceholderImageForWindow:(id)a3
{
  UIImage *emptySharedAlbumPlaceholderImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  if (!emptySharedAlbumPlaceholderImage)
  {
    -[PUAlbumListViewControllerSpec nameOfEmptySharedAlbumPlaceholderImage](self, "nameOfEmptySharedAlbumPlaceholderImage", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:scale:](PUAlbumListViewControllerSpec, "emptyPlaceholderImageForSystemImageNamed:scale:", v5, 3);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emptySharedAlbumPlaceholderImage;
    self->_emptySharedAlbumPlaceholderImage = v6;

    emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  }
  return emptySharedAlbumPlaceholderImage;
}

- (NSString)nameOfEmptyPeopleAlbumPlaceholderImage
{
  return (NSString *)CFSTR("person.crop.rectangle");
}

- (NSString)nameOfEmptyAlbumPlaceholderImage
{
  return (NSString *)CFSTR("photo.on.rectangle");
}

- (NSString)nameOfEmptySharedAlbumPlaceholderImage
{
  return (NSString *)CFSTR("icloud");
}

- (CGPoint)_pixelRoundedOriginForCenteredImage:(id)a3 inRect:(CGRect)a4 window:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  objc_msgSend(a3, "size");
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGRectGetMidX(v18);
  UIRoundToViewScale();
  v12 = v11;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGRectGetMidY(v19);
  UIRoundToViewScale();
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_getStackSize:(CGSize *)a3 outEdgeInsets:(UIEdgeInsets *)a4 forLayoutReferenceSize:(CGSize)a5 safeAreaInsets:(UIEdgeInsets)a6
{
  double right;
  double left;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;

  right = a6.right;
  left = a6.left;
  v11 = a5.width - a6.left - a6.right;
  -[PUAlbumListViewControllerSpec _insetsInterpolator](self, "_insetsInterpolator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForMetric:", v11);
  v14 = v13;

  if (a4)
  {
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v15 = round(*(double *)&PUMainScreenScale_screenScale * v14) / *(double *)&PUMainScreenScale_screenScale;
    a4->top = 0.0;
    a4->left = left + v15;
    a4->bottom = 0.0;
    a4->right = right + v15;
  }
  if (a3)
  {
    -[PUAlbumListViewControllerSpec _stackWidthInterpolator](self, "_stackWidthInterpolator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForMetric:", v11 + v14 * -2.0);
    v18 = v17;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v19 = round(*(double *)&PUMainScreenScale_screenScale * v18) / *(double *)&PUMainScreenScale_screenScale;

    a3->width = v19;
    a3->height = v19;
  }
}

- (PUAlbumListViewControllerSpec)standInAlbumListViewControllerSpec
{
  return (PUAlbumListViewControllerSpec *)objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

- (BOOL)shouldUseTableView
{
  return self->_shouldUseTableView;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)stackViewStyle
{
  return self->_stackViewStyle;
}

- (unint64_t)folderStackViewStyle
{
  return self->_folderStackViewStyle;
}

- (PUPhotoDecoration)stackPhotoDecoration
{
  return self->_stackPhotoDecoration;
}

- (PUPhotoDecoration)emptyStackPhotoDecoration
{
  return self->_emptyStackPhotoDecoration;
}

- (CGSize)stackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_stackSize.width;
  height = self->_stackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIOffset)stackOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackOffset.horizontal;
  vertical = self->_stackOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stackPerspectiveInsets.top;
  left = self->_stackPerspectiveInsets.left;
  bottom = self->_stackPerspectiveInsets.bottom;
  right = self->_stackPerspectiveInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackPerspectiveOffset.horizontal;
  vertical = self->_stackPerspectiveOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (double)posterSquareCornerRadius
{
  return self->_posterSquareCornerRadius;
}

- (double)posterSubitemCornerRadius
{
  return self->_posterSubitemCornerRadius;
}

- (CGSize)collageImageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_collageImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)collageImageContentMode
{
  return self->_collageImageContentMode;
}

- (double)collageSpacing
{
  return self->_collageSpacing;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return self->_showsDeleteButtonOnCellContentView;
}

- (int64_t)cellContentViewLayout
{
  return self->_cellContentViewLayout;
}

- (BOOL)usesStackTransitionToGrid
{
  return self->_usesStackTransitionToGrid;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return self->_shouldUseCollageForCloudFeedPlaceholder;
}

- (BOOL)shouldUseShortTitleForStandInAlbumList
{
  return self->_shouldUseShortTitleForStandInAlbumList;
}

- (BOOL)canShowVirtualCollections
{
  return self->_canShowVirtualCollections;
}

- (int64_t)albumDeletionWarningStyle
{
  return self->_albumDeletionWarningStyle;
}

- (PUPhotosGridViewControllerSpec)gridViewControllerSpec
{
  return self->_gridViewControllerSpec;
}

- (PUPhotosAlbumViewControllerSpec)albumViewControllerSpec
{
  return self->_albumViewControllerSpec;
}

- (PUFeedViewControllerSpec)feedViewControllerSpec
{
  return self->_feedViewControllerSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewControllerSpec, 0);
  objc_storeStrong((id *)&self->_albumViewControllerSpec, 0);
  objc_storeStrong((id *)&self->_gridViewControllerSpec, 0);
  objc_storeStrong((id *)&self->__fontManager, 0);
  objc_storeStrong((id *)&self->_emptyStackPhotoDecoration, 0);
  objc_storeStrong((id *)&self->_stackPhotoDecoration, 0);
  objc_storeStrong((id *)&self->_emptySharedAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, 0);
}

+ (id)phoneSpec
{
  return objc_alloc_init(PUAlbumListViewControllerPhoneSpec);
}

+ (id)padSpec
{
  return objc_alloc_init(PUAlbumListViewControllerPadSpec);
}

+ (id)visionOSSpec
{
  return objc_alloc_init(PUAlbumListViewControllerVisionOSSpec);
}

+ (id)emptyPlaceholderImageForSystemImageNamed:(id)a3 scale:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v5, "systemGray4Color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3888];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B50], a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
