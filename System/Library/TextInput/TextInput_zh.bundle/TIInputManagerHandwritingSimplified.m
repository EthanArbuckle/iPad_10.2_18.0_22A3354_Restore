@implementation TIInputManagerHandwritingSimplified

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIInputManager)initImplementation
{
  TIInputManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwritingSimplified;
  v3 = -[TIInputManagerHandwriting initImplementation](&v5, sel_initImplementation);
  -[TIInputManagerHandwriting updateAddressBook](self, "updateAddressBook");
  -[TIInputManagerHandwriting updateUserWordEntries](self, "updateUserWordEntries");
  return v3;
}

- (id)recognitionLanguage
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh-Hans"));
}

@end
