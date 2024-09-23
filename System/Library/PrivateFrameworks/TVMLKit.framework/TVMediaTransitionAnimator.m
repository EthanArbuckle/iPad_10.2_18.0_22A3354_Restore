@implementation TVMediaTransitionAnimator

- (void)migratesMediaControllerFromHost:(id)a3 toHost:(id)a4
{
  id v6;

  v6 = a4;
  -[TVMediaTransitionAnimator setFromHost:](self, "setFromHost:", a3);
  -[TVMediaTransitionAnimator setToHost:](self, "setToHost:", v6);

  self->_migrates = 1;
}

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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldRasterize:", 1);

  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRasterizationScale:", 1.0);

  objc_msgSend(v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:belowSubview:", v8, v11);
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldRasterize:", 1);

  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRasterizationScale:", 1.0);

  if (self->_migrates)
  {
    -[TVMediaTransitionAnimator fromHost](self, "fromHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "relinquishOwnership");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", v16, 0);

    -[TVMediaTransitionAnimator toHost](self, "toHost");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adoptMediaController:", v15);

  }
  else
  {
    v15 = 0;
  }
  v18 = (void *)MEMORY[0x24BDF6F90];
  v19 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __47__TVMediaTransitionAnimator_animateTransition___block_invoke;
  v30[3] = &unk_24EB848C0;
  v31 = v8;
  v32 = v11;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __47__TVMediaTransitionAnimator_animateTransition___block_invoke_2;
  v25[3] = &unk_24EB848E8;
  v26 = v32;
  v27 = v31;
  v28 = v15;
  v29 = v4;
  v20 = v4;
  v21 = v15;
  v22 = v31;
  v23 = v32;
  objc_msgSend(v18, "animateWithDuration:animations:completion:", v30, v25, 0.5);

}

uint64_t __47__TVMediaTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __47__TVMediaTransitionAnimator_animateTransition___block_invoke_2(id *a1)
{
  id v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[3];

  v2 = a1[4];
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v8[0] = *MEMORY[0x24BDBD8B8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(a1[4], "setAlpha:", 1.0);
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[4], "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

  objc_msgSend(a1[5], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", 0);

  objc_msgSend(a1[6], "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  return objc_msgSend(a1[7], "completeTransition:", 1);
}

- (TVMediaControllerHosting)fromHost
{
  return self->_fromHost;
}

- (void)setFromHost:(id)a3
{
  objc_storeStrong((id *)&self->_fromHost, a3);
}

- (TVMediaControllerHosting)toHost
{
  return self->_toHost;
}

- (void)setToHost:(id)a3
{
  objc_storeStrong((id *)&self->_toHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toHost, 0);
  objc_storeStrong((id *)&self->_fromHost, 0);
}

@end
