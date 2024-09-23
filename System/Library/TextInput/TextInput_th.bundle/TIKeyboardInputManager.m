@implementation TIKeyboardInputManager

uint64_t __55__TIKeyboardInputManager_th_validUSetForAutocorrection__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD17C8], "_characterSetWithPattern:", CFSTR("[:Script=Thai:]"));
  -[TIKeyboardInputManager_th validUSetForAutocorrection]::thai_alphabet_set = result;
  return result;
}

@end
