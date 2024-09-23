@implementation PRSWallpaperObserverConfiguration

- (PRSWallpaperObserverConfiguration)init
{
  PRSWallpaperObserverConfiguration *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRSWallpaperObserverConfiguration;
  v2 = -[PRSWallpaperObserverConfiguration init](&v6, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(17, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)configurationWithHandler:(id)a3
{
  id v3;
  PRSWallpaperObserverConfiguration *v4;
  PRSWallpaperLocationStateObserver *v5;

  v3 = a3;
  v4 = objc_alloc_init(PRSWallpaperObserverConfiguration);
  v5 = objc_alloc_init(PRSWallpaperLocationStateObserver);
  -[PRSWallpaperLocationStateObserver setHandler:](v5, "setHandler:", v3);

  -[PRSWallpaperObserverConfiguration setLocationStateObserver:](v4, "setLocationStateObserver:", v5);
  return v4;
}

- (void)setQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  void *v6;

  v4 = (OS_dispatch_queue *)a3;
  if (v4)
  {
    queue = self->_queue;
    self->_queue = v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserverConfiguration setQueue:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (BOOL)isValid
{
  return self->_queue != 0;
}

- (void)setLocations:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PRSWallpaperObserverConfiguration locationStateObserver](self, "locationStateObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[PRSWallpaperObserverConfiguration setLocationStateObserver:](self, "setLocationStateObserver:", v6);

  }
  -[PRSWallpaperObserverConfiguration locationStateObserver](self, "locationStateObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocations:", a3);

}

- (unint64_t)locations
{
  void *v2;
  unint64_t v3;

  -[PRSWallpaperObserverConfiguration locationStateObserver](self, "locationStateObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locations");

  return v3;
}

- (PRSWallpaperLocationStateObserver)locationStateObserver
{
  return self->_locationStateObserver;
}

- (void)setLocationStateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_locationStateObserver, a3);
}

- (PRSWallpaperSnapshotObserver)snapshotObserver
{
  return self->_snapshotObserver;
}

- (void)setSnapshotObserver:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotObserver, a3);
}

- (PRSPosterRoleActivePosterObserver)activePosterRoleObserver
{
  return self->_activePosterRoleObserver;
}

- (void)setActivePosterRoleObserver:(id)a3
{
  objc_storeStrong((id *)&self->_activePosterRoleObserver, a3);
}

- (PRSPosterRoleCollectionObserver)postersCollectionRoleObserver
{
  return self->_postersCollectionRoleObserver;
}

- (void)setPostersCollectionRoleObserver:(id)a3
{
  objc_storeStrong((id *)&self->_postersCollectionRoleObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postersCollectionRoleObserver, 0);
  objc_storeStrong((id *)&self->_activePosterRoleObserver, 0);
  objc_storeStrong((id *)&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_locationStateObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setQueue:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
