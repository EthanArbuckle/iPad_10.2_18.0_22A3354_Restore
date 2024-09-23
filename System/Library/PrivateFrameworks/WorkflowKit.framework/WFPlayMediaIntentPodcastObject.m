@implementation WFPlayMediaIntentPodcastObject

- (WFPlayMediaIntentPodcastObject)initWithIntent:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFPlayMediaIntentPodcastObject *v18;
  WFPlayMediaIntentPodcastObject *v19;
  objc_super v21;

  v5 = a3;
  objc_msgSend(v5, "mediaItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;

  }
  else
  {
    objc_msgSend(v5, "mediaContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v19 = 0;
      goto LABEL_11;
    }
  }
  v9 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectMatchingKey:value:", CFSTR("name"), CFSTR("storeCollectionId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "mediaContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(v8, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)WFPlayMediaIntentPodcastObject;
  self = -[WFiTunesPodcastObject initWithName:identifier:podcastUUID:feedURL:kind:](&v21, sel_initWithName_identifier_podcastUUID_feedURL_kind_, v16, v17, 0, 0, CFSTR("podcast"));

  if (!v15)
  if (self)
  {
    objc_storeStrong((id *)&self->_intent, a3);
    v18 = self;
  }

  v19 = self;
LABEL_11:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPlayMediaIntentPodcastObject;
  if (-[MTLModel isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    -[WFPlayMediaIntentPodcastObject intent](self, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFPlayMediaIntentPodcastObject;
  v3 = -[MTLModel hash](&v7, sel_hash);
  -[WFPlayMediaIntentPodcastObject intent](self, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (id)intentJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_645, &__block_literal_global_649);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __55__WFPlayMediaIntentPodcastObject_intentJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a2, "_JSONDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__WFPlayMediaIntentPodcastObject_intentJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CBDA70]);
  objc_msgSend(v3, "_updateWithJSONDictionary:", v2);

  return v3;
}

@end
