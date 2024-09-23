@implementation PKAppProtectionCoordinator

+ (id)shared
{
  if (qword_1ECF22A18 != -1)
    dispatch_once(&qword_1ECF22A18, &__block_literal_global_172);
  return (id)_MergedGlobals_264;
}

void __36__PKAppProtectionCoordinator_shared__block_invoke()
{
  PKAppProtectionCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(PKAppProtectionCoordinator);
  v1 = (void *)_MergedGlobals_264;
  _MergedGlobals_264 = (uint64_t)v0;

}

- (BOOL)isEffectivelyLocked
{
  void *v2;
  char v3;

  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEffectivelyLocked");

  return v3;
}

- (void)isShieldRequiredWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isShieldRequiredWithCompletionHandler:", v3);

}

- (void)requestAccess
{
  id v2;

  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestAccess");

}

- (void)requestAccessWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestAccessWithCompletionHandler:", v3);

}

- (void)registerObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", v3);

}

- (void)unregisterObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_PKAppProtectionCoordinator shared](_PKAppProtectionCoordinator, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", v3);

}

@end
