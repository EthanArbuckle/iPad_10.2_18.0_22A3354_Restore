@implementation CarCollectionView

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v5;
  id v6;
  objc_super v7;

  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CarCollectionView;
  -[CarCollectionView setAccessoryView:atEdge:](&v7, "setAccessoryView:atEdge:", v5, 4);
  v6 = objc_msgSend(v5, "_mapsCar_injectBlurView");

}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarCollectionView;
  v3 = -[CarCollectionView accessoryViewAtEdge:](&v5, "accessoryViewAtEdge:", 4);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)accessibilityIdentifier
{
  return CFSTR("CarCollectionView");
}

@end
