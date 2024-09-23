@implementation _ICQButtonSpecification

- (_ICQButtonSpecification)initWithServerDictionary:(id)a3
{
  id v5;
  _ICQButtonSpecification *v6;
  _ICQButtonSpecification *v7;
  void *v8;
  uint64_t v9;
  NSString *buttonFormat;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *textFormat;
  uint64_t v15;
  NSString *linkFormat;
  NSString *v17;
  NSObject *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  ICQLink *buttonLink;
  int v24;
  NSString *v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[_ICQButtonSpecification init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQStringForKey(v8, CFSTR("format"));
    v9 = objc_claimAutoreleasedReturnValue();
    buttonFormat = v7->_buttonFormat;
    v7->_buttonFormat = (NSString *)v9;

    _ICQArrayForKey(v8, CFSTR("detailedFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v13 = objc_claimAutoreleasedReturnValue();
      textFormat = v7->_textFormat;
      v7->_textFormat = (NSString *)v13;

      objc_msgSend(v12, "objectAtIndex:", 1);
      v15 = objc_claimAutoreleasedReturnValue();
      linkFormat = v7->_linkFormat;
      v7->_linkFormat = (NSString *)v15;
    }
    else
    {
      v17 = v7->_buttonFormat;
      linkFormat = v7->_textFormat;
      v7->_textFormat = v17;
    }

    _ICQGetLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v7->_textFormat;
      v20 = v7->_linkFormat;
      v24 = 138412546;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "format array \"%@\" \"%@\", (uint8_t *)&v24, 0x16u);
    }

    _ICQLinkButtonForServerMessage(v8, 2);
    v21 = objc_claimAutoreleasedReturnValue();
    buttonLink = v7->_buttonLink;
    v7->_buttonLink = (ICQLink *)v21;

  }
  return v7;
}

- (ICQLink)buttonLink
{
  ICQLink *v3;
  void *v4;
  void *v5;

  if (self->_serverDict)
  {
    v3 = self->_buttonLink;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQButtonSpecification linkForBundleIdentifier:](self, "linkForBundleIdentifier:", v5);
    v3 = (ICQLink *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)linkForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (self->_serverDict)
  {
    -[_ICQButtonSpecification buttonLink](self, "buttonLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ICQButtonSpecification linkForBundleIdentifier](self, "linkForBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)buttonFormat
{
  return self->_buttonFormat;
}

- (NSString)textFormat
{
  return self->_textFormat;
}

- (NSString)linkFormat
{
  return self->_linkFormat;
}

- (NSDictionary)linkForBundleIdentifier
{
  return self->_linkForBundleIdentifier;
}

- (void)setLinkForBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkForBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkForBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkFormat, 0);
  objc_storeStrong((id *)&self->_textFormat, 0);
  objc_storeStrong((id *)&self->_buttonFormat, 0);
  objc_storeStrong((id *)&self->_buttonLink, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)buttonSpecificationSampleForLevel:(int64_t)a3
{
  uint64_t *v3;
  id v4;

  if (a3 == 3)
  {
    if (_ButtonSpecificationSampleForFullLevel_onceToken != -1)
      dispatch_once(&_ButtonSpecificationSampleForFullLevel_onceToken, &__block_literal_global_10_1);
    v3 = &_ButtonSpecificationSampleForFullLevel_sButtonSpecification;
  }
  else
  {
    if (a3 != 2)
    {
      v4 = 0;
      return v4;
    }
    if (_ButtonSpecificationSampleForAlmostFullLevel_onceToken != -1)
      dispatch_once(&_ButtonSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_19);
    v3 = &_ButtonSpecificationSampleForAlmostFullLevel_sButtonSpecification;
  }
  v4 = (id)*v3;
  return v4;
}

@end
