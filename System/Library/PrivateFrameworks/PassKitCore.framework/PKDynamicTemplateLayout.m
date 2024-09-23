@implementation PKDynamicTemplateLayout

- (PKDynamicTemplateLayout)initWithDictionary:(id)a3
{
  id v4;
  PKDynamicTemplateLayout *v5;
  PKDynamicTemplateLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDynamicTemplateLayout;
  v5 = -[PKDynamicTemplateLayout init](&v8, sel_init);
  if (v5)
  {
    if (!v4 || !objc_msgSend(v4, "count"))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[PKDynamicTemplateLayout _initWithLayoutDictionary:](v5, "_initWithLayoutDictionary:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)_initWithLayoutDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *templateIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *layoutImages;
  NSMutableDictionary *v9;
  NSMutableDictionary *layoutStrings;
  NSMutableDictionary *v11;
  NSMutableDictionary *layoutLinks;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  id v31;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("cardTemplateIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  templateIdentifier = self->_templateIdentifier;
  self->_templateIdentifier = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  layoutImages = self->_layoutImages;
  self->_layoutImages = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  layoutStrings = self->_layoutStrings;
  self->_layoutStrings = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  layoutLinks = self->_layoutLinks;
  self->_layoutLinks = v11;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("assets"));
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v13 = objc_opt_class();
    +[PKLayoutAssetString assetKey](PKLayoutAssetString, "assetKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "PKArrayContaining:forKey:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKLayoutAssetString nameToAssetsMapFromDictionaries:](PKLayoutAssetString, "nameToAssetsMapFromDictionaries:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSMutableDictionary *)objc_msgSend(v16, "mutableCopy");
    v18 = self->_layoutStrings;
    self->_layoutStrings = v17;

    v19 = objc_opt_class();
    +[PKLayoutAssetImage assetKey](PKLayoutAssetImage, "assetKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "PKArrayContaining:forKey:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKLayoutAssetImage nameToAssetsMapFromDictionaries:](PKLayoutAssetImage, "nameToAssetsMapFromDictionaries:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSMutableDictionary *)objc_msgSend(v22, "mutableCopy");
    v24 = self->_layoutImages;
    self->_layoutImages = v23;

    v25 = objc_opt_class();
    +[PKLayoutAssetLink assetKey](PKLayoutAssetLink, "assetKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "PKArrayContaining:forKey:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKLayoutAssetLink nameToAssetsMapFromDictionaries:](PKLayoutAssetLink, "nameToAssetsMapFromDictionaries:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (NSMutableDictionary *)objc_msgSend(v28, "mutableCopy");
    v30 = self->_layoutLinks;
    self->_layoutLinks = v29;

  }
}

- (id)layoutStrings
{
  return (id)-[NSMutableDictionary copy](self->_layoutStrings, "copy");
}

- (id)layoutImages
{
  return (id)-[NSMutableDictionary copy](self->_layoutImages, "copy");
}

- (id)layoutLinks
{
  return (id)-[NSMutableDictionary copy](self->_layoutLinks, "copy");
}

- (id)anyLayoutStringNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_layoutStrings, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)anyLayoutImageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_layoutImages, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)anyLayoutLinkNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_layoutLinks, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)layoutStringNamed:(id)a3 passingTest:(id)a4
{
  NSMutableDictionary *layoutStrings;
  id v6;
  void *v7;
  void *v8;

  layoutStrings = self->_layoutStrings;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](layoutStrings, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_firstObjectPassingTest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutImageNamed:(id)a3 passingTest:(id)a4
{
  NSMutableDictionary *layoutImages;
  id v6;
  void *v7;
  void *v8;

  layoutImages = self->_layoutImages;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](layoutImages, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_firstObjectPassingTest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutLinkNamed:(id)a3 passingTest:(id)a4
{
  NSMutableDictionary *layoutLinks;
  id v6;
  void *v7;
  void *v8;

  layoutLinks = self->_layoutLinks;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](layoutLinks, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_firstObjectPassingTest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutLinks, 0);
  objc_storeStrong((id *)&self->_layoutImages, 0);
  objc_storeStrong((id *)&self->_layoutStrings, 0);
}

@end
