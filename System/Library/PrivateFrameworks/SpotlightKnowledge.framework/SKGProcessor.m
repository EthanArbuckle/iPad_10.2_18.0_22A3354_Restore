@implementation SKGProcessor

+ (id)sharedProcessor
{
  if (sharedProcessor_onceToken != -1)
    dispatch_once(&sharedProcessor_onceToken, &__block_literal_global);
  return (id)sharedProcessor_gProcessor;
}

void __31__SKGProcessor_sharedProcessor__block_invoke()
{
  SKGProcessor *v0;
  uint64_t v1;
  void *v2;

  v0 = [SKGProcessor alloc];
  v1 = -[SKGProcessor initWithOptions:](v0, "initWithOptions:", MEMORY[0x24BDBD1B8]);
  v2 = (void *)sharedProcessor_gProcessor;
  sharedProcessor_gProcessor = v1;

}

- (SKGProcessor)initWithOptions:(id)a3
{
  SKGProcessor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKGProcessor;
  v3 = -[SKGProcessor init](&v7, sel_init, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.SpotlightKnowledge.processor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)queue
{
  return self->_queue;
}

- (BOOL)recordIsValid:(id)a3
{
  return getValueForKey((CFDictionaryRef)a3, CFSTR("_kMDItemUserActivityType")) == 0;
}

- (id)copyReferenceIdentifierFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  uint64_t v7;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemExternalID"), (const void **)&value))
    goto LABEL_10;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_10;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
LABEL_9:
      v5 = (void *)v7;
      goto LABEL_11;
    }
    if (v6 == CFNumberGetTypeID())
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), v5);
      goto LABEL_9;
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)copyBundleIdentifierFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemBundleID"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyFileProviderIDFromRecord:(id)a3
{
  return -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", a3, CFSTR("kMDItemFileProviderID"));
}

- (id)copyPersonaFromRecord:(id)a3
{
  return CFSTR("1");
}

- (id)copyEmbeddingVersionFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemEmbeddingVersion"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyEmbeddingModelVersionFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemMediaEmbeddingVersion"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyKeyphraseVersionFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemKeyphraseVersion"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyPeopleVersionFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemKnowledgeIndexVersion"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyProtectionClassFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  const __CFString *v7;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemProtectionClass"), (const void **)&value)
    || (v5 = value, value == (void *)*MEMORY[0x24BDBD430])
    || !value)
  {
    v7 = CFSTR("Default");
    goto LABEL_9;
  }
  v6 = CFGetTypeID(value);
  if (v6 != CFStringGetTypeID())
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
LABEL_9:

  return (id)v7;
}

- (id)copyLanguageFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemTextContentLanguage"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyTextContentFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemTextContent"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDescriptionContentFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemDescription"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyContentURLFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemContentURL"), (const void **)&value))
    goto LABEL_9;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_9;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);

      goto LABEL_10;
    }
    if (v6 == CFURLGetTypeID())
    {
      v5 = (void *)objc_msgSend(v5, "copy");
      goto LABEL_10;
    }
LABEL_9:
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)copyContentTypeFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemContentType"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copySnippetFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("_kMDItemSnippet"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyStringValueFromRecord:(id)a3 key:(id)a4
{
  const __CFDictionary *v5;
  id v6;
  void *ValueForKey;
  void *v8;
  CFTypeID v9;
  id v10;
  void *v11;

  v5 = (const __CFDictionary *)a3;
  v6 = a4;
  if (!v5)
    goto LABEL_7;
  ValueForKey = getValueForKey(v5, v6);
  v8 = ValueForKey;
  if (ValueForKey)
  {
    v9 = CFGetTypeID(ValueForKey);
    if (v9 == CFStringGetTypeID())
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v8);
      goto LABEL_8;
    }
    if (v9 == CFURLGetTypeID())
    {
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v8, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "initWithString:", v11);

      goto LABEL_8;
    }
