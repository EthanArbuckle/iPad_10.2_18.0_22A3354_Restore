@implementation PDUWelcomeViewController

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_2;
  v3[3] = &unk_2515A5D20;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "getCGImageForImageDescriptor:completion:", v2, v3);
  objc_destroyWeak(&v4);
}

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_3;
    v7[3] = &unk_2515A5CF8;
    v8 = v4;
    v9 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIcon:accessibilityLabel:", *(_QWORD *)(a1 + 40), CFSTR("AppIcon"));

}

@end
