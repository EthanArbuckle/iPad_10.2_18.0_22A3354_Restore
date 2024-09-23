@implementation NSAttributedString(SCRCMathExpression)

- (uint64_t)_scrcRangeOfVanillaFormatSpecifier
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "string");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("%@"));

  return v2;
}

- (uint64_t)_scrcRangeOfFormatSpecifierWithIndex:()SCRCMathExpression
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%lu$@"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfString:", v5);

  return v6;
}

+ (id)_scrcStringWithFormat:()SCRCMathExpression args:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id *v25;

  v6 = a3;
  v25 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
  v8 = objc_msgSend(v7, "_scrcRangeOfVanillaFormatSpecifier");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = v9;
    do
    {
      v12 = v25++;
      v13 = *v12;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:", CFSTR("(null)"));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v10, v11, v13);
      v10 = objc_msgSend(v7, "_scrcRangeOfVanillaFormatSpecifier");
      v11 = v14;

    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v15 = objc_msgSend(v7, "_scrcRangeOfFormatSpecifierWithIndex:", 1);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v15;
    v18 = v16;
    v19 = 2;
    do
    {
      v20 = v25++;
      v21 = *v20;
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:", CFSTR("(null)"));
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v17, v18, v21);
      v17 = objc_msgSend(v7, "_scrcRangeOfFormatSpecifierWithIndex:", v19);
      v18 = v22;

      ++v19;
    }
    while (v17 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v23 = (void *)objc_msgSend([a1 alloc], "initWithAttributedString:", v7);

  return v23;
}

+ (id)scrcStringWithFormat:()SCRCMathExpression
{
  objc_msgSend(a1, "_scrcStringWithFormat:args:", a3, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)scrcStringWithString:()SCRCMathExpression
{
  return objc_msgSend(a1, "scrcStringWithString:treePosition:", a3, 0);
}

+ (id)scrcStringWithString:()SCRCMathExpression treePosition:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    v11 = CFSTR("kSCRCMathStringAttributeTreePosition");
    v12[0] = a4;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = a4;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    a4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)objc_msgSend([a1 alloc], "initWithString:attributes:", v6, a4);

  return v9;
}

+ (uint64_t)scrcStringWithLiteralString:()SCRCMathExpression
{
  return objc_msgSend(a1, "scrcStringWithLiteralString:treePosition:", a3, 0);
}

+ (id)scrcStringWithLiteralString:()SCRCMathExpression treePosition:
{
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  const __CFString **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v20[0] = CFSTR("kSCRCMathStringAttributeSpeakLiteralCharacters");
    v20[1] = CFSTR("kSCRCMathStringAttributeTreePosition");
    v21[0] = MEMORY[0x24BDBD1C8];
    v21[1] = a4;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a4;
    v8 = a3;
    v9 = v21;
    v10 = (const __CFString **)v20;
    v11 = v6;
    v12 = 2;
  }
  else
  {
    v18 = CFSTR("kSCRCMathStringAttributeSpeakLiteralCharacters");
    v19 = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v7 = 0;
    v14 = a3;
    v9 = &v19;
    v10 = &v18;
    v11 = v13;
    v12 = 1;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend([a1 alloc], "initWithString:attributes:", a3, v15);
  return v16;
}

+ (id)scrcStringWithDollarCode:()SCRCMathExpression treePosition:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDollarCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(a1, "scrcStringWithString:treePosition:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)scrcString
{
  return objc_alloc_init(a1);
}

+ (uint64_t)scrcPauseString
{
  return objc_msgSend(a1, "scrcStringWithString:", CFSTR(", "));
}

+ (uint64_t)scrcSpaceString
{
  return objc_msgSend(a1, "scrcStringWithString:", CFSTR(" "));
}

- (id)scrcStringByAppendingAttributedString:()SCRCMathExpression
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1688];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAttributedString:", a1);
  objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", objc_msgSend(a1, "length"), 0, v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v6);
  return v7;
}

- (id)scrcStringByReplacingOccurrencesOfString:()SCRCMathExpression withString:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", a1);
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfString:", v6);
  v12 = v11;

  while (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "replaceCharactersInRange:withString:", v10, v12, v7);
    objc_msgSend(v8, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "rangeOfString:", v6);
    v12 = v14;

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v8);

  return v15;
}

- (id)scrcStringByAddingAttribute:()SCRCMathExpression value:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "addAttribute:value:range:", v7, v6, 0, objc_msgSend(a1, "length"));

  return v8;
}

- (uint64_t)_scrcHasPauseCommaAtIndex:()SCRCMathExpression
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "characterAtIndex:", a3);

  if (v6 != 44)
    return 0;
  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("kSCRCMathStringAttributeSpeakLiteralCharacters"), a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

  return v8;
}

- (uint64_t)scrcContainsPause
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = result;
    if ((objc_msgSend(a1, "_scrcHasPauseCommaAtIndex:", 0) & 1) != 0)
    {
      return 1;
    }
    else
    {
      v4 = 1;
      do
      {
        v5 = v4;
        if (v3 == v4)
          break;
        v6 = objc_msgSend(a1, "_scrcHasPauseCommaAtIndex:", v4);
        v4 = v5 + 1;
      }
      while (!v6);
      return v5 < v3;
    }
  }
  return result;
}

@end
