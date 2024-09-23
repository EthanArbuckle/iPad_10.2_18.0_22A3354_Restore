@implementation PVEffectTimedPropertiesDelegateWrapper

- (PVEffectTimedPropertiesDelegateWrapper)initWithTimedPropertiesDelegate:(id)a3 supportedTimedPropertyGroups:(id)a4 userContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  PVEffectTimedPropertiesDelegateWrapper *v11;
  PVEffectTimedPropertiesDelegateWrapper *v12;
  unsigned __int8 v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PVEffectTimedPropertiesDelegateWrapper;
  v11 = -[PVEffectTimedPropertiesDelegateWrapper init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PVEffectTimedPropertiesDelegateWrapper setTimedPropertiesDelegate:](v11, "setTimedPropertiesDelegate:", v8);
    -[PVEffectTimedPropertiesDelegateWrapper setSupportedTimedPropertyGroups:](v12, "setSupportedTimedPropertyGroups:", v9);
    -[PVEffectTimedPropertiesDelegateWrapper setUserContext:](v12, "setUserContext:", v10);
    v13 = objc_opt_respondsToSelector();
    -[PVEffectTimedPropertiesDelegateWrapper setWantsStartStopNotifications:](v12, "setWantsStartStopNotifications:", v13 & objc_opt_respondsToSelector() & 1);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PVEffectTimedPropertiesDelegateWrapper timedPropertiesDelegate](self, "timedPropertiesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PVEffectTimedPropertiesDelegateWrapper timedPropertiesDelegate](self, "timedPropertiesDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timedPropertiesDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    -[PVEffectTimedPropertiesDelegateWrapper timedPropertiesDelegate](self, "timedPropertiesDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v4);
  }

  return v7;
}

- (PVEffectTimedPropertiesDelegate)timedPropertiesDelegate
{
  return (PVEffectTimedPropertiesDelegate *)objc_loadWeakRetained((id *)&self->_timedPropertiesDelegate);
}

- (void)setTimedPropertiesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_timedPropertiesDelegate, a3);
}

- (NSArray)supportedTimedPropertyGroups
{
  return self->_supportedTimedPropertyGroups;
}

- (void)setSupportedTimedPropertyGroups:(id)a3
{
  objc_storeStrong((id *)&self->_supportedTimedPropertyGroups, a3);
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (BOOL)wantsStartStopNotifications
{
  return self->_wantsStartStopNotifications;
}

- (void)setWantsStartStopNotifications:(BOOL)a3
{
  self->_wantsStartStopNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_supportedTimedPropertyGroups, 0);
  objc_destroyWeak((id *)&self->_timedPropertiesDelegate);
}

@end
