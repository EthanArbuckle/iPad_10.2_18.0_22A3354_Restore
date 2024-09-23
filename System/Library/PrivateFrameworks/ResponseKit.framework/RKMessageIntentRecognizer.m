@implementation RKMessageIntentRecognizer

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__RKMessageIntentRecognizer_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, block);
  return (id)sharedManager_sharedMessageIntentManager;
}

void __42__RKMessageIntentRecognizer_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedMessageIntentManager;
  sharedManager_sharedMessageIntentManager = (uint64_t)v1;

}

- (RKMessageIntentRecognizer)init
{
  RKMessageIntentRecognizer *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKMessageIntentRecognizer;
  v2 = -[RKMessageIntentRecognizer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)_localeMessageIntentRecognizer;
    _localeMessageIntentRecognizer = (uint64_t)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RKMessageIntentRecognizer;
  -[RKMessageIntentRecognizer dealloc](&v2, sel_dealloc);
}

- (void)getMessageIntentRecognizer:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFDictionary *Mutable;
  __CFDictionary *v7;

  v3 = (__CFString *)a3;
  objc_msgSend((id)_localeMessageIntentRecognizer, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)_localeMessageIntentRecognizer, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v7 = Mutable;
    if (!v3)
      v3 = CFSTR("en");
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE6B280], v3);
    v5 = (void *)NLMessageIntentRecognizerCreate();
    CFRelease(v7);
    if (v5)
      objc_msgSend((id)_localeMessageIntentRecognizer, "setObject:forKeyedSubscript:", v5, v3);
  }

  return v5;
}

+ (id)getRangesOfKeywords:(id)a3 forMessage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v20 = (id)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_msgSend(v6, "substringFromIndex:", v9, v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "rangeOfString:", v12);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = v14;
          v17 = v15;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14 + v9, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v18);

          v9 += v17 + v16;
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v20;
}

- (id)copyAttributedTokensForMessage:(id)a3 conversationTurns:(id)a4 metadata:(id)a5 languageID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  const __CFAllocator *v14;
  __CFArray *Mutable;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  __CFString *v19;
  void *v20;
  const void *v21;
  void *v22;
  void *v23;
  CFAbsoluteTime Current;
  CFDateRef v25;
  const void *v26;
  const void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKMessageIntentRecognizer getMessageIntentRecognizer:](self, "getMessageIntentRecognizer:", v13);
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (v11)
  {
    v30 = v13;
    v31 = v12;
    v32 = v10;
    v16 = objc_msgSend(v11, "count");
    if (v16 >= 1)
    {
      v17 = v16;
      v18 = 0;
      v19 = &stru_24C6B9E08;
      while (1)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timestamp");

        objc_msgSend(v20, "text");
        objc_msgSend(v20, "senderId");

        v21 = (const void *)NLMessageConversationTurnCreate();
        CFArrayInsertValueAtIndex(Mutable, v18, v21);
        objc_msgSend(v20, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingString:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          break;
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v23);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v21)
          goto LABEL_6;
LABEL_7:

        if (v17 == ++v18)
          goto LABEL_14;
      }
      v19 = CFSTR(" ");
      if (!v21)
        goto LABEL_7;
LABEL_6:
      CFRelease(v21);
      goto LABEL_7;
    }
    v19 = &stru_24C6B9E08;
LABEL_14:

    v12 = v31;
    v10 = v32;
    v13 = v30;
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v25 = CFDateCreate(v14, Current);
    v26 = (const void *)NLMessageConversationTurnCreate();
    CFRelease(v25);
    CFArrayInsertValueAtIndex(Mutable, 0, v26);
    if (v26)
      CFRelease(v26);
  }
  v27 = (const void *)NLMessageConversationCreate();
  v28 = (void *)NLMessageIntentRecognizerCopyTopNIntentCandidates();
  if (v27)
    CFRelease(v27);
  if (Mutable)
    CFRelease(Mutable);

  return v28;
}

@end
