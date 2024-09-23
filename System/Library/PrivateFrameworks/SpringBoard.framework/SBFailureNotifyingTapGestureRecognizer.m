@implementation SBFailureNotifyingTapGestureRecognizer

- (SBFailureNotifyingTapGestureRecognizerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFailureNotifyingTapGestureRecognizer;
  -[SBFailureNotifyingTapGestureRecognizer delegate](&v3, sel_delegate);
  return (SBFailureNotifyingTapGestureRecognizerDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFailureNotifyingTapGestureRecognizer;
  -[SBFailureNotifyingTapGestureRecognizer setDelegate:](&v3, sel_setDelegate_, a3);
}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v5 = -[SBFailureNotifyingTapGestureRecognizer state](self, "state");
  if (a3 == 5 && v5 != 5)
  {
    -[SBFailureNotifyingTapGestureRecognizer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gestureRecognizerTransitionedToFailed:", self);

  }
  v7.receiver = self;
  v7.super_class = (Class)SBFailureNotifyingTapGestureRecognizer;
  -[SBFailureNotifyingTapGestureRecognizer setState:](&v7, sel_setState_, a3);
}

@end
