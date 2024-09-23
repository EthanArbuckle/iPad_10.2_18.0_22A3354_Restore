@implementation _UIKeyShortcutHUDCell

- (_UIKeyShortcutHUDCell)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDCell *v3;
  _UIKeyShortcutHUDCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDCell;
  v3 = -[UICollectionViewListCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UICollectionViewCell setAutomaticallyUpdatesContentConfiguration:](v3, "setAutomaticallyUpdatesContentConfiguration:", 0);
    -[UICollectionViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v4, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4
{
  return a4 != 5;
}

- (id)configurationState
{
  _UIKeyShortcutHUDCellConfigurationState *v3;
  void *v4;
  _UIKeyShortcutHUDCellConfigurationState *v5;
  objc_super v7;

  v3 = [_UIKeyShortcutHUDCellConfigurationState alloc];
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDCell;
  -[UICollectionViewListCell configurationState](&v7, sel_configurationState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIKeyShortcutHUDCellConfigurationState initWithCellConfigurationState:](v3, "initWithCellConfigurationState:", v4);

  -[_UIKeyShortcutHUDCellConfigurationState setFlashing:](v5, "setFlashing:", -[_UIKeyShortcutHUDCell isFlashing](self, "isFlashing"));
  -[_UIKeyShortcutHUDCellConfigurationState setCategoryVisible:](v5, "setCategoryVisible:", -[_UIKeyShortcutHUDCell isCategoryVisible](self, "isCategoryVisible"));
  -[_UIKeyShortcutHUDCellConfigurationState setDrawsBackground:](v5, "setDrawsBackground:", -[_UIKeyShortcutHUDCell drawsBackground](self, "drawsBackground"));
  return v5;
}

- (void)setFlashing:(BOOL)a3
{
  if (self->_flashing != a3)
  {
    self->_flashing = a3;
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)setCategoryVisible:(BOOL)a3
{
  if (self->_categoryVisible != a3)
  {
    self->_categoryVisible = a3;
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)setDrawsBackground:(BOOL)a3
{
  if (self->_drawsBackground != a3)
  {
    self->_drawsBackground = a3;
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDCell;
  -[UICollectionViewListCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_flashing = 0;
  self->_categoryVisible = 0;
  self->_drawsBackground = 0;
}

- (BOOL)isBackgroundVisible
{
  _UIKeyShortcutHUDCell *v2;
  void *v3;

  v2 = self;
  -[_UIKeyShortcutHUDCell configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_UIKeyShortcutHUDCell _backgroundStyleForState:](v2, "_backgroundStyleForState:", v3) != 3;

  return (char)v2;
}

- (int64_t)_backgroundStyleForState:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isFlashing") & 1) != 0
    || (objc_msgSend(v3, "isHighlighted") & 1) != 0
    || objc_msgSend(v3, "isSelected"))
  {
    if ((objc_msgSend(v3, "isFlashing") & 1) == 0
      && objc_msgSend(v3, "isHighlighted")
      && (objc_msgSend(v3, "isSelected") & 1) != 0)
    {
      v4 = 2;
    }
    else
    {
      v4 = !objc_msgSend(v3, "isFlashing")
        || (objc_msgSend(v3, "isHighlighted") & 1) == 0 && (objc_msgSend(v3, "isSelected") & 1) == 0;
    }
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (id)defaultContentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyShortcutHUDCell;
  -[UICollectionViewListCell defaultContentConfiguration](&v13, sel_defaultContentConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardHUDFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v5, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(v3, "standardHUDTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setNumberOfLines:", 1);
  objc_msgSend(v3, "shortcutTitleToSubtitleVerticalPadding");
  objc_msgSend(v4, "setTextToSecondaryTextVerticalPadding:");
  objc_msgSend(v4, "secondaryTextProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortcutSubtitleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v8, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(v3, "shortcutSubtitleTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v10);

  objc_msgSend(v8, "setNumberOfLines:", 1);
  objc_msgSend(v3, "menuCellHorizontalContentMargin");
  objc_msgSend(v4, "setDirectionalLayoutMargins:", 0.0, v11, 0.0, v11);

  return v4;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setFocused:", 0);
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedConfigurationForState:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "drawsBackground"))
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    +[UIColor clearColor](UIColor, "clearColor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = (void *)v7;
    objc_msgSend(v5, "setBackgroundColor:", v7);
LABEL_5:

  }
  else
  {
    v9 = -[_UIKeyShortcutHUDCell _backgroundStyleForState:](self, "_backgroundStyleForState:", v12);
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch(v9)
    {
      case 0:
        +[UIColor systemFillColor](UIColor, "systemFillColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      case 1:
        +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      case 2:
        +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alphaComponent");
        objc_msgSend(v8, "colorWithAlphaComponent:", v10 * 0.7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBackgroundColor:", v11);

        goto LABEL_5;
      case 3:
        goto LABEL_3;
      default:
        break;
    }
  }
  -[UICollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

}

- (BOOL)isFlashing
{
  return self->_flashing;
}

- (BOOL)isCategoryVisible
{
  return self->_categoryVisible;
}

- (BOOL)drawsBackground
{
  return self->_drawsBackground;
}

@end
