@implementation _UISearchControllerTransplantSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  id v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  void (**v30)(void *, uint64_t);
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double *v39;
  double v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(_QWORD);
  id v47;
  void (**v48)(void *, uint64_t);
  double v49;
  _UISearchControllerTransplantSearchBarAnimator *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  char v63;
  char v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t *v73;
  char v74;
  char v75;
  BOOL v76;
  uint64_t v77;
  double *v78;
  uint64_t v79;
  void *v80;
  __int128 v81;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isAnimated");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = v6;
  else
    v9 = v5;
  v10 = v9;
  objc_msgSend(v10, "_searchPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transitionCoordinator");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v10;
  objc_msgSend(v10, "searchBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_supportsLayoutStates");
  v53 = v5;
  v55 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v50 = self;
    if (objc_msgSend(v11, "searchBarToBecomeTopAttached"))
    {
      objc_msgSend(v6, "set_previousSearchBarPosition:", objc_msgSend(v13, "barPosition"));
      objc_msgSend(v13, "_setBarPosition:", 3);
    }
    objc_msgSend(v11, "searchBarContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v13);

    objc_msgSend(v6, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalFrameForViewController:", v6);
    objc_msgSend(v16, "setFrame:");
    objc_msgSend(v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v16);

    -[UIView _recursiveEagerlyUpdateSafeAreaInsetsUntilViewController](v16);
    objc_msgSend(v11, "resultsControllerContentOffset");
    v19 = v18;
    v77 = 0;
    v78 = (double *)&v77;
    v79 = 0x3010000000;
    v80 = &unk_18685B0AF;
    v81 = *MEMORY[0x1E0C9D538];
    objc_msgSend(v6, "searchResultsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_contentOrObservableScrollViewForEdge:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v14;
    if (objc_msgSend(v6, "hidesNavigationBarDuringPresentation"))
    {
      objc_msgSend(v55, "presentingViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 != 0;

    }
    else
    {
      v24 = 0;
    }
    if (fabs(v19) >= 2.22044605e-16)
    {
      objc_msgSend(v21, "contentInset");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v39 = v78;
      v78[4] = 0.0;
      v39[5] = -v19;
      if (v24)
      {
        objc_msgSend(v6, "_resultsContentScrollViewPresentationOffset");
        v78[5] = v78[5] - v40;
      }
      else
      {
        objc_msgSend(v6, "set_resultsContentScrollViewPresentationOffset:", 0.0);
      }
      objc_msgSend(v21, "setContentInset:", v19, v34, v36, v38);
      objc_msgSend(v21, "setContentOffset:", v78[4], v78[5]);
      objc_msgSend(v21, "setScrollIndicatorInsets:", v19, v34, v36, v38);
    }
    objc_msgSend(v6, "_resultsControllerViewContainer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAlpha:", 0.0);

    v42 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke;
    v68[3] = &unk_1E16DE9B0;
    v69 = v6;
    v74 = v51;
    v43 = v13;
    v70 = v43;
    v75 = v7;
    v44 = v20;
    v76 = v24;
    v71 = v44;
    v73 = &v77;
    v45 = v21;
    v72 = v45;
    v46 = (void (**)(_QWORD))_Block_copy(v68);
    v65[0] = v42;
    v65[1] = 3221225472;
    v65[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_2;
    v65[3] = &unk_1E16B2218;
    v66 = v43;
    v47 = v4;
    v67 = v47;
    v48 = (void (**)(void *, uint64_t))_Block_copy(v65);
    if (v7)
    {
      -[_UISearchControllerAnimator transitionDuration:](v50, "transitionDuration:", v47);
      v31 = v54;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v54, "completionCurve"), v46, v48, v49, 0.0);
    }
    else
    {
      v46[2](v46);
      v31 = v54;
      v48[2](v48, 1);
    }

    _Block_object_dispose(&v77, 8);
  }
  else
  {
    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E16B4E20;
    v26 = v5;
    v61 = v26;
    v63 = v14;
    v27 = v13;
    v62 = v27;
    v64 = v7;
    v28 = (void (**)(_QWORD))_Block_copy(aBlock);
    v56[0] = v25;
    v56[1] = 3221225472;
    v56[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_4;
    v56[3] = &unk_1E16B2B40;
    v57 = v26;
    v58 = v27;
    v29 = v4;
    v59 = v29;
    v30 = (void (**)(void *, uint64_t))_Block_copy(v56);
    if (v7)
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v29);
      v31 = v54;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v54, "completionCurve"), v28, v30, v32, 0.0);
    }
    else
    {
      v28[2](v28);
      v30[2](v30, 1);
      v31 = v54;
    }

    v16 = v61;
  }

}

@end