LABEL_7:
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)copyNumberValueFromRecord:(id)a3 key:(id)a4
{
  const __CFDictionary *v5;
  id v6;
  void *ValueForKey;
  void *v8;
  CFTypeID v9;
  uint64_t v10;

  v5 = (const __CFDictionary *)a3;
  v6 = a4;
  if (!v5)
    goto LABEL_8;
  ValueForKey = getValueForKey(v5, v6);
  v8 = ValueForKey;
  if (ValueForKey)
  {
    v9 = CFGetTypeID(ValueForKey);
    if (v9 == CFNumberGetTypeID())
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v8, "intValue"));
LABEL_7:
      v8 = (void *)v10;
      goto LABEL_9;
    }
    if (v9 == CFBooleanGetTypeID())
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", CFBooleanGetValue((CFBooleanRef)v8) != 0);
      goto LABEL_7;
    }
LABEL_8:
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)copyTitleFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  int ValueIfPresent;
  void **v6;
  const void *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_13;
  value = 0;
  ValueIfPresent = CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemSubject"), (const void **)&value);
  v6 = (void **)MEMORY[0x24BDBD430];
  if (ValueIfPresent)
  {
    v7 = value;
    if (value != (void *)*MEMORY[0x24BDBD430])
    {
      if (value)
        goto LABEL_11;
    }
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(v4, CFSTR("kMDItemTitle"), (const void **)&value))
  {
    v7 = value;
    if (value != *v6)
    {
      if (value)
        goto LABEL_11;
    }
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v4, CFSTR("kMDItemDisplayName"), (const void **)&value))
    goto LABEL_13;
  v7 = value;
  if (value == *v6)
    goto LABEL_13;
  if (value)
  {
LABEL_11:
    v8 = CFGetTypeID(v7);
    if (v8 == CFStringGetTypeID())
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v7);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
      v7 = (const void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
LABEL_13:
    v7 = 0;
  }
LABEL_14:

  return (id)v7;
}

- (id)copyAuthorFromRecord:(id)a3
{
  __CFArray *v3;
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v3 = copyArrayValueForKey((const __CFDictionary *)a3, CFSTR("kMDItemAuthors"));
  if (-[__CFArray count](v3, "count"))
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[__CFArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dateFromRecord:(id)a3 key:(id)a4
{
  const __CFDictionary *v5;
  id v6;
  void *ValueForKey;
  id v8;
  CFTypeID v9;

  v5 = (const __CFDictionary *)a3;
  v6 = a4;
  if (!v5)
    goto LABEL_5;
  ValueForKey = getValueForKey(v5, v6);
  v8 = ValueForKey;
  if (ValueForKey)
  {
    v9 = CFGetTypeID(ValueForKey);
    if (v9 == CFDateGetTypeID())
    {
      v8 = v8;
      goto LABEL_6;
    }
LABEL_5:
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (id)copyFilePathFromRecord:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemPath"), (const void **)&value))
    goto LABEL_7;
  v5 = value;
  if (value == (void *)*MEMORY[0x24BDBD430])
    goto LABEL_7;
  if (value)
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (BOOL)recordIsRecent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 dateKeys:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  v26 = a5;
  v14 = 0;
  v15 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v11);
      -[SKGProcessor dateFromRecord:key:](self, "dateFromRecord:key:", v10, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14 || objc_msgSend(v14, "compare:", v17) == -1)
      {
        v18 = v17;

        v14 = v18;
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v13);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "components:fromDate:toDate:options:", 8, v14, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (a4 == 4)
      {
        v23 = objc_msgSend(v21, "year");
        v22 = v26;
      }
      else
      {
        v22 = v26;
        if (a4 == 16)
          v23 = objc_msgSend(v21, "day");
        else
          v23 = objc_msgSend(v21, "month");
      }
      v24 = v23 <= v22;

    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
LABEL_16:
    v24 = 1;
  }

  return v24;
}

- (BOOL)recordIsCurrent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 checkFuture:(BOOL)a6 dateKeys:(id)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  double v23;
  double Current;
  BOOL v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {
    v16 = 0;
    goto LABEL_21;
  }
  v14 = v13;
  v37 = a6;
  v38 = a4;
  v36 = a5;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v41 != v17)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
      -[SKGProcessor dateFromRecord:key:](self, "dateFromRecord:key:", v12, v19, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(&unk_251904D08, "containsObject:", v19))
      {
        v21 = v20;

        v15 = v21;
      }
      if (!v16 || objc_msgSend(v16, "compare:", v20) == -1)
      {
        v22 = v20;

        v16 = v22;
      }

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v14);
  if (!v15)
  {
    v26 = v38;
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = v38;
      v31 = v16;
      v32 = v28;
LABEL_24:
      objc_msgSend(v29, "components:fromDate:toDate:options:", v30, v31, v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (v26 == 4)
        {
          v34 = objc_msgSend(v33, "year");
        }
        else if (v26 == 16)
        {
          v34 = objc_msgSend(v33, "day");
        }
        else
        {
          v34 = objc_msgSend(v33, "month");
        }
        v25 = v34 <= v36;

        goto LABEL_32;
      }
LABEL_28:
      v25 = 0;
      goto LABEL_32;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_28;
  }
  v23 = MEMORY[0x2495855D8](v15);
  Current = CFAbsoluteTimeGetCurrent();
  v25 = v23 < Current && !v37;
  v26 = v38;
  if (v37 && v23 >= Current)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    v30 = v38;
    v31 = v28;
    v32 = v15;
    goto LABEL_24;
  }
