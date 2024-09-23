@implementation SBWorkspaceTransientOverlayTransitionContext

- (SBWorkspaceTransientOverlayTransitionContext)init
{
  SBWorkspaceTransientOverlayTransitionContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  result = -[SBWorkspaceTransitionContext init](&v3, sel_init);
  if (result)
  {
    result->_animated = 1;
    result->_shouldDismissSiriUponPresentation = 1;
  }
  return result;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  int64_t transitionType;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  -[SBWorkspaceTransitionContext compactDescriptionBuilderWithMultilinePrefix:](&v11, sel_compactDescriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_transientOverlay, CFSTR("transientOverlay"), 1);
  transitionType = self->_transitionType;
  v7 = CFSTR("dismissal");
  if (transitionType != 1)
    v7 = 0;
  if (transitionType)
    v8 = v7;
  else
    v8 = CFSTR("presentation");
  v9 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v8, CFSTR("transitionType"), 1);
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBWorkspaceTransientOverlayTransitionContext *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  v4 = a3;
  -[SBWorkspaceTransitionContext descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBWorkspaceTransientOverlayTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __86__SBWorkspaceTransientOverlayTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("transientOverlay"), 1);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
  v4 = CFSTR("dismissal");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("presentation");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", v5, CFSTR("transitionType"), 1);
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)shouldDismissSiriUponPresentation
{
  return self->_shouldDismissSiriUponPresentation;
}

- (void)setShouldDismissSiriUponPresentation:(BOOL)a3
{
  self->_shouldDismissSiriUponPresentation = a3;
}

- (BOOL)shouldPreserveAppSwitcher
{
  return self->_shouldPreserveAppSwitcher;
}

- (void)setShouldPreserveAppSwitcher:(BOOL)a3
{
  self->_shouldPreserveAppSwitcher = a3;
}

- (SBTransientOverlayPresenting)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_scenePresenter, a3);
}

- (SBTransientOverlayPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (void)setPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_presentationManager, a3);
}

- (SBWorkspaceTransientOverlay)transientOverlay
{
  return self->_transientOverlay;
}

- (void)setTransientOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_transientOverlay, a3);
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (void)setOriginatingProcess:(id)a3
{
  objc_storeStrong((id *)&self->_originatingProcess, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

@end
