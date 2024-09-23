@implementation SUSearchFieldConfiguration

+ (id)defaultConfigurationWithClientInterface:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithClientInterface:", a3);
  *(_QWORD *)(v3 + 8) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
  *(_QWORD *)(v3 + 40) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_24DE83F60, 0);
  *(_QWORD *)(v3 + 64) = CFSTR("SULastSearch");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    *(_OWORD *)(v3 + 80) = xmmword_21B558480;
    v4 = 0x406F800000000000;
    v5 = 3;
  }
  else
  {
    v5 = 0;
    *(_BYTE *)(v3 + 48) = 1;
    v4 = 0x4074000000000000;
  }
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 72) = v4;
  return (id)v3;
}

- (id)_initWithClientInterface:(id)a3
{
  SUSearchFieldConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSearchFieldConfiguration;
  v4 = -[SUSearchFieldConfiguration init](&v6, sel_init);
  if (v4)
    v4->_clientInterface = (SUClientInterface *)a3;
  return v4;
}

- (SUSearchFieldConfiguration)init
{
  return -[SUSearchFieldConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUSearchFieldConfiguration)initWithDictionary:(id)a3
{
  return -[SUSearchFieldConfiguration initWithDictionary:clientInterface:](self, "initWithDictionary:clientInterface:", a3, +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (SUSearchFieldConfiguration)initWithDictionary:(id)a3 clientInterface:(id)a4
{
  SUSearchFieldConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUSearchFieldConfiguration;
  v6 = -[SUSearchFieldConfiguration init](&v8, sel_init);
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_location = 2;
    v6->_userDefaultsKey = (NSString *)CFSTR("SULastSearch");
    -[SUSearchFieldConfiguration loadFromDictionary:](v6, "loadFromDictionary:", a3);
  }
  return v6;
}

- (void)dealloc
{
  __CFDictionary *hintURLs;
  __CFDictionary *searchURLs;
  objc_super v5;

  hintURLs = self->_hintURLs;
  if (hintURLs)
    CFRelease(hintURLs);
  searchURLs = self->_searchURLs;
  if (searchURLs)
    CFRelease(searchURLs);

  v5.receiver = self;
  v5.super_class = (Class)SUSearchFieldConfiguration;
  -[SUSearchFieldConfiguration dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __CFDictionary *hintURLs;
  __CFDictionary *searchURLs;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithClientInterface:", self->_clientInterface);
  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_cancelString, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = self->_location;
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_placeholder, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 48) = self->_rootViewOnly;
  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_userDefaultsKey, "copyWithZone:", a3);
  *(double *)(v5 + 72) = self->_width;
  *(double *)(v5 + 80) = self->_widthLandscape;
  *(double *)(v5 + 88) = self->_widthPortrait;
  hintURLs = self->_hintURLs;
  if (hintURLs)
    *(_QWORD *)(v5 + 24) = CFDictionaryCreateMutableCopy(0, 0, hintURLs);
  searchURLs = self->_searchURLs;
  if (searchURLs)
    *(_QWORD *)(v5 + 56) = CFDictionaryCreateMutableCopy(0, 0, searchURLs);
  return (id)v5;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "defaultConfigurationWithClientInterface:", +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (id)hintsURLRequestPropertiesForNetworkType:(int64_t)a3
{
  if (self->_hintURLs)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", CFDictionaryGetValue(self->_hintURLs, (const void *)a3));
  else
    return -[SUSearchFieldConfiguration _urlRequestPropertiesForURLBagKey:networkType:](self, "_urlRequestPropertiesForURLBagKey:networkType:", -[SUClientInterface URLBagKeyForIdentifier:](self->_clientInterface, "URLBagKeyForIdentifier:", CFSTR("SUURLBagKeySearchHints")), a3);
}

- (void)loadFromDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("cancel-text"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_cancelString = (NSString *)v5;
  }
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("hints-urls"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUSearchFieldConfiguration _setHintURLsFromDictionary:](self, "_setHintURLsFromDictionary:", v6);
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("location"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_location = -[SUSearchFieldConfiguration _locationForString:](self, "_locationForString:", v7);
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("persistent-id"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_userDefaultsKey = (NSString *)v8;
  }
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("placeholder"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v10 = (NSString *)objc_msgSend(v9, "length");
    if (v10)
      v10 = v9;
    self->_placeholder = v10;
  }
  v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("root-page-only"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_rootViewOnly = objc_msgSend(v11, "BOOLValue");
  v12 = objc_msgSend(a3, "objectForKey:", CFSTR("search-urls"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUSearchFieldConfiguration _setSearchURLsFromDictionary:](self, "_setSearchURLsFromDictionary:", v12);
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("width"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "floatValue");
    self->_width = v14;
  }
  v15 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("width-landscape"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "floatValue");
    self->_widthLandscape = v16;
  }
  v17 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("width-portrait"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "floatValue");
    self->_widthPortrait = v18;
  }
}

- (id)searchURLRequestPropertiesForNetworkType:(int64_t)a3
{
  if (self->_searchURLs)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", CFDictionaryGetValue(self->_searchURLs, (const void *)a3));
  else
    return -[SUSearchFieldConfiguration _urlRequestPropertiesForURLBagKey:networkType:](self, "_urlRequestPropertiesForURLBagKey:networkType:", -[SUClientInterface URLBagKeyForIdentifier:](self->_clientInterface, "URLBagKeyForIdentifier:", CFSTR("SUURLBagKeySearch")), a3);
}

- (id)URLRequestPropertiesWithBaseURL:(id)a3 forNetworkType:(int64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", a3);
  v7 = -[SUSearchFieldConfiguration _newQueryStringDictionaryForNetworkType:](self, "_newQueryStringDictionaryForNetworkType:", a4);
  objc_msgSend(v6, "setRequestParameters:", v7);

  return v6;
}

- (double)widthForOrientation:(int64_t)a3
{
  double result;

  if ((unint64_t)(a3 - 3) > 1)
    result = self->_widthPortrait;
  else
    result = self->_widthLandscape;
  if (result <= 0.00000011920929)
    return self->_width;
  return result;
}

- (int64_t)_locationForString:(id)a3
{
  uint64_t v4;
  int64_t v5;

  v4 = 0;
  v5 = 2;
  while (!-[__CFString isEqualToString:](*(__CFString **)((char *)&__LocationNameMapping + v4), "isEqualToString:", a3))
  {
    v4 += 16;
    if (v4 == 64)
      return v5;
  }
  return *(int64_t *)((char *)&__LocationNameMapping + v4 + 8);
}

- (id)_newQueryStringDictionaryForNetworkType:(int64_t)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = -[SUClientInterface clientIdentifier](self->_clientInterface, "clientIdentifier");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
    v9 = objc_msgSend((id)objc_msgSend(v8, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "searchQueryParametersForClientIdentifier:networkType:", v7, a3);
    if (v9)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v9, 1);
      if (v10)
        objc_msgSend(v5, "addEntriesFromDictionary:", v10);

    }
  }
  return v5;
}

