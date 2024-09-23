@implementation VUIStorefrontValidator

+ (void)isValidStorefront:(id)a3 sharedStorefront:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke;
  v16[3] = &unk_1E9F99598;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "evaluate:", v16);

}

void __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD aBlock[4];
  id v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VideoURLRouterInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasProperty:", CFSTR("isValidStorefront")))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v10[0] = *(_QWORD *)(a1 + 32);
    v10[1] = v4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke_2;
    aBlock[3] = &unk_1E9F98E18;
    v9 = *(id *)(a1 + 48);
    v5 = _Block_copy(aBlock);
    v10[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("isValidStorefront"), v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
