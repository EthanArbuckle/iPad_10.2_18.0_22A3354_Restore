@implementation NCLongLookTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  id v18;
  NCLongLookDefaultPresentationController *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLExpandedPlatterTransitioningDelegate _presentationController](self, "_presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v10, "pl_containingClickPresentationInteractionPresentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewForPreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "presenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      v15 = objc_opt_respondsToSelector();
      v16 = v14;
      if ((v15 & 1) != 0 || (v17 = objc_opt_respondsToSelector(), v16 = v8, (v17 & 1) != 0))
        v18 = v16;
      else
        v18 = 0;
      objc_msgSend(v8, "setDismisser:", v18);

    }
    v19 = -[NCLongLookDefaultPresentationController initWithPresentedViewController:presentingViewController:sourceViewController:sourceView:]([NCLongLookDefaultPresentationController alloc], "initWithPresentedViewController:presentingViewController:sourceViewController:sourceView:", v8, v9, v10, v13);
    -[PLExpandedPlatterTransitioningDelegate _setPresentationController:](self, "_setPresentationController:", v19);

  }
  -[PLExpandedPlatterTransitioningDelegate _presentationController](self, "_presentationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)+[NCLongLookTransitioningDelegate superclass](NCLongLookTransitioningDelegate, "superclass"), "instancesRespondToSelector:", sel_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext_))
  {
    v12.receiver = self;
    v12.super_class = (Class)NCLongLookTransitioningDelegate;
    -[PLExpandedPlatterTransitioningDelegate viewControllerAnimator:willBeginPresentationAnimationWithTransitionContext:](&v12, sel_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext_, v6, v7);
  }
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, &__block_literal_global_36);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  v10 = *MEMORY[0x1E0DC5F70];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F70]))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_PRESENTATION_BEGIN", " enableTelemetry=YES ", v11, 2u);
  }
  kdebug_trace();

}

uint64_t __110__NCLongLookTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *MEMORY[0x1E0DC5F70];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F70]))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_PRESENTATION_END", " enableTelemetry=YES ", v2, 2u);
  }
  return kdebug_trace();
}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)+[NCLongLookTransitioningDelegate superclass](NCLongLookTransitioningDelegate, "superclass"), "instancesRespondToSelector:", sel_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext_))
  {
    v12.receiver = self;
    v12.super_class = (Class)NCLongLookTransitioningDelegate;
    -[PLExpandedPlatterTransitioningDelegate viewControllerAnimator:willBeginDismissalAnimationWithTransitionContext:](&v12, sel_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext_, v6, v7);
  }
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, &__block_literal_global_11_0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  v10 = *MEMORY[0x1E0DC5F70];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F70]))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_DISMISSAL_BEGIN", " enableTelemetry=YES ", v11, 2u);
  }
  kdebug_trace();

}

uint64_t __107__NCLongLookTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *MEMORY[0x1E0DC5F70];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F70]))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_DISMISSAL_END", " enableTelemetry=YES ", v2, 2u);
  }
  return kdebug_trace();
}

@end
