@implementation CLTranscriptSubscriptionAdapter

- (CLTranscriptSubscriptionAdapter)init
{
  CLTranscriptSubscriptionAdapter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTranscriptSubscriptionAdapter;
  result = -[CLTranscriptSubscriptionAdapter init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
