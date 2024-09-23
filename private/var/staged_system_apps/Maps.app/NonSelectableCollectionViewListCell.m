@implementation NonSelectableCollectionViewListCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration", a3));
  -[NonSelectableCollectionViewListCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);

}

@end
