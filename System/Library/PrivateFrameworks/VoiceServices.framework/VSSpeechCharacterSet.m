@implementation VSSpeechCharacterSet

- (VSSpeechCharacterSet)initWithLanguage:(id)a3
{
  id v4;
  VSSpeechCharacterSet *v5;
  void *v6;
  VSSpeechCharacterSet *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSCharacterSet *characterSet;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSSpeechCharacterSet;
  v5 = -[VSSpeechCharacterSet init](&v14, sel_init);
  if (!v5)
  {
LABEL_5:
    v7 = v5;
    goto LABEL_7;
  }
  +[VSSpeechCharacterSet languageMapping](VSSpeechCharacterSet, "languageMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (VSSpeechCharacterSet *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:inDirectory:", v7, CFSTR("cbm"), CFSTR("CharacterBinaryMaps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {

      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithBitmapRepresentation:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v11;

    goto LABEL_5;
  }
LABEL_7:

  return v7;
}

- (id)unspeakableRangeOfText:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      -[VSSpeechCharacterSet characterSet](self, "characterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", v6));

      if (!v10 || v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          v12 = 1;
        else
          v12 = v10;
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          v13 = v6;
        else
          v13 = v8;
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          v14 = 1;
        else
          v14 = v7;
        if ((v10 & 1) != 0)
        {
          v13 = v8;
          v14 = v7;
        }
        if ((v12 & 1) != 0)
        {
          v8 = v13;
          v7 = v14;
        }
        else
        {
          ++v7;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        v7 = 0;
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "length"));
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);

    }
  }

  return v5;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (void)setCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_characterSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
}

+ (id)languageMapping
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:inDirectory:", CFSTR("VSSpeechLangCharset"), CFSTR("plist"), CFSTR("CharacterBinaryMaps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
