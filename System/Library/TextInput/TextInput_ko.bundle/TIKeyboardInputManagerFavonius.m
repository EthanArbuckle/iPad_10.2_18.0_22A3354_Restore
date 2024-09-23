@implementation TIKeyboardInputManagerFavonius

uint64_t __54__TIKeyboardInputManagerFavonius_ko_acceptsCharacter___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD17C8], "_characterSetWithPattern:", CFSTR("[:Script=Hangul:]"));
  -[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::hangul_set = result;
  return result;
}

@end
