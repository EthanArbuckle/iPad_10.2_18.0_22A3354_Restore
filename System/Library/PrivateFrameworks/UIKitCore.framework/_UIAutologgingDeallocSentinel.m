@implementation _UIAutologgingDeallocSentinel

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!-[_UIAutologgingDeallocSentinel called](self, "called"))
  {
    -[_UIAutologgingDeallocSentinel message](self, "message");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)_UIAutologgingDeallocSentinel;
  -[_UIAutologgingDeallocSentinel dealloc](&v4, sel_dealloc);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)called
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  self->_called = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
