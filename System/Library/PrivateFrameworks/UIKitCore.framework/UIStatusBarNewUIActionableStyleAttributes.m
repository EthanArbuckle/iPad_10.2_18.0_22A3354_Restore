@implementation UIStatusBarNewUIActionableStyleAttributes

- (UIStatusBarNewUIActionableStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  UIStatusBarNewUIActionableStyleAttributes *v11;
  _BOOL8 v12;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStatusBarNewUIActionableStyleAttributes;
  v11 = -[UIStatusBarNewUIStyleAttributes initWithRequest:backgroundColor:foregroundColor:hasBusyBackground:](&v14, sel_initWithRequest_backgroundColor_foregroundColor_hasBusyBackground_, v10, a4, a5, v6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "style") != 214 && objc_msgSend(v10, "style") != 111;
    -[UIStatusBarStyleAttributes setPulsingAnimationEnabled:](v11, "setPulsingAnimationEnabled:", v12);
  }

  return v11;
}

- (BOOL)shouldProduceReturnEvent
{
  return 1;
}

@end
