@implementation SearchUICollectionReusableView

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (SearchUICollectionReusableView)initWithFrame:(CGRect)a3
{
  SearchUICollectionReusableView *v3;
  SearchUICollectionReusableView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionReusableView;
  v3 = -[SearchUICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SearchUICollectionReusableView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SearchUICollectionReusableView addSubview:](v4, "addSubview:", v5);
      +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v5);
    }

  }
  return v4;
}

- (id)contentView
{
  return 0;
}

@end
