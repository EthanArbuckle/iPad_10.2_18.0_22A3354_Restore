@implementation RKUtilities

+ (id)stripPunctuations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "punctuationCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "addCharactersInString:", CFSTR("‚„…‘’“”•–—˜›«¬¯±·»"));
  stripCharacterSet(v7, v6);
  objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  stripCharacterSet(v7, v8);

  return v7;
}

+ (id)removeMultipleWhitespaces:(id)a3
{
  id v3;
  void *v4;
  _QWORD block[5];
  _QWORD v7[5];
  id v8;

  v3 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6;
  v7[4] = __Block_byref_object_dispose__6;
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__RKUtilities_removeMultipleWhitespaces___block_invoke;
  block[3] = &unk_24C6AF080;
  block[4] = v7;
  if (removeMultipleWhitespaces__onceRegexToken != -1)
    dispatch_once(&removeMultipleWhitespaces__onceRegexToken, block);
  objc_msgSend((id)removeMultipleWhitespaces__regexMultipleWhitespaces, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v7, 8);

  return v4;
}

void __41__RKUtilities_removeMultipleWhitespaces___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\s+"), 1, &obj);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)removeMultipleWhitespaces__regexMultipleWhitespaces;
  removeMultipleWhitespaces__regexMultipleWhitespaces = v2;

}

+ (id)stripEmojiSkinTones:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stripEmojiSkinTones(v3);
  return v3;
}

+ (id)normalizeForPersonalization:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFAllocator *v20;
  __int16 v21;
  CFStringRef v22;
  UniChar chars;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringLowercase(v3, 0);
  v4 = v3;
  if (normalizeWhitespace_onceToken != -1)
    dispatch_once(&normalizeWhitespace_onceToken, &__block_literal_global_117);
  CFStringTrimWhitespace(v4);
  v5 = -[__CFString length](v4, "length");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = -[__CFString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", normalizeWhitespace_sWhitespaceCharacterSet, 4, 0, v6);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0)
        break;
      v10 = v7;
      v11 = v8;
      v12 = -[__CFString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", normalizeWhitespace_sNonWhitespaceCharacterSet, 4, 0, v7);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0)
        break;
      v6 = v12;
      -[__CFString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", v12 + v13, v10 + v11 - (v12 + v13), CFSTR(" "));
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  stripCharacterSet(v4, v15);

  v16 = v4;
  v17 = -[__CFString length](v16, "length");
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    do
    {
      chars = 0;
      v21 = -[__CFString characterAtIndex:](v16, "characterAtIndex:", v19);
      if ((unsigned __int16)(v21 + 255) <= 0x5Du)
      {
        chars = v21 + 288;
        v22 = CFStringCreateWithCharactersNoCopy(0, &chars, 1, v20);
        -[__CFString replaceCharactersInRange:withString:](v16, "replaceCharactersInRange:withString:", v19, 1, v22);
        CFRelease(v22);
      }
      ++v19;
    }
    while (v18 != v19);
  }

  stripDiacritics(v16);
  stripEmojiSkinTones(v16);
  return v16;
}

+ (id)stripDiacritics:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stripDiacritics(v3);
  return v3;
}

+ (BOOL)isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("ms"), CFSTR("ca"), CFSTR("id"), CFSTR("vi"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  return v6;
}

+ (BOOL)isLanguageSupportedForLemmatization:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("en"), CFSTR("es"), CFSTR("pt"), CFSTR("de"), CFSTR("it"), CFSTR("ru"), CFSTR("tr"), CFSTR("fr"), CFSTR("ar"), CFSTR("he"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)isLanguageSupportedForPartOfSpeech:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("en"), CFSTR("es"), CFSTR("pt"), CFSTR("de"), CFSTR("it"), CFSTR("ru"), CFSTR("tr"), CFSTR("fr"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)isLanguageSupportedBySmartPunctuation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("en"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)removeEmoji:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = (__CFString *)a3;
  if (CEMStringContainsEmoji())
  {
    CFStringGetLength(v3);
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__6;
    v18 = __Block_byref_object_dispose__6;
    v19 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9 = v3;
    CEMEnumerateEmojiTokensInStringWithBlock();
    v4 = v11[3];
    v5 = -[__CFString length](v9, "length");
    -[__CFString substringWithRange:](v9, "substringWithRange:", v4, v5 - v11[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15[5], "appendString:", v6);
    v7 = (__CFString *)(id)v15[5];

    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

void __27__RKUtilities_removeEmoji___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, a3 - v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v9);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
}

