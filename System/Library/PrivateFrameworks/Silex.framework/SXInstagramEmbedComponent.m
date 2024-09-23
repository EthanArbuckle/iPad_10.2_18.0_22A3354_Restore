@implementation SXInstagramEmbedComponent

- (id)type
{
  return CFSTR("embed");
}

- (id)embedType
{
  return CFSTR("instagram_post");
}

- (id)classification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  -[SXInstagramEmbedComponent type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXJSONObject specificationVersion](self, "specificationVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFullscreenCaption caption]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXFullscreenCaption caption]((uint64_t)v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SXInstagramEmbedComponent;
    -[SXComponent classification](&v10, sel_classification);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)traits
{
  return 32;
}

@end
