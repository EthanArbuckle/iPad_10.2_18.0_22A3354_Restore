@implementation PXSearchQueryMatchInfo

- (PXSearchQueryMatchInfo)initWithLocalizedQueryString:(id)a3 matchedSceneIdentifiers:(id)a4 personLocalIdentifiers:(id)a5 audioIdentifiers:(id)a6 humanActionIdentifiers:(id)a7 ocrTexts:(id)a8 ocrAssetUUIDS:(id)a9 queryEmbedding:(id)a10 countOfQueryTerms:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PXSearchQueryMatchInfo *v24;
  void *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *localizedQueryString;
  uint64_t v30;
  NSSet *sceneIdentifiers;
  uint64_t v32;
  NSSet *audioIdentifiers;
  uint64_t v34;
  NSSet *humanActionIdentifiers;
  uint64_t v36;
  NSSet *personLocalIdentifiers;
  uint64_t v38;
  NSArray *ocrAssetUUIDs;
  void *v40;
  void *v41;
  uint64_t v42;
  NSArray *ocrTexts;
  NSObject *p_super;
  uint64_t v45;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v47 = a8;
  v22 = a9;
  v23 = a10;
  v48.receiver = self;
  v48.super_class = (Class)PXSearchQueryMatchInfo;
  v24 = -[PXSearchQueryMatchInfo init](&v48, sel_init);
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v17, "copy");
    localizedQueryString = v24->_localizedQueryString;
    v24->_localizedQueryString = (NSString *)v28;

    v30 = objc_msgSend(v18, "copy");
    sceneIdentifiers = v24->_sceneIdentifiers;
    v24->_sceneIdentifiers = (NSSet *)v30;

    v32 = objc_msgSend(v20, "copy");
    audioIdentifiers = v24->_audioIdentifiers;
    v24->_audioIdentifiers = (NSSet *)v32;

    v34 = objc_msgSend(v21, "copy");
    humanActionIdentifiers = v24->_humanActionIdentifiers;
    v24->_humanActionIdentifiers = (NSSet *)v34;

    v36 = objc_msgSend(v19, "copy");
    personLocalIdentifiers = v24->_personLocalIdentifiers;
    v24->_personLocalIdentifiers = (NSSet *)v36;

    v38 = objc_msgSend(v22, "copy");
    ocrAssetUUIDs = v24->_ocrAssetUUIDs;
    v24->_ocrAssetUUIDs = (NSArray *)v38;

    objc_storeStrong((id *)&v24->_queryEmbedding, a10);
    v24->_countOfQueryTerms = a11;
    +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "overrideMatchedQueryText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v41, "length"))
    {
      v51[0] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v42 = objc_claimAutoreleasedReturnValue();
      ocrTexts = v24->_ocrTexts;
      v24->_ocrTexts = (NSArray *)v42;

      PLSearchUIQueryGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v41;
        _os_log_impl(&dword_1A6789000, p_super, OS_LOG_TYPE_DEFAULT, "⚠️ overrideMatchedQueryText is set. Using the overridden value (%@) instead of the matched query strings.", buf, 0xCu);
      }
    }
    else
    {
      v45 = objc_msgSend(v47, "copy");
      p_super = &v24->_ocrTexts->super;
      v24->_ocrTexts = (NSArray *)v45;
    }

  }
  return v24;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@\n"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("query: %@\n"), self->_localizedQueryString);
  objc_msgSend(v3, "appendFormat:", CFSTR("sceneIdentifiers: %@\n"), self->_sceneIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("personLocalIdentifiers: %@\n"), self->_personLocalIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("ocrTexts: %@\n"), self->_ocrTexts);
  objc_msgSend(v3, "appendFormat:", CFSTR("ocrAssetUUIDs: %@\n"), self->_ocrAssetUUIDs);
  objc_msgSend(v3, "appendFormat:", CFSTR("humanAction: %@\n"), self->_humanActionIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("audio: %@\n"), self->_audioIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("embedding: %@\n"), self->_queryEmbedding);
  objc_msgSend(v3, "appendFormat:", CFSTR("countOfQueryTerms: %ld\n"), self->_countOfQueryTerms);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSearchQueryMatchInfo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSearchQueryMatchInfo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)localizedQueryString
{
  return self->_localizedQueryString;
}

- (NSSet)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (NSSet)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (NSSet)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (NSArray)ocrTexts
{
  return self->_ocrTexts;
}

- (NSArray)ocrAssetUUIDs
{
  return self->_ocrAssetUUIDs;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (unint64_t)countOfQueryTerms
{
  return self->_countOfQueryTerms;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_ocrAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_ocrTexts, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_localizedQueryString, 0);
}

@end
