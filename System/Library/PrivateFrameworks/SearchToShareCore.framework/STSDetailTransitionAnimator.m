@implementation STSDetailTransitionAnimator

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[STSDetailTransitionAnimator presenting](self, "presenting", a3);
  result = 0.4;
  if (!v3)
    return 0.25;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
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
  void *v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  STSDetailTransitionAnimator *v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  void *v57;
  id v58;
  id v59;
  id v60;
  STSDetailTransitionAnimator *v61;
  id v62;
  _QWORD v63[6];

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  if (-[STSDetailTransitionAnimator presenting](self, "presenting"))
  {
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v12);
    objc_msgSend(v11, "frame");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v11, "addSubview:", v13);

  }
  else
  {
    v14 = objc_alloc(MEMORY[0x24BEBDB00]);
    objc_msgSend(v4, "finalFrameForViewController:", v8);
    v11 = (void *)objc_msgSend(v14, "initWithFrame:");
  }
  objc_msgSend(v5, "addSubview:", v11);
  -[STSDetailTransitionAnimator snapshotView](self, "snapshotView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v15);

  v16 = -[STSDetailTransitionAnimator presenting](self, "presenting");
  -[STSDetailTransitionAnimator snapshotView](self, "snapshotView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[STSDetailTransitionAnimator sourceFrame](self, "sourceFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[STSDetailTransitionAnimator sourceInsets](self, "sourceInsets");
    objc_msgSend(v17, "setFrame:", v19 + v29, v21 + v26, v23 - (v29 + v27), v25 - (v26 + v28));

    v30 = (void *)MEMORY[0x24BEBDB00];
    -[STSDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v32 = v31;
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke;
    v63[3] = &unk_24E7457A8;
    v63[4] = self;
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_2;
    v56[3] = &unk_24E745AF8;
    v57 = v6;
    v58 = v8;
    v59 = v4;
    v60 = v5;
    v61 = self;
    v62 = v11;
    v33 = v4;
    v34 = v8;
    v35 = v6;
    objc_msgSend(v30, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v63, v56, v32, 0.0, 0.7, 0.0);

    v36 = v57;
  }
  else
  {
    -[STSDetailTransitionAnimator presentedFrame](self, "presentedFrame");
    objc_msgSend(v17, "setFrame:");

    v37 = (void *)MEMORY[0x24BEBDB00];
    -[STSDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v39 = v38;
    v40 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_3;
    v54[3] = &unk_24E7457A8;
    v41 = v6;
    v55 = v41;
    objc_msgSend(v37, "animateWithDuration:animations:", v54, v39);
    v42 = (void *)MEMORY[0x24BEBDB00];
    -[STSDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v44 = v43;
    v52 = self;
    v53[0] = v40;
    v53[1] = 3221225472;
    v53[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_4;
    v53[3] = &unk_24E7457A8;
    v53[4] = self;
    v48[0] = v40;
    v48[1] = 3221225472;
    v48[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_5;
    v48[3] = &unk_24E745B20;
    v49 = v41;
    v50 = v8;
    v51 = v4;
    v45 = v4;
    v46 = v8;
    v47 = v41;
    objc_msgSend(v42, "animateWithDuration:animations:completion:", v53, v48, v44);

    v36 = v55;
  }

}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentedFrame");
  objc_msgSend(v2, "setFrame:");

}

uint64_t __49__STSDetailTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "finalFrameForViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setFrame:");

  v5 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  objc_msgSend(*(id *)(a1 + 64), "snapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 48), "completeTransition:", 1);
}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "sourceInsets");
  objc_msgSend(v14, "setFrame:", v3 + v13, v5 + v10, v7 - (v13 + v11), v9 - (v10 + v12));

}

uint64_t __49__STSDetailTransitionAnimator_animateTransition___block_invoke_5(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1[4], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(a1[5], "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  objc_msgSend(a1[4], "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "finalFrameForViewController:", a1[4]);
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(a1[7], "snapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  return objc_msgSend(a1[6], "completeTransition:", 1);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (CGRect)sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceFrame.origin.x;
  y = self->_sourceFrame.origin.y;
  width = self->_sourceFrame.size.width;
  height = self->_sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIEdgeInsets)sourceInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sourceInsets.top;
  left = self->_sourceInsets.left;
  bottom = self->_sourceInsets.bottom;
  right = self->_sourceInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSourceInsets:(UIEdgeInsets)a3
{
  self->_sourceInsets = a3;
}

- (CGRect)presentedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentedFrame.origin.x;
  y = self->_presentedFrame.origin.y;
  width = self->_presentedFrame.size.width;
  height = self->_presentedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentedFrame:(CGRect)a3
{
  self->_presentedFrame = a3;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
