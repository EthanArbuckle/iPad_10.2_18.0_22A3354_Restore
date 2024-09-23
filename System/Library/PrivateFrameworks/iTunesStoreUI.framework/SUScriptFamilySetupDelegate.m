@implementation SUScriptFamilySetupDelegate

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
