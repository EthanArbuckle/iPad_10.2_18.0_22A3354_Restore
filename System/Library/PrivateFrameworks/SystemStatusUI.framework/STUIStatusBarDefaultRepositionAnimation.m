@implementation STUIStatusBarDefaultRepositionAnimation

void __STUIStatusBarDefaultRepositionAnimation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v8 = *(double *)(a1 + 32);
  v9 = *(double *)(a1 + 40);
  v13 = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke_2;
  v14[3] = &unk_1E8D636B0;
  v15 = v5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke_3;
  v12[3] = &unk_1E8D62B98;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v14, v12, v8, v9);

}

uint64_t __STUIStatusBarDefaultRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __STUIStatusBarDefaultRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
