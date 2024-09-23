@implementation TSKMockUIAlert

+ (void)setDismissalButtonIndex:(int64_t)a3
{
  gMockUIAlertDismissalButtonIndex = a3;
}

- (TSKMockUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKMockUIAlert;
  return -[TSKAbstractAlert init](&v7, sel_init, a3, a4, a5, a6);
}

- (int64_t)cancelButtonIndex
{
  return 0;
}

- (int64_t)firstOtherButtonIndex
{
  return -1;
}

- (void)showWithDismissedByButtonBlock:(id)a3
{
  (*((void (**)(id, TSKMockUIAlert *, uint64_t))a3 + 2))(a3, self, gMockUIAlertDismissalButtonIndex);
}

@end
