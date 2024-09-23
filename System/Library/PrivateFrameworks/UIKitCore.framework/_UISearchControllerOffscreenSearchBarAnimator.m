@implementation _UISearchControllerOffscreenSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  void (**v30)(void *, uint64_t);
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void (**v56)(_QWORD);
  id v57;
  void (**v58)(void *, uint64_t);
  double v59;
  _UISearchControllerOffscreenSearchBarAnimator *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD aBlock[4];
  id v71;
  id v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v4, "isAnimated");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v8 = v6;
  else
    v8 = v5;
  v9 = v8;
  objc_msgSend(v9, "_searchPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionCoordinator");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v65 = v9;
  v66 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v10, "searchBarToBecomeTopAttached"))
      objc_msgSend(v13, "_setBarPosition:", 3);
    v14 = (double *)MEMORY[0x1E0C9D538];
    if (v13 && (objc_msgSend(v13, "_isTextFieldManagedInNSToolbar") & 1) == 0)
    {
      objc_msgSend(v10, "searchBarContainerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v13, "frame");
        v90.origin.x = *v14;
        v90.origin.y = v14[1];
        objc_msgSend(v13, "setFrame:", *v14, v90.origin.y - CGRectGetHeight(v90), v90.size.width, v90.size.height);
      }
      objc_msgSend(v15, "addSubview:", v13);

      v10 = v66;
    }
    objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextToView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v60 = self;
    v62 = v5;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v6, "view");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v19;

    objc_msgSend(v4, "finalFrameForViewController:", v6);
    objc_msgSend(v32, "setFrame:");
    objc_msgSend(v4, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v32);

    objc_msgSend(v10, "resultsControllerContentOffset");
    v35 = v34;
    v36 = *v14;
    v37 = v14[1];
    objc_msgSend(v6, "searchResultsController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_contentOrObservableScrollViewForEdge:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (fabs(v35) >= 2.22044605e-16)
    {
      objc_msgSend(v39, "contentInset");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      objc_msgSend(v40, "setContentInset:", v35);
      objc_msgSend(v40, "setContentOffset:", v36, v37);
      objc_msgSend(v40, "setScrollIndicatorInsets:", v35, v42, v44, v46);
      v36 = 0.0;
      v37 = -v35;
    }
    if (objc_msgSend(v6, "automaticallyShowsCancelButton", v60))
      objc_msgSend(v13, "setShowsCancelButton:animated:", 1, 0);
    objc_msgSend(v13, "frame");
    x = v92.origin.x;
    width = v92.size.width;
    height = v92.size.height;
    v50 = CGRectGetHeight(v92) + v92.origin.y;
    if (objc_msgSend(v13, "barPosition") == 3)
    {
      objc_msgSend(v10, "statusBarAdjustment");
      v50 = v50 + v51;
    }
    objc_msgSend(v6, "_resultsControllerViewContainer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAlpha:", 0.0);

    v53 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke;
    v79[3] = &unk_1E16DE988;
    v80 = v6;
    v81 = v13;
    v84 = x;
    v85 = v50;
    v86 = width;
    v87 = height;
    v54 = v38;
    v82 = v54;
    v55 = v40;
    v83 = v55;
    v88 = v36;
    v89 = v37;
    v56 = (void (**)(_QWORD))_Block_copy(v79);
    v77[0] = v53;
    v77[1] = 3221225472;
    v77[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_2;
    v77[3] = &unk_1E16B3FD8;
    v57 = v4;
    v78 = v57;
    v58 = (void (**)(void *, uint64_t))_Block_copy(v77);
    if (v63)
    {
      objc_msgSend(v61, "transitionDuration:", v57);
      v25 = v64;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v64, "completionCurve"), v56, v58, v59, 0.0);
    }
    else
    {
      v56[2](v56);
      v58[2](v58, 1);
      v25 = v64;
    }

    v5 = v62;
  }
  else
  {
    objc_msgSend(v12, "frame");
    v20 = v91.origin.x;
    v21 = v91.size.width;
    v22 = v91.size.height;
    v23 = v91.origin.y - CGRectGetHeight(v91);
    if (objc_msgSend(v13, "barPosition") == 3)
    {
      objc_msgSend(v10, "statusBarAdjustment");
      v23 = v23 - v24;
    }
    v25 = v64;
    v26 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E16BE770;
    v71 = v5;
    v27 = v13;
    v72 = v27;
    v73 = v20;
    v74 = v23;
    v75 = v21;
    v76 = v22;
    v28 = (void (**)(_QWORD))_Block_copy(aBlock);
    v67[0] = v26;
    v67[1] = 3221225472;
    v67[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_4;
    v67[3] = &unk_1E16B2218;
    v68 = v27;
    v29 = v4;
    v69 = v29;
    v30 = (void (**)(void *, uint64_t))_Block_copy(v67);
    if (v63)
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v29);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v64, "completionCurve"), v28, v30, v31, 0.0);
    }
    else
    {
      v28[2](v28);
      v30[2](v30, 1);
    }

    v32 = v71;
  }

}

@end
