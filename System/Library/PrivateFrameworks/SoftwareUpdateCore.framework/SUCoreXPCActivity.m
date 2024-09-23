@implementation SUCoreXPCActivity

- (id)init:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUCoreXPCActivity *v12;
  SUCoreXPCActivity *v13;
  uint64_t v14;
  id handler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreXPCActivity;
  v12 = -[SUCoreXPCActivity init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityName, a3);
    v14 = MEMORY[0x1DF0E6BC4](v11);
    handler = v13->_handler;
    v13->_handler = (id)v14;

    objc_storeStrong((id *)&v13->_activityOptions, a4);
    v13->_isRegisteredWithXPC = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreXPCActivity *v4;
  void *v5;
  char v6;

  v4 = (SUCoreXPCActivity *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUCoreXPCActivity activityName](v4, "activityName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", self->_activityName);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_handler)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_isRegisteredWithXPC)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ Options: {%@} HandlerSet: %@ RegisteredWithXPC: %@"), self->_activityName, self->_activityOptions, v3, v2);
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
  objc_storeStrong((id *)&self->_activityName, a3);
}

- (SUCoreActivityOptions)activityOptions
{
  return self->_activityOptions;
}

- (void)setActivityOptions:(id)a3
{
  objc_storeStrong((id *)&self->_activityOptions, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isRegisteredWithXPC
{
  return self->_isRegisteredWithXPC;
}

- (void)setIsRegisteredWithXPC:(BOOL)a3
{
  self->_isRegisteredWithXPC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_activityOptions, 0);
  objc_storeStrong((id *)&self->_activityName, 0);
}

@end