LABEL_32:

  return v25;
}

- (BOOL)recordHasTextContent:(id)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID v5;
  BOOL v6;
  void *value;

  v3 = (const __CFDictionary *)a3;
  v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, CFSTR("kMDItemTextContent"), (const void **)&value))
    && value != (void *)*MEMORY[0x24BDBD430]
    && value)
  {
    v5 = CFGetTypeID(value);
    v6 = v5 == CFStringGetTypeID();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)recordContainsValue:(id)a3 key:(id)a4
{
  return a3 && getValueForKey((CFDictionaryRef)a3, a4) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)needsPriorityForRecord:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SKGProcessor copyBundleIdentifierFromRecord:](self, "copyBundleIdentifierFromRecord:", v6);
  v10 = v9;
  if (SKGBundleIsMail(v9))
    v11 = &unk_251904D20;
  else
    v11 = &unk_251904D38;
  v12 = -[SKGProcessor recordIsCurrent:toCalendarUnit:maxOffset:checkFuture:dateKeys:](self, "recordIsCurrent:toCalendarUnit:maxOffset:checkFuture:dateKeys:", v6, 16, 1, 0, v11);
  v13 = v12 | -[SKGProcessor recordIsCurrent:toCalendarUnit:maxOffset:checkFuture:dateKeys:](self, "recordIsCurrent:toCalendarUnit:maxOffset:checkFuture:dateKeys:", v6, 8, 1, 1, &unk_251904D50);

  return v13;
}

