@implementation _UIPreviewTransitionDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  _UIPreviewTransitionController *v8;
  int has_internal_diagnostics;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  objc_class *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UIPreviewTransitionDelegate interactionProgressForPresentation](self, "interactionProgressForPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIPreviewTransitionController initWithInteractionProgress:targetPresentationPhase:]([_UIPreviewTransitionController alloc], "initWithInteractionProgress:targetPresentationPhase:", v7, 2);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[_UIPreviewTransitionDelegate feedbackGenerator](self, "feedbackGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_3;
      }
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
  }
  else if (!v10)
  {
    v19 = animationControllerForPresentedController_presentingController_sourceController____s_category;
    if (!animationControllerForPresentedController_presentingController_sourceController____s_category)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&animationControllerForPresentedController_presentingController_sourceController____s_category);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v16 = v20;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_3:
  -[_UIPreviewTransitionDelegate feedbackGenerator](self, "feedbackGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewTransitionController setFeedbackGenerator:](v8, "setFeedbackGenerator:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v28[3] = &unk_1E16B1B28;
  v29 = v6;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_2;
  v26[3] = &unk_1E16B3FD8;
  v13 = v29;
  v27 = v13;
  -[_UIPreviewTransitionController setAnimations:completion:forPresentationPhase:](v8, "setAnimations:completion:forPresentationPhase:", v28, v26, 1);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_3;
  v24[3] = &unk_1E16B1B28;
  v25 = v13;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_4;
  v22[3] = &unk_1E16B3FD8;
  v23 = v25;
  v14 = v25;
  -[_UIPreviewTransitionController setAnimations:completion:forPresentationPhase:](v8, "setAnimations:completion:forPresentationPhase:", v24, v22, 2);

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  _UIPreviewTransitionController *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = -[_UIPreviewTransitionController initWithInteractionProgress:targetPresentationPhase:]([_UIPreviewTransitionController alloc], "initWithInteractionProgress:targetPresentationPhase:", 0, 5);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74___UIPreviewTransitionDelegate_animationControllerForDismissedController___block_invoke;
  v10[3] = &unk_1E16B1B28;
  v11 = v3;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __74___UIPreviewTransitionDelegate_animationControllerForDismissedController___block_invoke_2;
  v8[3] = &unk_1E16B3FD8;
  v9 = v11;
  v6 = v11;
  -[_UIPreviewTransitionController setAnimations:completion:forPresentationPhase:](v4, "setAnimations:completion:forPresentationPhase:", v10, v8, 5);

  return v4;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "interactionProgress");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  _UIPreviewPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIPreviewPresentationController initWithPresentedViewController:presentingViewController:]([_UIPreviewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

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

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->interactionProgressForPresentation, 0);
}

@end
