@implementation UIViewController(PUNavigationController_Private)

- (id)pu_navigationController
{
  void *v1;

  objc_msgSend(a1, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (void)ppt_performBlockAfterNextNavigationAnimation:()PUNavigationController_Private
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PUNavigationController.m"), 546, CFSTR("navigation controller must be a PUNavigationController"));

  }
  if (v5)
  {
    objc_msgSend(v6, "ppt_onDidShowViewControllerBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PUNavigationController.m"), 549, CFSTR("a previous block has already been scheduled for after the next navigation animation"));

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke;
    v10[3] = &unk_1E58ABAC8;
    v11 = v5;
    objc_msgSend(v6, "ppt_setOnDidShowViewControllerBlock:", v10);

  }
  else
  {
    objc_msgSend(v6, "ppt_setOnDidShowViewControllerBlock:", 0);
  }

}

@end
