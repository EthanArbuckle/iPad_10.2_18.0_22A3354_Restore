@implementation ACMEUIController

- (ACMEUIController)init
{
  ACMEUIController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMEUIController;
  v2 = -[ACMEUIController init](&v4, sel_init);
  if (v2)
    -[ACMEUIController setShownAlerts:](v2, "setShownAlerts:", (id)objc_opt_new());
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMSignInDialogProtocol setDelegate:](-[ACMEUIController signInDialog](self, "signInDialog"), "setDelegate:", 0);
  -[ACMEUIController setSignInDialog:](self, "setSignInDialog:", 0);
  -[ACMEUIController setShownAlerts:](self, "setShownAlerts:", 0);
  -[ACMEUIController setRequest:](self, "setRequest:", 0);
  -[ACMEUIController setLogoImage:](self, "setLogoImage:", 0);
  -[ACMEUIController setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACMEUIController setAccountNameFieldPlaceholder:](self, "setAccountNameFieldPlaceholder:", 0);
  -[ACMEUIController setWidgetAccountLabel:](self, "setWidgetAccountLabel:", 0);
  -[ACMEUIController setSignInButton:](self, "setSignInButton:", 0);
  -[ACMEUIController setCancelButton:](self, "setCancelButton:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMEUIController;
  -[ACMEUIController dealloc](&v3, sel_dealloc);
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components");
}

- (void)setWidgetEnabled:(BOOL)a3
{
  self->_widgetEnabled = a3;
  -[ACMSignInDialogProtocol disableControls:](-[ACMEUIController signInDialog](self, "signInDialog"), "disableControls:", !a3);
}

- (BOOL)isWidgetShown
{
  return self->_signInDialog != 0;
}

- (BOOL)useAlertView
{
  return -[ACMEUIController signInStyle](self, "signInStyle") == 0;
}

- (BOOL)useCustomWidget
{
  return -[ACMEUIController signInStyle](self, "signInStyle") == 2;
}

- (NSString)password
{
  return (NSString *)-[ACMSignInDialogProtocol passwordString](-[ACMEUIController signInDialog](self, "signInDialog"), "passwordString");
}

- (void)setPassword:(id)a3
{
  -[ACMSignInDialogProtocol setPasswordString:](-[ACMEUIController signInDialog](self, "signInDialog"), "setPasswordString:", a3);
}

- (Class)standardSignInClass
{
  return 0;
}

- (Class)customSignInClass
{
  return 0;
}

- (Class)iTunesSignInClass
{
  return 0;
}

- (Class)signInWidgetClass
{
  return 0;
}

- (id)createAlertDialog
{
  ACMBaseAuthenticationRequest *v3;
  id v4;

  v3 = -[ACMEUIController request](self, "request");
  -[ACMEUIController iTunesSignInClass](self, "iTunesSignInClass");
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setIsUserNameEditable:", objc_msgSend((id)-[ACMBaseAuthenticationRequest userName](v3, "userName"), "length") == 0);
  objc_msgSend(v4, "setAlertViewPrompt:", -[ACMBaseAuthenticationRequest alertViewPrompt](v3, "alertViewPrompt"));
  return v4;
}

- (id)createStandardWidget
{
  id v3;

  -[ACMEUIController standardSignInClass](self, "standardSignInClass");
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setLogo:", -[ACMEUIController logoImage](self, "logoImage"));
  objc_msgSend(v3, "setBackgroundColor:", -[ACMEUIController backgroundColor](self, "backgroundColor"));
  objc_msgSend(v3, "setAccountNameFieldPlaceholder:", -[ACMEUIController accountNameFieldPlaceholder](self, "accountNameFieldPlaceholder"));
  return v3;
}

