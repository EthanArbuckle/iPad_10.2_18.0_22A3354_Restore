@implementation WBSUserDefinedContentBlockerCrossSiteContent

- (WBSUserDefinedContentBlockerCrossSiteContent)initWithSource:(id)a3 title:(id)a4 extraAttributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSUserDefinedContentBlockerCrossSiteContent *v12;
  WBSUserDefinedContentBlockerCrossSiteContent *v13;
  void *v14;
  WBSUserDefinedContentBlockerCrossSiteContent *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSUserDefinedContentBlockerCrossSiteContent;
  v12 = -[WBSUserDefinedContentBlockerCrossSiteContent init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_databaseID = 0;
    objc_storeStrong((id *)&v12->_source, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    if (v11)
      v14 = v11;
    else
      v14 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v13->_extraAttributes, v14);
    v15 = v13;
  }

  return v13;
}

- (WBSUserDefinedContentBlockerCrossSiteContent)initWithDatabaseID:(int64_t)a3 source:(id)a4 title:(id)a5 extraAttributes:(id)a6
{
  WBSUserDefinedContentBlockerCrossSiteContent *v7;
  WBSUserDefinedContentBlockerCrossSiteContent *v8;
  WBSUserDefinedContentBlockerCrossSiteContent *v9;

  v7 = -[WBSUserDefinedContentBlockerCrossSiteContent initWithSource:title:extraAttributes:](self, "initWithSource:title:extraAttributes:", a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v7->_databaseID = a3;
    v9 = v7;
  }

  return v8;
}

- (BOOL)isEquivalentToContent:(id)a3
{
  WBSUserDefinedContentBlockerCrossSiteContent *v4;
  WBSUserDefinedContentBlockerCrossSiteContent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WBSUserDefinedContentBlockerCrossSiteContent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[WBSUserDefinedContentBlockerCrossSiteContent source](v4, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSUserDefinedContentBlockerCrossSiteContent source](self, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[WBSUserDefinedContentBlockerCrossSiteContent title](v5, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerCrossSiteContent title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WBSIsEqual();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WBSUserDefinedContentBlockerCrossSiteContent source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSUserDefinedContentBlockerCrossSiteContent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p src=\"%@\" title=\"%@\">"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setExtraAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extraAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
