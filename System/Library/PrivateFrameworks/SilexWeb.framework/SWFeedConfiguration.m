@implementation SWFeedConfiguration

- (SWFeedConfiguration)init
{
  SWFeedConfiguration *v2;
  uint64_t v3;
  NSSet *selectors;
  NSDictionary *configuration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWFeedConfiguration;
  v2 = -[SWFeedConfiguration init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    selectors = v2->_selectors;
    v2->_selectors = (NSSet *)v3;

    configuration = v2->_configuration;
    v2->_configuration = 0;

  }
  return v2;
}

- (SWFeedConfiguration)initWithSelectors:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  SWFeedConfiguration *v9;
  SWFeedConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWFeedConfiguration;
  v9 = -[SWFeedConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selectors, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SWFeedConfiguration *v4;
  void *v5;
  void *v6;
  SWFeedConfiguration *v7;

  v4 = [SWFeedConfiguration alloc];
  -[SWFeedConfiguration selectors](self, "selectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWFeedConfiguration configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWFeedConfiguration initWithSelectors:configuration:](v4, "initWithSelectors:configuration:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SWFeedConfiguration selectors](self, "selectors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToSet:", v7);

    if (!v8)
      goto LABEL_8;
    -[SWFeedConfiguration configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      v16 = 1;
      goto LABEL_10;
    }
    -[SWFeedConfiguration configuration](self, "configuration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          objc_msgSend(v5, "configuration"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      -[SWFeedConfiguration configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToDictionary:", v15);

    }
    else
    {
LABEL_8:
      v16 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (NSSet)selectors
{
  return self->_selectors;
}

- (void)setSelectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectors, 0);
}

@end
