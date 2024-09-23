@implementation CMTextFilter

+ (id)filterHyperlinkField:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("HYPERLINK"));
  v6 = v5;
  if (v5)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteCharactersInRange:", v7, v6);
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v8, "length"));
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "oi_rangeOfCharactersFromSet:index:", v9, 0);
    v12 = v11;

    if (v12 && !v10)
      objc_msgSend(v8, "deleteCharactersInRange:", 0, v12);
    if ((unint64_t)objc_msgSend(v8, "length") < 2)
    {
      v6 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "oi_rangeOfCharactersFromSet:index:", v13, 0);
    v16 = v15;

    if (v16 && v10 == objc_msgSend(v8, "length") - v16)
      objc_msgSend(v8, "deleteCharactersInRange:", v14, v16);
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("\\l ")) & 1) != 0)
    {
      v17 = CFSTR("\\l ");
      v18 = 3;
    }
    else
    {
      if (!objc_msgSend(v8, "hasPrefix:", CFSTR("\\l")))
      {
LABEL_15:
        v6 = v8;
        goto LABEL_16;
      }
      v17 = CFSTR("\\l");
      v18 = 2;
    }
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v17, CFSTR("#"), 2, 0, v18);
    goto LABEL_15;
  }
LABEL_17:

  return v6;
}

+ (id)convertLineBreaksToParagraphBreaks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 2, 0, objc_msgSend(v4, "length"));

  return v4;
}

+ (id)convertToVericalString:(id)a3
{
  id v3;
  id v4;
  unsigned int i;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  for (i = 0; objc_msgSend(v3, "length") > (unint64_t)i; ++i)
  {
    v6 = objc_msgSend(v3, "characterAtIndex:", i);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterIsMember:", v6);

    if (v8)
      v9 = 160;
    else
      v9 = v6;
    objc_msgSend(v4, "appendFormat:", CFSTR("%C\r"), v9);
  }

  return v4;
}

- (CMTextFilter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMTextFilter;
  return -[CMTextFilter init](&v3, sel_init);
}

+ (id)covertFormatString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), &stru_24F3BFFF8, 2, 0, objc_msgSend(v3, "length"));

  return v4;
}

+ (id)filterSpecialCodes:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t i;
  int v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    for (i = 0; i < v5; ++i)
    {
      v7 = objc_msgSend(v4, "characterAtIndex:", i);
      if (v7 > 2027)
      {
        if (v7 != 2028)
        {
          if (v7 == 61607 || v7 == 61623)
          {
            objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, CFSTR("&bull;"));
            v5 += 5;
          }
          continue;
        }
      }
      else if ((v7 - 10) >= 5)
      {
        if (v7 == 9)
        {
          objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, CFSTR("<span style=\"padding-left:36;\">&#x200b;</span>"));
          v5 += 45;
        }
        continue;
      }
      objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, CFSTR("<br/>"));
      v5 += 4;
    }
  }

  return v4;
}

+ (id)filterToPreserveMultipleWhiteSpaces:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" &nbsp;"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), v5, 2, 0, objc_msgSend(v4, "length")));

  return v4;
}

@end
