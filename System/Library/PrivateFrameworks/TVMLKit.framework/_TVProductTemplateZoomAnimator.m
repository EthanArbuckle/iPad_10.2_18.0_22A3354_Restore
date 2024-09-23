@implementation _TVProductTemplateZoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id location;
  CGAffineTransform v41;

  v3 = a3;
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v41, 1.5, 1.5);
  objc_msgSend(v7, "setTransform:", &v41);
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldRasterize:", 1);

  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  if (v11 <= 1.0)
    v12 = 1.0;
  else
    v12 = 1.5;
  objc_msgSend(v9, "setRasterizationScale:", v12);

  objc_msgSend(v6, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldRasterize:", 1);

  objc_msgSend(v13, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRasterizationScale:", 1.0);

  objc_msgSend(v4, "insertSubview:aboveSubview:", v7, v13);
  objc_initWeak(&location, v3);
  v16 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke;
  v36[3] = &unk_24EB87970;
  v17 = v7;
  v37 = v17;
  v18 = v13;
  v38 = v18;
  objc_copyWeak(&v39, &location);
  v19 = (void *)MEMORY[0x22767F470](v36);
  v20 = (void *)MEMORY[0x24BDF6F90];
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_2;
  v33[3] = &unk_24EB848C0;
  v21 = v18;
  v34 = v21;
  v22 = v17;
  v35 = v22;
  objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 0, v33, 0, 0.33, 0.0);
  v23 = (void *)MEMORY[0x24BDF6F90];
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_3;
  v30[3] = &unk_24EB848C0;
  v24 = v22;
  v31 = v24;
  v25 = v21;
  v32 = v25;
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_4;
  v28[3] = &unk_24EB85E00;
  v26 = v19;
  v29 = v26;
  objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 4, v30, v28, 0.5, 0.0);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

@end