+ (id)embeddingVersionDataWithVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("SPOTLIGHT_CURRENT_MODEL_EMBEDDING_VERSION");
  v9[1] = CFSTR("SPOTLIGHT_CURRENT_EMBEDDING_VERSION");
  v10[0] = a3;
  v10[1] = &unk_251904E70;
  v9[2] = CFSTR("SPOTLIGHT_CURRENT_RELEASE_VERSION");
  v10[2] = &unk_251904E88;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)extractContentFromRecordForMail:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6
{
  id v10;
  id v11;
  const char *v12;
  id v13;
  unint64_t v14;
  BOOL v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;

  v10 = a3;
  v11 = a4;
  if ((SKGBundleIsMail(v11) & 1) != 0 || SKGBundleIsPommesCtl(v11, v12))
  {
    v13 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v10, CFSTR("_kMDItemTextContentEmbedCheckLen"));
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (a5 || v14 <= 9)
    {
      if (a5 || !v14)
      {
        v16 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v10);
        if (!v16)
          v16 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v10);
        v14 = stringComposedLengthForEmbeddingCheck(v16);
      }
      else
      {
        v16 = 0;
      }
      v17 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v10);
      v18 = -[SKGProcessor copyAuthorFromRecord:](self, "copyAuthorFromRecord:", v10);
      v19 = stringComposedLengthForEmbeddingCheck(v17);
      v20 = v19 + v14 + stringComposedLengthForEmbeddingCheck(v18);
      v15 = v20 > 9;
      if (v20 >= 0xA)
      {
        if (a5)
        {
          v21 = &stru_251903660;
          if (v17)
            v22 = v17;
          else
            v22 = &stru_251903660;
          if (v18)
            v23 = v18;
          else
            v23 = &stru_251903660;
          if (v16)
            v21 = v16;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v22, v23, v21);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a6)
          *a6 = 2;
      }

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)extractContentFromRecordForSafari:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6
{
  id v10;
  const char *v11;
  __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  id *v40;
  void *v41;
  unint64_t *v42;

  v10 = a3;
  if (SKGBundleIsSafari(a4, v11))
  {
    v12 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v10);
    v13 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("redirectSourceTitle"));
    v41 = v13;
    v42 = a6;
    v40 = a5;
    if (v13)
    {
      if (v12)
      {
        v14 = v13;
        if ((objc_msgSend(v13, "isEqualToString:", v12) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v14, v12);
          v15 = objc_claimAutoreleasedReturnValue();

          v12 = (__CFString *)v15;
        }
      }
    }
    v16 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("kMDItemContentURL"));
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "percentEncodedPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(" "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v17, "host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v21, v19);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    v24 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("redirectSourceURL"));
    if (objc_msgSend(v24, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "percentEncodedPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(" "));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v25, "host");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ %@"), v29, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 && v22 && (objc_msgSend(v30, "isEqualToString:", v22) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v30, v22);
        v31 = objc_claimAutoreleasedReturnValue();

        v22 = (__CFString *)v31;
      }

    }
    v32 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("kMDItemDescription"));
    v33 = stringComposedLengthForEmbeddingCheck(v12);
    v34 = stringComposedLengthForEmbeddingCheck(v22) + v33;
    v35 = v34 + stringComposedLengthForEmbeddingCheck(v32);
    v23 = v35 > 9;
    if (v35 >= 0xA)
    {
      if (v40)
      {
        v36 = &stru_251903660;
        if (v12)
          v37 = v12;
        else
          v37 = &stru_251903660;
        if (v22)
          v38 = v22;
        else
          v38 = &stru_251903660;
        if (v32)
          v36 = v32;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v37, v38, v36);
        *v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v42)
        *v42 = 1;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)extractContentFromRecordForCalendar:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6
{
  id v10;
  const char *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;

  v10 = a3;
  if (SKGBundleIsCalendar(a4, v11))
  {
    v12 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v10);
    v13 = -[SKGProcessor copyAuthorFromRecord:](self, "copyAuthorFromRecord:", v10);
    v14 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("kMDItemNamedLocation"));
    v15 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v10, CFSTR("kMDItemComment"));
    v16 = stringComposedLengthForEmbeddingCheck(v12);
    v17 = stringComposedLengthForEmbeddingCheck(v13) + v16;
    v18 = v17 + stringComposedLengthForEmbeddingCheck(v14);
    v19 = v18 + stringComposedLengthForEmbeddingCheck(v15);
    v20 = v19 > 9;
    if (v19 >= 0xA)
    {
      if (a5)
      {
        v21 = &stru_251903660;
        if (v12)
          v22 = v12;
        else
          v22 = &stru_251903660;
        if (v13)
          v23 = v13;
        else
          v23 = &stru_251903660;
        if (v14)
          v24 = v14;
        else
          v24 = &stru_251903660;
        if (v15)
          v21 = v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v22, v23, v24, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a6)
        *a6 = 1;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)extractContentFromRecordForMessages:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6
{
  id v10;
  const char *v11;
  id v12;
  unint64_t v13;
  BOOL v14;
  id v15;

  v10 = a3;
  if (SKGBundleIsMessages(a4, v11))
  {
    v12 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v10, CFSTR("_kMDItemTextContentEmbedCheckLen"));
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (a5 || v13 <= 9)
    {
      if (a5 || !v13)
      {
        v15 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v10);
        if (!v15)
          v15 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v10);
        v13 = stringComposedLengthForEmbeddingCheck(v15);
      }
      else
      {
        v15 = 0;
      }
      v14 = v13 > 9;
      if (v13 >= 0xA)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v15);
        if (a6)
          *a6 = 1;
      }

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)extractContentFromRecord:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  const char *v16;
  BOOL v17;
  BOOL v18;
  const char *v20;
  const char *v21;
  id v22;
  unint64_t v23;
  __CFString *v24;
  __CFString *v25;
  unint64_t v26;
  const __CFString *v27;
  const __CFString *v28;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = -[SKGProcessor copyBundleIdentifierFromRecord:](self, "copyBundleIdentifierFromRecord:", v10);
  v14 = v13;
  if ((SKGBundleIsMail(v13) & 1) != 0 || SKGBundleIsPommesCtl(v14, v15))
  {
    v17 = -[SKGProcessor extractContentFromRecordForMail:bundleID:content:maxChunkCountPtr:](self, "extractContentFromRecordForMail:bundleID:content:maxChunkCountPtr:", v10, v14, a5, a6);
LABEL_7:
    v18 = v17;
    goto LABEL_8;
  }
  if (SKGBundleIsSafari(v14, v16))
  {
    v17 = -[SKGProcessor extractContentFromRecordForSafari:bundleID:content:maxChunkCountPtr:](self, "extractContentFromRecordForSafari:bundleID:content:maxChunkCountPtr:", v10, v14, a5, a6);
    goto LABEL_7;
  }
  if (SKGBundleIsCalendar(v14, v20))
  {
    v17 = -[SKGProcessor extractContentFromRecordForCalendar:bundleID:content:maxChunkCountPtr:](self, "extractContentFromRecordForCalendar:bundleID:content:maxChunkCountPtr:", v10, v14, a5, a6);
    goto LABEL_7;
  }
  if (SKGBundleIsMessages(v14, v21))
  {
    v17 = -[SKGProcessor extractContentFromRecordForMessages:bundleID:content:maxChunkCountPtr:](self, "extractContentFromRecordForMessages:bundleID:content:maxChunkCountPtr:", v10, v14, a5, a6);
    goto LABEL_7;
  }
  v22 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v10, CFSTR("_kMDItemTextContentEmbedCheckLen"));
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  if (a5 || v23 <= 9)
  {
    if (a5 || !v23)
    {
      v24 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v10);
      if (!v24)
      {
        v24 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v10);
        if (!v24)
          v24 = -[SKGProcessor copyDescriptionContentFromRecord:](self, "copyDescriptionContentFromRecord:", v10);
      }
      v23 = stringComposedLengthForEmbeddingCheck(v24);
    }
    else
    {
      v24 = 0;
    }
    v25 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v10);
    v26 = stringComposedLengthForEmbeddingCheck(v25) + v23;
    v18 = v26 > 9;
    if (v26 >= 0xA)
    {
      if (a5)
      {
        v27 = &stru_251903660;
        if (v25)
          v28 = v25;
        else
          v28 = &stru_251903660;
        if (v24)
          v27 = v24;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v28, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a6)
        *a6 = 2;
    }

  }
  else
  {
    v18 = 1;
  }
