@implementation TIKeyboardInputManager_zh_hant_Pinyin

- (void)initImplementation
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BEB52F8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_hant_Pinyin;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v4, sel_initImplementationWithMode_andLanguage_, CFSTR("Pinyin"), v2);
}

- (int)inputMethodType
{
  return 4;
}

- (id)locale
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("zh-Hant"));
}

- (id)phoneticSortingMethod
{
  return &unk_2501332C8;
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D88], "sharedInstance");
}

- (BOOL)usesComposingInput
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardInputManagerBase currentInputModeIdentifier](self, "currentInputModeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("sw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("Pinyin-Traditional"));
  return (char)v2;
}

@end
