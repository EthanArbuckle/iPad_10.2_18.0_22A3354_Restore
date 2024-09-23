@implementation _ICQBannerSpecification

- (void)setMessageWithServerMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_ICQBannerSpecification setLinksFormat:](self, "setLinksFormat:", v4);
    -[_ICQBannerSpecification setLinks:](self, "setLinks:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("format"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQBannerSpecification setLinksFormat:](self, "setLinksFormat:", v5);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("params"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQLinksForServerMessageParameters(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQBannerSpecification setLinks:](self, "setLinks:", v7);

      +[ICQLink _icqDismissLinkForServerMessageParameters:](ICQLink, "_icqDismissLinkForServerMessageParameters:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQBannerSpecification setDismissLink:](self, "setDismissLink:", v8);

    }
    else
    {
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "invalid banner spec server message:%@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

- (void)setLinksFormat:(id)a3
{
  objc_storeStrong((id *)&self->_linksFormat, a3);
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (void)setDismissLink:(id)a3
{
  objc_storeStrong((id *)&self->_dismissLink, a3);
}

- (_ICQBannerSpecification)initWithServerDictionary:(id)a3
{
  id v5;
  _ICQBannerSpecification *v6;
  _ICQBannerSpecification *v7;
  NSString *bannerSource;
  void *v9;

  v5 = a3;
  v6 = -[_ICQBannerSpecification init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    *(_WORD *)&v7->_isDetailBannerInfoAvailable = 0;
    bannerSource = v7->_bannerSource;
    v7->_bannerSource = (NSString *)CFSTR("ICQBannerSourceAppBannerInfo");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQBannerSpecification setMessageWithServerMessage:](v7, "setMessageWithServerMessage:", v9);

  }
  return v7;
}

- (_ICQBannerSpecification)initWithDetailBannerInfo:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  _ICQBannerSpecification *v9;
  _ICQBannerSpecification *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  NSDictionary *titleTemplates;
  NSDictionary *v32;
  uint64_t v33;
  NSDictionary *iconDetails;
  ICQIconSpecification *v35;
  void *v36;
  uint64_t v37;
  ICQIconSpecification *iconSpecification;
  void *v40;
  id obj;
  id v42;
  _ICQBannerSpecification *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[_ICQBannerSpecification init](self, "init");
  v10 = v9;
  if (v9)
  {
    obj = a4;
    v42 = v8;
    objc_storeStrong((id *)&v9->_serverDict, a3);
    v10->_isDetailBannerInfoAvailable = 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("placeHolderExists"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_placeholderExists = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bannerFooter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQBannerSpecification setMessageWithServerMessage:](v10, "setMessageWithServerMessage:", v12);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("displayConfiguration"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQBannerSpecification _setDisplayConfigurations:](v10, "_setDisplayConfigurations:");
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mesg"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("format"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("key"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v20, v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v16);
    }

    v43 = v10;
    objc_storeStrong((id *)&v10->_messageTemplates, v13);
    v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("title"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("format"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("key"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v22, "setObject:forKey:", v29, v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v25);
    }

    v10 = v43;
    titleTemplates = v43->_titleTemplates;
    v43->_titleTemplates = v22;
    v32 = v22;

    v7 = v44;
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("iconDetails"));
    v33 = objc_claimAutoreleasedReturnValue();
    iconDetails = v43->_iconDetails;
    v43->_iconDetails = (NSDictionary *)v33;

    objc_storeStrong((id *)&v43->_bannerSource, obj);
    v35 = [ICQIconSpecification alloc];
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("icon"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[ICQIconSpecification initWithDictionary:](v35, "initWithDictionary:", v36);
    iconSpecification = v43->_iconSpecification;
    v43->_iconSpecification = (ICQIconSpecification *)v37;

    v8 = v42;
  }

  return v10;
}

+ (id)bannerSpecificationSampleForLevel:(int64_t)a3
{
  uint64_t *v3;
  id v4;

  if (a3 == 3)
  {
    if (_BannerSpecificationSampleForFullLevel_onceToken != -1)
      dispatch_once(&_BannerSpecificationSampleForFullLevel_onceToken, &__block_literal_global_8);
    v3 = &_BannerSpecificationSampleForFullLevel_sBannerSpecification;
  }
  else
  {
    if (a3 != 2)
    {
      v4 = 0;
      return v4;
    }
    if (_BannerSpecificationSampleForAlmostFullLevel_onceToken != -1)
      dispatch_once(&_BannerSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_2);
    v3 = &_BannerSpecificationSampleForAlmostFullLevel_sBannerSpecification;
  }
  v4 = (id)*v3;
  return v4;
}

- (void)_setDisplayConfigurations:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decayUntilInMS"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decayUntilInMS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decayUntilInMS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQBannerSpecification setDecayUntil:](self, "setDecayUntil:", v8);

    }
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("suppressUntilInMS"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("suppressUntilInMS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("suppressUntilInMS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQBannerSpecification setSupressUntil:](self, "setSupressUntil:", v13);

    }
  }

}

