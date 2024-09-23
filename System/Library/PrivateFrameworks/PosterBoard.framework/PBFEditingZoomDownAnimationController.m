@implementation PBFEditingZoomDownAnimationController

- (double)transitionDuration:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isAnimated");
  result = 0.0;
  if (v3)
    return 0.5;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  CGFloat rect_8;
  CGFloat rect_16;
  double rect_24;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayCornerRadius");
  v16 = v15;

  -[PBFEditingZoomAnimationController previewView](self, "previewView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFEditingZoomAnimationController buildDimmingView](self, "buildDimmingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFEditingZoomAnimationController complicationsView](self, "complicationsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  rect_8 = v11;
  -[PBFEditingZoomAnimationController buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:](self, "buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:", v17, v5, v19, v7, v9, v11, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setContinuousCornerRadius:", v16);
  objc_msgSend(v4, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v18);
  objc_msgSend(v21, "addSubview:", v20);
  objc_msgSend(v21, "bounds");
  objc_msgSend(v18, "setFrame:");
  v22 = v9;
  objc_msgSend(v20, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v20, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[PBFEditingZoomAnimationController previewFrame](self, "previewFrame");
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  rect_16 = v60.size.height;
  v27 = CGRectGetWidth(v60);
  v61.origin.x = v7;
  v61.origin.y = v22;
  v61.size.width = rect_8;
  v61.size.height = v13;
  rect_24 = v27 / CGRectGetWidth(v61);
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v28 = CGRectGetHeight(v62);
  v63.origin.x = v7;
  v63.origin.y = v22;
  v63.size.width = rect_8;
  v63.size.height = v13;
  v29 = v28 / CGRectGetHeight(v63);
  -[PBFEditingZoomAnimationController previewCornerRadius](self, "previewCornerRadius");
  v31 = v30;
  -[PBFEditingZoomDownAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v33 = v32;
  v34 = (void *)MEMORY[0x1E0DC3F10];
  v35 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke;
  v49[3] = &unk_1E86F5B10;
  v50 = v20;
  v53 = x;
  v54 = y;
  v55 = width;
  v56 = rect_16;
  v57 = rect_24;
  v58 = v29;
  v59 = v31;
  v51 = v18;
  v52 = v5;
  v45[0] = v35;
  v45[1] = 3221225472;
  v45[2] = __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke_2;
  v45[3] = &unk_1E86F5B38;
  v46 = v51;
  v47 = v50;
  v48 = v4;
  v36 = v4;
  v37 = v50;
  v38 = v51;
  v39 = v5;
  objc_msgSend(v34, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v49, v45, v33, 0.0, 1.0, 0.0);

}

uint64_t __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v5;

  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  v3 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
  objc_msgSend(v3, "setTransform:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 104) / *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

@end
