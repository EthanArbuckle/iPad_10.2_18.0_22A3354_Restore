@implementation _PXUIAssetBadgeImageView

- (_PXUIAssetBadgeImageView)initWithFrame:(CGRect)a3
{
  _PXUIAssetBadgeImageView *v3;
  _PXUIAssetBadgeImageView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXUIAssetBadgeImageView;
  v3 = -[_PXUIAssetBadgeImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_PXUIAssetBadgeImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentsGravity:", CFSTR("resize"));

  }
  return v4;
}

- (void)setImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[_PXUIAssetBadgeImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v6), "CGImage"));

  }
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
