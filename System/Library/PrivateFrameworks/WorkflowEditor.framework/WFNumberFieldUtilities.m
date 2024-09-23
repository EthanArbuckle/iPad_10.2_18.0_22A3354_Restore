@implementation WFNumberFieldUtilities

+ (id)decimalSymbol
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decimalSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)negateText:(id)a3
{
  __CFString *v3;
  void *v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length")
    && (-[__CFString substringToIndex:](v3, "substringToIndex:", 1),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("-")),
        v4,
        v5))
  {
    -[__CFString substringFromIndex:](v3, "substringFromIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24EE26238;
    if (v3)
      v7 = v3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("-"), v7);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

+ (void)negateTextInput:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "positionFromPosition:offset:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textInRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("-")))
  {
    objc_msgSend(v18, "replaceRange:withText:", v6, &stru_24EE26238);
    objc_msgSend(v3, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "positionFromPosition:offset:", v8, -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = v10;
    v13 = -1;
  }
  else
  {
    objc_msgSend(CFSTR("-"), "stringByAppendingString:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceRange:withText:", v6, v14);

    objc_msgSend(v3, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "positionFromPosition:offset:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = v10;
    v13 = 1;
  }
  objc_msgSend(v11, "positionFromPosition:offset:", v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "textRangeFromPosition:toPosition:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectedTextRange:", v17);

}

+ (BOOL)shouldChangeText:(id)a3 allowMinus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1518], "minimumDecimalNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") + 1;

  v12 = objc_msgSend(v6, "length") <= v9
     && (objc_msgSend(a1, "decimalSymbol"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v11 = objc_msgSend(a1, "numberOfOccurrencesOfString:inString:", v10, v6),
         v10,
         v11 <= 1)
     && objc_msgSend(a1, "numberOfOccurrencesOfString:inString:", CFSTR("-"), v6) <= (unint64_t)v4;

  return v12;
}

+ (id)stringBySanitizingNumberString:(id)a3 allowDecimalNumbers:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD1690];
  v7 = a3;
  objc_msgSend(v6, "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCharactersInString:", CFSTR("-"));
  if (v4)
  {
    objc_msgSend(a1, "decimalSymbol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addCharactersInString:", v9);

  }
  objc_msgSend(v8, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentsJoinedByString:", &stru_24EE26238);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "length") >= 2 && objc_msgSend(v12, "hasPrefix:", CFSTR("0")))
  {
    objc_msgSend(v12, "substringFromIndex:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(a1, "decimalSymbol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "hasPrefix:", v14);

  if (v15)
  {
    objc_msgSend(CFSTR("0"), "stringByAppendingString:", v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }

  return v12;
}

+ (unint64_t)numberOfOccurrencesOfString:(id)a3 inString:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, v8, objc_msgSend(v6, "length") - v8);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      ++v7;
      v8 = v9 + v10;
    }
    while (v9 + v10 < (unint64_t)objc_msgSend(v6, "length"));
  }

  return v7;
}

@end
