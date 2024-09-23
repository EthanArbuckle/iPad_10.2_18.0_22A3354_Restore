@implementation VUICollectionViewFeaturedCell

+ (double)_iOSLockupWidthWithWindowWidth:(double)result safeAreaInsets:(UIEdgeInsets)a4 showsPageControl:(BOOL)a5
{
  if (!a5)
    return result - a4.left * 0.5 - a4.right * 0.5;
  return result;
}

- (VUICollectionViewFeaturedCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  VUICollectionViewFeaturedCell *v7;
  VUICollectionViewFeaturedCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VUICollectionViewFeaturedCell;
  v7 = -[VUIBaseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7)
    -[VUICollectionViewFeaturedCell _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  return v8;
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VUICollectionViewFeaturedView *v8;
  double v9;
  VUICollectionViewFeaturedView *v10;
  VUICollectionViewFeaturedView *featuredView;
  id v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [VUICollectionViewFeaturedView alloc];
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = -[VUICollectionViewFeaturedView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0, v9, CGRectGetHeight(v14));
  featuredView = self->_featuredView;
  self->_featuredView = v10;

  -[VUICollectionViewFeaturedView setTranslatesAutoresizingMaskIntoConstraints:](self->_featuredView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[VUICollectionViewFeaturedView setAutoresizingMask:](self->_featuredView, "setAutoresizingMask:", 18);
  -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vui_addSubview:oldView:", self->_featuredView, 0);

}

- (VUICollectionViewFeaturedView)featuredView
{
  return self->_featuredView;
}

- (void)setFeaturedView:(id)a3
{
  objc_storeStrong((id *)&self->_featuredView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredView, 0);
}

@end
