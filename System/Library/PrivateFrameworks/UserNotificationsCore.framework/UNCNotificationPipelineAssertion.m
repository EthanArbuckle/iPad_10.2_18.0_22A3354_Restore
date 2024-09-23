@implementation UNCNotificationPipelineAssertion

- (UNCNotificationPipelineAssertion)init
{
  UNCNotificationPipelineAssertion *v2;
  UNCNotificationPipelineAssertionImpl *v3;
  UNCNotificationPipelineAssertionImpl *assertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNCNotificationPipelineAssertion;
  v2 = -[UNCNotificationPipelineAssertion init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(UNCNotificationPipelineAssertionImpl);
    assertion = v2->_assertion;
    v2->_assertion = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
