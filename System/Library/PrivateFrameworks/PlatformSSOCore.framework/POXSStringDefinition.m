@implementation POXSStringDefinition

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)sCharactersToConvert;
    sCharactersToConvert = v2;

    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 9, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 10, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 13, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 32, 55264);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 57344, 8190);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 0x10000, 0x100000);
    objc_msgSend((id)sCharactersToConvert, "invert");
    objc_msgSend((id)sCharactersToConvert, "addCharactersInString:", CFSTR("&<>"));
  }
}

- (id)valueFromString:(id)a3
{
  return a3;
}

- (id)_stringSuitableForHTML:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  UniChar *v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", sCharactersToConvert, 0, 0, v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (__CFString *)v3;
    goto LABEL_17;
  }
  v8 = v5;
  v9 = v6;
  v10 = (UniChar *)malloc_type_malloc(2 * v4 + 2, 0x1000040BDFB0063uLL);
  objc_msgSend(v3, "getCharacters:", v10);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = 0;
    while (1)
    {
      CFStringAppendCharacters(v7, &v10[v11], v8 - v11);
      v12 = objc_msgSend(v3, "characterAtIndex:", v8);
      if (v12 == 38)
        break;
      if (v12 == 62)
      {
        v13 = CFSTR("&gt;");
        goto LABEL_11;
      }
      if (v12 == 60)
      {
        v13 = CFSTR("&lt;");
LABEL_11:
        -[__CFString appendString:](v7, "appendString:", v13);
      }
      v11 = v9 + v8;
      v14 = v4 - (v9 + v8);
      v15 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", sCharactersToConvert, 0, v9 + v8, v14);
      if (!v14)
        goto LABEL_15;
      v8 = v15;
      v9 = v16;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CFStringAppendCharacters(v7, &v10[v11], v14);
        goto LABEL_15;
      }
    }
    v13 = CFSTR("&amp;");
    goto LABEL_11;
  }
LABEL_15:
  if (v10)
    free(v10);
LABEL_17:

  return v7;
}

@end
