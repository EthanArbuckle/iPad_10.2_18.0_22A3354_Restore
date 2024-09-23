@implementation TMLUIBarButtonItemActionTarget

- (void)action:(id)a3
{
  double v3;

  objc_msgSend_emitTMLSignal_withArguments_(a3, a2, v3, CFSTR("action"), 0);
}

@end
