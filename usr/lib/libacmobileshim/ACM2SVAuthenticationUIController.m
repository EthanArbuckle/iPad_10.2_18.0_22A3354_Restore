@implementation ACM2SVAuthenticationUIController

- (ACM2SVAuthenticationUIController)initWithParentViewController:(id)a3
{
  ACM2SVAuthenticationUIController *v4;
  ACM2SVAuthenticationUIController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACM2SVAuthenticationUIController;
  v4 = -[ACM2SVAuthenticationUIController init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ACM2SVAuthenticationUIController setParentViewController:](v4, "setParentViewController:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_trustedDevicesViewController)
  {
    -[ACM2SVTrustedDevicesViewController setDelegate:](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "setDelegate:", 0);
    -[ACM2SVAuthenticationUIController setTrustedDevicesViewController:](self, "setTrustedDevicesViewController:", 0);
  }
  if (self->_codeVerificationViewController)
  {
    -[ACM2SVCodeVerificationViewController setDelegate:](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "setDelegate:", 0);
    -[ACM2SVAuthenticationUIController setCodeVerificationViewController:](self, "setCodeVerificationViewController:", 0);
  }
  -[ACM2SVAuthenticationUIController setDelegate:](self, "setDelegate:", 0);
  -[ACM2SVAuthenticationUIController setParentViewController:](self, "setParentViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVAuthenticationUIController;
  -[ACM2SVAuthenticationUIController dealloc](&v3, sel_dealloc);
}

- (void)hideUIAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[6];
  BOOL v8;

  v4 = a3;
  v6 = (id)objc_msgSend(a4, "copy");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__ACM2SVAuthenticationUIController_hideUIAnimated_withCompletion___block_invoke;
  v7[3] = &unk_24FCE5318;
  v8 = v4;
  v7[4] = self;
  v7[5] = v6;
  -[ACM2SVAuthenticationUIController hideTrustedDevicesViewControllerAnimated:withCompletion:](self, "hideTrustedDevicesViewControllerAnimated:withCompletion:", v4, v7);
}

uint64_t __66__ACM2SVAuthenticationUIController_hideUIAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideEnterVerificationCodeViewControllerAnimated:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)handleFailoverWithCompletion:(id)a3
{
  -[ACM2SVAuthenticationUIController hideUIAnimated:withCompletion:](self, "hideUIAnimated:withCompletion:", 1, a3);
}

- (int64_t)statusBarStyle
{
  if (floor(*MEMORY[0x24BDD0D50]) <= 993.0)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarStyle");
}

