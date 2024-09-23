@implementation SCRO2DBrailleString

- (SCRO2DBrailleString)initWithText:(id)a3
{
  id v4;
  SCRO2DBrailleString *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *brailleParagraphs;
  SCRO2DBrailleString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SCRO2DBrailleString;
  v5 = -[SCRO2DBrailleString init](&v21, sel_init);
  if (v5)
  {
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    brailleParagraphs = v5->_brailleParagraphs;
    v5->_brailleParagraphs = v7;

    v15 = v5;
  }

  return v5;
}

+ (id)brailleStringsFromBrailleData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  SCRO2DBrailleString *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "strings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v3, "strings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[SCRO2DBrailleString initWithText:]([SCRO2DBrailleString alloc], "initWithText:", v9);
      objc_msgSend(v4, "addObject:", v10);

    }
  }

  return v4;
}

- (id)brailleLinesForWidth:(unint64_t)a3 indent:(unint64_t)a4 focused:(BOOL)a5 wordWrap:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSArray *obj;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return (id)objc_opt_new();
  v6 = a5;
  v9 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_brailleParagraphs;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v34;
    if (a4)
      v10 = v6;
    else
      v10 = 0;
    v28 = v10;
    v11 = 1;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((v28 & v11) != 0)
          v14 = CFSTR("⣿");
        else
          v14 = &stru_24CC1DB88;
        -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v14, "stringByPaddingToLength:withString:startingAtIndex:", a4, CFSTR("⠀"), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringByAppendingString:", v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (objc_msgSend(v15, "length"))
        {
          v17 = v15;
          do
          {
            if (objc_msgSend(v17, "length") < a3)
            {
              objc_msgSend(v17, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR("⠀"), 0);
              v18 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v18;
            }
            v19 = -[SCRO2DBrailleString _wordRangeAtIndex:inBraille:](self, "_wordRangeAtIndex:inBraille:", a3, v17);
            if (v19 < a3 && (v21 = v19) != 0 && v19 + v20 > a3)
            {
              objc_msgSend(v17, "substringToIndex:", v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR("⠀"), 0);
              v23 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "addObject:", v23);
              objc_msgSend(v17, "substringFromIndex:", v21);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v17 = (void *)v23;
            }
            else
            {
              objc_msgSend(v17, "substringToIndex:", a3);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v24);

              objc_msgSend(v17, "substringFromIndex:", a3);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v17 = v16;
          }
          while (objc_msgSend(v16, "length"));
        }

        v11 = 0;
      }
      v11 = 0;
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v31);
  }

  v25 = (void *)objc_msgSend(v9, "copy");
  return v25;
}

- (_NSRange)_wordRangeAtIndex:(unint64_t)a3 inBraille:(id)a4
{
  id v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v5 = a4;
  if (objc_msgSend(v5, "length") >= a3)
  {
    v8 = a3;
    do
    {
      v7 = v8;
      if (!v8)
        break;
      --v8;
    }
    while (objc_msgSend(v5, "characterAtIndex:", v7 - 1) != 10240);
    for (; a3 < objc_msgSend(v5, "length"); ++a3)
    {
      if (objc_msgSend(v5, "characterAtIndex:", a3) == 10240)
        break;
    }
    v6 = a3 - v7;
  }
  else
  {
    v6 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v9 = v7;
  v10 = v6;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleParagraphs, 0);
}

@end
