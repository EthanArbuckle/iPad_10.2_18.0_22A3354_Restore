@implementation _UITabSidebarHeaderFooterCell

- (void)setContentConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITabSidebarHeaderFooterCell;
  -[UICollectionViewCell setContentConfiguration:](&v4, sel_setContentConfiguration_, a3);
  -[UICollectionReusableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

@end