- (UIColor)textColor
{
  if (-[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle"))
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)labelTextColor
{
  if (-[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle"))
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
  else
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (UIColor)backgroundColor
{
  if (-[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle"))
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

- (int64_t)keyboardAppearance
{
  return -[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle") != 0;
}

- (UIColor)tintColor
{
  return 0;
}

- (ACM2SVTrustedDevicesViewController)trustedDevicesViewController
{
  ACM2SVTrustedDevicesViewController *trustedDevicesViewController;
  double v4;
  double v5;
  double v6;
  double v7;

  trustedDevicesViewController = self->_trustedDevicesViewController;
  if (!trustedDevicesViewController)
  {
    self->_trustedDevicesViewController = -[ACM2SVTrustedDevicesViewController initWithDelegate:]([ACM2SVTrustedDevicesViewController alloc], "initWithDelegate:", self);
    -[ACM2SVTrustedDevicesViewController setTextColor:](self->_trustedDevicesViewController, "setTextColor:", -[ACM2SVAuthenticationUIController textColor](self, "textColor"));
    -[ACM2SVTrustedDevicesViewController setBackgroundColor:](self->_trustedDevicesViewController, "setBackgroundColor:", -[ACM2SVAuthenticationUIController backgroundColor](self, "backgroundColor"));
    -[ACM2SVTrustedDevicesViewController setLabelTextColor:](self->_trustedDevicesViewController, "setLabelTextColor:", -[ACM2SVAuthenticationUIController labelTextColor](self, "labelTextColor"));
    -[ACM2SVTrustedDevicesViewController setSuggestedStatusBarStyle:](self->_trustedDevicesViewController, "setSuggestedStatusBarStyle:", -[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle"));
    -[ACM2SVTrustedDevicesViewController view](self->_trustedDevicesViewController, "view");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self->_trustedDevicesViewController, "view"), "setTintColor:", -[ACM2SVAuthenticationUIController tintColor](self, "tintColor"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "applicationFrame");
    objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self->_trustedDevicesViewController, "view"), "setFrame:", v4, v5, v6, v7);
    trustedDevicesViewController = self->_trustedDevicesViewController;
  }
  return trustedDevicesViewController;
}

- (ACM2SVCodeVerificationViewController)codeVerificationViewController
{
  ACM2SVCodeVerificationViewController *codeVerificationViewController;
  double v4;
  double v5;
  double v6;
  double v7;

  codeVerificationViewController = self->_codeVerificationViewController;
  if (!codeVerificationViewController)
  {
    self->_codeVerificationViewController = -[ACM2SVCodeVerificationViewController initWithDelegate:]([ACM2SVCodeVerificationViewController alloc], "initWithDelegate:", self);
    -[ACM2SVCodeVerificationViewController setSuggestedStatusBarStyle:](self->_codeVerificationViewController, "setSuggestedStatusBarStyle:", -[ACM2SVAuthenticationUIController statusBarStyle](self, "statusBarStyle"));
    -[ACM2SVCodeVerificationViewController setBackgroundColor:](self->_codeVerificationViewController, "setBackgroundColor:", -[ACM2SVAuthenticationUIController backgroundColor](self, "backgroundColor"));
    -[ACM2SVCodeVerificationViewController setTextColor:](self->_codeVerificationViewController, "setTextColor:", -[ACM2SVAuthenticationUIController textColor](self, "textColor"));
    -[ACM2SVCodeVerificationViewController setKeyboardAppearance:](self->_codeVerificationViewController, "setKeyboardAppearance:", -[ACM2SVAuthenticationUIController keyboardAppearance](self, "keyboardAppearance"));
    objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view"), "setBackgroundColor:", -[ACM2SVAuthenticationUIController backgroundColor](self, "backgroundColor"));
    -[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view"), "setTintColor:", -[ACM2SVAuthenticationUIController tintColor](self, "tintColor"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "applicationFrame");
    objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view"), "setFrame:", v4, v5, v6, v7);
    codeVerificationViewController = self->_codeVerificationViewController;
  }
  return codeVerificationViewController;
}

- (void)resetTrustedDevicesViewControllerWithDeviceList:(id)a3
{
  -[ACM2SVTrustedDevicesViewController resetWithDeviceList:](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "resetWithDeviceList:", a3);
}

- (void)resetCodeVerificationViewController
{
  -[ACM2SVCodeVerificationViewController reset](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "reset");
}

- (void)chooseTrustedDeviceWithDeviceList:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[7];

  v6 = (id)objc_msgSend(a4, "copy");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke;
  v7[3] = &unk_24FCE5368;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = v6;
  -[ACM2SVAuthenticationUIController hideEnterVerificationCodeViewControllerAnimated:withCompletion:](self, "hideEnterVerificationCodeViewControllerAnimated:withCompletion:", 1, v7);
}

uint64_t __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "trustedDevicesViewController");
  v3 = objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke_2;
  v6[3] = &unk_24FCE5340;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v2, "presentWithParentViewController:deviceList:completion:", v3, v4, v6);
}

uint64_t __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController chooseTrustedDeviceWithDeviceList:completion:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 177, 0, "Ask delegate to send code");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)enterVerificationCodeWithLength:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[8];

  v8 = (id)objc_msgSend(a5, "copy");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__ACM2SVAuthenticationUIController_enterVerificationCodeWithLength_forDevice_completion___block_invoke;
  v9[3] = &unk_24FCE5390;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = v8;
  v9[7] = a3;
  -[ACM2SVAuthenticationUIController hideTrustedDevicesViewControllerAnimated:withCompletion:](self, "hideTrustedDevicesViewControllerAnimated:withCompletion:", 1, v9);
}

uint64_t __89__ACM2SVAuthenticationUIController_enterVerificationCodeWithLength_forDevice_completion___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "codeVerificationViewController"), "setPasscodeLength:", *(_QWORD *)(a1 + 56));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "codeVerificationViewController"), "setCanResendTheCode:", objc_msgSend(*(id *)(a1 + 40), "isTOTPDevice") ^ 1);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "codeVerificationViewController"), "presentWithParentViewController:completion:", objc_msgSend(*(id *)(a1 + 32), "parentViewController"), *(_QWORD *)(a1 + 48));
}

- (void)hideTrustedDevicesViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v5;
  id v7;
  dispatch_time_t v8;
  _QWORD block[6];
  BOOL v10;

  v5 = a3;
  if (-[ACM2SVTrustedDevicesViewController isBeingPresented](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "isBeingPresented"))
  {
    v7 = (id)objc_msgSend(a4, "copy");
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__ACM2SVAuthenticationUIController_hideTrustedDevicesViewControllerAnimated_withCompletion___block_invoke;
    block[3] = &unk_24FCE5318;
    v10 = v5;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  }
  else if (-[ACM2SVTrustedDevicesViewController presentingViewController](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "presentingViewController")&& (-[ACM2SVTrustedDevicesViewController isBeingDismissed](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "isBeingDismissed") & 1) == 0)
  {
    -[ACM2SVTrustedDevicesViewController hideAnimated:withCompletion:](-[ACM2SVAuthenticationUIController trustedDevicesViewController](self, "trustedDevicesViewController"), "hideAnimated:withCompletion:", v5, a4);
  }
  else if (a4)
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

