@implementation PBFPosterGallerySmartAlbumConfigurationViewHostCell

- (void)layoutSubviews
{
  UIView *hostedView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGallerySmartAlbumConfigurationViewHostCell;
  -[PBFPosterGallerySmartAlbumConfigurationViewHostCell layoutSubviews](&v4, sel_layoutSubviews);
  hostedView = self->_hostedView;
  -[UIView frame](hostedView, "frame");
  -[PBFPosterGallerySmartAlbumConfigurationViewHostCell bounds](self, "bounds");
  UIRectCenteredRect();
  -[UIView setFrame:](hostedView, "setFrame:");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_hostedView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView intrinsicContentSize](self->_hostedView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHostedView:(id)a3
{
  UIView *v5;
  UIView *hostedView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  hostedView = self->_hostedView;
  if (hostedView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](hostedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_hostedView, a3);
    -[PBFPosterGallerySmartAlbumConfigurationViewHostCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_hostedView);

    -[PBFPosterGallerySmartAlbumConfigurationViewHostCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBFPosterGallerySmartAlbumConfigurationViewHostCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)updateContent:(id)a3
{
  if (a3)
    (*((void (**)(id, UIView *))a3 + 2))(a3, self->_hostedView);
  -[PBFPosterGallerySmartAlbumConfigurationViewHostCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PBFPosterGallerySmartAlbumConfigurationViewHostCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
}

@end
