@implementation SBStartupTransitionFactory

- (SBStartupTransitionFactory)initWithInitialRestartState:(id)a3
{
  id v6;
  SBStartupTransitionFactory *v7;
  SBStartupTransitionFactory *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionFactory.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialRestartState"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBStartupTransitionFactory;
  v7 = -[SBStartupTransitionFactory init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_initialRestartState, a3);

  return v8;
}

- (id)transitionForContext:(id)a3 outDestination:(unint64_t *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;
  unint64_t v15;
  void *v16;
  int v17;
  int64_t v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v23;
  unsigned int v24;
  BOOL v25;
  _BOOL4 v26;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionFactory.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  -[SBInitialRestartState bootDefaults](self->_initialRestartState, "bootDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBInitialRestartState requiresSetup](self->_initialRestartState, "requiresSetup");
  v26 = -[SBInitialRestartState isInLostMode](self->_initialRestartState, "isInLostMode");
  v9 = -[SBInitialRestartState isBlocked](self->_initialRestartState, "isBlocked");
  v10 = objc_msgSend(v6, "isDark");
  v11 = -[SBInitialRestartState shouldNeverLock](self->_initialRestartState, "shouldNeverLock");
  v12 = -[SBInitialRestartState isAuthenticated](self->_initialRestartState, "isAuthenticated");
  v25 = -[SBInitialRestartState hasPasscodeSet](self->_initialRestartState, "hasPasscodeSet");
  v13 = objc_msgSend(v6, "isLogin");
  v24 = objc_msgSend(v6, "fromUserPowerDown");
  v14 = -[SBInitialRestartState isForSimulator](self->_initialRestartState, "isForSimulator");
  if (-[SBInitialRestartState isLoginSession](self->_initialRestartState, "isLoginSession"))
  {
    v15 = 4;
    goto LABEL_23;
  }
  if (v13)
  {
    if (v11 || (((v9 || v26 || !v12) | v10) & 1) == 0)
    {
      if (v8)
        v15 = 3;
      else
        v15 = 1;
      goto LABEL_23;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    v15 = 3;
    goto LABEL_23;
  }
  if (!v11 && (((v9 || v26 || !v12) | v10) & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v6, "applicationLaunchURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v15 = 2;
  }
  else
  {
    v17 = objc_msgSend(v7, "dontLockAfterCrash");
    v18 = -[SBInitialRestartState homeButtonType](self->_initialRestartState, "homeButtonType");
    v19 = (v11 || v14) | v17;
    v20 = v24;
    if (v18 == 2)
      v20 = 0;
    if (((v19 | v25) & 1) != 0)
      v15 = v19;
    else
      v15 = v20;
  }
LABEL_23:
  if (a4)
    *a4 = v15;
  -[SBStartupTransitionFactory _transactionForDestination:context:](self, "_transactionForDestination:context:", v15, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_transactionForDestination:(unint64_t)a3 context:(id)a4
{
  id v6;
  SBStartupTransitionToLoginWindow *v7;
  uint64_t v8;
  SBStartupTransitionToSetup *v9;
  SBStartupTransitionToSetup *v10;

  v6 = a4;
  switch(a3)
  {
    case 0uLL:
      v7 = [SBStartupTransitionToLockOut alloc];
      v8 = 0;
      goto LABEL_8;
    case 1uLL:
      v7 = [SBStartupTransitionToHome alloc];
      v8 = 1;
      goto LABEL_8;
    case 2uLL:
      v7 = [SBStartupTransitionToApp alloc];
      v8 = 2;
      goto LABEL_8;
    case 3uLL:
      v10 = -[SBStartupTransitionToSetup initWithDestination:context:initialRestartState:]([SBStartupTransitionToSetup alloc], "initWithDestination:context:initialRestartState:", 3, v6, self->_initialRestartState);
      goto LABEL_9;
    case 4uLL:
      v7 = [SBStartupTransitionToLoginWindow alloc];
      v8 = 4;
LABEL_8:
      v10 = -[SBStartupTransitionToLockOut initWithDestination:context:](v7, "initWithDestination:context:", v8, v6);
LABEL_9:
      v9 = v10;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRestartState, 0);
}

@end
