@implementation TIKeyboardInputManager_yue_Hant_Phonetic

- (void)initImplementation
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BEB52F0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_yue_Hant_Phonetic;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v4, sel_initImplementationWithMode_andLanguage_, CFSTR("Pinyin"), v2);
}

- (int)mecabraInputMethodType
{
  return 13;
}

- (id)locale
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("yue-Hant"));
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D88], "sharedInstance");
}

- (id)phoneticSortingMethod
{
  return &unk_25012E840;
}

@end
