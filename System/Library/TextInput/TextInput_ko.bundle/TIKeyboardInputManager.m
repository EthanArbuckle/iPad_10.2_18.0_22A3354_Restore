@implementation TIKeyboardInputManager

uint64_t __55__TIKeyboardInputManager_ko_validUSetForAutocorrection__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD17C8], "_characterSetWithPattern:", CFSTR("[:Script=Hangul:]"));
  -[TIKeyboardInputManager_ko validUSetForAutocorrection]::hangul_set = result;
  return result;
}

@end
