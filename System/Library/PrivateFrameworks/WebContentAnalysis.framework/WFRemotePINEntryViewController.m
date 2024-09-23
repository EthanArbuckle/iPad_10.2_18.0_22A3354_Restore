@implementation WFRemotePINEntryViewController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFRemotePINEntryViewController;
  -[WFRemotePINEntryViewController viewDidLoad](&v4, sel_viewDidLoad);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v3 = 16;
  else
    v3 = 17;
  -[WFRemotePINEntryViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[WFRemotePINEntryViewController setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFRemotePINEntryViewController;
  -[_UIRemoteViewController dealloc](&v3, sel_dealloc);
}

- (void)setURL:(id)a3
{
  objc_msgSend(-[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "setURL:", a3);
}

- (void)setPageTitle:(id)a3
{
  objc_msgSend(-[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "setPageTitle:", a3);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A7EE8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25499C288);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    return 30;
  else
    return 2;
}

- (void)userEnteredCorrectPIN
{
  -[WFPINEntryViewControllerProtocol userEnteredCorrectPIN](self->_delegate, "userEnteredCorrectPIN");
}

- (void)userDidCancel
{
  -[WFPINEntryViewControllerProtocol userDidCancel](self->_delegate, "userDidCancel");
}

- (void)getIsPINPresentWithCompletion:(id)a3
{
  objc_msgSend(-[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "getIsPINPresentWithCompletion:", a3);
}

- (void)permitURLWithCompletion:(id)a3
{
  objc_msgSend(-[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "permitURLWithCompletion:", a3);
}

- (BOOL)requiresKeyboard
{
  return 0;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 2;
}

- (WFPINEntryViewControllerProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (WFPINEntryViewControllerProtocol *)a3;
}

@end
