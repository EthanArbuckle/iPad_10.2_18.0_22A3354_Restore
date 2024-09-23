@implementation PRSWallpaperObserverState

- (PRSWallpaperObserverState)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  PRSWallpaperObserverState *result;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  PRSWallpaperObserverState *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("-init is not allowed on %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("PRSWallpaperObserver.m");
    v20 = 1024;
    v21 = 108;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (PRSWallpaperObserverState *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSelectedLock:(id)a3 selectedHome:(id)a4 activeLock:(id)a5 activeHome:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PRSWallpaperObserverState *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PRSWallpaperObserverState;
  v15 = -[PRSWallpaperObserverState init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedLock, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfiguration _path](self->_selectedLock, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfiguration _path](self->_selectedHome, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfiguration _path](self->_activeLock, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfiguration _path](self->_activeHome, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p sl=%@ sh=%@ al=%@ ah=%@>"), v4, self, v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PRSPosterConfiguration)selectedLock
{
  return self->_selectedLock;
}

- (PRSPosterConfiguration)selectedHome
{
  return self->_selectedHome;
}

- (PRSPosterConfiguration)activeLock
{
  return self->_activeLock;
}

- (PRSPosterConfiguration)activeHome
{
  return self->_activeHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHome, 0);
  objc_storeStrong((id *)&self->_activeLock, 0);
  objc_storeStrong((id *)&self->_selectedHome, 0);
  objc_storeStrong((id *)&self->_selectedLock, 0);
}

@end
