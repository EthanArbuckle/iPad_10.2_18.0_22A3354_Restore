@implementation TIKeyboardInputManagerWubi_yue

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)initImplementation
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = *MEMORY[0x24BEB5300];
  v3 = *MEMORY[0x24BEB52F0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerWubi_yue;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v5, sel_initImplementationWithMode_andLanguage_, v2, v3);
}

- (int)inputMethodType
{
  return 15;
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D90], "sharedInstance");
}

@end
