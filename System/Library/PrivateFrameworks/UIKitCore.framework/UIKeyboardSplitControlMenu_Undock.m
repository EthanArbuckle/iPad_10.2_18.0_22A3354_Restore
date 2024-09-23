@implementation UIKeyboardSplitControlMenu_Undock

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Undock"), CFSTR("Undock"));
}

- (BOOL)visible
{
  int v2;
  void *v3;

  if (+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference")
    && !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isUndocked") ^ 1;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)actionForMenu:(id)a3
{
  id v3;

  objc_msgSend(a3, "setFinishSplitTransitionBlock:", 0);
  UIKeyboardSetUndocked(1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRivenSplitLock:", 1);

}

@end
