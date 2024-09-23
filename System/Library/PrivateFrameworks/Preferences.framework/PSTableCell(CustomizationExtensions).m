@implementation PSTableCell(CustomizationExtensions)

- (BOOL)isCopyable
{
  return self->_isCopyable;
}

- (void)setIsCopyable:()CustomizationExtensions
{
  self->_isCopyable = a3;
}

- (UILongPressGestureRecognizer)longTapRecognizer
{
  return self->_longTapRecognizer;
}

- (void)setLongTapRecognizer:()CustomizationExtensions
{
  objc_storeStrong((id *)&self->_longTapRecognizer, a3);
}

@end
