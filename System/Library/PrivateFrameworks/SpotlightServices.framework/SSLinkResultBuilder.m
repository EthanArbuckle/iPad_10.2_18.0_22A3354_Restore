@implementation SSLinkResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.MobileSMS");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.searchd.syndicatedLinks"));

  return v4;
}

- (SSLinkResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSLinkResultBuilder *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SSLinkResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v21, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6048], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6028], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLinkResultBuilder setWebsiteTitle:](v5, "setWebsiteTitle:", v8);

    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v6;
    else
      v10 = 0;
    -[SSLinkResultBuilder setSenders:](v5, "setSenders:", v10);

    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v7;
    else
      v12 = 0;
    -[SSLinkResultBuilder setSenderContactIdentifiers:](v5, "setSenderContactIdentifiers:", v12);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6900], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLinkResultBuilder setSyndicationStatus:](v5, "setSyndicationStatus:", objc_msgSend(v13, "unsignedIntValue"));

    objc_msgSend(v4, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SSLinkResultBuilder setUrl:](v5, "setUrl:", v14);
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6970], objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLinkResultBuilder setUrl:](v5, "setUrl:", v17);

    }
    -[SSLinkResultBuilder url](v5, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[SSLinkResultBuilder setUrl:](v5, "setUrl:", v18);
    }
    else
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6970], objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLinkResultBuilder setUrl:](v5, "setUrl:", v19);

    }
  }

  return v5;
}

- (id)buildThumbnail
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIconType:", 1);
  return v2;
}

- (id)buildTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D8C660];
  -[SSLinkResultBuilder websiteTitle](self, "websiteTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FROM_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSLinkResultBuilder senders](self, "senders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SSLinkResultBuilder senderContactIdentifiers](self, "senderContactIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setContactIdentifier:", v9);
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_opt_new();
  -[SSLinkResultBuilder url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUrl:", v13);

  if (objc_msgSend(v3, "count"))
    v14 = v3;
  else
    v14 = 0;
  objc_msgSend(v11, "setPeopleToBadge:", v14);
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCoreSpotlightIdentifier:", v15);

  objc_msgSend(v11, "setIsHighlighted:", -[SSLinkResultBuilder syndicationStatus](self, "syndicationStatus") == 2);
  return v11;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0D8C5E0];
  -[SSLinkResultBuilder url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPunchout:", v6);

  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)websiteTitle
{
  return self->_websiteTitle;
}

- (void)setWebsiteTitle:(id)a3
{
  objc_storeStrong((id *)&self->_websiteTitle, a3);
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
  objc_storeStrong((id *)&self->_senders, a3);
}

- (NSArray)senderContactIdentifiers
{
  return self->_senderContactIdentifiers;
}

- (void)setSenderContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_senderContactIdentifiers, a3);
}

- (unint64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (void)setSyndicationStatus:(unint64_t)a3
{
  self->_syndicationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_senders, 0);
  objc_storeStrong((id *)&self->_websiteTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
