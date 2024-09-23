@implementation UISearchControllerATVSearchBarAnimatorLegacy

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "presentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_disableMenuPressForBackGesture");

}

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setDisableFocus:", 0);

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "definesPresentationContext"))
  {
    objc_msgSend(v8, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "isAnimated"), 0);
  }

}

uint64_t __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

uint64_t __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _OWORD v10[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v10);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  v4 = *(double *)(a1 + 176);
  v5 = *(double *)(a1 + 184);
  v6 = *(double *)(a1 + 192);
  v7 = *(double *)(a1 + 200);
  objc_msgSend(*(id *)(a1 + 64), "_resultsControllerViewContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  return objc_msgSend(*(id *)(a1 + 72), "setAlpha:", 1.0);
}

void __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "setConstant:", *(double *)(a1 + 88));
  v2 = *(double *)(a1 + 96);
  v3 = *(double *)(a1 + 104);
  v4 = *(double *)(a1 + 112);
  v5 = *(double *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  v7 = *(double *)(a1 + 224);
  v8 = *(double *)(a1 + 232);
  v9 = *(double *)(a1 + 240);
  v10 = *(double *)(a1 + 248);
  objc_msgSend(*(id *)(a1 + 72), "_resultsControllerViewContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 80), "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

uint64_t __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  memset(&v14, 0, sizeof(v14));
  v2 = *(double *)(a1 + 104);
  CGAffineTransformMakeTranslation(&v14, 0.0, v2 * -0.5 + -1.0);
  v12 = v14;
  CGAffineTransformScale(&v13, &v12, 1.0, 1.0 / v2);
  v14 = v13;
  v11 = v13;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v3, "setTransform:", &v10);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
  v4 = *(double *)(a1 + 208);
  v5 = *(double *)(a1 + 216);
  v6 = *(double *)(a1 + 224);
  v7 = *(double *)(a1 + 232);
  objc_msgSend(*(id *)(a1 + 64), "_resultsControllerViewContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  return objc_msgSend(*(id *)(a1 + 72), "setAlpha:", 0.0);
}

void __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "setConstant:", *(double *)(a1 + 88));
  v2 = *(double *)(a1 + 96);
  v3 = *(double *)(a1 + 104);
  v4 = *(double *)(a1 + 112);
  v5 = *(double *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  v7 = *(double *)(a1 + 224);
  v8 = *(double *)(a1 + 232);
  v9 = *(double *)(a1 + 240);
  v10 = *(double *)(a1 + 248);
  objc_msgSend(*(id *)(a1 + 72), "_resultsControllerViewContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 80), "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

void __97___UISearchControllerATVSearchBarAnimatorLegacy_willFocusOffscreenViewForController_withHeading___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216), *(double *)(a1 + 224));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248), *(double *)(a1 + 256));
  objc_msgSend(*(id *)(a1 + 72), "setFrame:", *(double *)(a1 + 264), *(double *)(a1 + 272), *(double *)(a1 + 280), *(double *)(a1 + 288));
  objc_msgSend(*(id *)(a1 + 80), "setFrame:", *(double *)(a1 + 296), *(double *)(a1 + 304), *(double *)(a1 + 312), *(double *)(a1 + 320));
  objc_msgSend(*(id *)(a1 + 88), "setConstant:", *(double *)(a1 + 328));
  v2 = *(double *)(a1 + 336);
  v3 = *(double *)(a1 + 344);
  v4 = *(double *)(a1 + 352);
  v5 = *(double *)(a1 + 360);
  objc_msgSend(*(id *)(a1 + 96), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 96), "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

@end
