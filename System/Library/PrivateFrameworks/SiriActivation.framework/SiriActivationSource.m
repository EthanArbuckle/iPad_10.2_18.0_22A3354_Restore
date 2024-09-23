@implementation SiriActivationSource

- (SiriActivationSource)init
{
  SiriActivationSource *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriActivationSource;
  v2 = -[SiriActivationSource init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SiriActivationSource invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SiriActivationSource;
  -[SiriActivationSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isEnabled
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  v2 = _AXSHomeButtonAssistant();
  +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "siriIsSupported"))
  {
    +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "siriIsEnabled");
    if (v2)
      v6 = v5;
    else
      v6 = 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isActive
{
  return !self->_knowsIfActive || self->_active;
}

- (void)invalidate
{
  NSObject *v3;
  BSServiceConnection *connection;
  BSServiceConnection *v5;
  int v6;
  const char *v7;
  __int16 v8;
  BSServiceConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v6 = 136315394;
    v7 = "-[SiriActivationSource invalidate]";
    v8 = 2112;
    v9 = connection;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation invalidating BSServiceConnection %@", (uint8_t *)&v6, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v5 = self->_connection;
  self->_connection = 0;

  *(_WORD *)&self->_active = 256;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)activeChangedTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 active;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    active = self->_active;
    v8 = v5;
    objc_msgSend(v6, "numberWithBool:", active);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SiriActivationSource activeChangedTo:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation old availability: %@, new availability: %@", (uint8_t *)&v11, 0x20u);

  }
  self->_active = objc_msgSend(v4, "BOOLValue");
  self->_knowsIfActive = 1;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
