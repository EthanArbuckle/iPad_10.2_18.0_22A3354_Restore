@implementation SPMatcher

- (SPMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(unint64_t)a5
{
  id v7;
  id v8;
  SPMatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPMatcher;
  v9 = -[SPMatcher init](&v11, sel_init);
  if (v9)
    v9->_matcher = (void *)icu_word_matcher_create();

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  icu_ctx_release();
  v3.receiver = self;
  v3.super_class = (Class)SPMatcher;
  -[SPMatcher dealloc](&v3, sel_dealloc);
}

- (unint64_t)wordCount
{
  return icu_word_matcher_count();
}

- (BOOL)matches:(id)a3 outMatchBits:(unint64_t *)a4
{
  return icu_word_matcher_matches_string();
}

- (BOOL)matchesUTF8String:(const char *)a3 outMatchBits:(unint64_t *)a4
{
  return icu_word_matcher_matches();
}

- (BOOL)matches:(id)a3
{
  return icu_word_matcher_matches_string();
}

- (BOOL)matchesUTF8String:(const char *)a3
{
  return icu_word_matcher_matches();
}

+ (id)transcriptionForString:(id)a3 withLanguage:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BYTE v11[1024];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(v11, 0x400uLL);
  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "UTF8String");

  if (resolve_transcriptions_for_locale())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
