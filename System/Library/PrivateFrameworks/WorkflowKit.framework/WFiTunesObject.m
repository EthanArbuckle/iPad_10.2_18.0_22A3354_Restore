@implementation WFiTunesObject

- (WFiTunesObject)initWithName:(id)a3 identifier:(id)a4 kind:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFiTunesObject *v11;
  WFiTunesObject *v12;
  WFiTunesObject *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFiTunesObject;
  v11 = -[MTLModel init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[WFiTunesObject setName:](v11, "setName:", v8);
    -[WFiTunesObject setIdentifier:](v12, "setIdentifier:", v9);
    -[WFiTunesObject setKind:](v12, "setKind:", v10);
    v13 = v12;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (NSString)censoredName
{
  return self->_censoredName;
}

- (NSURL)viewURL
{
  return self->_viewURL;
}

- (NSDictionary)artworkURLs
{
  return self->_artworkURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLs, 0);
  objc_storeStrong((id *)&self->_viewURL, 0);
  objc_storeStrong((id *)&self->_censoredName, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesObject;
  objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("artworkURLs"));

  return v3;
}

+ (id)JSONKeyPathsByPropertyKey
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("artworkURLs");
  v4[0] = &unk_1E7B8D988;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", &__block_literal_global_37673);
}

+ (id)releaseDateJSONTransformer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3B20];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"), 0, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)artworkURLsJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_146_37654, &__block_literal_global_155);
}

+ (Class)classForParsingJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrapperType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("artist")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("podcast")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intent"));

    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("collection")) & 1) == 0
           && !objc_msgSend(v5, "isEqualToString:", CFSTR("audiobook"))
           && !objc_msgSend(v5, "isEqualToString:", CFSTR("track"))
           && !objc_msgSend(v5, "isEqualToString:", CFSTR("software")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = a1;
        goto LABEL_11;
      }
    }
  }
  objc_opt_class();
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v9 = v8;

  return (Class)v9;
}

id __44__WFiTunesObject_artworkURLsJSONTransformer__block_invoke_154(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("artworkUrl%lu"), objc_msgSend(v9, "unsignedLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

id __44__WFiTunesObject_artworkURLsJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v25 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "substringFromIndex:", 10);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLWithString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v14, v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E7B8B710);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E7B8B728);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E7B8B710);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("100x100"), CFSTR("512x512"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLWithString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, &unk_1E7B8B728);

    }
  }

  return v25;
}

id __43__WFiTunesObject_identifierJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = v2;
  }
  v4 = v3;
LABEL_7:

  return v4;
}

@end
