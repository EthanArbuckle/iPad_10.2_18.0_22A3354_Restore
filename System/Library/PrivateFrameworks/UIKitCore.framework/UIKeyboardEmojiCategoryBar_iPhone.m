@implementation UIKeyboardEmojiCategoryBar_iPhone

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIKeyboardEmojiCategoryBar_iPhone *v5;

  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
    v5 = self;
  else
    v5 = 0;
  return v5;
}

@end
