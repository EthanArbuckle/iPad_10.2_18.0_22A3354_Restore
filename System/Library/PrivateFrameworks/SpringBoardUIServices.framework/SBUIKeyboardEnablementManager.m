@implementation SBUIKeyboardEnablementManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_24);
  return (id)sharedInstance__instance;
}

uint64_t __47__SBUIKeyboardEnablementManager_sharedInstance__block_invoke()
{
  SBUIKeyboardEnablementManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBUIKeyboardEnablementManager);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBUIKeyboardEnablementManager)init
{
  SBUIKeyboardEnablementManager *v2;
  uint64_t v3;
  NSHashTable *disabledContexts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIKeyboardEnablementManager;
  v2 = -[SBUIKeyboardEnablementManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    disabledContexts = v2->_disabledContexts;
    v2->_disabledContexts = (NSHashTable *)v3;

  }
  return v2;
}

- (void)disableAutomaticAppearanceForContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[NSHashTable containsObject:](self->_disabledContexts, "containsObject:"))
  {
    -[NSHashTable addObject:](self->_disabledContexts, "addObject:", v5);
    UIKeyboardDisableAutomaticAppearance();
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_beginDisablingAnimations");

  }
}

- (void)enableAutomaticAppearanceForContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSHashTable containsObject:](self->_disabledContexts, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_disabledContexts, "removeObject:", v5);
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_endDisablingAnimations");

    if (!-[NSHashTable count](self->_disabledContexts, "count"))
      UIKeyboardEnableAutomaticAppearance();
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - disabledContexts: %@>"), v5, self, self->_disabledContexts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledContexts, 0);
}

@end
