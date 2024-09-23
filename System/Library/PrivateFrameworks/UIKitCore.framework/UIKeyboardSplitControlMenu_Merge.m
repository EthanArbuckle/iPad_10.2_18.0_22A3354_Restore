@implementation UIKeyboardSplitControlMenu_Merge

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Merge"), CFSTR("Merge"));
}

- (BOOL)visible
{
  return +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
}

- (void)actionForMenu:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  UIKeyboardSetSplit(0);
  objc_msgSend(v3, "setFinishSplitTransitionBlock:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRivenSplitLock:", 1);

}

@end