uint64_t __92__ACM2SVAuthenticationUIController_hideTrustedDevicesViewControllerAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideTrustedDevicesViewControllerAnimated:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)hideEnterVerificationCodeViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  id v7;
  dispatch_time_t v8;
  _QWORD block[6];
  BOOL v10;

  if (-[ACM2SVCodeVerificationViewController isBeingPresented](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "isBeingPresented"))
  {
    v7 = (id)objc_msgSend(a4, "copy");
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __99__ACM2SVAuthenticationUIController_hideEnterVerificationCodeViewControllerAnimated_withCompletion___block_invoke;
    block[3] = &unk_24FCE5318;
    v10 = a3;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  }
  else if (-[ACM2SVCodeVerificationViewController presentingViewController](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "presentingViewController")&& (-[ACM2SVCodeVerificationViewController isBeingDismissed](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "isBeingDismissed") & 1) == 0)
  {
    -[ACM2SVCodeVerificationViewController hideAnimated:withCompletion:](-[ACM2SVAuthenticationUIController codeVerificationViewController](self, "codeVerificationViewController"), "hideAnimated:withCompletion:", 1, a4);
  }
  else if (a4)
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

uint64_t __99__ACM2SVAuthenticationUIController_hideEnterVerificationCodeViewControllerAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideEnterVerificationCodeViewControllerAnimated:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)showAlertWithError:(id)a3 completion:(id)a4
{
  id v5;
  ACMAlertView *v6;
  _QWORD v7[6];

  v5 = (id)objc_msgSend(a4, "copy");
  v6 = -[ACMAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:]([ACMAlertView alloc], "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", &stru_24FCE58F0, objc_msgSend(a3, "localizedDescription"), 0, 0, +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("OK")), 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__ACM2SVAuthenticationUIController_showAlertWithError_completion___block_invoke;
  v7[3] = &unk_24FCE53B8;
  v7[4] = v6;
  v7[5] = v5;
  -[ACMAlertView showWithCompletionBlock:](v6, "showWithCompletionBlock:", v7);
}

uint64_t __66__ACM2SVAuthenticationUIController_showAlertWithError_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "cancelButtonIndex");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)trustedDevicesViewControllerDidSelectUnableReceiveMessages:(id)a3
{
  -[ACC2SVAuthenticationUIControllerDelegate uiControllerUserIsUnableToReceiveVerificationCode:](-[ACM2SVAuthenticationUIController delegate](self, "delegate", a3), "uiControllerUserIsUnableToReceiveVerificationCode:", self);
}

- (void)trustedDevicesViewControllerNeedsRefresh:(id)a3
{
  -[ACC2SVAuthenticationUIControllerDelegate uiControllerRefreshDeviceList:](-[ACM2SVAuthenticationUIController delegate](self, "delegate", a3), "uiControllerRefreshDeviceList:", self);
}

- (void)downloadImageWithURL:(id)a3 completionBlock:(id)a4
{
  -[ACC2SVAuthenticationUIControllerDelegate uiController:getImageWithURL:completion:](-[ACM2SVAuthenticationUIController delegate](self, "delegate"), "uiController:getImageWithURL:completion:", self, a3, a4);
}

- (void)cancelInProgressImageDownloads
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController cancelInProgressImageDownloads]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 277, 0, "Ask delegate to cancel image downloads");
  -[ACC2SVAuthenticationUIControllerDelegate uiControllerCancelGettingImages:](-[ACM2SVAuthenticationUIController delegate](self, "delegate"), "uiControllerCancelGettingImages:", self);
}

- (void)codeVerificationViewControllerNeedsResendCode:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController codeVerificationViewControllerNeedsResendCode:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 285, 0, "Ask delegate to resend code");
  -[ACC2SVAuthenticationUIControllerDelegate uiController:resendVerificationCodeWithCompletion:](-[ACM2SVAuthenticationUIController delegate](self, "delegate", a3), "uiController:resendVerificationCodeWithCompletion:", self, 0);
}

- (ACC2SVAuthenticationUIControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACC2SVAuthenticationUIControllerDelegate *)a3;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setTrustedDevicesViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setCodeVerificationViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
