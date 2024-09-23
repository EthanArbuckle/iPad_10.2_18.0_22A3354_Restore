@implementation UIKeyboardSplitControlMenu_Dock

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Dock"), CFSTR("Dock"));
}

- (BOOL)visible
{
  void *v3;
  char v4;

  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    return 0;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUndocked");

  return v4;
}

- (void)actionForMenu:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__UIKeyboardSplitControlMenu_Dock_actionForMenu___block_invoke;
  v5[3] = &unk_1E16B3FD8;
  v6 = v3;
  v4 = v3;
  +[UIPeripheralHost setFloating:onCompletion:](UIPeripheralHost, "setFloating:onCompletion:", 0, v5);

}

@end
