@implementation TUIPredictionViewStackContentView

- (void)willRemoveSubview:(id)a3
{
  id v3;

  -[TUIPredictionViewStackContentView superview](self, "superview", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

@end
