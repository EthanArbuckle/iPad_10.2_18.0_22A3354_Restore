@implementation _SBProximityTouchHandlingWindow

+ (_SBProximityTouchHandlingWindow)proximityTouchHandlingWindowWithScene:(void *)a3 viewController:
{
  id v4;
  id v5;
  _SBProximityTouchHandlingWindow *v6;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([_SBProximityTouchHandlingWindow alloc], "initWithWindowScene:role:debugName:", v5, 0, CFSTR("_SBProximityTouchHandlingWindow"));

  -[_SBProximityTouchHandlingWindow setRootViewController:](v6, "setRootViewController:", v4);
  -[_SBProximityTouchHandlingWindow setLevel:](v6, "setLevel:", 999999.0);
  -[_SBProximityTouchHandlingWindow setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
  return v6;
}

@end
