@implementation PKRemoteAddPassesViewController

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKRemoteAddPassesViewController;
  -[_UIRemoteViewController dealloc](&v2, sel_dealloc);
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE555AF0);
}

- (void)ingestionDidFinishWithResult:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKRemoteAddPassesViewController_ingestionDidFinishWithResult___block_invoke;
  v3[3] = &unk_1E3E62010;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __64__PKRemoteAddPassesViewController_ingestionDidFinishWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ingestionDidFinishWithResult:", *(_QWORD *)(a1 + 40));

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  -[PKRemoteAddPassesViewController ingestionDidFinishWithResult:](self, "ingestionDidFinishWithResult:", 0);
}

- (PKAddPassesViewControllerDelegate)delegate
{
  return (PKAddPassesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
