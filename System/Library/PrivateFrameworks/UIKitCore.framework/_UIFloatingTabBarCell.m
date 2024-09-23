@implementation _UIFloatingTabBarCell

+ (BOOL)_isInternalCell
{
  return 1;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarCell;
  -[UICollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (BOOL)hasSelectionHighlight
{
  return 0;
}

- (_UIFloatingTabBarListItem)listItem
{
  return self->_listItem;
}

- (void)setListItem:(id)a3
{
  objc_storeStrong((id *)&self->_listItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);
}

@end
