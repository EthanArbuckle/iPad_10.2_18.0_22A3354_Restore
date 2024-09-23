@implementation UIAccessibilityCustomRotorSearchPredicate

- (UIAccessibilityCustomRotorItemResult)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(UIAccessibilityCustomRotorItemResult *)currentItem
{
  objc_storeStrong((id *)&self->_currentItem, currentItem);
}

- (UIAccessibilityCustomRotorDirection)searchDirection
{
  return self->_searchDirection;
}

- (void)setSearchDirection:(UIAccessibilityCustomRotorDirection)searchDirection
{
  self->_searchDirection = searchDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end
