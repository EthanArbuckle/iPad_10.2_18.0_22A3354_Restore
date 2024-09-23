@implementation TVStackCommonTemplateController

void __44___TVStackCommonTemplateController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "_updateViewLayout");

    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v3, "setSupplementaryCellSection:", objc_msgSend(v6, "_supplementaryViewSectionIndex"));

    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "stackWrappingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supplementaryCellLayoutAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSupplementaryCellLayoutAttributes:", v9);

  }
  objc_destroyWeak(&to);

}

void __56___TVStackCommonTemplateController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performSelector:", sel__cancelImpressionsUpdate);

  }
}

void __97___TVStackCommonTemplateController__updateSupplementaryViewControllersWithElements_updateStyles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "supplementaryViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "viewControllerWithElement:layout:existingController:", v6, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

}

uint64_t __65___TVStackCommonTemplateController__updateViewSupplementaryViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSemanticContentAttribute:", *(_QWORD *)(a1 + 32));
}

@end
