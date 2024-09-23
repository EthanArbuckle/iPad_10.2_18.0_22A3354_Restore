@implementation BKGraphDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_stackIndexesHighlighted, 0);
  objc_storeStrong((id *)&self->_itemRemainingStack, 0);
  objc_storeStrong((id *)&self->_itemCountStack, 0);
}

@end
