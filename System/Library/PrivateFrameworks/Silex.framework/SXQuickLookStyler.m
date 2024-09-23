@implementation SXQuickLookStyler

- (void)styleViewController:(id)a3
{
  id v3;

  objc_msgSend(a3, "errorLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

}

@end
