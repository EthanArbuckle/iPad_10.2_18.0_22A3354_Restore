@implementation _UIContextMenuPresentation

- (_UIContextMenuPresentation)initWithPresentingViewController:(id)a3 configuration:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _UIContextMenuActionsOnlyViewController *v12;
  void *v13;
  uint64_t v14;
  _UIContextMenuPreviewPresentationController *v15;
  _UIContextMenuPresentation *v16;
  _UIContextMenuUIController *v17;
  _UIContextMenuUIController *uiController;
  _UIContextMenuUIController *v19;
  void *v20;
  _UIContextMenuPresentationAnimation *v21;
  _UIContextMenuPresentationAnimation *v22;
  objc_super v24;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "preferredLayout") == 3 || objc_msgSend(v9, "preferredLayout") == 1 && !v11)
  {
    v12 = [_UIContextMenuActionsOnlyViewController alloc];
    objc_msgSend(v8, "sourcePreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UIContextMenuActionsOnlyViewController initWithTargetedPreview:](v12, "initWithTargetedPreview:", v13);

    v11 = (void *)v14;
  }
  v15 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([_UIContextMenuPreviewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v11, v10);

  -[_UIContextMenuPreviewPresentationController setMenuPresentationDelegate:](v15, "setMenuPresentationDelegate:", self);
  -[_UIContextMenuPreviewPresentationController setMenuStyle:](v15, "setMenuStyle:", v9);
  v24.receiver = self;
  v24.super_class = (Class)_UIContextMenuPresentation;
  v16 = -[_UIClickPresentation initWithPresentedViewController:presentationController:](&v24, sel_initWithPresentedViewController_presentationController_, v11, v15);
  if (v16)
  {
    v17 = -[_UIContextMenuUIController initWithConfiguration:style:]([_UIContextMenuUIController alloc], "initWithConfiguration:style:", v8, v9);
    uiController = v16->_uiController;
    v16->_uiController = v17;
    v19 = v17;

    -[_UIContextMenuUIController setDelegate:](v16->_uiController, "setDelegate:", v16);
    -[_UIContextMenuUIController platterContainerView](v19, "platterContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIClickPresentation setCustomViewForTouchContinuation:](v16, "setCustomViewForTouchContinuation:", v20);

    v21 = -[_UIContextMenuPresentationAnimation initWithUIController:asDismissal:]([_UIContextMenuPresentationAnimation alloc], "initWithUIController:asDismissal:", v19, 0);
    -[_UIClickPresentation setAppearanceTransition:](v16, "setAppearanceTransition:", v21);

    v22 = -[_UIContextMenuPresentationAnimation initWithUIController:asDismissal:]([_UIContextMenuPresentationAnimation alloc], "initWithUIController:asDismissal:", v19, 1);
    -[_UIClickPresentation setDisappearanceTransition:](v16, "setDisappearanceTransition:", v22);

  }
  return v16;
}

- (_UIFulfilledContextMenuConfiguration)menuConfiguration
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIFulfilledContextMenuConfiguration *)v3;
}

- (NSArray)visibleMenus
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleMenus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_platformMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAlongsideAnimatorForPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_UIClickPresentation appearanceTransition](self, "appearanceTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlongsideAnimator:", v4);

  -[_UIContextMenuPresentation _platformMetrics](self, "_platformMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateAlongsideTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "alongsideAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66___UIContextMenuPresentation_setAlongsideAnimatorForPresentation___block_invoke;
    v9[3] = &unk_1E16B2F48;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "addAnimations:", v9);

  }
}

- (void)prepareToPresent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationTransitionWillBegin");
  -[_UIClickPresentation appearanceTransition](self, "appearanceTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentation presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareTransitionToView:", v7);

  objc_msgSend(v4, "alongsideAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46___UIContextMenuPresentation_prepareToPresent__block_invoke;
  v10[3] = &unk_1E16B1B28;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "addCompletion:", v10);

}

- (void)present
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIClickPresentation appearanceTransition](self, "appearanceTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performTransition");

  -[_UIClickPresentation presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController contentPlatterView](self->_uiController, "contentPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuDidPresentWithContentPlatterView:", v5);

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContextMenuSceneComponent sceneComponentForView:](_UIContextMenuSceneComponent, "sceneComponentForView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerPresentation:", self);

}

- (void)setAlongsideAnimatorForDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_UIClickPresentation disappearanceTransition](self, "disappearanceTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlongsideAnimator:", v4);

  -[_UIContextMenuPresentation _platformMetrics](self, "_platformMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateAlongsideTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "alongsideAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63___UIContextMenuPresentation_setAlongsideAnimatorForDismissal___block_invoke;
    v9[3] = &unk_1E16B2F48;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "addAnimations:", v9);

  }
}

- (void)prepareToDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissalTransitionWillBegin");
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContextMenuSceneComponent sceneComponentForView:](_UIContextMenuSceneComponent, "sceneComponentForView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removePresentation:", self);

  -[_UIClickPresentation disappearanceTransition](self, "disappearanceTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourcePreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareTransitionToView:", v9);

  objc_msgSend(v7, "alongsideAnimator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46___UIContextMenuPresentation_prepareToDismiss__block_invoke;
  v12[3] = &unk_1E16B1B28;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v10, "addCompletion:", v12);

}

- (void)dismiss
{
  id v2;

  -[_UIClickPresentation disappearanceTransition](self, "disappearanceTransition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performTransition");

}

- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayMenu:inPlaceOfMenu:", v7, v6);

}

- (void)retargetDismissingMenuToPreview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retargetDismissingMenuToPreview:", v4);

}

- (void)viewTraitCollectionDidChange
{
  id v2;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewTraitCollectionDidChange");

}

- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePreviewForDragItem:preferringFullSize:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewForCancellingDragItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewForCancellingDragItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dragWillCancelWithAnimator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragWillCancelWithAnimator:", v4);

}

- (id)windowSceneActivationPreview
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSceneActivationPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)requestMenuDismissal
{
  id v3;

  -[_UIContextMenuPresentation delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:", self, 5, 0, 0);

}

- (id)contextMenuUIController:(id)a3 willDisplayMenu:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[_UIContextMenuPresentation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuPresentation:willDisplayMenu:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)contextMenuUIControllerWillPerformLayout:(id)a3 withPreviewSize:(CGSize)a4
{
  double height;
  double width;
  id v6;

  height = a4.height;
  width = a4.width;
  -[_UIClickPresentation presentationController](self, "presentationController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuLayoutDidProducePreviewSize:", width, height);

}

- (void)contextMenuUIController:(id)a3 didSelectMenuLeaf:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_UIContextMenuPresentation delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuPresentation:didSelectMenuLeaf:", self, v5);

}

- (void)contextMenuUIController:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a5;
  -[_UIContextMenuPresentation delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:", self, a4, v10, v9);

}

- (BOOL)contextMenuUIControllerShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3
{
  _UIContextMenuPresentation *v3;
  void *v4;

  v3 = self;
  -[_UIContextMenuPresentation delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "contextMenuPresentationShouldAllowSwipeToDismissForBeginningPanInteraction:", v3);

  return (char)v3;
}

- (void)contextMenuUIControllerDidEndPanInteraction:(id)a3
{
  id v4;

  -[_UIContextMenuPresentation delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuPresentationDidEndPanInteraction:", self);

}

- (void)contextMenuUIController:(id)a3 didBeginDragWithTouch:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_UIContextMenuPresentation delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuPresentation:didBeginDragWithTouch:", self, v5);

}

- (id)contextMenuUIController:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  -[_UIContextMenuPresentation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextMenuPresentation:dismissalPreviewForItem:clientReturnedPreview:", self, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)contextMenuPreviewPresentationController:(id)a3 didChangePreviewContentSize:(CGSize)a4
{
  double height;
  double width;
  id v6;

  height = a4.height;
  width = a4.width;
  -[_UIContextMenuPresentation uiController](self, "uiController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewSizeDidChange:", width, height);

}

- (id)preferredFocusEnvironmentsForContextMenuPreviewPresentationController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuPresentation uiController](self, "uiController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return MEMORY[0x1E0C9AA60];
  -[_UIContextMenuPresentation uiController](self, "uiController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_UIContextMenuPresentationDelegate)delegate
{
  return (_UIContextMenuPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIContextMenuUIController)uiController
{
  return self->_uiController;
}

- (BOOL)suppressInputViewDuringPresentation
{
  return self->_suppressInputViewDuringPresentation;
}

- (void)setSuppressInputViewDuringPresentation:(BOOL)a3
{
  self->_suppressInputViewDuringPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
