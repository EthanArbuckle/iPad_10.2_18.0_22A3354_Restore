@implementation PunctuationFailure

- (PunctuationFailure)init
{
  PunctuationFailure *v2;
  uint64_t v3;
  NSCharacterSet *punctuation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PunctuationFailure;
  v2 = -[PunctuationFailure init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    punctuation = v2->_punctuation;
    v2->_punctuation = (NSCharacterSet *)v3;

  }
  return v2;
}

- (BOOL)doesMatchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend(v4, "corrected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", &stru_24FD49B78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_24FD49B78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0 && objc_msgSend(v6, "length"))
  {
    v9 = 0;
    while (objc_msgSend(v8, "length") > v9)
    {
      v10 = objc_msgSend(v6, "characterAtIndex:", v9);
      v11 = objc_msgSend(v8, "characterAtIndex:", v9);
      if (v10 != (_DWORD)v11)
      {
        v12 = -[NSCharacterSet characterIsMember:](self->_punctuation, "characterIsMember:", v11);
        goto LABEL_8;
      }
      if (objc_msgSend(v6, "length") <= ++v9)
        break;
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuation, 0);
}

@end
