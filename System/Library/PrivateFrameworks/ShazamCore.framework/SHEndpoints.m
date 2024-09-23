@implementation SHEndpoints

- (SHEndpoints)initWithConfiguration:(id)a3 suggestedLanguage:(id)a4
{
  id v6;
  id v7;
  SHEndpoints *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *endpoints;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHEndpoints;
  v8 = -[SHEndpoints init](&v13, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v9, "setValue:forKey:", CFSTR("/v1/catalog/{storefront}/songs/{id}?fields=name,hapticsAssetUrl,durationInMillis,spatialOffsets&format[resources]=map&extend=spatialOffsets"), CFSTR("song-haptics-adamid"));
    objc_msgSend(v9, "setValue:forKey:", CFSTR("/v1/catalog/{storefront}/songs?filter[isrc]={id}&fields=name,hapticsAssetUrl,durationInMillis,spatialOffsets&format[resources]=map&extend=spatialOffsets"), CFSTR("song-haptics-isrc"));
    v10 = objc_msgSend(v9, "copy");
    endpoints = v8->_endpoints;
    v8->_endpoints = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_suggestedLanguage, a4);
  }

  return v8;
}

- (id)matchURLPathForClientIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("match"), a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SHEndpoints endpoints](self, "endpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHEndpoints endpoints](self, "endpoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = CFSTR("match");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)lookupURLPathForClientIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("lookup"), a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SHEndpoints endpoints](self, "endpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHEndpoints endpoints](self, "endpoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = CFSTR("lookup");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hapticsURLPathForClientIdentifier:(id)a3 songResourceIDType:(int64_t)a4
{
  void *v4;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v7 = a3;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("song-haptics-isrc"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SHEndpoints endpoints](self, "endpoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHEndpoints endpoints](self, "endpoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v12 = CFSTR("song-haptics-isrc");
      goto LABEL_8;
    }
LABEL_6:
    v13 = v11;
    v12 = v8;
LABEL_9:
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("song-haptics-adamid"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SHEndpoints endpoints](self, "endpoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHEndpoints endpoints](self, "endpoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v12 = CFSTR("song-haptics-adamid");
LABEL_8:
      v13 = v11;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_10:

  return v4;
}

- (NSString)suggestedLanguage
{
  return self->_suggestedLanguage;
}

- (NSDictionary)endpoints
{
  return self->_endpoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_suggestedLanguage, 0);
}

@end
