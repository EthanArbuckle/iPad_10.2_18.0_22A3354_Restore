@implementation UIContextualAction

void __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke_2;
  v9[3] = &unk_1E5C1E830;
  v10 = v5;
  v7 = *(void (**)(uint64_t, _QWORD *))(v6 + 16);
  v8 = v5;
  v7(v6, v9);

}

uint64_t __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
