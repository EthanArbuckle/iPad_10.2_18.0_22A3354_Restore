@implementation UIView(NCTextSupportingAdditions)

- (uint64_t)canBecomeFirstResponder
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)UIView_0;
  if ((objc_msgSendSuper2(&v3, sel_canBecomeFirstResponder) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "nc_isMenuEnabled");
}

- (BOOL)nc_isMenuEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_interactionForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)_interactionForClass:()NCTextSupportingAdditions
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  objc_msgSend(a1, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIView_NCTextSupportingAdditions___interactionForClass___block_invoke;
  v7[3] = &unk_1E8D1E078;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (uint64_t)nc_setMenuEnabled:()NCTextSupportingAdditions
{
  uint64_t result;
  NCTextMenuInteraction *v6;

  result = objc_msgSend(a1, "nc_isMenuEnabled");
  if ((_DWORD)result != (_DWORD)a3)
  {
    if ((_DWORD)a3)
    {
      v6 = objc_alloc_init(NCTextMenuInteraction);
      objc_msgSend(a1, "addInteraction:", v6);
    }
    else
    {
      objc_msgSend(a1, "_interactionForClass:", objc_opt_class());
      v6 = (NCTextMenuInteraction *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(a1, "removeInteraction:", v6);
    }

    return objc_msgSend(a1, "setUserInteractionEnabled:", a3);
  }
  return result;
}

@end
