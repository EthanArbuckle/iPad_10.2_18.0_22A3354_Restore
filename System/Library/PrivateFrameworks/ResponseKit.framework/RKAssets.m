@implementation RKAssets

- (RKAssets)init
{
  RKAssets *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RKAssets;
  v2 = -[RKAssets init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)plistURL;
    plistURL = 0;

  }
  return v2;
}

- (RKAssets)initWithPlistURL:(id)a3
{
  id v5;
  RKAssets *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RKAssets;
  v6 = -[RKAssets init](&v8, sel_init);
  if (v6)
    objc_storeStrong((id *)&plistURL, a3);

  return v6;
}

+ (id)constantClasses
{
  return &unk_24C719400;
}

+ (id)categoryKeywordMap
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("categoryClassifiersByLanguageAndScript"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fixedPhrases
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fixedPhrasesByLanguageAndScript"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)momentsPhrases
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fullScreenMomentsKeywordsByLanguageAndScript"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)synonyms
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("synonymsByLanguageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sensitiveSubjectRegularExpressionPatterns
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sensitiveSubjectRegularExpressionPatternsByLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)polarTagKeywords
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("polarTagKeywordsByLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)contractedResponses
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contractedResponseByLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)alternativeInversions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("alternativeInversionsByLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedStrings
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("localizedStringsByLanguageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appreciationKeywords
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "constantClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("appreciationKeywordsByLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
