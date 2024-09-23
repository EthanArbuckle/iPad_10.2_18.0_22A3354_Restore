@implementation RPTInteractionOptions

- (RCPEventSenderProperties)senderProperties
{
  void *v2;

  v2 = -[RPTInteractionOptions preferredIdiom](self, "preferredIdiom");
  if (v2 == (void *)2)
  {
    objc_msgSend(getRCPEventSenderPropertiesClass(), "mouseSender");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == (void *)1)
  {
    objc_msgSend(getRCPEventSenderPropertiesClass(), "trackpadSender");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v2)
  {
    objc_msgSend(getRCPEventSenderPropertiesClass(), "touchScreenDigitizerSender");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (RCPEventSenderProperties *)v2;
}

+ (RPTInteractionOptions)defaultForPlatform
{
  if (defaultForPlatform_onceToken != -1)
    dispatch_once(&defaultForPlatform_onceToken, &__block_literal_global_1);
  return (RPTInteractionOptions *)(id)defaultForPlatform_defaultForPlatform;
}

- (unint64_t)preferredIdiom
{
  return self->_preferredIdiom;
}

- (void)setPreferredIdiom:(unint64_t)a3
{
  self->_preferredIdiom = a3;
}

- (RPTInteractionOptions)init
{
  RPTInteractionOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RPTInteractionOptions;
  result = -[RPTInteractionOptions init](&v3, sel_init);
  if (result)
    result->_pointerFrequency = 120;
  return result;
}

uint64_t __43__RPTInteractionOptions_defaultForPlatform__block_invoke()
{
  RPTInteractionOptions *v0;
  void *v1;
  void *v2;
  unsigned int v3;

  v0 = objc_alloc_init(RPTInteractionOptions);
  v1 = (void *)defaultForPlatform_defaultForPlatform;
  defaultForPlatform_defaultForPlatform = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isiOSAppOnMac");

  return objc_msgSend((id)defaultForPlatform_defaultForPlatform, "setPreferredIdiom:", v3);
}

- (BOOL)prefersPointer
{
  return self->_preferredIdiom != 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RPTInteractionOptions preferredIdiom](self, "preferredIdiom");
  -[RPTInteractionOptions senderProperties](self, "senderProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p preferredIdiom: %lu; senderProperties: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)pointerFrequency
{
  return self->_pointerFrequency;
}

- (void)setPointerFrequency:(int64_t)a3
{
  self->_pointerFrequency = a3;
}

@end
