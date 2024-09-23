@implementation _UIKeyShortcutHUDMenuCell

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDMenuCell;
  -[_UIKeyShortcutHUDCell updateConfigurationUsingState:](&v6, sel_updateConfigurationUsingState_, a3);
  -[UICollectionViewCell backgroundConfiguration](self, "backgroundConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuCellCornerRadius");
  objc_msgSend(v4, "setCornerRadius:");

  -[UICollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);
}

@end
