@implementation _UISceneHostingSheetPresentationClientComponent

- (void)_setLocalSheetPresentationController:(id)a3
{
  UISheetPresentationController **p_localSheetPresentationController;
  id v5;

  p_localSheetPresentationController = &self->_localSheetPresentationController;
  v5 = a3;
  objc_storeWeak((id *)p_localSheetPresentationController, v5);
  objc_msgSend(v5, "_setClientRemotePresentationDelegate:", self);

  -[_UISceneHostingSheetPresentationClientComponent applySheetConfigurationToLocalPresentationControllerWithTransitionContext:](self, "applySheetConfigurationToLocalPresentationControllerWithTransitionContext:", 0);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "settingsDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsProperty:", sel_sheetConfiguration);

  if (v6)
  {
    objc_msgSend(v8, "transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneHostingSheetPresentationClientComponent applySheetConfigurationToLocalPresentationControllerWithTransitionContext:](self, "applySheetConfigurationToLocalPresentationControllerWithTransitionContext:", v7);

  }
}

- (void)applySheetConfigurationToLocalPresentationControllerWithTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[FBSSceneComponent scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sheetConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_localSheetPresentationController);
  v9 = WeakRetained;
  if (v7 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "layoutIfNeeded");
    objc_msgSend(v9, "_setConfiguration:", v7);
    objc_msgSend(v4, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __125___UISceneHostingSheetPresentationClientComponent_applySheetConfigurationToLocalPresentationControllerWithTransitionContext___block_invoke;
      v13[3] = &unk_1E16B1B28;
      v14 = v11;
      +[UIView _animateWithAnimationSettings:animations:completion:](UIView, "_animateWithAnimationSettings:animations:completion:", v12, v13, 0);

    }
    else
    {
      objc_msgSend(v11, "layoutIfNeeded");
    }

  }
}

- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent clientScene](self, "clientScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108___UISceneHostingSheetPresentationClientComponent__sheetPresentationControllerClientConfigurationDidChange___block_invoke;
  v7[3] = &unk_1E16EA950;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateClientSettings:", v7);

}

- (void)_sheetGrabberDidTriggerPrimaryAction
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[FBSSceneComponent scene](self, "scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  +[_UISceneHostingSheetPresentationActionToHost actionForSheetGrabberDidTriggerPrimaryAction](_UISceneHostingSheetPresentationActionToHost, "actionForSheetGrabberDidTriggerPrimaryAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendPrivateActions:", v4);

}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  -[FBSSceneComponent scene](self, "scene");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:](_UISceneHostingSheetPresentationActionToHost, "actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v7, a3, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendPrivateActions:", v11);

}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[FBSSceneComponent scene](self, "scene");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:](_UISceneHostingSheetPresentationActionToHost, "actionForSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v7, v6, v11, v10, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendPrivateActions:", v14);

}

- (void)_sheetInteractionDraggingDidEnd
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[FBSSceneComponent scene](self, "scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidEnd](_UISceneHostingSheetPresentationActionToHost, "actionForSheetInteractionDraggingDidEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendPrivateActions:", v4);

}

- (UISheetPresentationController)_localSheetPresentationController
{
  return (UISheetPresentationController *)objc_loadWeakRetained((id *)&self->_localSheetPresentationController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localSheetPresentationController);
}

@end
