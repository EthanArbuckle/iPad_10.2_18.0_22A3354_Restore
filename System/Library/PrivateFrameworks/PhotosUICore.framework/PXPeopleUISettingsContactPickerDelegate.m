@implementation PXPeopleUISettingsContactPickerDelegate

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "identifier", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDebugContactIdentifier:", v5);

}

@end
