@implementation CRMultiLocaleRecognizerConfiguration

- (CRMultiLocaleRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  CRMultiLocaleRecognizerConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSOrderedSet *languages;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v7 = -[CRRecognizerConfiguration initWithImageReaderOptions:error:](&v14, sel_initWithImageReaderOptions_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderLanguageKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderLanguageKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRRecognizerConfiguration, "supportedLanguagesForVersion:", -[CRRecognizerConfiguration revision](v7, "revision"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRRecognizerConfiguration languageSetFromInputLanguages:supportedLanguages:](CRRecognizerConfiguration, "languageSetFromInputLanguages:supportedLanguages:", v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      languages = v7->_languages;
      v7->_languages = (NSOrderedSet *)v11;

    }
  }

  return v7;
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v3 = -[CRRecognizerConfiguration initV2DefaultConfigWithOptions:](&v9, sel_initV2DefaultConfigWithOptions_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E40]);
    +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRRecognizerConfiguration, "supportedLanguagesForVersion:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithArray:", v5);
    v7 = (void *)v3[10];
    v3[10] = v6;

  }
  return v3;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v3 = -[CRRecognizerConfiguration initV3DefaultConfigWithOptions:](&v9, sel_initV3DefaultConfigWithOptions_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E40]);
    +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRRecognizerConfiguration, "supportedLanguagesForVersion:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithArray:", v5);
    v7 = (void *)v3[10];
    v3[10] = v6;

  }
  return v3;
}

- (id)textFeatureFilter
{
  void *v3;
  void *v4;
  CRTextFeaturesFilterV2 *v5;
  void *v6;
  CRTextFeaturesFilterV2 *v7;

  -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[CRRecognizerConfiguration revision](self, "revision") > 2)
    {
      v5 = [CRTextFeaturesFilterV2 alloc];
      -[CRMultiLocaleRecognizerConfiguration languages](self, "languages");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CRTextFeaturesFilterV2 initWithLocale:](v5, "initWithLocale:", v6);
      -[CRRecognizerConfiguration setCachedTextFeatureFilter:](self, "setCachedTextFeatureFilter:", v7);

    }
    else
    {
      v4 = (void *)objc_opt_new();
      -[CRRecognizerConfiguration setCachedTextFeatureFilter:](self, "setCachedTextFeatureFilter:", v4);
    }

  }
  return -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
}

- (NSOrderedSet)languages
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);
}

@end
