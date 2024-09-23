@implementation UIInputViewSetPlacementOffScreenDownForFloatingAssistant

+ (id)placement
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)showsEditItems
{
  return 0;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementOffScreenDownForFloatingAssistant;
  -[UIInputViewSetPlacement remoteIntrinsicContentSizeForInputViewInSet:includingIAV:](&v8, sel_remoteIntrinsicContentSizeForInputViewInSet_includingIAV_, a3, a4);
  v6 = 1.0;
  v7 = 0.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (BOOL)isFloatingAssistantView
{
  return 1;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

@end
