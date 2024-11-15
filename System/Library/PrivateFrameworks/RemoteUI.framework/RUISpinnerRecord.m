@implementation RUISpinnerRecord

- (NSArray)rightItems
{
  return self->_rightItems;
}

- (void)setRightItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)leftItems
{
  return self->_leftItems;
}

- (void)setLeftItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (void)setNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItem, a3);
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)spinningTitle
{
  return self->_spinningTitle;
}

- (void)setSpinningTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinningTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_leftItems, 0);
  objc_storeStrong((id *)&self->_rightItems, 0);
}

@end