+ (BOOL)tokenInArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "containsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)prefixInArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)suffixInArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)getDeviceModel
{
  if (getDeviceModel_onceToken != -1)
    dispatch_once(&getDeviceModel_onceToken, &__block_literal_global_11);
  return (id)getDeviceModel_deviceModelName;
}

void __29__RKUtilities_getDeviceModel__block_invoke()
{
  __CFString *v0;
  __CFString *v1;

  v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = v1;
  else
    v0 = &stru_24C6B9E08;
  objc_storeStrong((id *)&getDeviceModel_deviceModelName, v0);

}

+ (BOOL)isDeviceSupportedForLSTMBasedLanguageIdentification:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (isDeviceSupportedForLSTMBasedLanguageIdentification__onceToken != -1)
    dispatch_once(&isDeviceSupportedForLSTMBasedLanguageIdentification__onceToken, &__block_literal_global_44);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)isDeviceSupportedForLSTMBasedLanguageIdentification__preH8;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

void __67__RKUtilities_isDeviceSupportedForLSTMBasedLanguageIdentification___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24C715EF0);
  v1 = (void *)isDeviceSupportedForLSTMBasedLanguageIdentification__preH8;
  isDeviceSupportedForLSTMBasedLanguageIdentification__preH8 = v0;

}

+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  _BYTE v6[19];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  uloc_addLikelySubtags();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  +[RKUtilities addLikelySubtagsForLocaleIdentifier:](RKUtilities, "addLikelySubtagsForLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBCB40];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB40]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!v6)
    {
      v15 = 0;
      goto LABEL_9;
    }
    v20 = v5;
    v21 = v6;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v21;
    v13 = &v20;
    v14 = 1;
  }
  else
  {
    v22[0] = v5;
    v22[1] = v7;
    v23[0] = v6;
    v23[1] = v8;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = (void **)v23;
    v13 = v22;
    v14 = 2;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v16 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "canonicalLanguageIdentifierFromString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)RKRepairStringNeeded:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  BOOL v5;
  const __CFString *v7;
  __CFString *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  UniChar v15;
  uint64_t v16;
  uint64_t v17;
  UniChar v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  CFRange v25;
  uint64_t v26;
  _OWORD v27[8];
  CFStringRef theString;
  const UniChar *v29;
  const char *v30;
  uint64_t v31;
  CFIndex v32;
  int64_t v33;
  int64_t v34;

  v3 = (__CFString *)a3;
  if (!-[__CFString length](v3, "length"))
    goto LABEL_5;
  v4 = -[__CFString fastestEncoding](v3, "fastestEncoding");
  v5 = 0;
  if (v4 != 1 && v4 != 4)
  {
    if (CFStringGetCStringPtr(v3, 4u))
    {
LABEL_5:
      v5 = 0;
      goto LABEL_6;
    }
    v7 = v3;
    v8 = (__CFString *)v7;
    if (v7)
    {
      memset(v27, 0, sizeof(v27));
      Length = CFStringGetLength(v7);
      theString = v8;
      v31 = 0;
      v32 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      v29 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      v33 = 0;
      v34 = 0;
      v30 = CStringPtr;
      if (Length >= 1)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v5 = 1;
        v16 = 64;
        while (1)
        {
          if ((unint64_t)v14 >= 4)
            v17 = 4;
          else
            v17 = v14;
          if (v32 <= v14)
          {
            if (v15 >> 10 == 54)
              goto LABEL_37;
            v18 = 0;
          }
          else
          {
            if (v29)
            {
              v18 = v29[v14 + v31];
            }
            else if (v30)
            {
              v18 = v30[v31 + v14];
            }
            else
            {
              if (v34 <= v14 || v13 > v14)
              {
                v20 = -v17;
                v21 = v17 + v12;
                v22 = v16 - v17;
                v23 = v14 + v20;
                v24 = v23 + 64;
                if (v23 + 64 >= v32)
                  v24 = v32;
                v33 = v23;
                v34 = v24;
                v25.location = v23 + v31;
                if (v32 >= v22)
                  v26 = v22;
                else
                  v26 = v32;
                v25.length = v26 + v21;
                CFStringGetCharacters(theString, v25, (UniChar *)v27);
                v13 = v33;
              }
              v18 = *((_WORD *)v27 + v14 - v13);
            }
            if ((v15 >> 10 == 54) != (v18 >> 10 == 55))
              goto LABEL_37;
          }
          v5 = ++v14 < Length;
          --v12;
          ++v16;
          v15 = v18;
          if (Length == v14)
            goto LABEL_37;
        }
      }
    }
    v5 = 0;
LABEL_37:

  }
LABEL_6:

  return v5;
}

@end
