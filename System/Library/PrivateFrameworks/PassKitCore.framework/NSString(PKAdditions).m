@implementation NSString(PKAdditions)

- (id)pk_uppercaseStringForPreferredLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uppercaseStringWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pk_decodeHexadecimal
{
  id v2;
  id v3;
  size_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  char v9;
  char __str[3];

  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v3 = objc_retainAutorelease(a1);
  v4 = strlen((const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4));
  __str[2] = 0;
  if (v4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = 1;
    do
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v6 - 1);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v6);
      v9 = 0;
      v9 = strtoul(__str, 0, 16);
      objc_msgSend(v2, "appendBytes:length:", &v9, 1);
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (id)pk_zString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", a1);
}

- (id)pk_lowercaseStringForPreferredLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowercaseStringWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pk_capitalizedStringForPreferredLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "capitalizedStringWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pk_uppercaseFirstStringForPreferredLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pk_uppercaseFirstStringForLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pk_uppercaseFirstStringForLocale:()PKAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(a1, "length") < 2)
  {
    objc_msgSend(a1, "uppercaseStringWithLocale:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v6 = v5;
    objc_msgSend(a1, "substringToIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseStringWithLocale:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "substringFromIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)pk_uppercaseAttributedString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(a1, "pk_uppercaseStringForPreferredLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (id)pk_attributedString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a1);
}

- (void)pk_normalizedLevenshteinDistanceFromString:()PKAdditions decimalPlaces:
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  size_t v11;
  size_t v12;

  v6 = objc_retainAutorelease(a1);
  v7 = a3;
  v8 = (const char *)objc_msgSend(v6, "UTF8String");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  if (v8)
  {
    v11 = strlen(v8);
    if (v10)
    {
LABEL_3:
      v12 = strlen(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (v10)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  if (v11 | v12)
  {
    LevenshteinDistance();
    __exp10((double)a4);
  }
}

- (id)pk_decodeURLBase64
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  return v4;
}

+ (uint64_t)pk_stringWithInteger:()PKAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
}

+ (id)pk_stringWithBCData:()PKAdditions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v3, "length"));
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
      objc_msgSend(v4, "appendFormat:", CFSTR("%.2x"), *(unsigned __int8 *)(v6 + v7++));
    while (v7 < objc_msgSend(v5, "length"));
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (id)pk_stringIfNotEmpty
{
  void *v2;

  if (objc_msgSend(a1, "length"))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)pk_merchantTokensSanitizedBillingAgreement
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "length") <= 0x1F4)
    v4 = objc_msgSend(v3, "length");
  else
    v4 = 500;
  objc_msgSend(v3, "substringToIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)pk_posixStringHasPeriod
{
  return objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)pk_posixStringDecimalPlaces
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 4);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return objc_msgSend(a1, "length") - (v2 + v3);
}

- (id)pk_posixStringWithMinimumDecimalPlaces:()PKAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a1;
  v5 = v4;
  if (a3 < 1)
    goto LABEL_7;
  if ((objc_msgSend(v4, "pk_posixStringHasPeriod") & 1) == 0)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("."));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = objc_msgSend(v5, "pk_posixStringDecimalPlaces");
  v8 = a3 - v7;
  if (a3 <= v7)
  {
LABEL_7:
    v9 = v5;
  }
  else
  {
    do
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("0"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v9;
      --v8;
    }
    while (v8);
  }
  return v9;
}

@end
