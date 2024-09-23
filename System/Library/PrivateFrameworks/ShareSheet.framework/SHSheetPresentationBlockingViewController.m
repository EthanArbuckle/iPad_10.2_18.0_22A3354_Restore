@implementation SHSheetPresentationBlockingViewController

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[SHSheetPresentationBlockingViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SHSheetPresentationBlockingViewController;
  -[SHSheetPresentationBlockingViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)_createSystemCloseButton
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__handleClose);
}

- (void)_handleClose
{
  id v2;

  -[SHSheetPresentationBlockingViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlePresentationBlockingViewControllerClose");

}

- (SHSheetPresentationBlockingViewControllerDelegate)delegate
{
  return (SHSheetPresentationBlockingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIBarButtonItem)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (SHSheetContentPresenter)presenter
{
  return (SHSheetContentPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
