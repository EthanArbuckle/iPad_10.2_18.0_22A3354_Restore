@implementation ICUIApplicationShimDelegate

- (UIWindow)keyWindow
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyWindow"));

  return (UIWindow *)v3;
}

- (BOOL)isSecureScreenShowing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v3 = objc_msgSend(v2, "isSecureScreenShowing");

  return v3;
}

- (BOOL)isQuickNoteSessionActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v3 = objc_msgSend(v2, "isQuickNoteSessionActive");

  return v3;
}

@end
