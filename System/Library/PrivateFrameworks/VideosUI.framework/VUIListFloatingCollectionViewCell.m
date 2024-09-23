@implementation VUIListFloatingCollectionViewCell

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (id)vuiContentView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIListFloatingCollectionViewCell;
  -[VUIBaseCollectionViewCell vuiContentView](&v3, sel_vuiContentView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIListFloatingCollectionViewCell;
  v4 = a3;
  -[VUIBaseCollectionViewCell setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  -[VUIListFloatingCollectionViewCell backgroundView](self, "backgroundView", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[VUIListFloatingCollectionViewCell setBackgroundView:](self, "setBackgroundView:", v6);

  }
  -[VUIListFloatingCollectionViewCell backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

}

- (void)setHighlightedBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIListFloatingCollectionViewCell;
  v4 = a3;
  -[VUIBaseCollectionViewCell setHighlightedBackgroundColor:](&v8, sel_setHighlightedBackgroundColor_, v4);
  -[VUIListFloatingCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[VUIListFloatingCollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v6);

  }
  -[VUIListFloatingCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

}

@end
