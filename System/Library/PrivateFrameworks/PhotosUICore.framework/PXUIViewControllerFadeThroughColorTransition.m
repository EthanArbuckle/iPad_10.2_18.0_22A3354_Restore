@implementation PXUIViewControllerFadeThroughColorTransition

- (PXUIViewControllerFadeThroughColorTransition)init
{
  return -[PXUIViewControllerFadeThroughColorTransition initWithDuration:midpointColor:](self, "initWithDuration:midpointColor:", 0, 1.0);
}

- (PXUIViewControllerFadeThroughColorTransition)initWithDuration:(double)a3 midpointColor:(id)a4
{
  id v6;
  PXUIViewControllerFadeThroughColorTransition *v7;
  PXUIViewControllerFadeThroughColorTransition *v8;
  UIColor *v9;
  UIColor *midpointColor;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUIViewControllerFadeThroughColorTransition;
  v7 = -[PXUIViewControllerFadeThroughColorTransition init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_duration = a3;
    if (v6)
    {
      v9 = (UIColor *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    midpointColor = v8->_midpointColor;
    v8->_midpointColor = v9;

  }
  return v8;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;

  v4 = a3;
  -[PXUIViewControllerFadeThroughColorTransition transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5 * 0.5;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v11, "bounds");
  v13 = (void *)objc_msgSend(v12, "initWithFrame:");
  -[PXUIViewControllerFadeThroughColorTransition midpointColor](self, "midpointColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  objc_msgSend(v13, "setAlpha:", 0.0);
  objc_msgSend(v11, "addSubview:", v13);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke;
  aBlock[3] = &unk_1E5144558;
  v16 = v13;
  v35 = v16;
  v36 = v4;
  v17 = v4;
  v18 = _Block_copy(aBlock);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v32[0] = v15;
  v32[1] = 3221225472;
  v32[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_2;
  v32[3] = &unk_1E5149198;
  v33 = v16;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_3;
  v25[3] = &unk_1E512F9A0;
  v26 = v8;
  v27 = v11;
  v28 = v10;
  v29 = v33;
  v31 = v6;
  v30 = v18;
  v20 = v18;
  v21 = v33;
  v22 = v10;
  v23 = v11;
  v24 = v8;
  objc_msgSend(v19, "animateWithDuration:animations:completion:", v32, v25, v6);

}

- (double)duration
{
  return self->_duration;
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midpointColor, 0);
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", a2);
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_3(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  double v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "insertSubview:belowSubview:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(double *)(a1 + 72);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_4;
    v9[3] = &unk_1E5149198;
    v10 = *(id *)(a1 + 56);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_5;
    v7[3] = &unk_1E513FE10;
    v8 = *(id *)(a1 + 64);
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v9, v7, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
