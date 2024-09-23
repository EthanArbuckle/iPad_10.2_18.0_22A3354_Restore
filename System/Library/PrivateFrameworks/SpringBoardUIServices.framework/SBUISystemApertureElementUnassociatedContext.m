@implementation SBUISystemApertureElementUnassociatedContext

+ (id)unassociatedContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBUISystemApertureElementUnassociatedContext_unassociatedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unassociatedContext_onceToken != -1)
    dispatch_once(&unassociatedContext_onceToken, block);
  return (id)unassociatedContext_unassociatedContext;
}

void __67__SBUISystemApertureElementUnassociatedContext_unassociatedContext__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)unassociatedContext_unassociatedContext;
  unassociatedContext_unassociatedContext = (uint64_t)v1;

}

- (BOOL)isFallbackContext
{
  return 1;
}

- (BOOL)isBeingRemoved
{
  return 0;
}

- (void)_logErrorForSelectorIfNeeded:(SEL)a3
{
  id v4;

  if (SBUIIsSystemApertureEnabled())
  {
    NSStringFromSelector(a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("*** Calling -[SBUISystemApertureElementContext %@] before you have an active context will have no effect. ***"), v4);

  }
}

- (void)elementDidDismissMenu
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)elementWillPresentMenu
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)requestNegativeResponseAnimation
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)requestTransitionToMaximumSupportedLayoutMode
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)requestTransitionToPreferredLayoutMode
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2, a4);
}

- (void)setElementNeedsUpdate
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
}

- (id)requestAlertingAssertionWithOptions:(unint64_t)a3
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
  return 0;
}

- (id)requestAlertingAssertion
{
  -[SBUISystemApertureElementUnassociatedContext _logErrorForSelectorIfNeeded:](self, "_logErrorForSelectorIfNeeded:", a2);
  return 0;
}

- (SBUISystemApertureElementTransitionContext)transitionContext
{
  return self->transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transitionContext, 0);
}

@end
