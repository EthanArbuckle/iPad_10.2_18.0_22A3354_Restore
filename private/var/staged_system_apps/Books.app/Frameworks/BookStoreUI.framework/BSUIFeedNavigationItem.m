@implementation BSUIFeedNavigationItem

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[BSUIFeedNavigationItem allowsTitle](self, "allowsTitle"))
  {
    v5.receiver = self;
    v5.super_class = (Class)BSUIFeedNavigationItem;
    -[BSUIFeedNavigationItem setTitle:](&v5, "setTitle:", v4);
  }

}

- (BOOL)allowsTitle
{
  return *(&self->super._isUpdatingManualScrollEdgeAppearanceProgress + 1);
}

- (void)setAllowsTitle:(BOOL)a3
{
  *(&self->super._isUpdatingManualScrollEdgeAppearanceProgress + 1) = a3;
}

@end
