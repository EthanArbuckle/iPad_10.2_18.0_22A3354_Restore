@implementation SASUIUserEngagementProviderFactory

- (SASUIUserEngagementProviderFactory)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4
{
  SASUIUserEngagementProviderFactory *v6;
  SASUIUserEngagementProviderFactory *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SASUIUserEngagementProviderFactory;
  v6 = -[SASUIUserEngagementProviderFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_samplingInterval = a3;
    v6->_attentionLossTimeout = a4;
    v6->_supportedAttentionAwarenessEvents = -[SASUIUserEngagementProviderFactory supportedEvents](v6, "supportedEvents");
  }
  return v7;
}

- (id)touchAttentionAwarenessClient
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE09590]);
  objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.siri.AttentionAwareness.Touch"), -[SASUIUserEngagementProviderFactory _touchAttentionAwarenessEventMask](self, "_touchAttentionAwarenessEventMask"), 0.1, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:shouldReset:", v4, 1);

  return v3;
}

- (id)buttonPressAwarenessClient
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE09590]);
  objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.siri.AttentionAwareness.ButtonPress"), -[SASUIUserEngagementProviderFactory _buttonPressAwarenessClientEventMask](self, "_buttonPressAwarenessClientEventMask"), 0.1, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:shouldReset:", v4, 1);

  return v3;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x209;
}

- (unint64_t)_buttonPressAwarenessClientEventMask
{
  return self->_supportedAttentionAwarenessEvents & 3;
}

- (unint64_t)supportedEvents
{
  return objc_msgSend(MEMORY[0x24BE09598], "supportedEvents");
}

+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6
{
  objc_class *v9;
  id v10;
  id v11;

  v9 = (objc_class *)MEMORY[0x24BE09598];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setIdentifier:", v10);

  objc_msgSend(v11, "setEventMask:", a4);
  objc_msgSend(v11, "setSamplingInterval:", a5);
  objc_msgSend(v11, "setAttentionLostTimeout:", a6);
  return v11;
}

@end
