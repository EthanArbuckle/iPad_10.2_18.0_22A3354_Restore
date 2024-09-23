@implementation TIKeyboardInputManagerSimplifiedWubixing

- (void)initImplementation
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = *MEMORY[0x24BEB52C8];
  v3 = *MEMORY[0x24BEB52E8];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerSimplifiedWubixing;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v5, sel_initImplementationWithMode_andLanguage_, v2, v3);
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D78], "sharedInstance");
}

@end
