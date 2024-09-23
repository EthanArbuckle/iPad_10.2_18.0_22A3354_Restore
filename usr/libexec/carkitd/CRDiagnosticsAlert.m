@implementation CRDiagnosticsAlert

- (BOOL)allowInCar
{
  return 1;
}

- (double)alertDismissal
{
  double result;

  -[CRDiagnosticsAlert timeoutInterval](self, "timeoutInterval");
  return result;
}

- (id)alertTitle
{
  return -[CRDiagnosticsAlert bannerMessage](self, "bannerMessage");
}

- (id)lockscreenTitle
{
  return -[CRDiagnosticsAlert bannerMessage](self, "bannerMessage");
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("OK"), a2);
}

- (NSString)bannerMessage
{
  return self->_bannerMessage;
}

- (void)setBannerMessage:(id)a3
{
  objc_storeStrong((id *)&self->_bannerMessage, a3);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerMessage, 0);
}

@end
