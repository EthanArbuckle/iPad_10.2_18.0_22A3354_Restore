@implementation TPDictionaryMatchingRule

+ (id)fieldExists:(id)a3
{
  id v3;
  TPPBDictionaryMatchingRule *v4;
  TPPBDictionaryMatchingRuleFieldExists *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 5);
  v5 = objc_alloc_init(TPPBDictionaryMatchingRuleFieldExists);
  -[TPPBDictionaryMatchingRule setExists:](v4, "setExists:", v5);

  -[TPPBDictionaryMatchingRule exists](v4, "exists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFieldName:", v3);

  return v4;
}

+ (id)fieldMatch:(id)a3 fieldRegex:(id)a4
{
  id v5;
  id v6;
  TPPBDictionaryMatchingRule *v7;
  TPPBDictionaryMatchingRuleFieldRegexMatch *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v7, "setType:", 4);
  v8 = objc_alloc_init(TPPBDictionaryMatchingRuleFieldRegexMatch);
  -[TPPBDictionaryMatchingRule setMatch:](v7, "setMatch:", v8);

  -[TPPBDictionaryMatchingRule match](v7, "match");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFieldName:", v6);

  -[TPPBDictionaryMatchingRule match](v7, "match");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRegex:", v5);

  return v7;
}

+ (id)notMatch:(id)a3
{
  id v3;
  TPPBDictionaryMatchingRule *v4;

  v3 = a3;
  v4 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 3);
  -[TPPBDictionaryMatchingRule setNot:](v4, "setNot:", v3);

  return v4;
}

+ (id)andMatch:(id)a3
{
  id v3;
  TPPBDictionaryMatchingRule *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 1);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TPPBDictionaryMatchingRule setAnds:](v4, "setAnds:", v5);
  return v4;
}

+ (id)orMatch:(id)a3
{
  id v3;
  TPPBDictionaryMatchingRule *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TPPBDictionaryMatchingRule setOrs:](v4, "setOrs:", v5);
  return v4;
}

+ (id)trueMatch
{
  TPPBDictionaryMatchingRule *v2;

  v2 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v2, "setType:", 6);
  return v2;
}

+ (id)falseMatch
{
  TPPBDictionaryMatchingRule *v2;

  v2 = objc_alloc_init(TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v2, "setType:", 7);
  return v2;
}

@end
