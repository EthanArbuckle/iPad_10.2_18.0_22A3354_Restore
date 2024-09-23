@implementation UIAlertControllerTextFieldViewController

uint64_t __60___UIAlertControllerTextFieldViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

void __65___UIAlertControllerTextFieldViewController_updateTextFieldStyle__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 2;
    if (v6 - 1 == a3)
      v7 = 3;
    if (!a3)
      v7 = 1;
    if (v6 >= 2)
      v8 = v7;
    else
      v8 = 0;
    objc_msgSend(*(id *)(a1 + 32), "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_textFieldContainingViewWithTextField:position:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContainerView:", v11);

  }
}

@end
