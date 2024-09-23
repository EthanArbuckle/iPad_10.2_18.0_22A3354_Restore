@implementation _TVNavigationZoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47___TVNavigationZoomAnimator_animateTransition___block_invoke;
  v9[3] = &unk_24EB85440;
  v10 = v4;
  v8 = v4;
  -[_TVNavigationZoomAnimator _beginZoomAnimationFromViewController:toViewController:containerView:completion:](self, "_beginZoomAnimationFromViewController:toViewController:containerView:completion:", v7, v6, v5, v9);

}

- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v12, "setAlpha:", 0.0);
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldRasterize:", 1);

  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRasterizationScale:", 1.0);

  objc_msgSend(v11, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "insertSubview:belowSubview:", v12, v15);
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShouldRasterize:", 1);

  objc_msgSend(v15, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRasterizationScale:", 1.0);

  v18 = (void *)MEMORY[0x24BDF6F90];
  v19 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke;
  v31[3] = &unk_24EB85440;
  v32 = v15;
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_2;
  v29[3] = &unk_24EB85A38;
  v30 = v32;
  v20 = v32;
  objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 0x10000, v31, v29, 0.3, 0.0);
  v21 = (void *)MEMORY[0x24BDF6F90];
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_3;
  v27[3] = &unk_24EB85440;
  v28 = v12;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_4;
  v24[3] = &unk_24EB85FA0;
  v25 = v28;
  v26 = v9;
  v22 = v9;
  v23 = v28;
  objc_msgSend(v21, "animateWithDuration:animations:completion:", v27, v24, 0.5);

}

@end
