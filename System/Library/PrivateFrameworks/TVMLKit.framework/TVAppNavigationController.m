@implementation TVAppNavigationController

void __80___TVAppNavigationController_iOS__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;

}

void __68___TVAppNavigationController_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _TVAppDocumentRequestController *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "appDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v11 = -[_TVAppDocumentRequestController initWithAppDocument:]([_TVAppDocumentRequestController alloc], "initWithAppDocument:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x24BE51868]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      -[_TVAppDocumentController setAdoptsContext:](v11, "setAdoptsContext:", v13);
      objc_msgSend(*(id *)(a1 + 40), "_doWillLoadAppDocumentWithController:", v11);
      objc_msgSend(v10, "insertObject:atIndex:", v11, a3);
      objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v10, 1);
      *a4 = 1;

    }
  }

}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissed");

}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TVAppNavigationWillDisplayViewControllerNotification"), *(_QWORD *)(a1 + 32));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  +[TVStorePlaybackLaunchShroud sharedShroud](TVStorePlaybackLaunchShroud, "sharedShroud");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  v6 = objc_msgSend(*(id *)(a1 + 40), "presentationStyle");
  v7 = MEMORY[0x24BDAC760];
  if (v6 == 7 && *(_QWORD *)(a1 + 48))
  {
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3;
    v40[3] = &unk_24EB865E0;
    v9 = &v41;
    v10 = *(_QWORD *)(a1 + 48);
    v41 = *(id *)(a1 + 56);
    v11 = &v42;
    v42 = WeakRetained;
    v43 = *(id *)(a1 + 40);
    objc_msgSend(v8, "hideController:animated:withCompletion:", v10, 1, v40);

    v12 = v43;
  }
  else
  {
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_4;
    v37[3] = &unk_24EB848C0;
    v9 = &v38;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 56);
    v38 = *(id *)(a1 + 48);
    v11 = &v39;
    v39 = *(id *)(a1 + 40);
    objc_msgSend(v12, "showController:fromController:withConfiguration:animated:andCompletionBlock:", v14, WeakRetained, v13, v5, v37);
  }

  objc_msgSend(*(id *)(a1 + 56), "appDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "templateElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "elementName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("playlist")))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v18);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__11;
    v34 = __Block_byref_object_dispose__11;
    v35 = 0;
    v19 = objc_loadWeakRetained(&location);
    v23 = v7;
    v24 = 3221225472;
    v25 = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_54;
    v26 = &unk_24EB88580;
    v27 = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v29, &location);
    v28 = &v30;
    objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.tv.dismissing-playback"), 0, 0, &v23);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v31[5];
    v31[5] = v20;

    objc_destroyWeak(&v29);
    _Block_object_dispose(&v30, 8);

    objc_destroyWeak(&location);
  }
  objc_msgSend(WeakRetained, "setPresentedModalViewController:", *(_QWORD *)(a1 + 56), v23, v24, v25, v26, v27);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postNotificationName:object:", CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), *(_QWORD *)(a1 + 32));

}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3(_QWORD *a1)
{
  id v2;

  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showController:fromController:withConfiguration:andCompletionBlock:", a1[4], a1[5], a1[6], 0);

}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_4(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "navigationBarHidden"))
    {
      +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "hideController:animated:withCompletion:", *(_QWORD *)(a1 + 32), 0, 0);

    }
  }
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_54(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "dismissed");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67___TVAppNavigationController_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char isKindOfClass;
  _TVAppDocumentRequestController *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = objc_opt_respondsToSelector();
  v8 = v18;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v18, "appDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

    v8 = v18;
    if (v10)
    {
      objc_msgSend(v18, "templateViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v18, "replaceAppDocumentWithAppDocument:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v18, "setPresentedModal:", *(unsigned __int8 *)(a1 + 64));
      }
      else
      {
        v13 = -[_TVAppDocumentRequestController initWithAppDocument:]([_TVAppDocumentRequestController alloc], "initWithAppDocument:", *(_QWORD *)(a1 + 40));
        -[_TVAppDocumentController setPresentedModal:](v13, "setPresentedModal:", *(unsigned __int8 *)(a1 + 64));
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BE51868]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        -[_TVAppDocumentController setAdoptsContext:](v13, "setAdoptsContext:", v15);
        objc_msgSend(*(id *)(a1 + 56), "_doWillLoadAppDocumentWithController:", v13);
        objc_msgSend(*(id *)(a1 + 56), "viewControllers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");

        objc_msgSend(v17, "replaceObjectAtIndex:withObject:", a3, v13);
        objc_msgSend(*(id *)(a1 + 56), "setViewControllers:animated:", v17, 1);

      }
      *a4 = 1;
      v8 = v18;
    }
  }

}

@end
