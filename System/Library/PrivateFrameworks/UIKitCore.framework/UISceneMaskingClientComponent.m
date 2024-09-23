@implementation UISceneMaskingClientComponent

void __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_2;
    v3[3] = &unk_1E16B2F48;
    v2 = *(id *)(a1 + 32);
    v4 = 0;
    v5 = v2;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);

  }
}

uint64_t __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[_UISceneMaskingAction invalidationAction](_UISceneMaskingAction, "invalidationAction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendPrivateActions:", v3);

}

@end
