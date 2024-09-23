@implementation WFUIKitAlertPresenter

+ (void)presentAlert:(id)a3 withUserInterface:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__WFUIKitAlertPresenter_presentAlert_withUserInterface___block_invoke;
  v9[3] = &unk_24EF60738;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __56__WFUIKitAlertPresenter_presentAlert_withUserInterface___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "presentationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAlertPresentationSource sourceWithView:](WFAlertPresentationSource, "sourceWithView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPresentationSource:", v4);

  }
  return +[WFUIAlertControllerAlertPresenter presentAlert:withUserInterface:](WFUIAlertControllerAlertPresenter, "presentAlert:withUserInterface:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
