@implementation TIKeyboardInputManager

void __59__TIKeyboardInputManager_ug_keyboardConfigurationLayoutTag__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__nonLetterSet;
  -[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__nonLetterSet = v0;

}

@end
