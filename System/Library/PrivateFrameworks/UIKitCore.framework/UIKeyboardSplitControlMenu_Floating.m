@implementation UIKeyboardSplitControlMenu_Floating

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Floating"), CFSTR("Floating"));
}

- (BOOL)visible
{
  _BOOL4 v2;

  v2 = +[UIKeyboardImpl supportsFloating](UIKeyboardImpl, "supportsFloating");
  if (v2)
    LOBYTE(v2) = !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  return v2;
}

- (void)actionForMenu:(id)a3
{
  +[UIPeripheralHost setFloating:onCompletion:](UIPeripheralHost, "setFloating:onCompletion:", 1, &__block_literal_global_344);
  +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:trigger:finalPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardSummonedEvent:trigger:finalPosition:", CFSTR("Untether"), CFSTR("NonInteractive"), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

@end
