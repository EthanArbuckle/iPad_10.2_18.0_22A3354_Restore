@implementation UIKeyboardCameraBasePresentationController

- (BOOL)updatesGuideDuringRotation
{
  return 0;
}

- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "existingContainerRootController");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v19 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraBasePresentationController.m"), 23, CFSTR("Missing input window."));

    v19 = 0;
  }
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "windowScene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardTrackingCoordinator trackingCoordinatorForScene:](UIKeyboardTrackingCoordinator, "trackingCoordinatorForScene:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", 16);
  if (v6)
    objc_msgSend(v23, "animateTrackingElementsFromStart:toEnd:duration:forShow:", a3 == 2, v14, v13, v12, v11, x, y, width, height, v24);
  else
    objc_msgSend(v23, "moveKeyboardTrackingElementsFromStartFrame:endFrame:duration:isStart:forShow:", 0, a3 == 2, v14, v13, v12, v11, x, y, width, height, v24);

}

- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 forStart:(BOOL)a4
{
  _BOOL8 v4;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  id v56;

  v4 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraBasePresentationController.m"), 38, CFSTR("Invalid arguments."));

  }
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraBasePresentationController.m"), 41, CFSTR("Missing input window."));

    v8 = 0;
  }
  objc_msgSend(v8, "hosting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemForPurpose:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationsFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v56, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v12, v14, v16, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UIPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[UIPresentationController containerView](self, "containerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "convertRect:toView:", 0, v28, v30, v32, v34);
  objc_msgSend(v36, "convertRect:toWindow:", 0);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  if (a3 == 2)
    v46 = v26;
  else
    v46 = v45;
  if (a3 == 2)
    v47 = v24;
  else
    v47 = v43;
  if (a3 == 2)
    v48 = v22;
  else
    v48 = v41;
  if (a3 == 2)
    v49 = v20;
  else
    v49 = v39;
  if (a3 == 2)
    v50 = v39;
  else
    v50 = v20;
  if (a3 == 2)
    v51 = v41;
  else
    v51 = v22;
  if (a3 == 2)
    v52 = v43;
  else
    v52 = v24;
  if (a3 == 2)
    v53 = v45;
  else
    v53 = v26;
  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:from:to:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", a3, v4, v49, v48, v47, v46, v50, v51, v52, v53);

}

- (BOOL)presentingOverKeyboard
{
  return self->_presentingOverKeyboard;
}

- (void)setPresentingOverKeyboard:(BOOL)a3
{
  self->_presentingOverKeyboard = a3;
}

@end
