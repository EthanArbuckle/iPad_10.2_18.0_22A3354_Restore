@implementation TUStateRestoreController

- (BOOL)isStateRestorationAllowed
{
  TUStateRestoreController *v2;
  char v3;

  v2 = self;
  v3 = StateRestoreController.isStateRestorationAllowed.getter();

  return v3 & 1;
}

- (BOOL)isStateRestorationFeatureEnabled
{
  return StateRestoreController.isStateRestorationFeatureEnabled.getter() & 1;
}

- (TUStateRestoreController)initWithTimeWindow:(double)a3 isStateRestorationEnabled:(BOOL)a4
{
  TUStateRestoreController *result;

  StateRestoreController.init(timeWindow:isStateRestorationEnabled:)(a4, a3);
  return result;
}

- (TUStateRestoreController)initWithTimeWindow:(double)a3 isRunningPPT:(BOOL)a4
{
  TUStateRestoreController *result;

  StateRestoreController.init(timeWindow:isRunningPPT:)(a4, a3);
  return result;
}

- (void)sceneDidEnterBackground
{
  TUStateRestoreController *v2;

  v2 = self;
  StateRestoreController.sceneDidEnterBackground()();

}

- (void)navigationDidHappen
{
  StateRestoreController.navigationDidHappen()();
}

- (TUStateRestoreController)init
{
  StateRestoreController.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TUStateRestoreController_store);
}

@end
