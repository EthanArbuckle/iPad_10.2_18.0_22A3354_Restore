@implementation _UIAlertControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  _UIAlertControllerAnimatedTransitioning *v9;
  void *v10;
  _UIAlertControllerAnimatedTransitioning *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  v9 = [_UIAlertControllerAnimatedTransitioning alloc];
  -[_UIAlertControllerTransitioningDelegate interactionProgressForPresentation](self, "interactionProgressForPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIAlertControllerAnimatedTransitioning initWithInteractionProgress:](v9, "initWithInteractionProgress:", v10);

  +[UIAlertController _alertControllerContainedInViewController:](UIAlertController, "_alertControllerContainedInViewController:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerAnimatedTransitioning setAlertController:](v11, "setAlertController:", v12);
  objc_msgSend(v7, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_updateProvidedStyleWithTraitCollection:", v13);
  -[_UIAlertControllerAnimatedTransitioning setPresentation:](v11, "setPresentation:", 1);

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  _UIAlertControllerAnimatedTransitioning *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_UIAlertControllerAnimatedTransitioning);
  +[UIAlertController _alertControllerContainedInViewController:](UIAlertController, "_alertControllerContainedInViewController:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerAnimatedTransitioning setAlertController:](v4, "setAlertController:", v5);
  -[_UIAlertControllerAnimatedTransitioning setPresentation:](v4, "setPresentation:", 0);

  return v4;
}

- (id)_interactionControllerForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  id v4;
  void *v5;
  _UIAlertControllerInteractionController *v6;

  v4 = a4;
  objc_msgSend(v4, "_visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v5, "transitionOfType:shouldBeInteractiveForAlertController:", 0, v4))
  {
    objc_msgSend(v5, "interactionProgressForTransitionOfType:forAlertController:", 0, v4);
    v6 = (_UIAlertControllerInteractionController *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v6 = objc_alloc_init(_UIAlertControllerInteractionController);
      -[_UIAlertControllerInteractionController setAlertController:](v6, "setAlertController:", v4);
    }
  }

  return v6;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  char isKindOfClass;
  void *v7;
  void *v8;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (has_internal_diagnostics)
  {
    if ((isKindOfClass & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UIAlertController is expected to have an animator of type _UIAlertControllerAnimatedTransitioning", buf, 2u);
      }

    }
  }
  else if ((isKindOfClass & 1) == 0)
  {
    v11 = interactionControllerForPresentation____s_category;
    if (!interactionControllerForPresentation____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&interactionControllerForPresentation____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "UIAlertController is expected to have an animator of type _UIAlertControllerAnimatedTransitioning", v13, 2u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "alertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerTransitioningDelegate _interactionControllerForTransitionOfType:forAlertController:](self, "_interactionControllerForTransitionOfType:forAlertController:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
  objc_storeStrong((id *)&self->interactionProgressForPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->interactionProgressForPresentation, 0);
}

@end