- (id)createCustomWidget
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  -[ACMEUIController customSignInClass](self, "customSignInClass");
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  if (!objc_msgSend(v3, "widgetClass"))
    objc_msgSend(v3, "setWidgetClass:", -[ACMEUIController signInWidgetClass](self, "signInWidgetClass"));
  -[ACMEUIController widgetPosition](self, "widgetPosition");
  objc_msgSend(v3, "setWidgetPosition:");
  objc_msgSend(v3, "setWidgetPasswordReturnKeyType:", -[ACMEUIController widgetPasswordReturnKeyType](self, "widgetPasswordReturnKeyType"));
  if (-[NSString length](-[ACMEUIController widgetAccountLabel](self, "widgetAccountLabel"), "length"))
    objc_msgSend(v3, "setWidgetAccountLabel:", -[ACMEUIController widgetAccountLabel](self, "widgetAccountLabel"));
  v4 = -[ACMEUIController signInButton](self, "signInButton");
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "setSignInBarButton:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setSignInButton:", v5);
    }
    objc_msgSend(v3, "setShouldAuthenticateOnUserInput:", -[ACMEUIController shouldAuthenticateOnUserInput](self, "shouldAuthenticateOnUserInput"));
  }
  v6 = -[ACMEUIController cancelButton](self, "cancelButton");
  if (v6)
  {
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "setCancelBarButton:", v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setCancelButton:", v7);
    }
  }
  objc_msgSend(v3, "setUserNameFieldEditable:", -[ACMBaseAuthenticationRequest userNameFieldEditable](-[ACMEUIController request](self, "request"), "userNameFieldEditable"));
  objc_msgSend(v3, "setBackgroundColor:", -[ACMEUIController backgroundColor](self, "backgroundColor"));
  return v3;
}

- (ACMSignInDialogProtocol)signInDialog
{
  ACMSignInDialogProtocol *result;
  id v4;

  result = self->_signInDialog;
  if (!result)
  {
    if (-[ACMEUIController useAlertView](self, "useAlertView"))
    {
      v4 = -[ACMEUIController createAlertDialog](self, "createAlertDialog");
    }
    else if (-[ACMEUIController useCustomWidget](self, "useCustomWidget"))
    {
      v4 = -[ACMEUIController createCustomWidget](self, "createCustomWidget");
    }
    else
    {
      v4 = -[ACMEUIController createStandardWidget](self, "createStandardWidget");
    }
    self->_signInDialog = (ACMSignInDialogProtocol *)v4;
    -[ACMSignInDialogProtocol setRequestedUserName:](self->_signInDialog, "setRequestedUserName:", -[ACMBaseAuthenticationRequest userName](-[ACMEUIController request](self, "request"), "userName"));
    return self->_signInDialog;
  }
  return result;
}

- (void)showSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[ACMSignInDialogProtocol showWithParentViewController:animated:completion:](-[ACMEUIController signInDialog](self, "signInDialog"), "showWithParentViewController:animated:completion:", a3, a4, a5);
}

- (void)hideSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[ACMSignInDialogProtocol hideWithParentViewController:animated:completion:](-[ACMEUIController signInDialog](self, "signInDialog"), "hideWithParentViewController:animated:completion:", a3, a4, a5);
}

- (void)cancelSignInWidget
{
  void *v3;

  while (-[NSMutableSet count](-[ACMEUIController shownAlerts](self, "shownAlerts"), "count"))
  {
    v3 = (void *)-[NSMutableSet anyObject](-[ACMEUIController shownAlerts](self, "shownAlerts"), "anyObject");
    objc_msgSend(v3, "dismissWithClickedButtonIndex:animated:", objc_msgSend(v3, "tag") == -100102, 0);
    -[NSMutableSet removeObject:](-[ACMEUIController shownAlerts](self, "shownAlerts"), "removeObject:", v3);
  }
  -[ACMSignInDialogProtocol cancel](-[ACMEUIController signInDialog](self, "signInDialog"), "cancel");
}

- (void)showAlertWithAlertMessage:(id)a3 buttonTitle:(id)a4 cancelButtonTitle:(id)a5 errorTag:(int64_t)a6
{
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67F8]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", &stru_24FCE58F0, a3, self, a5, a4, 0);
  objc_msgSend(v8, "setTag:", a6);
  -[ACMEUIController setWidgetEnabled:](self, "setWidgetEnabled:", 0);
  -[NSMutableSet addObject:](-[ACMEUIController shownAlerts](self, "shownAlerts"), "addObject:", v8);
  objc_msgSend(v8, "show");

}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  if (objc_msgSend(a3, "cancelButtonIndex") == a4 && objc_msgSend(a3, "tag") == -100102)
    -[ACMEUIController onIForgot:](self, "onIForgot:", self);
  -[NSMutableSet removeObject:](-[ACMEUIController shownAlerts](self, "shownAlerts"), "removeObject:", a3);
  -[ACMEUIController setWidgetEnabled:](self, "setWidgetEnabled:", 1);
}

