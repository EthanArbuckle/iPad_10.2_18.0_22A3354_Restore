@implementation WFEmbeddableActionUserInterface

- (void)presentContent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WFEmbeddableActionUserInterface contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFDialogLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[WFEmbeddableActionUserInterface presentContent:]";
      _os_log_impl(&dword_227027000, v6, OS_LOG_TYPE_FAULT, "%s Unable to present a content view controller while one is already active.", (uint8_t *)&v8, 0xCu);
    }

  }
  else if (!-[WFEmbeddableActionUserInterface presentContent:completion:](self, "presentContent:completion:", v4, 0))
  {
    -[WFActionUserInterface delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionUserInterface:showViewControllerInPlatter:", self, v4);

    -[WFEmbeddableActionUserInterface setContentViewController:](self, "setContentViewController:", v4);
  }

}

- (BOOL)presentContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[WFEmbeddableActionUserInterface prefersModalPresentation](self, "prefersModalPresentation")
    && (-[WFActionUserInterface viewControllerForPresenting](self, "viewControllerForPresenting"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[WFActionUserInterface viewControllerForPresenting](self, "viewControllerForPresenting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__WFEmbeddableActionUserInterface_presentContent_completion___block_invoke;
    v12[3] = &unk_24EF60760;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    v10 = 1;
    objc_msgSend(v9, "presentViewController:animated:completion:", v13, 1, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD v12[5];
  void (**v13)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WFEmbeddableActionUserInterface contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[WFEmbeddableActionUserInterface prefersModalPresentation](self, "prefersModalPresentation")
      && (-[WFActionUserInterface viewControllerForPresenting](self, "viewControllerForPresenting"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      -[WFActionUserInterface viewControllerForPresenting](self, "viewControllerForPresenting");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
      v12[3] = &unk_24EF60788;
      v12[4] = self;
      v13 = v4;
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v12);

      v8 = v13;
    }
    else
    {
      -[WFActionUserInterface delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_24EF60788;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v9, "dismissPlatterForActionUserInterface:completionHandler:", self, v10);

      v8 = v11;
    }

  }
  else
  {
    v4[2](v4);
  }

}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

uint64_t __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentViewController:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentViewController:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __61__WFEmbeddableActionUserInterface_presentContent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setContentViewController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
