@implementation _UIKeyboardBasedNonEditableTextSelectionGestureController

- (Class)textInteractionClass
{
  return (Class)objc_opt_class();
}

@end
