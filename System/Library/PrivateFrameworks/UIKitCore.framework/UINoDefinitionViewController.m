@implementation UINoDefinitionViewController

void __44___UINoDefinitionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _UIRemoteDictionaryViewController *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[_UIRemoteDictionaryViewController initWithStyle:]([_UIRemoteDictionaryViewController alloc], "initWithStyle:", 0);
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);

    WeakRetained = v4;
  }

}

@end
