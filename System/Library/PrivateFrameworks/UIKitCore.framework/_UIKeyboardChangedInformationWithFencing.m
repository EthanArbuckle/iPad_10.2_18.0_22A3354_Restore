@implementation _UIKeyboardChangedInformationWithFencing

+ (id)animationFence
{
  return +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
}

@end
