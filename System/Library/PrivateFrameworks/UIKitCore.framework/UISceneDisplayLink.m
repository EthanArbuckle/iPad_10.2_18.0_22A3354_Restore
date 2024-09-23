@implementation UISceneDisplayLink

void __47___UISceneDisplayLink_unregisterTarget_action___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == (void *)a1[4])
  {
    v9 = objc_msgSend(v11, "action");
    v10 = a1[6];
    if (v9 == v10)
    {

    }
    else
    {

      if (v10)
        goto LABEL_8;
    }
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
    goto LABEL_8;
  }

LABEL_8:
}

void __40___UISceneDisplayLink__displayLinkTick___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (const char *)objc_msgSend(v12, "action");
    v7 = *(_QWORD *)(a1 + 32);
    if (dyld_program_sdk_at_least())
      objc_msgSend(v5, v6, v7);
    else
      objc_msgSend(v5, sel_performSelector_withObject_, v6, v7);
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v8, "addIndex:", a3);
  }

}

@end
