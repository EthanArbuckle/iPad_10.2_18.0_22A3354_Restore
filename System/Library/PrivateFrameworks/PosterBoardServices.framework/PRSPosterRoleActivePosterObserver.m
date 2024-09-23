@implementation PRSPosterRoleActivePosterObserver

- (PRSPosterRoleActivePosterObserver)init
{
  void *v3;
  PRSPosterRoleActivePosterObserver *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PRPosterRoleLockScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRSPosterRoleActivePosterObserver initWithRoles:](self, "initWithRoles:", v3);

  return v4;
}

- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3
{
  return -[PRSPosterRoleActivePosterObserver initWithRoles:needsSandboxExtensions:](self, "initWithRoles:needsSandboxExtensions:", a3, 1);
}

- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3 needsSandboxExtensions:(BOOL)a4
{
  id v6;
  PRSPosterRoleActivePosterObserver *v7;
  uint64_t v8;
  NSSet *roles;
  uint64_t v10;
  NSMutableDictionary *roleToState;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSPosterRoleActivePosterObserver;
  v7 = -[PRSPosterRoleActivePosterObserver init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    roles = v7->_roles;
    v7->_roles = (NSSet *)v8;

    v7->_needsSandboxExtensions = a4;
    v10 = objc_opt_new();
    roleToState = v7->_roleToState;
    v7->_roleToState = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (void)issueUpdatedState:(id)a3
{
  void *v4;
  PRSPosterRoleActivePosterObserver *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](self->_roles, "containsObject:", v4))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_roleToState, "setObject:forKeyedSubscript:", v8, v4);
    -[PRSPosterRoleActivePosterObserver handler](v5, "handler");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, PRSPosterRoleActivePosterObserver *, id))(v6 + 16))(v6, v5, v8);

    objc_sync_exit(v5);
  }

}

- (id)stateForRole:(id)a3
{
  id v4;
  PRSPosterRoleActivePosterObserver *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_roleToState, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (NSSet)roles
{
  return self->_roles;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (id)handler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_roleToState, 0);
}

@end
