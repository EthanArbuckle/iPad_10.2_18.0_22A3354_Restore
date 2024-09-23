@implementation UIFindNavigatorView

void __38___UIFindNavigatorView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setAutocorrectionType:", 1);
  objc_msgSend(v5, "setAutocapitalizationType:", 0);
  objc_msgSend(v5, "setSmartInsertDeleteType:", 1);
  objc_msgSend(v5, "setSmartDashesType:", 1);
  objc_msgSend(v5, "setSmartQuotesType:", 1);
  objc_msgSend(v5, "setAcceptsInitialEmojiKeyboard:", 1);
  objc_msgSend(*(id *)(a1 + 32), "applyStyleToFieldIfNeeded:", v5);
  objc_msgSend(v5, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    objc_msgSend(v5, "setDisablePrediction:", 1);

}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "findNavigatorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "findNavigator:didInvokeReplaceReplacingAll:", v3, 0);

}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "findNavigatorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "findNavigator:didInvokeReplaceReplacingAll:", v3, 1);

}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "findNavigatorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNavigator:didInvokeNextResultInDirection:", *(_QWORD *)(a1 + 32), 1);

}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "findNavigatorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNavigator:didInvokeNextResultInDirection:", *(_QWORD *)(a1 + 32), 0);

}

void __46___UIFindNavigatorView_suggestedFindMenuItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSearchMenuItem:", v3);

}

void __38___UIFindNavigatorView_layoutSubviews__block_invoke(uint64_t a1, void *a2, double a3)
{
  double v4;
  double v5;
  id v6;
  CGRect v7;
  CGRect v8;

  v4 = *(double *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v6, "setFrame:", a3, 0.0, v4, v5);
  objc_msgSend(v6, "frame");
  v8 = CGRectInset(v7, 0.0, 4.0);
  objc_msgSend(v6, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);

}

@end
