@implementation PXPPTNavigationHelper

+ (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PXProgrammaticNavigationRequest *v12;
  id v13;
  id v14;
  id v15;
  PXProgrammaticNavigationRequest *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SEL v21;
  id v22;

  v9 = a3;
  v10 = a5;
  objc_msgSend(a1, "applicationRootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PXProgrammaticNavigationRequest alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke;
  v17[3] = &unk_1E5148F88;
  v18 = v9;
  v19 = v11;
  v20 = v10;
  v21 = a2;
  v22 = a1;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:](v12, "initWithDestination:options:completionHandler:", v15, a4, v17);
  PXProgrammaticNavigationRequestExecute(v16, v13);

}

+ (id)topmostChildFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    v6 = v4;
    do
    {
      objc_msgSend(a1, "_unwrapNavigationController:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v8);
  }
  objc_msgSend(a1, "_unwrapNavigationController:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)caseNameStringForPXProgrammaticNavigationResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("PXProgrammaticNavigationResultUndefined");
  else
    return off_1E5148FA8[a3 - 1];
}

+ (UIViewController)applicationRootViewController
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPPTNavigationHelper.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootViewController != nil"));

  }
  return (UIViewController *)v6;
}

+ (id)_unwrapNavigationController:(id)a3
{
  id v3;
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "topViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v6;
    v7 = v10;

  }
  return v7;
}

void __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_time_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  uint64_t v34;

  if (a2 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to navigate to destination %@: %@"), *(_QWORD *)(a1 + 32), a3);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    return;
  }
  PXProgrammaticNavigationLastParticipantOnRouteToDestinationMatching(*(void **)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_301477);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 64);
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("PXPPTNavigationHelper.m"), 30, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("PXProgrammaticNavigationLastParticipantOnRouteToDestinationMatching(destination, rootViewController, ^BOOL(id<PXProgrammaticNavigationParticipant> participant) { UIViewController *viewController = ((UIViewController *)({ id obj = (participant); id result = ((void *)0); Class cls = [UIViewController class]; if (cls && [obj isKindOfClass:cls]) { result = obj; } result; })); return viewController.px_isVisible || viewController.presentedViewController != ((void *)0); })"),
        v28,
        v29);

    }
  }
  objc_msgSend(v4, "ppt_containedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  objc_msgSend(v8, "px_topmostPresentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;

    v8 = v11;
  }
  objc_msgSend(v8, "ppt_containedViewController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  objc_msgSend(v15, "navigationController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_20;
  }
  v16 = v15;
  if (v16)
  {
LABEL_14:
    objc_msgSend(v16, "topViewController");
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v17;
  }
  else
  {
    v15 = 0;
  }
LABEL_20:
  objc_msgSend(v15, "ppt_containedViewController");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v15;
  v21 = v20;

  if (v21)
  {
    v22 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_3;
    block[3] = &unk_1E5148F60;
    v33 = *(id *)(a1 + 48);
    v34 = 1;
    v32 = v21;
    dispatch_after(v22, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No view controller found after navigating to destination %@"), *(_QWORD *)(a1 + 32));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

BOOL __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if ((objc_msgSend(v3, "px_isVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

@end
