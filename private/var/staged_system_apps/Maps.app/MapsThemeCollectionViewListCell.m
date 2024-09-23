@implementation MapsThemeCollectionViewListCell

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 1;
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
  v9.super_class = (Class)MapsThemeCollectionViewListCell;
  -[MapsThemeCollectionViewListCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewListCell traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewListCell traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeCollectionViewListCell updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionViewListCell;
  -[MapsThemeCollectionViewListCell didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionViewListCell window](self, "window"));

  if (v3)
    -[MapsThemeCollectionViewListCell updateTheme](self, "updateTheme");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  double x;
  double y;
  double width;
  double v9;
  CGRect v11;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(self), "_maps_overridePreferredLayoutAttributesWithCompressedSize") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "copy");
    objc_msgSend(v5, "frame");
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    -[MapsThemeCollectionViewListCell _maps_compressedSizeForWidth:withBlock:](self, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v11));
    objc_msgSend(v5, "setFrame:", x, y, width, v9);
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

@end
