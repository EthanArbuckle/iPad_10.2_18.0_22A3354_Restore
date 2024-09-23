@implementation UILocalizedIndexedCollation

+ (UILocalizedIndexedCollation)collationWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return (UILocalizedIndexedCollation *)v5;
}

- (UILocalizedIndexedCollation)initWithDictionary:(id)a3
{
  id v5;
  UILocalizedIndexedCollation *v6;
  void *v7;
  uint64_t v8;
  NSLocale *locale;
  uint64_t v10;
  NSArray *sectionTitles;
  uint64_t v12;
  NSArray *sectionStartStrings;
  uint64_t v14;
  NSArray *sectionIndexTitles;
  uint64_t v16;
  NSArray *sectionIndexMapping;
  uint64_t v18;
  NSString *transform;
  uint64_t v20;
  NSString *firstSectionStartString;
  uint64_t v22;
  NSString *lastSectionStartString;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UILocalizedIndexedCollation;
  v6 = -[UILocalizedIndexedCollation init](&v29, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("UICollationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UILocalizedIndexedCollation.m"), 61, CFSTR("Missing locale identifier in collation dictionary"));

    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v7);
    locale = v6->_locale;
    v6->_locale = (NSLocale *)v8;

    objc_msgSend(v5, "objectForKey:", CFSTR("UISectionTitles"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionTitles = v6->_sectionTitles;
    v6->_sectionTitles = (NSArray *)v10;

    objc_msgSend(v5, "objectForKey:", CFSTR("UISectionStartStrings"));
    v12 = objc_claimAutoreleasedReturnValue();
    sectionStartStrings = v6->_sectionStartStrings;
    v6->_sectionStartStrings = (NSArray *)v12;

    objc_msgSend(v5, "objectForKey:", CFSTR("UIIndexTitles"));
    v14 = objc_claimAutoreleasedReturnValue();
    sectionIndexTitles = v6->_sectionIndexTitles;
    v6->_sectionIndexTitles = (NSArray *)v14;

    objc_msgSend(v5, "objectForKey:", CFSTR("UIIndexMapping"));
    v16 = objc_claimAutoreleasedReturnValue();
    sectionIndexMapping = v6->_sectionIndexMapping;
    v6->_sectionIndexMapping = (NSArray *)v16;

    objc_msgSend(v5, "objectForKey:", CFSTR("UITransform"));
    v18 = objc_claimAutoreleasedReturnValue();
    transform = v6->_transform;
    v6->_transform = (NSString *)v18;

    -[NSArray objectAtIndex:](v6->_sectionStartStrings, "objectAtIndex:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
    firstSectionStartString = v6->_firstSectionStartString;
    v6->_firstSectionStartString = (NSString *)v20;

    -[NSArray lastObject](v6->_sectionStartStrings, "lastObject");
    v22 = objc_claimAutoreleasedReturnValue();
    lastSectionStartString = v6->_lastSectionStartString;
    v6->_lastSectionStartString = (NSString *)v22;

    -[NSLocale languageCode](v6->_locale, "languageCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_primaryLanguageIsJapanese = objc_msgSend(v24, "isEqualToString:", CFSTR("ja"));

    if (v6->_primaryLanguageIsJapanese)
    {
      v6->_preferJapaneseRomajiTranscriptions = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:", &unk_1E1A94CA0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_preferJapaneseRomajiTranscriptions = objc_msgSend(v26, "isEqualToString:", CFSTR("ja"));

    }
  }

  return v6;
}

- (id)_kanaTranscriptionForString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "_firstGrapheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_containsJapaneseOnly");

  if (v6)
  {
    objc_msgSend(v4, "_stringByTranscribingUsingTokenizer:", -[UILocalizedIndexedCollation tokenizer](self, "tokenizer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transformedCollationStringForString:(id)a3
{
  __CFString *MutableCopy;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3 && self->_transform)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
    if (!CFStringTransform(MutableCopy, 0, (CFStringRef)self->_transform, 0))
    {
      CFRelease(MutableCopy);
LABEL_17:
      MutableCopy = (__CFString *)a3;
    }
  }
  else
  {
    if (!a3)
      goto LABEL_17;
    v6 = objc_msgSend(a3, "length");
    if (objc_msgSend(a3, "compare:options:range:locale:", self->_lastSectionStartString, 64, 0, v6, self->_locale) == -1
      && objc_msgSend(a3, "compare:options:range:locale:", self->_firstSectionStartString, 64, 0, v6, self->_locale) != -1)
    {
      goto LABEL_17;
    }
    if (!self->_primaryLanguageIsJapanese
      || (-[UILocalizedIndexedCollation _kanaTranscriptionForString:](self, "_kanaTranscriptionForString:", a3),
          (MutableCopy = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (self->_preferJapaneseRomajiTranscriptions)
      {
        -[UILocalizedIndexedCollation _kanaTranscriptionForString:](self, "_kanaTranscriptionForString:", a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
          v7 = a3;
        objc_msgSend(v7, "_stringByApplyingTransform:", *MEMORY[0x1E0C9B360]);
        MutableCopy = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!MutableCopy)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(a3, "_stringByApplyingTransform:", *MEMORY[0x1E0C9B360]);
        MutableCopy = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!MutableCopy)
          goto LABEL_17;
      }
    }
  }
  return MutableCopy;
}

- (__CFStringTokenizer)tokenizer
{
  __CFStringTokenizer *result;
  const __CFAllocator *v4;
  const __CFLocale *v5;
  CFRange v6;

  result = self->_tokenizer;
  if (!result)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ja"));
    v6.location = 0;
    v6.length = 0;
    result = CFStringTokenizerCreate(v4, 0, v6, 0, v5);
    self->_tokenizer = result;
  }
  return result;
}

+ (UILocalizedIndexedCollation)currentCollation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("UITableViewLocalizedSectionIndex"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v4);
  objc_msgSend(a1, "collationWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILocalizedIndexedCollation *)v6;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)UILocalizedIndexedCollation;
  -[UILocalizedIndexedCollation dealloc](&v4, sel_dealloc);
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (NSArray)sectionIndexTitles
{
  NSArray *sectionIndexTitles;

  sectionIndexTitles = self->_sectionIndexTitles;
  if (!sectionIndexTitles)
    sectionIndexTitles = self->_sectionTitles;
  return sectionIndexTitles;
}

- (NSInteger)sectionForSectionIndexTitleAtIndex:(NSInteger)indexTitleIndex
{
  NSInteger v3;
  NSArray *sectionIndexMapping;
  void *v5;

  v3 = indexTitleIndex;
  sectionIndexMapping = self->_sectionIndexMapping;
  if (sectionIndexMapping)
  {
    -[NSArray objectAtIndex:](sectionIndexMapping, "objectAtIndex:", indexTitleIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (int)objc_msgSend(v5, "intValue");

  }
  return v3;
}

- (NSInteger)sectionForObject:(id)object collationStringSelector:(SEL)selector
{
  NSArray *sectionStartStrings;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSInteger v12;
  uint64_t v13;

  sectionStartStrings = self->_sectionStartStrings;
  if (!sectionStartStrings)
    sectionStartStrings = self->_sectionTitles;
  ((void (*)(id, SEL))objc_msgSend(object, "methodForSelector:", selector))(object, selector);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILocalizedIndexedCollation transformedCollationStringForString:](self, "transformedCollationStringForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_14;
  v8 = -[NSArray count](sectionStartStrings, "count");
  if (v8 < 1)
    goto LABEL_14;
  v9 = v8;
  v10 = 0;
  do
  {
    v11 = v10 + v9;
    if (v10 + v9 < 0 != __OFADD__(v10, v9))
      ++v11;
    v12 = v11 >> 1;
    v13 = objc_msgSend(v7, "compare:options:range:locale:", -[NSArray objectAtIndex:](sectionStartStrings, "objectAtIndex:", v11 >> 1), 64, 0, objc_msgSend(v7, "length"), self->_locale);
    if (v13 == -1)
    {
      v9 = v12;
    }
    else
    {
      if (v13 != 1)
        goto LABEL_16;
      v10 = v12 + 1;
    }
  }
  while (v10 < v9);
  if (v10 <= 0)
LABEL_14:
    v10 = -[NSArray count](sectionStartStrings, "count");
  v12 = v10 - 1;
LABEL_16:

  return v12;
}

- (NSArray)sortedArrayFromArray:(NSArray *)array collationStringSelector:(SEL)selector
{
  _QWORD v5[2];

  v5[0] = self;
  v5[1] = selector;
  -[NSArray sortedArrayUsingFunction:context:](array, "sortedArrayUsingFunction:context:", localizedObjectSort, v5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionStartString, 0);
  objc_storeStrong((id *)&self->_firstSectionStartString, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_sectionIndexMapping, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_sectionStartStrings, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
