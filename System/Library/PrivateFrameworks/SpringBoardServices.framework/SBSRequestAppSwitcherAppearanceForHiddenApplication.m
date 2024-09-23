@implementation SBSRequestAppSwitcherAppearanceForHiddenApplication

void __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke_2;
  v9 = &unk_1E288D2E8;
  v4 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], &v6);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v6, v7, v8, v9);

}

uint64_t __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
