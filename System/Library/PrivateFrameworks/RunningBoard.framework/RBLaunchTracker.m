@implementation RBLaunchTracker

- (double)nextAllowedLaunchOfIdentity:(id)a3
{
  RBTimeProviding *timeProvider;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  timeProvider = self->_timeProvider;
  v5 = a3;
  -[RBTimeProviding currentTime](timeProvider, "currentTime");
  v7 = v6;
  -[NSMutableDictionary objectForKey:](self->_launchBeforeLast, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0.0;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    if (v7 - v10 < 10.0)
    {
      objc_msgSend(v8, "doubleValue");
      v9 = v11 + 10.0;
    }
  }

  return v9;
}

- (void)trackLaunchOfIdentity:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  double v12;
  NSObject *v13;
  NSMutableDictionary *lastLaunch;
  void *v15;

  v4 = a3;
  if ((objc_msgSend(v4, "isMultiInstanceExtension") & 1) != 0)
    goto LABEL_15;
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  v6 = v5;
  -[NSMutableDictionary objectForKey:](self->_lastLaunch, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_launchBeforeLast, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v11 = v6 - v10 < 10.0;
    if (!v9)
      goto LABEL_10;
LABEL_6:
    objc_msgSend(v9, "doubleValue");
    if (v6 - v12 < 10.0)
    {
      rbs_general_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[RBLaunchTracker trackLaunchOfIdentity:].cold.1(v13);

    }
    goto LABEL_10;
  }
  v11 = 0;
  if (v8)
    goto LABEL_6;
LABEL_10:
  lastLaunch = self->_lastLaunch;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](lastLaunch, "setObject:forKey:", v15, v4);

  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_launchBeforeLast, "setObject:forKey:", v7, v4);
  }
  else if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_launchBeforeLast, "removeObjectForKey:", v4);
  }

LABEL_15:
}

- (RBLaunchTracker)initWithTimeProvider:(id)a3
{
  id v5;
  RBLaunchTracker *v6;
  uint64_t v7;
  NSMutableDictionary *lastLaunch;
  uint64_t v9;
  NSMutableDictionary *launchBeforeLast;
  RBLaunchTracker *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBLaunchTracker;
  v6 = -[RBLaunchTracker init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    lastLaunch = v6->_lastLaunch;
    v6->_lastLaunch = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    launchBeforeLast = v6->_launchBeforeLast;
    v6->_launchBeforeLast = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v6->_timeProvider, a3);
    v11 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_launchBeforeLast, 0);
  objc_storeStrong((id *)&self->_lastLaunch, 0);
}

- (void)trackLaunchOfIdentity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A8B4000, log, OS_LOG_TYPE_FAULT, "tracking a launch of an identity that shouldn't have been allowed", v1, 2u);
}

@end