LABEL_8:

  return v18;
}

- (BOOL)needsEmbeddingsForRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB00C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceSupportsEmbedding");

  if (v6)
  {
    if (objc_msgSend(v4, "count"))
    {
      +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "recordIsValid:", v4);

      if (v6)
      {
        v8 = -[SKGProcessor copyEmbeddingVersionFromRecord:](self, "copyEmbeddingVersionFromRecord:", v4);
        v9 = -[SKGProcessor copyEmbeddingModelVersionFromRecord:](self, "copyEmbeddingModelVersionFromRecord:", v4);
        if (v8)
        {
          v10 = objc_msgSend(v8, "intValue");
          +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          if (objc_msgSend(v11, "embeddingVersion") == v10 && v9)
          {
            v13 = objc_msgSend(v9, "intValue");
            +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v14, "embeddingModelVersion") == v13;

          }
        }
        else
        {
          v12 = 0;
        }
        LOBYTE(v6) = !v12;

      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (BOOL)canGenerateEmbeddingsForRecord:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  const char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  const __CFString *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  unint64_t v30;

  v6 = a3;
  v7 = a4;
  if (SKGBundleIsMail(v7))
  {
    v9 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v6);

    v10 = -[SKGProcessor copyAuthorFromRecord:](self, "copyAuthorFromRecord:", v6);
    v11 = v9 | v10;

    v12 = v11 != 0;
    goto LABEL_22;
  }
  if (SKGBundleIsSafari(v7, v8))
  {
    v14 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v6, CFSTR("redirectSourceTitle"));

    v15 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v6, CFSTR("kMDItemContentURL"));
    v16 = v14 | v15;

    v17 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v6, CFSTR("redirectSourceURL"));
    v18 = CFSTR("kMDItemDescription");
    goto LABEL_7;
  }
  if (!SKGBundleIsCalendar(v7, v13))
  {
    v22 = -[SKGProcessor copyFileProviderIDFromRecord:](self, "copyFileProviderIDFromRecord:", v6);
    if (v22)
    {
      v23 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemRequiresImport"));
      v24 = (unint64_t)v23;
      if (v23)
        v12 = objc_msgSend(v23, "BOOLValue");
      else
        v12 = 0;
    }
    else
    {
      v25 = -[SKGProcessor copyDescriptionContentFromRecord:](self, "copyDescriptionContentFromRecord:", v6);

      if (objc_msgSend(v7, "containsString:", CFSTR("com.apple")) && v25)
      {
        v12 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v26 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemTextContentIndexExists"));
      v27 = objc_msgSend(v26, "BOOLValue");

      v28 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemTextContentEmbedCheckLen"));
      v29 = objc_msgSend(v28, "unsignedIntegerValue");

      v12 = 1;
      if ((v27 & 1) != 0 || v29)
        goto LABEL_21;
      v24 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v6);
      v30 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v6);
      v12 = (v24 | v30) != 0;

    }
    goto LABEL_21;
  }
  v19 = -[SKGProcessor copyTitleFromRecord:](self, "copyTitleFromRecord:", v6);

  v20 = -[SKGProcessor copyAuthorFromRecord:](self, "copyAuthorFromRecord:", v6);
  v16 = v19 | v20;

  v17 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v6, CFSTR("kMDItemNamedLocation"));
  v18 = CFSTR("kMDItemComment");
