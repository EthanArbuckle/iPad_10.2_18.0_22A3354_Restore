@implementation PRSWallpaperObserverTransition

- (PRSWallpaperObserverTransition)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  PRSWallpaperObserverTransition *result;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  PRSWallpaperObserverTransition *v17;
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
    v21 = 145;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (PRSWallpaperObserverTransition *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithChanged:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRSWallpaperObserverTransition;
  result = -[PRSWallpaperObserverTransition init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PRSWallpaperObserverLocationsDescription(self->_changed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p changed=(%@)>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)changed
{
  return self->_changed;
}

- (void)setChanged:(unint64_t)a3
{
  self->_changed = a3;
}

@end
