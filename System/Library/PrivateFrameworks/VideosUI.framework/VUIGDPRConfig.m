@implementation VUIGDPRConfig

- (void)setPopoverHeight:(double)a3
{
  self->_popoverHeight = a3;
}

- (VUIGDPRConfig)init
{
  VUIGDPRConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIGDPRConfig;
  result = -[VUIGDPRConfig init](&v3, sel_init);
  if (result)
    result->_popoverHeight = 0.0;
  return result;
}

- (double)popoverHeight
{
  return self->_popoverHeight;
}

@end
