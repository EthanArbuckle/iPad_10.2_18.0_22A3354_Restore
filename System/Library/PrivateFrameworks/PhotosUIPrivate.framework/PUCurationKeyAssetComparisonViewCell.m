@implementation PUCurationKeyAssetComparisonViewCell

- (PUCurationKeyAssetComparisonViewCell)initWithFrame:(CGRect)a3
{
  PUCurationKeyAssetComparisonViewCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  v3 = -[PUCurationKeyAssetComparisonViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[PUCurationKeyAssetComparisonViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  -[PUCurationKeyAssetComparisonViewCell layoutSubviews](&v8, sel_layoutSubviews);
  -[PUCurationKeyAssetComparisonViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", 3.0, 19.0, v5 + -6.0, v7 + -6.0 + -16.0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  -[PUCurationKeyAssetComparisonViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUCurationKeyAssetComparisonViewCell setThumbnailImage:](self, "setThumbnailImage:", 0);
  -[PUCurationKeyAssetComparisonViewCell setRepresentedAssetIdentifier:](self, "setRepresentedAssetIdentifier:", 0);
}

- (void)setThumbnailImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_representedAssetIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (double)cellHeightWithCellWidth:(double)a3
{
  return a3 + 6.0 + 16.0;
}

@end
