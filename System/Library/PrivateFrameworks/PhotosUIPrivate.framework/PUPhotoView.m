@implementation PUPhotoView

- (PUPhotoView)initWithFrame:(CGRect)a3
{
  PUPhotoView *v3;
  PUPhotoViewContentHelper *v4;
  PUPhotoViewContentHelper *contentHelper;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoView;
  v3 = -[PUPhotoView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[PUPhotoViewContentHelper initWithContentView:]([PUPhotoViewContentHelper alloc], "initWithContentView:", v3);
    contentHelper = v3->_contentHelper;
    v3->_contentHelper = v4;

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PUPhotoViewContentHelper contentViewSizeThatFits:](self->_contentHelper, "contentViewSizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoView;
  -[PUPhotoView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUPhotoViewContentHelper layoutSubviewsOfContentView](self->_contentHelper, "layoutSubviewsOfContentView");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoView;
  v4 = a3;
  -[PUPhotoView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PUPhotoView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PUPhotoViewContentHelper contentViewDynamicUserInterfaceTraitDidChange](self->_contentHelper, "contentViewDynamicUserInterfaceTraitDidChange");
}

- (PUPhotoViewContentHelper)contentHelper
{
  return self->_contentHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHelper, 0);
}

@end
