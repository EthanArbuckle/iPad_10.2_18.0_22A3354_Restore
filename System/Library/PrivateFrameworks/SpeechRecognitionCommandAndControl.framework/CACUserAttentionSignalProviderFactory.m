@implementation CACUserAttentionSignalProviderFactory

- (CACUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5
{
  CACUserAttentionSignalProviderFactory *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACUserAttentionSignalProviderFactory;
  result = -[CACUserAttentionSignalProviderFactory init](&v9, sel_init);
  if (result)
  {
    result->_samplingInterval = a3;
    result->_attentionLossTimeout = a4;
    result->_supportedAttentionAwarenessEvents = a5;
  }
  return result;
}

- (id)faceAttentionAwarenessClient
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE09590]);
  objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.SpeechRecognitionCore.AttentionAwareness.Face"), -[CACUserAttentionSignalProviderFactory _faceAttentionAwarenessEventMask](self, "_faceAttentionAwarenessEventMask"), self->_samplingInterval, self->_attentionLossTimeout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:shouldReset:", v4, 1);

  return v3;
}

- (id)touchAttentionAwarenessClient
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE09590]);
  objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.SpeechRecognitionCore.AttentionAwareness.Touch"), -[CACUserAttentionSignalProviderFactory _touchAttentionAwarenessEventMask](self, "_touchAttentionAwarenessEventMask"), 0.1, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:shouldReset:", v4, 1);

  return v3;
}

- (id)wakeGestureManager
{
  return (id)objc_msgSend(MEMORY[0x24BDC1448], "sharedManager");
}

- (unint64_t)_faceAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x81;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  if ((self->_supportedAttentionAwarenessEvents & 0x200) != 0)
    return self->_supportedAttentionAwarenessEvents & 1 | 8;
  else
    return self->_supportedAttentionAwarenessEvents & 9;
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
  objc_msgSend(v11, "setSampleWhileAbsent:", 1);
  objc_msgSend(v11, "setAttentionLostTimeout:", a6);
  objc_msgSend(v11, "setNotificationMask:", 3);
  return v11;
}

@end