- (id)_bannerSpecificationParams
{
  const __CFString *v3;

  if (-[_ICQBannerSpecification isDetailBannerInfoAvailable](self, "isDetailBannerInfoAvailable"))
    v3 = CFSTR("bannerFooter.params");
  else
    v3 = CFSTR("mesg.params");
  -[NSDictionary valueForKeyPath:](self->_serverDict, "valueForKeyPath:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)serverUIURL
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_ICQBannerSpecification _bannerSpecificationParams](self, "_bannerSpecificationParams");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "valueForKeyPath:", CFSTR("actParams.openUrl"), (_QWORD)v11);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v9 = (void *)v7;
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);

          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSURL *)v8;
}

- (NSURL)dynamicUIRouteURL
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_ICQBannerSpecification _bannerSpecificationParams](self, "_bannerSpecificationParams");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "valueForKeyPath:", CFSTR("actParams.route"), (_QWORD)v11);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v9 = (void *)v7;
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);

          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSURL *)v8;
}

- (NSString)purchaseAttribution
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_ICQBannerSpecification _bannerSpecificationParams](self, "_bannerSpecificationParams");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "valueForKeyPath:", CFSTR("actParams.purchaseAttribution"), (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSString *)v8;
}

- (id)titleWithKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = (__CFString *)a3;
  if (-[_ICQBannerSpecification isDetailBannerInfoAvailable](self, "isDetailBannerInfoAvailable"))
  {
    -[_ICQBannerSpecification titleTemplates](self, "titleTemplates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ICQBannerSpecification titleTemplates](self, "titleTemplates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = v4;
    else
      v9 = CFSTR("default");
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)messageWithKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = (__CFString *)a3;
  if (-[_ICQBannerSpecification isDetailBannerInfoAvailable](self, "isDetailBannerInfoAvailable"))
  {
    -[_ICQBannerSpecification messageTemplates](self, "messageTemplates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ICQBannerSpecification messageTemplates](self, "messageTemplates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = v4;
    else
      v9 = CFSTR("default");
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)iconPath
{
  void *v2;
  void *v3;

  -[_ICQBannerSpecification iconDetails](self, "iconDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sfSymbolBundlePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)reason
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_serverDict, "objectForKeyedSubscript:", CFSTR("reason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQOffer offerReasonForServerReason:](ICQOffer, "offerReasonForServerReason:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)messageTemplates
{
  return self->_messageTemplates;
}

- (NSDictionary)titleTemplates
{
  return self->_titleTemplates;
}

- (NSDictionary)iconDetails
{
  return self->_iconDetails;
}

- (NSString)linksFormat
{
  return self->_linksFormat;
}

- (NSArray)links
{
  return self->_links;
}

- (ICQLink)dismissLink
{
  return self->_dismissLink;
}

- (BOOL)isDetailBannerInfoAvailable
{
  return self->_isDetailBannerInfoAvailable;
}

- (BOOL)placeholderExists
{
  return self->_placeholderExists;
}

- (void)setServerUIURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverUIURL, a3);
}

- (NSString)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (ICQIconSpecification)iconSpecification
{
  return self->_iconSpecification;
}

- (void)setIconSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_iconSpecification, a3);
}

- (NSNumber)supressUntil
{
  return self->_supressUntil;
}

- (void)setSupressUntil:(id)a3
{
  objc_storeStrong((id *)&self->_supressUntil, a3);
}

- (NSNumber)decayUntil
{
  return self->_decayUntil;
}

- (void)setDecayUntil:(id)a3
{
  objc_storeStrong((id *)&self->_decayUntil, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decayUntil, 0);
  objc_storeStrong((id *)&self->_supressUntil, 0);
  objc_storeStrong((id *)&self->_iconSpecification, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_serverUIURL, 0);
  objc_storeStrong((id *)&self->_dismissLink, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_linksFormat, 0);
  objc_storeStrong((id *)&self->_iconDetails, 0);
  objc_storeStrong((id *)&self->_titleTemplates, 0);
  objc_storeStrong((id *)&self->_messageTemplates, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end
