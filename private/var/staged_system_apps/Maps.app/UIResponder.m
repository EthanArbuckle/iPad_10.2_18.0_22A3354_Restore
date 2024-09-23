@implementation UIResponder

- (void)_maps_logResponderChain
{
  id v3;

  NSLog(CFSTR("%@"), a2, self);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UIResponder nextResponder](self, "nextResponder"));
  objc_msgSend(v3, "_maps_logResponderChain");

}

@end
