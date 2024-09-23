@implementation SBStartupTransitionContextPersistence

- (SBStartupTransitionContextPersistence)initWithBootDefaults:(id)a3 loginSession:(BOOL)a4
{
  id v7;
  SBStartupTransitionContextPersistence *v8;
  SBStartupTransitionContextPersistence *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBStartupTransitionContextPersistence;
  v8 = -[SBStartupTransitionContextPersistence init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bootDefaults, a3);
    v9->_loginSession = a4;
  }

  return v9;
}

- (void)saveContext:(id)a3
{
  SBBootDefaults *bootDefaults;
  id v4;

  bootDefaults = self->_bootDefaults;
  if (a3)
  {
    objc_msgSend(a3, "_representation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBBootDefaults setBootTransitionContext:](bootDefaults, "setBootTransitionContext:", v4);

  }
  else
  {
    -[SBBootDefaults setBootTransitionContext:](self->_bootDefaults, "setBootTransitionContext:");
  }
}

- (id)readTransitionContext
{
  void *v3;
  id v4;

  -[SBBootDefaults bootTransitionContext](self->_bootDefaults, "bootTransitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBStartupTransitionContext _initWithRepresentation:loginSession:]([SBStartupTransitionContext alloc], "_initWithRepresentation:loginSession:", v3, self->_loginSession);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootDefaults, 0);
}

@end
