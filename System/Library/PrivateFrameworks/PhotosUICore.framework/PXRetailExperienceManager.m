@implementation PXRetailExperienceManager

+ (__CFData)generateSVGDataFromURL:(__CFURL *)a3
{
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFData *result;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  v14 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v6 = (char *)getACCBakerDataVersion2SymbolLoc_ptr;
  v18 = (void *)getACCBakerDataVersion2SymbolLoc_ptr;
  if (!getACCBakerDataVersion2SymbolLoc_ptr)
  {
    v7 = ACCBakerLibrary();
    v6 = (char *)dlsym(v7, "ACCBakerDataVersion2");
    v16[3] = (uint64_t)v6;
    getACCBakerDataVersion2SymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v15, 8);
  if (v6)
  {
    v14 = *v6;
    v13 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v8 = getACCBakerCreateSymbolLoc_ptr;
    v18 = getACCBakerCreateSymbolLoc_ptr;
    if (!getACCBakerCreateSymbolLoc_ptr)
    {
      v9 = ACCBakerLibrary();
      v8 = dlsym(v9, "ACCBakerCreate");
      v16[3] = (uint64_t)v8;
      getACCBakerCreateSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v15, 8);
    if (v8)
      return (__CFData *)((uint64_t (*)(__CFURL *, BOOL, char *, uint64_t *))v8)(a3, v5 == 2, &v14, &v13);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef softlink_ACCBakerCreate(CFURLRef _Nonnull, const size_t, ACCBakerDataVersion * _Nullable, CFErrorRef  _Nullable * _Nullable)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXRetailExperienceManager.m"), 26, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ACCBakerDataVersion getACCBakerDataVersion2(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXRetailExperienceManager.m"), 27, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (void)showRetailExperienceCard
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke;
  v3[3] = &unk_1E5138580;
  v3[4] = self;
  v2 = +[PXToast show:](PXToast, "show:", v3);
}

- (void)presentRetailExperienceView
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PXRetailExperienceManager_presentRetailExperienceView__block_invoke;
  v6[3] = &unk_1E5149198;
  v6[4] = self;
  +[PXRetailExperienceInterface createRetailExperienceViewController:](_TtC12PhotosUICore27PXRetailExperienceInterface, "createRetailExperienceViewController:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRetailExperienceManager setRetailViewController:](self, "setRetailViewController:", v3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_presentViewController:animated:", v3, 1);

}

- (void)dismissRetailExperienceView
{
  id v2;

  -[PXRetailExperienceManager retailViewController](self, "retailViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIViewController)retailViewController
{
  return self->_retailViewController;
}

- (void)setRetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_retailViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retailViewController, 0);
}

uint64_t __56__PXRetailExperienceManager_presentRetailExperienceView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissRetailExperienceView");
}

void __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXRetailExperienceCardView *v4;
  PXRetailExperienceCardView *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = [PXRetailExperienceCardView alloc];
  v5 = -[PXRetailExperienceCardView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  PXLocalizedStringFromTable(CFSTR("PXRetailExperienceCardTitle"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRetailExperienceCardView setTitle:](v5, "setTitle:", v6);

  PXLocalizedStringFromTable(CFSTR("PXRetailExperienceCardMessage"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRetailExperienceCardView setMessage:](v5, "setMessage:", v7);

  PXLocalizedStringFromTable(CFSTR("PXContinue"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke_2;
  v9[3] = &unk_1E5149198;
  v9[4] = *(_QWORD *)(a1 + 32);
  -[PXRetailExperienceCardView addActionWithTitle:action:](v5, "addActionWithTitle:action:", v8, v9);

  objc_msgSend(v3, "setContentView:", v5);
  objc_msgSend(v3, "setAutoDismissalDelay:", 180.0);
  objc_msgSend(v3, "setCanSwipeToDismiss:", 1);
  objc_msgSend(v3, "setBottomMargin:", 5.0);

}

uint64_t __53__PXRetailExperienceManager_showRetailExperienceCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentRetailExperienceView");
}

@end
