@implementation HOAppDelegate.AccessoryPickerDelegate

- (void)actionSetAccessoryPickerDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
