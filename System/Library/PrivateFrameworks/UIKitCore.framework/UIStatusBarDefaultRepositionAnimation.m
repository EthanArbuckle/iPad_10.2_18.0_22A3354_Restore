@implementation UIStatusBarDefaultRepositionAnimation

void ___UIStatusBarDefaultRepositionAnimation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(double *)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___UIStatusBarDefaultRepositionAnimation_block_invoke_2;
  v13[3] = &unk_1E16B1BF8;
  v14 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___UIStatusBarDefaultRepositionAnimation_block_invoke_3;
  v11[3] = &unk_1E16C0E38;
  v9 = v6;
  v10 = v5;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v13, v11, v7, v8);

}

uint64_t ___UIStatusBarDefaultRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___UIStatusBarDefaultRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
