@implementation NSString(PhotosUIFoundation)

- (id)px_stringByApplyingCapitalization:()PhotosUIFoundation
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a1;
  v5 = v4;
  switch(a3)
  {
    case 3:
      v8 = objc_msgSend(v4, "px_firstLetterRange");
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v8;
        v11 = v9;
        v7 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v7, "substringWithRange:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedCapitalizedString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "replaceCharactersInRange:withString:", v10, v11, v13);

        goto LABEL_9;
      }
      break;
    case 2:
      objc_msgSend(v4, "localizedCapitalizedString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(v4, "localizedUppercaseString");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v6;
LABEL_9:

      v5 = v7;
      break;
  }
  return v5;
}

- (id)px_stringByTruncatingToLength:()PhotosUIFoundation addEllipsis:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a1;
  if (objc_msgSend(v6, "length") > a3)
  {
    objc_msgSend(v6, "substringToIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (a4)
      objc_msgSend(v8, "replaceCharactersInRange:withString:", a3 - 1, 1, CFSTR("…"));
    v9 = objc_msgSend(v8, "copy");

    v6 = (id)v9;
  }
  return v6;
}

- (uint64_t)px_rangeOfPrefixIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 137);
}

- (uint64_t)px_rangeOfSubstringIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 129);
}

- (BOOL)px_hasStringIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return objc_msgSend(a1, "px_rangeOfSubstringIgnoringCaseAndDiacritics:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)px_stringByDeletingCharactersInSet:()PhotosUIFoundation
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+PhotosUIFoundation.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characterSet"));

  }
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v7; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v6, "rangeOfCharacterFromSet:", v5))
      objc_msgSend(v6, "deleteCharactersInRange:", i, v8);
  }
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (id)px_stringByRepeating:()PhotosUIFoundation
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v5, "appendString:", a1);
      --a3;
    }
    while (a3);
  }
  return v5;
}

- (uint64_t)px_platformAgnosticHash
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  unsigned int v7;
  _WORD v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  v3 = v2;
  v4 = v9;
  if (v2 >= 97)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, ((unint64_t)v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    v5 = (unsigned __int16 *)&v12;
    v6 = (unsigned __int16 *)&v12;
LABEL_5:
    v4 = v9;
    do
    {
      v3 = 67503105 * v3 + 16974593 * *v4 + 66049 * v4[1] + 257 * v4[2] + v4[3];
      v4 += 4;
    }
    while (v4 < v6);
    goto LABEL_9;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  v5 = &v9[v2];
  if ((uint64_t)(v2 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    v6 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
LABEL_9:
  while (v4 < v5)
  {
    v7 = *v4++;
    v3 = 257 * v3 + v7;
  }
  return (v3 << (v2 & 0x1F)) + v3;
}

- (id)px_stringByIndentingNewLines
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\n\t"), 2, 0, objc_msgSend(a1, "length"));
  return v2;
}

- (uint64_t)px_firstLetterRange
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3010000000;
  v9 = &unk_244396D4B;
  v10 = xmmword_24438BBF0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__NSString_PhotosUIFoundation__px_firstLetterRange__block_invoke;
  v5[3] = &unk_2514CFD20;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 1027, v5);
  v3 = v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)px_integerValues
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap(v1, &__block_literal_global_3655);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)px_endsWithFullStopOrEquivalentPunctuationMark
{
  uint64_t result;

  if (px_endsWithFullStopOrEquivalentPunctuationMark_onceToken != -1)
    dispatch_once(&px_endsWithFullStopOrEquivalentPunctuationMark_onceToken, &__block_literal_global_29);
  result = objc_msgSend(a1, "length");
  if (result)
    return objc_msgSend((id)px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1));
  return result;
}

- (id)px_stringByAppendingDescriptionDetailsWithFormat:()PhotosUIFoundation
{
  __CFString *v10;
  void *v11;

  v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a3, &a9);
  objc_msgSend(a1, "px_stringByAppendingDescriptionDetails:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)px_stringByAppendingDescriptionDetails:()PhotosUIFoundation
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = objc_msgSend(a1, "rangeOfString:options:", CFSTR(">"), 12);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = objc_msgSend(v5, "length");
  objc_msgSend(v5, "insertString:atIndex:", v4, v6);

  return v5;
}

- (BOOL)px_hasExcessiveLineHeightCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "_excessiveLineHeightCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (uint64_t)px_roundedBoundingRectWithSize:()PhotosUIFoundation options:attributes:context:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (_excessiveLineHeightCharacterSet_onceToken != -1)
    dispatch_once(&_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_34);
  return (id)_excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;
}

@end
