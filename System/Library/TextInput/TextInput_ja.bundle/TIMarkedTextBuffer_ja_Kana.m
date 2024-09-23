@implementation TIMarkedTextBuffer_ja_Kana

- (TIMarkedTextBuffer_ja_Kana)initWithInternalString:(id)a3
{
  id v4;
  TIMarkedTextBuffer_ja_Kana *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIMarkedTextBuffer_ja_Kana;
  v5 = -[TIMarkedTextBuffer_ja_Kana init](&v7, sel_init);
  if (v5)
  {
    -[TIMarkedTextBuffer_ja_Kana setInternalString:withInputIndex:](v5, "setInternalString:withInputIndex:", v4, objc_msgSend(v4, "length"));
    -[TIMarkedTextBuffer_ja_Kana setHardwareKeyboard:](v5, "setHardwareKeyboard:", 1);
  }

  return v5;
}

- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  NSString *externalString;
  __int16 v31;
  __int16 v32;

  v6 = a3;
  v7 = v6;
  if (a4 < 2)
    goto LABEL_25;
  v8 = a4 - 1;
  if (a4 - 1 >= (unint64_t)objc_msgSend(v6, "length"))
    goto LABEL_25;
  v9 = objc_msgSend(v7, "characterAtIndex:", a4 - 1);
  if (v9 == 12444)
  {
    if (!-[TIMarkedTextBuffer_ja_Kana hardwareKeyboard](self, "hardwareKeyboard"))
      goto LABEL_25;
    objc_msgSend(v7, "substringWithRange:", a4 - 2, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(CFSTR("はひふへほ"), "rangeOfString:", v15);
    v18 = v17;

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_25;
    v19 = CFSTR("ぱぴぷぺぽ");
    goto LABEL_14;
  }
  if (v9 == 12443)
  {
    if (!-[TIMarkedTextBuffer_ja_Kana hardwareKeyboard](self, "hardwareKeyboard"))
    {
      v27 = objc_msgSend(v7, "characterAtIndex:", a4 - 2) - 12353;
      if (v27 > 0x53)
        goto LABEL_25;
      v28 = Kana_variant_map[v27];
      v31 = v28;
      if (!v28)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v31, 1);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v7, "substringWithRange:", a4 - 2, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(CFSTR("うかきくけこさしすせそたちつてとはひふへほ"), "rangeOfString:", v20);
    v18 = v21;

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_25;
    v19 = CFSTR("ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ");
LABEL_14:
    -[__CFString substringWithRange:](v19, "substringWithRange:", v16, v18);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v13 = (void *)v22;
    goto LABEL_23;
  }
  if (v9 != 8616)
    goto LABEL_25;
  v10 = objc_msgSend(v7, "characterAtIndex:", a4 - 2);
  v32 = v10;
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "characterIsMember:", v10);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v32, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "characterIsMember:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v32, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (!v24)
  {
LABEL_23:
    if (v13)
      goto LABEL_24;
LABEL_25:
    v8 = a4;
    goto LABEL_26;
  }
  objc_msgSend(v25, "uppercaseString");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v26 = (void *)v14;

  v13 = v26;
  if (!v26)
    goto LABEL_25;
LABEL_24:
  objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", a4 - 2, 2, v13);
  v29 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v29;
LABEL_26:
  externalString = self->_externalString;
  self->_externalIndex = v8;
  self->_externalString = (NSString *)v7;

}

- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5
{
  uint64_t v6;
  uint64_t v7;

  if (a3)
    *a3 = 1;
  if (a5)
  {
    v6 = -[TIMarkedTextBuffer_ja_Kana internalIndex](self, "internalIndex");
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    *a5 = v7 - 1;
  }
}

- (void)clear
{
  NSString *externalString;

  externalString = self->_externalString;
  self->_externalString = (NSString *)&stru_250122EC0;

  self->_externalIndex = 0;
}

- (BOOL)hardwareKeyboard
{
  return self->hardwareKeyboard;
}

- (void)setHardwareKeyboard:(BOOL)a3
{
  self->hardwareKeyboard = a3;
}

- (int64_t)externalIndex
{
  return self->_externalIndex;
}

- (void)setExternalIndex:(int64_t)a3
{
  self->_externalIndex = a3;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalString, 0);
}

@end
