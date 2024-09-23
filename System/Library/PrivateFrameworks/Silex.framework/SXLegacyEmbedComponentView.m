@implementation SXLegacyEmbedComponentView

- (SXEmbedResource)embedResource
{
  SXEmbedResource *embedResource;
  SXLegacyEmbedResource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXEmbedResource *v9;
  void *v10;
  void *v11;
  SXEmbedResource *v12;
  SXEmbedResource *v13;

  embedResource = self->_embedResource;
  if (!embedResource)
  {
    v4 = objc_alloc_init(SXLegacyEmbedResource);
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForLookupKey:", CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("URL"));
    v9 = [SXEmbedResource alloc];
    -[SXComponentView component](self, "component");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "specificationVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SXJSONObject initWithJSONObject:andVersion:](v9, "initWithJSONObject:andVersion:", v8, v11);
    v13 = self->_embedResource;
    self->_embedResource = v12;

    embedResource = self->_embedResource;
  }
  return embedResource;
}

- (void)setEmbedResource:(id)a3
{
  objc_storeStrong((id *)&self->_embedResource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedResource, 0);
}

@end
