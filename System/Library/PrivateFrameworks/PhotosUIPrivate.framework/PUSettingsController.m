@implementation PUSettingsController

void __35___PUSettingsController__hideToast__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Don’t ever show this reminder again?"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35___PUSettingsController__hideToast__block_invoke_2;
  v4[3] = &unk_1E58ABD10;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Don‘t Show Ever Again"), 2, v4);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Cancel"), 1, 0);

}

uint64_t __35___PUSettingsController__hideToast__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", 1, CFSTR("InternalSettingsDisableReminderToQuitAfterChange"));
}

uint64_t __55___PUSettingsController__showReminderToQuitAfterChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PURootSettings configureToastForReminderToQuitAfterLaunch:target:](PURootSettings, "configureToastForReminderToQuitAfterLaunch:target:", a2, *(_QWORD *)(a1 + 32));
}

void __47___PUSettingsController__clearSettingsOverride__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  exit(0);
}

uint64_t __49___PUSettingsController__warnForSettingsOverride__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSettingsOverride");
}

uint64_t __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsFavorite:settings:", *(_BYTE *)(a1 + 48) == 0, *(_QWORD *)(a1 + 40));
}

void __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "searchNavigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, 0);

}

void __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B938]), "initWithSettings:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);

}

uint64_t __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_4()
{
  return +[PURootSettings _presentTapToRadar](PURootSettings, "_presentTapToRadar");
}

void __63___PUSettingsController__updateNavigationItemOfViewController___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(void);
  void *v4;
  void (**v5)(void);

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v3[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

      v3 = v5;
    }
  }

}

@end
