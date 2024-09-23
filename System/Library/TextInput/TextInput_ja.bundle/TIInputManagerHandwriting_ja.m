@implementation TIInputManagerHandwriting_ja

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)initImplementation
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwriting_ja;
  v3 = -[TIInputManagerHandwriting initImplementation](&v5, sel_initImplementation);
  -[TIInputManagerHandwriting updateAddressBook](self, "updateAddressBook");
  -[TIInputManagerHandwriting updateUserWordEntries](self, "updateUserWordEntries");
  return v3;
}

- (id)recognitionLanguage
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("ja-Hrkt"));
}

- (int)recognitionMode
{
  return 2;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[TIInputManagerHandwriting_ja keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldOutputFullwidthSpace") & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR(" "));

    if (v7)
      objc_msgSend(v4, "setString:", CFSTR("　"));
  }
  else
  {

  }
  v10.receiver = self;
  v10.super_class = (Class)TIInputManagerHandwriting_ja;
  -[TIKeyboardInputManagerBase handleKeyboardInput:](&v10, sel_handleKeyboardInput_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
