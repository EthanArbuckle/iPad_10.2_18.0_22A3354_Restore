@implementation PNPPlatterAnimator

- (void)animateTransition:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  id v14;
  void (**v15)(_QWORD);
  int v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  id v28;
  BOOL v29;

  v4 = a3;
  v5 = -[PNPPlatterAnimator isPresenting](self, "isPresenting");
  objc_msgSend(v4, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)MEMORY[0x24BDF7F98];
  if (!v5)
    v7 = (_QWORD *)MEMORY[0x24BDF7F88];
  objc_msgSend(v4, "viewForKey:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke;
  v26[3] = &unk_24F4E51D8;
  v29 = v5;
  v10 = v8;
  v27 = v10;
  v11 = v6;
  v28 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x22E2E6AA4](v26);
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_3;
  v22[3] = &unk_24F4E51D8;
  v25 = v5;
  v13 = v10;
  v23 = v13;
  v14 = v4;
  v24 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x22E2E6AA4](v22);
  v16 = objc_msgSend(v14, "isAnimated");
  v12[2](v12);
  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDF6F90];
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_4;
    v20[3] = &unk_24F4E5188;
    v21 = &__block_literal_global_0;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_5;
    v18[3] = &unk_24F4E5240;
    v19 = v15;
    objc_msgSend(v17, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v20, v18);

  }
  else
  {
    v15[2](v15);
  }

}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    objc_msgSend(*(id *)(result + 40), "bounds");
    objc_msgSend(v2, "setFrame:");
    return objc_msgSend(*(id *)(v1 + 40), "addSubview:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

@end
