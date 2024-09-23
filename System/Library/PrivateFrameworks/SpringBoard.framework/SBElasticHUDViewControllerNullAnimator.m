@implementation SBElasticHUDViewControllerNullAnimator

id __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_2;
  v11[3] = &unk_1E8E9DED8;
  v5 = v2;
  v12 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithDuration:curve:animations:", 3, v11, 0.001);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_3;
  v9[3] = &unk_1E8EA2880;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "addCompletion:", v9);

  return v6;
}

void __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  objc_msgSend(v2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

@end
