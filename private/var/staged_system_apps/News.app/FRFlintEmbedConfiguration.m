@implementation FRFlintEmbedConfiguration

- (FRFlintEmbedConfiguration)initWithData:(id)a3
{
  id v4;
  FRFlintEmbedConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SXJSONDictionary *v9;
  SXJSONDictionary *embedConfiguration;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FRFlintEmbedConfiguration;
  v5 = -[FRFlintEmbedConfiguration init](&v12, "init");
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 4, 0));
    if (v7)
    {
      v8 = objc_opt_class(NSDictionary, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = (SXJSONDictionary *)objc_msgSend(objc_alloc((Class)SXJSONDictionary), "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", &stru_1000D9730, 0, 0, v7, 0);
        embedConfiguration = v5->_embedConfiguration;
        v5->_embedConfiguration = v9;

      }
    }

  }
  return v5;
}

- (id)embedForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfiguration embedConfiguration](self, "embedConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (SXJSONDictionary)embedConfiguration
{
  return self->_embedConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfiguration, 0);
}

@end
