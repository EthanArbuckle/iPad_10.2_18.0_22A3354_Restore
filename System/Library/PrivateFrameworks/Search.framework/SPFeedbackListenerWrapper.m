@implementation SPFeedbackListenerWrapper

+ (void)initialize
{
  if (initFeedbackTables_onceToken != -1)
    dispatch_once(&initFeedbackTables_onceToken, &__block_literal_global_0);
}

- (BOOL)supportsFeedbackType:(int64_t)a3
{
  return (self->_supportedTypes & (1 << a3)) != 0;
}

+ (id)wrapperWithFeedbackListener:(id)a3
{
  id v3;
  SPFeedbackListenerWrapper *v4;

  v3 = a3;
  v4 = -[SPFeedbackListenerWrapper initWithFeedbackListener:]([SPFeedbackListenerWrapper alloc], "initWithFeedbackListener:", v3);

  return v4;
}

- (SPFeedbackListenerWrapper)initWithFeedbackListener:(id)a3
{
  id v5;
  SPFeedbackListenerWrapper *v6;
  SPFeedbackListenerWrapper *v7;
  uint64_t i;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPFeedbackListenerWrapper;
  v6 = -[SPFeedbackListenerWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackListener, a3);
    for (i = 1; i != 27; ++i)
    {
      if (sSPFeedbackTypeSelectorTable[i] && (objc_opt_respondsToSelector() & 1) != 0)
        v7->_supportedTypes |= (1 << i);
    }
  }

  return v7;
}

- (SFFeedbackListener)feedbackListener
{
  return self->_feedbackListener;
}

- (void)setFeedbackListener:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackListener, a3);
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (void)setSupportedTypes:(unint64_t)a3
{
  self->_supportedTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackListener, 0);
}

@end
