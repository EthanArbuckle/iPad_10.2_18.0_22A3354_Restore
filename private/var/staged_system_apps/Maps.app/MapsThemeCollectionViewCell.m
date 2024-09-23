@implementation MapsThemeCollectionViewCell

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 1;
}

- (MapsThemeCollectionViewCell)initWithFrame:(CGRect)a3
{
  MapsThemeCollectionViewCell *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsThemeCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MapsThemeCollectionViewCell setBackgroundView:](v3, "setBackgroundView:", v5);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionViewCell;
  -[MapsThemeCollectionViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewCell traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewCell traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeCollectionViewCell updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionViewCell;
  -[MapsThemeCollectionViewCell didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewCell window](self, "window"));

  if (v3)
    -[MapsThemeCollectionViewCell updateTheme](self, "updateTheme");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  CGRect v18;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(self), "_maps_overridePreferredLayoutAttributesWithCompressedSize") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "copy");
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewCell contentView](self, "contentView"));
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    objc_msgSend(v14, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v18));
    v16 = v15;

    objc_msgSend(v5, "setFrame:", v7, v9, v11, v16);
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

@end
