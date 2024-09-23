@implementation PLCaptureSessionStateUnknown

- (PLCaptureSessionStateUnknown)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCaptureSessionStateUnknown;
  return -[PLCaptureSessionState initWithType:](&v3, sel_initWithType_, 0);
}

- (id)description
{
  return CFSTR("PLCaptureSessionStateUnknown");
}

@end
