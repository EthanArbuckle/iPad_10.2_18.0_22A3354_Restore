@implementation TVPlaybackCustomEventUserInfo

- (TVPlaybackCustomEventUserInfo)initWithProperties:(id)a3 expectsReturnValue:(BOOL)a4
{
  id v6;
  TVPlaybackCustomEventUserInfo *v7;
  uint64_t v8;
  NSDictionary *properties;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVPlaybackCustomEventUserInfo;
  v7 = -[TVPlaybackCustomEventUserInfo init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    properties = v7->_properties;
    v7->_properties = (NSDictionary *)v8;

    v7->_expectsReturnValue = a4;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v4;

  if (sel_processReturnJSValue_inContext_ == a3)
    return self->_expectsReturnValue;
  v4.receiver = self;
  v4.super_class = (Class)TVPlaybackCustomEventUserInfo;
  return -[TVPlaybackCustomEventUserInfo respondsToSelector:](&v4, sel_respondsToSelector_);
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  void *v5;
  id returnValue;

  objc_msgSend(a3, "toObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  returnValue = self->_returnValue;
  self->_returnValue = v5;

}

- (NSDictionary)properties
{
  return self->_properties;
}

- (BOOL)expectsReturnValue
{
  return self->_expectsReturnValue;
}

- (void)setExpectsReturnValue:(BOOL)a3
{
  self->_expectsReturnValue = a3;
}

- (id)returnValue
{
  return self->_returnValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_returnValue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
