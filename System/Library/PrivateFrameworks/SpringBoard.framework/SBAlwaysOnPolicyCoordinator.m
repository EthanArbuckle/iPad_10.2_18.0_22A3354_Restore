@implementation SBAlwaysOnPolicyCoordinator

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_new();
  -[SBAlwaysOnPolicyCoordinator _activatePolicy:](self, "_activatePolicy:", v3);

  v4 = (void *)objc_opt_new();
  -[SBAlwaysOnPolicyCoordinator _activatePolicy:](self, "_activatePolicy:", v4);

  v5 = (void *)objc_opt_new();
  -[SBAlwaysOnPolicyCoordinator _activatePolicy:](self, "_activatePolicy:", v5);

  v6 = (id)objc_opt_new();
  -[SBAlwaysOnPolicyCoordinator _activatePolicy:](self, "_activatePolicy:", v6);

}

- (void)removeExternalPolicy:(id)a3
{
  -[NSMutableSet removeObject:](self->_policies, "removeObject:", a3);
}

- (NSSet)activePolicies
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_policies, "copy");
}

- (void)_activatePolicy:(id)a3
{
  id v4;
  NSMutableSet *policies;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  policies = self->_policies;
  v8 = v4;
  if (!policies)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_policies;
    self->_policies = v6;

    v4 = v8;
    policies = self->_policies;
  }
  -[NSMutableSet addObject:](policies, "addObject:", v4);
  objc_msgSend(v8, "activateAlwaysOnPolicy");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

@end
