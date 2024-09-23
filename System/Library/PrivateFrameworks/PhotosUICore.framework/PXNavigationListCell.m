@implementation PXNavigationListCell

- (PXNavigationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXNavigationListCell *v4;
  PXNavigationListCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXNavigationListCell;
  v4 = -[PXNavigationListCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    -[PXNavigationListCell setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    -[PXNavigationListCell setAccessoryType:](v5, "setAccessoryType:", 1);
  }
  return v5;
}

- (void)setSeparatorStyleWorkaround57597636:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXNavigationListCell;
  -[PXNavigationListCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, a3);
}

- (int64_t)separatorStyleWorkaround57597636
{
  return self->_separatorStyleWorkaround57597636;
}

@end
