@implementation SBKeyboardFocusTarget

- (uint64_t)_initWithSceneIdentityToken:(int)a3 pid:
{
  id v6;
  id v7;
  uint64_t result;
  void *v9;
  objc_super v10;

  v6 = a2;
  if (!a1)
    goto LABEL_5;
  v10.receiver = a1;
  v10.super_class = (Class)SBKeyboardFocusTarget;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  a1 = v7;
  if (!v7)
    goto LABEL_5;
  if (a3 > 0)
  {
    objc_storeStrong((id *)v7 + 1, a2);
    a1[4] = a3;
LABEL_5:

    return (uint64_t)a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pid > 0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBKeyboardFocusTarget _initWithSceneIdentityToken:pid:].cold.1(sel__initWithSceneIdentityToken_pid_, (uint64_t)a1, (uint64_t)v9);
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)targetForSceneIdentityToken:(id)a3 pid:(int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)-[SBKeyboardFocusTarget _initWithSceneIdentityToken:pid:]([SBKeyboardFocusTarget alloc], v5, a4);

  return v6;
}

+ (id)targetForFBScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pid");

  if ((int)v7 <= 0)
  {
    SBLogKeyboardFocus();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SBKeyboardFocusTarget targetForFBScene:].cold.1((uint64_t)v4, v10);

    goto LABEL_7;
  }
  objc_msgSend(v4, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

+ (id)targetForSBWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "targetForSceneIdentityToken:pid:", v5, getpid());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)focusChange
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42700]), "initWithSceneIdentity:pid:", self->_sceneIdentityToken, self->_pid);
}

- (id)deferringTarget
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D00D90]);
    objc_msgSend(v2, "setPid:", *(unsigned int *)(a1 + 16));
    -[SBKeyboardFocusTarget deferringToken](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setToken:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)deferringToken
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1 && (v1 = *(void **)(a1 + 8)) != 0)
  {
    v2 = (void *)MEMORY[0x1E0D00CB8];
    objc_msgSend(v1, "stringRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tokenForString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (BSEqualObjects())
      v6 = v5[4] == self->_pid;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[FBSSceneIdentityToken hash](self->_sceneIdentityToken, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ pid:%d>"), self->_sceneIdentityToken, self->_pid);
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);
}

- (void)_initWithSceneIdentityToken:(uint64_t)a3 pid:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusTarget.m");
  v16 = 1024;
  v17 = 33;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

+ (void)targetForFBScene:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "invalid pid for scene %{public}@, returning nil target", (uint8_t *)&v2, 0xCu);
}

@end
