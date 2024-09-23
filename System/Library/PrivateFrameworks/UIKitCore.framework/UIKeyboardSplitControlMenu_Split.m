@implementation UIKeyboardSplitControlMenu_Split

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Split"), CFSTR("Split"));
}

- (BOOL)visible
{
  _BOOL4 v2;

  v2 = +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference");
  if (v2)
    LOBYTE(v2) = !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  return v2;
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
  v5[2] = __50__UIKeyboardSplitControlMenu_Split_actionForMenu___block_invoke;
  v5[3] = &unk_1E16B3FD8;
  v6 = v3;
  v4 = v3;
  +[UIPeripheralHost setFloating:onCompletion:](UIPeripheralHost, "setFloating:onCompletion:", 0, v5);

}

@end
