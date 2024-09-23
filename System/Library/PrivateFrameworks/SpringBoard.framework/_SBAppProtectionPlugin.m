@implementation _SBAppProtectionPlugin

- (void)setApplication:(id)a3 shielded:(BOOL)a4 forOutlet:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v7 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  SBLogAppProtection();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ shielded: %{BOOL}u", buf, 0x12u);
  }

  v13 = v8;
  v11 = v9;
  v12 = v8;
  BSDispatchMain();

}

- (SBAppProtectionCoordinator)_owningCoordinator
{
  return (SBAppProtectionCoordinator *)objc_loadWeakRetained((id *)&self->__owningCoordinator);
}

- (void)set_owningCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->__owningCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__owningCoordinator);
}

@end
