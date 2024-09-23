@implementation TIKeyboardInputManagerSimplifiedWubi

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
  v3 = *MEMORY[0x24BEB52E8];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerSimplifiedWubi;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v5, sel_initImplementationWithMode_andLanguage_, v2, v3);
}

- (int)inputMethodType
{
  return 7;
}

- (id)sortingMethods
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
  {
    v3 = &unk_250133270;
  }
  else
  {
    v4 = -[TIKeyboardInputManagerChinese hasIdeographicCandidates](self, "hasIdeographicCandidates");
    v5 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "arrayWithObject:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D70], "sharedInstance");
}

@end