- (unint64_t)signInDialogContentStyle
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[ACMUIControllerDelegate uiControllerSignInDialogContentStyle:](-[ACMEUIController delegate](self, "delegate"), "uiControllerSignInDialogContentStyle:", self);
  else
    return 0;
}

- (UIView)managerApprovalDialogSummaryView
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (UIView *)-[ACMUIControllerDelegate uiControllerManagerApprovalDialogSummaryView:](-[ACMEUIController delegate](self, "delegate"), "uiControllerManagerApprovalDialogSummaryView:", self);
  else
    return 0;
}

- (void)onSignIn:(id)a3
{
  void *v4;

  v4 = (void *)-[ACMSignInDialogProtocol userNameString](-[ACMEUIController signInDialog](self, "signInDialog", a3), "userNameString");
  -[ACMBaseAuthenticationRequest setUserName:](-[ACMEUIController request](self, "request"), "setUserName:", objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet")), "lowercaseString"));
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerOnSignIn:withPassword:](-[ACMEUIController delegate](self, "delegate"), "uiControllerOnSignIn:withPassword:", self, -[ACMSignInDialogProtocol passwordString](-[ACMEUIController signInDialog](self, "signInDialog"), "passwordString"));
}

- (void)onSignInCancel:(id)a3
{
  -[ACMEUIController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerOnSignInCancel:](-[ACMEUIController delegate](self, "delegate"), "uiControllerOnSignInCancel:", self);
}

- (void)onIForgot:(id)a3
{
  -[ACMEUIController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerOnSignIForgot:](-[ACMEUIController delegate](self, "delegate"), "uiControllerOnSignIForgot:", self);
}

- (void)onManageAppleID:(id)a3
{
  -[ACMUIControllerDelegate onManageAppleIDForRealm:](-[ACMEUIController delegate](self, "delegate", a3), "onManageAppleIDForRealm:", -[ACMBaseAuthenticationRequest realm](-[ACMEUIController request](self, "request"), "realm"));
}

- (void)signInDialogWillBecomeEnabled
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerWillEnableSignInDialog:](-[ACMEUIController delegate](self, "delegate"), "uiControllerWillEnableSignInDialog:", self);
}

- (void)signInDialogDidBecomeEnabled
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerDidEnableSignInDialog:](-[ACMEUIController delegate](self, "delegate"), "uiControllerDidEnableSignInDialog:", self);
}

- (void)signInDialogWillBecomeDisabled
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerWillDisableSignInDialog:](-[ACMEUIController delegate](self, "delegate"), "uiControllerWillDisableSignInDialog:", self);
}

- (void)signInDialogDidBecomeDisabled
{
  -[ACMEUIController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMUIControllerDelegate uiControllerDidDisableSignInDialog:](-[ACMEUIController delegate](self, "delegate"), "uiControllerDidDisableSignInDialog:", self);
}

- (ACMUIControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMUIControllerDelegate *)a3;
}

- (NSMutableSet)shownAlerts
{
  return self->_shownAlerts;
}

- (void)setShownAlerts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)isWidgetEnabled
{
  return self->_widgetEnabled;
}

- (ACMBaseAuthenticationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)signInStyle
{
  return self->_signInStyle;
}

- (void)setSignInStyle:(unint64_t)a3
{
  self->_signInStyle = a3;
}

- (UIImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CGPoint)widgetPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_widgetPosition.x;
  y = self->_widgetPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setWidgetPosition:(CGPoint)a3
{
  self->_widgetPosition = a3;
}

- (NSString)widgetAccountLabel
{
  return self->_widgetAccountLabel;
}

- (void)setWidgetAccountLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (id)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (id)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (int64_t)widgetPasswordReturnKeyType
{
  return self->_widgetPasswordReturnKeyType;
}

- (void)setWidgetPasswordReturnKeyType:(int64_t)a3
{
  self->_widgetPasswordReturnKeyType = a3;
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return self->_shouldAuthenticateOnUserInput;
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  self->_shouldAuthenticateOnUserInput = a3;
}

- (void)setSignInDialog:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
