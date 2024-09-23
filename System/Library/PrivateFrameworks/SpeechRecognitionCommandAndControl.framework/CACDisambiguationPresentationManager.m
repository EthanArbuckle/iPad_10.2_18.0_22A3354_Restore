@implementation CACDisambiguationPresentationManager

- (void)showWithDisambiguationItems:(id)a3
{
  -[CACDisambiguationPresentationManager showWithDisambiguationItems:alertTitle:](self, "showWithDisambiguationItems:alertTitle:", a3, 0);
}

- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4
{
  -[CACDisambiguationPresentationManager showWithDisambiguationItems:alertTitle:alertMessage:](self, "showWithDisambiguationItems:alertTitle:alertMessage:", a3, a4, 0);
}

- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke;
  v14[3] = &unk_24F2AB1A8;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v2 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_2;
  v8[3] = &unk_24F2AB158;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_3;
  v6[3] = &unk_24F2AB180;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "showViewControllerWithCreationHandler:updateHandler:", v8, v6);

}

CACDisambiguationPresentationViewController *__92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_2(_QWORD *a1)
{
  CACDisambiguationPresentationViewController *v2;

  v2 = -[CACDisambiguationPresentationViewController initWithTitle:message:]([CACDisambiguationPresentationViewController alloc], "initWithTitle:message:", a1[4], a1[5]);
  -[CACDisambiguationPresentationViewController setContactDisambiguationDelegate:](v2, "setContactDisambiguationDelegate:", a1[6]);
  return v2;
}

uint64_t __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisambiguationItems:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)dialDiambiguationPresentationViewController:(id)a3 hideWithCompletion:(id)a4
{
  -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, a4);
}

@end
