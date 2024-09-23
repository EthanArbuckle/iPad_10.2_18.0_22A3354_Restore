@implementation _UISearchControllerInPlaceSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  id v20;
  void (**v21)(void *, uint64_t);
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double *v38;
  double v39;
  void *v40;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD);
  id v44;
  void (**v45)(void *, uint64_t);
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  char v59;
  char v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint64_t *v67;
  char v68;
  char v69;
  BOOL v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  void *v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;

  v3 = a3;
  objc_msgSend(v3, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAnimated");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v8 = v5;
  else
    v8 = v4;
  v9 = v8;
  objc_msgSend(v9, "_searchPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionCoordinator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_supportsLayoutStates");
  v51 = v4;
  v53 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "set_resultsContentScrollViewPresentationOffset:", 0.0);
    v14 = v10;
    if (objc_msgSend(v10, "searchBarToBecomeTopAttached"))
      objc_msgSend(v5, "set_previousSearchBarPosition:", objc_msgSend(v12, "barPosition"));
    objc_msgSend(v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finalFrameForViewController:", v5);
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v3, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v17;
    if (objc_msgSend(v5, "_searchFieldIsBeginningEditing") && v17)
    {
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke;
      v76[3] = &unk_1E16B1B50;
      v77 = v49;
      v78 = v15;
      +[UIView _performBlockWithoutAutomaticallyUpdatingFirstResponder:forScene:]((uint64_t)UIView, v76, v17);

    }
    else
    {
      objc_msgSend(v49, "addSubview:", v15);
    }
    objc_msgSend(v14, "resultsControllerContentOffset");
    v25 = v24;
    v71 = 0;
    v72 = (double *)&v71;
    v73 = 0x3010000000;
    v74 = &unk_18685B0AF;
    v75 = *MEMORY[0x1E0C9D538];
    objc_msgSend(v5, "searchResultsController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_contentOrObservableScrollViewForEdge:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
    {
      objc_msgSend(v53, "presentingViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "navigationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 != 0;

      v30 = v29;
    }
    else
    {
      v30 = 0;
    }
    v31 = fabs(v25) < 2.22044605e-16 || v26 == 0;
    if (!v31 && objc_msgSend(v26, "_compatibleContentInsetAdjustmentBehavior") == 101)
    {
      objc_msgSend(v26, "contentInset");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v38 = v72;
      v72[4] = 0.0;
      v38[5] = -v25;
      if (v30)
      {
        objc_msgSend(v5, "_resultsContentScrollViewPresentationOffset");
        v72[5] = v72[5] - v39;
      }
      else
      {
        objc_msgSend(v5, "set_resultsContentScrollViewPresentationOffset:", 0.0);
      }
      objc_msgSend(v26, "setContentInset:", v25, v33, v35, v37);
      objc_msgSend(v26, "setContentOffset:", v72[4], v72[5]);
      objc_msgSend(v26, "setScrollIndicatorInsets:", v25, v33, v35, v37);
    }
    objc_msgSend(v5, "_resultsControllerViewContainer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAlpha:", 0.0);

    v41 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_2;
    v63[3] = &unk_1E16DE960;
    v64 = v5;
    v65 = v12;
    v68 = v13;
    v69 = v6;
    v42 = v26;
    v70 = v30;
    v66 = v42;
    v67 = &v71;
    v43 = (void (**)(_QWORD))_Block_copy(v63);
    v61[0] = v41;
    v61[1] = 3221225472;
    v61[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_3;
    v61[3] = &unk_1E16B3FD8;
    v44 = v3;
    v62 = v44;
    v45 = (void (**)(void *, uint64_t))_Block_copy(v61);
    if (v6)
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v44);
      v22 = v52;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v52, "completionCurve"), v43, v45, v46, 0.0);
    }
    else
    {
      v43[2](v43);
      v22 = v52;
      v45[2](v45, 1);
    }

    _Block_object_dispose(&v71, 8);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_4;
    aBlock[3] = &unk_1E16B4E20;
    v57 = v4;
    v58 = v12;
    v59 = v13;
    v60 = v6;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    v54[0] = v18;
    v54[1] = 3221225472;
    v54[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_5;
    v54[3] = &unk_1E16B3FD8;
    v20 = v3;
    v55 = v20;
    v21 = (void (**)(void *, uint64_t))_Block_copy(v54);
    if (v6)
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v20);
      v22 = v52;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v52, "completionCurve"), v19, v21, v23, 0.0);
    }
    else
    {
      v19[2](v19);
      v21[2](v21, 1);
      v22 = v52;
    }

    v15 = v57;
  }

}

@end
