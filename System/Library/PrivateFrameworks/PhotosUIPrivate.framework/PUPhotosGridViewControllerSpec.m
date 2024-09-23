@implementation PUPhotosGridViewControllerSpec

- (PUPhotosGridViewControllerSpec)init
{
  PUPhotosGridViewControllerSpec *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridViewControllerSpec;
  v2 = -[PUPhotosGridViewControllerSpec init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    v2->_sizeSubclass = objc_msgSend(MEMORY[0x1E0D7B560], "photosGridSizeSubclassForScreenSize:", v5, v7);
    objc_msgSend(MEMORY[0x1E0DC3F10], "pu_layoutMarginWidthForCurrentScreenSize");
    v2->_layoutMargins.top = 0.0;
    v2->_layoutMargins.left = v8;
    v2->_layoutMargins.bottom = 0.0;
    v2->_layoutMargins.right = v8;
  }
  return v2;
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

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (unsigned)thumbnailImageFormat
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewControllerSpec.m"), 53, CFSTR("Required override not found"));

  return 0;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (int64_t)cellBannerTextAlignment
{
  return 1;
}

- (BOOL)shouldUseAspectItems
{
  return 0;
}

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  v10 = a3;
  PXEdgeInsetsForEdges();
  self->_safeAreaInsets.top = v6;
  self->_safeAreaInsets.left = v7;
  self->_safeAreaInsets.bottom = v8;
  self->_safeAreaInsets.right = v9;
  objc_msgSend(v10, "setUsesAspectItems:", -[PUPhotosGridViewControllerSpec shouldUseAspectItems](self, "shouldUseAspectItems"));

}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 1;
}

- (BOOL)shouldPlaceDeleteInCenterToolbarPosition
{
  return 0;
}

- (BOOL)canCommitPreview
{
  return 1;
}

- (BOOL)displaysAvalancheStacks
{
  return 1;
}

- (BOOL)wantsBackButtonTitleForPhotoBrowser
{
  return 0;
}

- (BOOL)wantsCustomNavigationTransition
{
  return 0;
}

- (int64_t)forceLoadInitialSectionCount
{
  return 20;
}

- (double)sectionHeaderHeight
{
  return 0.0;
}

- (int64_t)sectionHeaderStyle
{
  return 0;
}

- (UIEdgeInsets)sectionHeaderInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[PUPhotosGridViewControllerSpec layoutMargins](self, "layoutMargins");
  -[PUPhotosGridViewControllerSpec safeAreaInsets](self, "safeAreaInsets");
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)gridContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)baseInterItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_baseInterItemSpacing.width;
  height = self->_baseInterItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)canDisplayOptionsInPopover
{
  return self->_canDisplayOptionsInPopover;
}

- (BOOL)canDisplaySlideshowButton
{
  return self->_canDisplaySlideshowButton;
}

- (BOOL)canDisplayEditActionsInNavigationBar
{
  return self->_canDisplayEditActionsInNavigationBar;
}

- (BOOL)usesStackPopTransition
{
  return self->_usesStackPopTransition;
}

- (PUAlbumPickerViewControllerSpec)albumPickerViewControllerSpec
{
  return self->_albumPickerViewControllerSpec;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumPickerViewControllerSpec, 0);
}

@end
