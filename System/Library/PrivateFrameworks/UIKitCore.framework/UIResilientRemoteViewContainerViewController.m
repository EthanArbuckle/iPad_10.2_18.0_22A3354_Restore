@implementation UIResilientRemoteViewContainerViewController

void __78___UIResilientRemoteViewContainerViewController_initWithExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  id *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      objc_msgSend(WeakRetained, "waitingController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopSpinner");

      objc_msgSend(v10, "_displayError:", v8);
    }
    else
    {
      objc_storeStrong(WeakRetained + 121, a3);
      objc_msgSend(v10, "setExtensionRequestIdentifier:", v12);
      if (!*((_BYTE *)v10 + 976))
        objc_msgSend(v10, "_displayRemoteViewController");
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v10, "_endDelayingPresentation");

}

void __63___UIResilientRemoteViewContainerViewController__displayError___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