LABEL_7:
  v21 = -[SKGProcessor copyStringValueFromRecord:key:](self, "copyStringValueFromRecord:key:", v6, v18);

  if (v16)
    v12 = 1;
  else
    v12 = (v17 | v21) != 0;
LABEL_22:

  return v12;
}

- (BOOL)shouldGenerateEmbeddingsForRecord:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  id v17;
  void *v18;
  id v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SKGProcessor copyBundleIdentifierFromRecord:](self, "copyBundleIdentifierFromRecord:", v6);
  v10 = v9;
  +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "embeddingExcludeBundles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v10);

  if ((v13 & 1) != 0
    || !-[SKGProcessor canGenerateEmbeddingsForRecord:bundleIdentifier:](self, "canGenerateEmbeddingsForRecord:bundleIdentifier:", v6, v10))
  {
    v15 = 0;
  }
  else
  {
    v14 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemTextContentIndexExists"));
    if (v14
      || (v14 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v6)) != 0
      || (v14 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v6)) != 0)
    {

    }
    else
    {
      v17 = -[SKGProcessor copyFileProviderIDFromRecord:](self, "copyFileProviderIDFromRecord:", v6);
      if (v17)
      {
        v18 = v17;
        v19 = -[SKGProcessor copyContentURLFromRecord:](self, "copyContentURLFromRecord:", v6);
        v20 = objc_msgSend(v19, "isFileURL");

        if ((v20 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_12;
        }
      }
    }
    v15 = -[SKGProcessor extractContentFromRecord:bundleID:content:maxChunkCountPtr:](self, "extractContentFromRecord:bundleID:content:maxChunkCountPtr:", v6, v10, 0, 0);
  }
