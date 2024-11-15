@implementation PRSPosterRoleActivePosterObserverState

- (PRSPosterRoleActivePosterObserverState)initWithRole:(id)a3 activePoster:(id)a4
{
  id v7;
  id v8;
  PRSPosterRoleActivePosterObserverState *v9;
  PRSPosterRoleActivePosterObserverState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterRoleActivePosterObserverState;
  v9 = -[PRSPosterRoleActivePosterObserverState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_role, a3);
    objc_storeStrong((id *)&v10->_activePoster, a4);
  }

  return v10;
}

- (NSString)role
{
  return self->_role;
}

- (PRSPosterConfiguration)activePoster
{
  return self->_activePoster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePoster, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
