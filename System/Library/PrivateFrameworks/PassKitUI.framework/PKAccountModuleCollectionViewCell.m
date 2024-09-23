@implementation PKAccountModuleCollectionViewCell

- (BOOL)configureWithAccount:(id)a3
{
  id v4;
  PKAccountModuleCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = PKAccountModuleCollectionViewCell.configure(account:)(v4);

  return self & 1;
}

- (PKAccountModuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKAccountModuleCollectionViewCell *v3;
  PKAccountModuleCollectionViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountModuleCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKAccountModuleCollectionViewCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v4, "setWantsCustomAppearance:", 0);
    -[PKDashboardCollectionViewCell setWantsDefaultHighlightBehavior:](v4, "setWantsDefaultHighlightBehavior:", 1);
    -[PKDashboardCollectionViewCell setMaskType:](v4, "setMaskType:", 3);
    -[PKAccountModuleCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67808]);
  }
  return v4;
}

@end
