@implementation TIKeyboardInputManager_ug

- (id)keyboardConfigurationLayoutTag
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;

  if (-[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__onceToken, &__block_literal_global);
  -[TIKeyboardInputManager_ug keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", -[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__nonLetterSet, 4);
  }
  else
  {
    v7 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "substringFromIndex:", v6 + v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (objc_msgSend(v5, "length"))
    v9 = CFSTR("Default");
  else
    v9 = CFSTR("Initial");

  return (id)v9;
}

@end
