@implementation TIDPWordRecord

- (NSString)cleanedWord
{
  void *v2;
  void *v3;
  void *v4;

  -[TIDPWordRecord word](self, "word");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSNumber)codedWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIDPWordRecord coder](self, "coder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDPWordRecord coder](self, "coder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDPWordRecord cleanedWord](self, "cleanedWord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codeForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSString)codedWordAsString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIDPWordRecord coder](self, "coder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDPWordRecord coder](self, "coder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDPWordRecord cleanedWord](self, "cleanedWord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringCodeForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSUUID)coderVersion
{
  void *v2;
  void *v3;

  -[TIDPWordRecord coder](self, "coder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "versionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)toDPWordRecord
{
  void *v3;
  void *v4;
  void *v5;

  -[TIDPWordRecord coder](self, "coder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[TIDPWordRecord codedWordAsString](self, "codedWordAsString");
  else
    -[TIDPWordRecord cleanedWord](self, "cleanedWord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1D330], "word:atPosition:", v4, self->_wordPosition);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)wordPosition
{
  return self->_wordPosition;
}

- (void)setWordPosition:(id)a3
{
  objc_storeStrong((id *)&self->_wordPosition, a3);
}

- (NSString)word
{
  return self->_word;
}

- (void)setWord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HCHuffmanCoder)coder
{
  return self->_coder;
}

- (void)setCoder:(id)a3
{
  objc_storeStrong((id *)&self->_coder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coder, 0);
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_wordPosition, 0);
}

+ (id)word:(id)a3
{
  return (id)objc_msgSend(a1, "word:atPosition:coder:", a3, 0, 0);
}

+ (id)word:(id)a3 atPosition:(id)a4
{
  return (id)objc_msgSend(a1, "word:atPosition:coder:", a3, a4, 0);
}

+ (id)word:(id)a3 atPosition:(id)a4 coder:(id)a5
{
  id v7;
  id v8;
  id v9;
  TIDPWordRecord *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(TIDPWordRecord);
  v11 = (void *)objc_msgSend(v9, "copy");

  -[TIDPWordRecord setWord:](v10, "setWord:", v11);
  v12 = (void *)objc_msgSend(v8, "copy");

  -[TIDPWordRecord setWordPosition:](v10, "setWordPosition:", v12);
  -[TIDPWordRecord setCoder:](v10, "setCoder:", v7);

  return v10;
}

@end