- (__CFDictionary)_newURLsDictionaryWithDictionary:(id)a3
{
  __CFDictionary *Mutable;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  v10 = 0;
  SSNetworkTypeApplyBlock();

  _Block_object_dispose(&v5, 8);
  return Mutable;
}

void __63__SUSearchFieldConfiguration__newURLsDictionaryWithDictionary___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id value;

  v4 = SSGetStringForNetworkType();
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    if (!v5
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      && SSNetworkTypeIsCellularType())
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
        if (v6)
        {
          value = (id)v6;
          if (SSNetworkTypeIsCellularType())
          {

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = value;
          }
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, value);

        }
      }
    }
  }
}

- (void)_setHintURLsFromDictionary:(id)a3
{
  __CFDictionary *hintURLs;

  hintURLs = self->_hintURLs;
  if (hintURLs)
    CFRelease(hintURLs);
  self->_hintURLs = -[SUSearchFieldConfiguration _newURLsDictionaryWithDictionary:](self, "_newURLsDictionaryWithDictionary:", a3);
}

- (void)_setSearchURLsFromDictionary:(id)a3
{
  __CFDictionary *searchURLs;

  searchURLs = self->_searchURLs;
  if (searchURLs)
    CFRelease(searchURLs);
  self->_searchURLs = -[SUSearchFieldConfiguration _newURLsDictionaryWithDictionary:](self, "_newURLsDictionaryWithDictionary:", a3);
}

- (id)_urlRequestPropertiesForURLBagKey:(id)a3 networkType:(int64_t)a4
{
  uint64_t v7;
  id result;

  v7 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v7), "urlForKey:", a3);
  if (result)
    return -[SUSearchFieldConfiguration URLRequestPropertiesWithBaseURL:forNetworkType:](self, "URLRequestPropertiesWithBaseURL:forNetworkType:", result, a4);
  return result;
}

- (NSString)cancelString
{
  return self->_cancelString;
}

- (int64_t)location
{
  return self->_location;
}

- (NSString)placeholderString
{
  return self->_placeholder;
}

- (BOOL)isRootViewOnly
{
  return self->_rootViewOnly;
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (double)width
{
  return self->_width;
}

@end
