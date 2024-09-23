@implementation PLCaptureSessionStateNone

- (PLCaptureSessionStateNone)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCaptureSessionStateNone;
  return -[PLCaptureSessionState initWithType:](&v3, sel_initWithType_, 1);
}

- (id)description
{
  return CFSTR("PLCaptureSessionStateNone");
}

@end
