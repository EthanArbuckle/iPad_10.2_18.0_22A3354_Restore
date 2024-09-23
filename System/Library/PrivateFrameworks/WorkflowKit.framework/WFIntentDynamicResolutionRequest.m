@implementation WFIntentDynamicResolutionRequest

- (WFIntentDynamicResolutionRequest)init
{
  WFIntentDynamicResolutionRequest *v2;
  WFIntentDynamicResolutionRequest *v3;
  WFIntentDynamicResolutionRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFIntentDynamicResolutionRequest;
  v2 = -[WFIntentDynamicResolutionRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v4 = v2;
  }

  return v3;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (id)resolutionBlock
{
  return self->_resolutionBlock;
}

- (void)setResolutionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolutionBlock, 0);
}

@end
