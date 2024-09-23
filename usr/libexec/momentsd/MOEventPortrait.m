@implementation MOEventPortrait

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_0 != -1)
    dispatch_once(&defineClassCollections_onceToken_0, &__block_literal_global_13);
}

void __41__MOEventPortrait_defineClassCollections__block_invoke(id a1)
{
  void *v1;

  v1 = (void *)kTopicIdNames;
  kTopicIdNames = (uint64_t)&off_1002DD230;

}

- (MOEventPortrait)init
{
  MOEventPortrait *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MOEventPortrait;
  v2 = -[MOEventPortrait init](&v4, "init");
  if (v2)
    +[MOEventPortrait defineClassCollections](MOEventPortrait, "defineClassCollections");
  return v2;
}

+ (id)displayNameOfScoredTopics:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  _QWORD v6[4];
  NSMutableDictionary *v7;

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke;
  v6[3] = &unk_1002ADA90;
  v4 = objc_opt_new(NSMutableDictionary);
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

void __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = (void *)kTopicIdNames;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)kTopicIdNames, "objectForKeyedSubscript:", v6));

    v6 = (id)v9;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *scoredTopics;
  id v4;
  id v5;

  scoredTopics = self->_scoredTopics;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", scoredTopics));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("scoredTopics"));

}

- (MOEventPortrait)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventPortrait *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSDictionary *scoredTopics;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOEventPortrait;
  v6 = -[MOEventPortrait init](&v12, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("scoredTopics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v8));
    scoredTopics = v6->_scoredTopics;
    v6->_scoredTopics = (NSDictionary *)v9;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventPortrait *v4;

  v4 = objc_alloc_init(MOEventPortrait);
  objc_storeStrong((id *)&v4->_scoredTopics, self->_scoredTopics);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventPortrait displayNameOfScoredTopics:](MOEventPortrait, "displayNameOfScoredTopics:", self->_scoredTopics));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("scoredTopics, %@"), v4);

  return v5;
}

- (NSDictionary)scoredTopics
{
  return self->_scoredTopics;
}

- (void)setScoredTopics:(id)a3
{
  objc_storeStrong((id *)&self->_scoredTopics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTopics, 0);
}

@end
