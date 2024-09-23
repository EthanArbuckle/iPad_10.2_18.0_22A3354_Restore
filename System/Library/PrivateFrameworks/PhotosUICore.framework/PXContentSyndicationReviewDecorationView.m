@implementation PXContentSyndicationReviewDecorationView

- (PXContentSyndicationReviewDecorationView)initWithFrame:(CGRect)a3
{
  PXContentSyndicationReviewDecorationView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXContentSyndicationReviewDecorationView;
  v3 = -[PXContentSyndicationReviewDecorationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[PXContentSyndicationReviewDecorationView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  -[PXContentSyndicationReviewDecorationView _positionSubviews](self, "_positionSubviews");
  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationReviewDecorationView;
  -[PXContentSyndicationReviewDecorationView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_positionSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  v3 = -[PXContentSyndicationReviewDecorationView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[PXContentSyndicationReviewDecorationView bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.2;
  v8 = v6 * 0.05;
  v9 = v4 - v6 * 0.05 - v6 * 0.2;
  if (v3)
    v9 = v8;
  v10 = v7;
  v11 = CGRectIntegral(*(CGRect *)&v9);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (void)_setEligibility:(int64_t)a3
{
  id v4;

  if (self->_eligibility != a3)
  {
    self->_eligibility = a3;
    PXContentSyndicationReviewDecorationImageForSyndicationEligibility(a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v4);

  }
}

- (void)_updateAssetInformation
{
  void *v3;
  uint64_t v4;

  -[PXContentSyndicationReviewDecorationView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXContentSyndicationReviewDecorationEligibilityForAssetReference(v3);

  -[PXContentSyndicationReviewDecorationView _setEligibility:](self, "_setEligibility:", v4);
}

- (void)setUserData:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;

  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    -[PXContentSyndicationReviewDecorationView _updateAssetInformation](self, "_updateAssetInformation");
    v5 = v6;
  }

}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXAssetReference)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