LABEL_12:

  return v15;
}

- (BOOL)shouldGenerateEmbeddingsForPastRecord:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SKGProcessor copyBundleIdentifierFromRecord:](self, "copyBundleIdentifierFromRecord:", v6);
  v10 = v9;
  v11 = -[SKGProcessor copyContentTypeFromRecord:](self, "copyContentTypeFromRecord:", v6);
  if (!v11)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v12 = v11;
  v13 = (void *)MEMORY[0x24BDF8238];
  v14 = -[SKGProcessor copyContentTypeFromRecord:](self, "copyContentTypeFromRecord:", v6);
  objc_msgSend(v13, "typeWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v15, "conformsToType:", *MEMORY[0x24BDF84B8]) & 1) != 0
    || (objc_msgSend(v15, "conformsToType:", *MEMORY[0x24BDF8640]) & 1) != 0)
  {
    objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
    v16 = 1;
    goto LABEL_14;
  }
  v17 = objc_msgSend(v15, "conformsToType:", *MEMORY[0x24BDF8410]);
LABEL_11:
  v16 = 1;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0 && (v17 & 1) == 0)
    v16 = -[SKGProcessor recordIsRecent:toCalendarUnit:maxOffset:dateKeys:](self, "recordIsRecent:toCalendarUnit:maxOffset:dateKeys:", v6, 8, 12, &unk_251904E28);
LABEL_14:

  return v16;
}

- (BOOL)needsKeyphrasesForRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "count")
    && (+[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "recordIsValid:", v4),
        v5,
        v6))
  {
    v7 = -[SKGProcessor copyKeyphraseVersionFromRecord:](self, "copyKeyphraseVersionFromRecord:", v4);
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "intValue");
      +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "keyphraseVersion") != v9;

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldGenerateKeyphrasesForRecord:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v22;
  BOOL v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SKGProcessor copyBundleIdentifierFromRecord:](self, "copyBundleIdentifierFromRecord:", v6);
  v10 = v9;
  +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyphraseExcludeBundles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v10);

  if ((v13 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v15 = -[SKGProcessor copyFileProviderIDFromRecord:](self, "copyFileProviderIDFromRecord:", v6);

    if (v15)
    {
      v16 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemRequiresImport"));
      v17 = -[SKGProcessor copyContentTypeFromRecord:](self, "copyContentTypeFromRecord:", v6);
      v18 = v17;
      v14 = v16
         && v17
         && objc_msgSend(v16, "BOOLValue")
         && !objc_msgSend(v18, "isEqualToString:", CFSTR("public.folder"));

    }
    else
    {
      v19 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemTextContentEmbedCheckLen"));
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      if (v20)
      {
        v14 = 1;
        goto LABEL_16;
      }
      v22 = -[SKGProcessor copyNumberValueFromRecord:key:](self, "copyNumberValueFromRecord:key:", v6, CFSTR("_kMDItemTextContentIndexExists"));
      v16 = v22;
      if (v22 && objc_msgSend(v22, "intValue"))
      {
        v23 = 0;
      }
      else
      {
        v24 = -[SKGProcessor copySnippetFromRecord:](self, "copySnippetFromRecord:", v6);
        if (v24)
        {
          v23 = 0;
        }
        else
        {
          v25 = -[SKGProcessor copyTextContentFromRecord:](self, "copyTextContentFromRecord:", v6);
          v23 = v25 == 0;

        }
      }
      v14 = !v23;
    }

  }
LABEL_16:

  return v14;
}

@end
