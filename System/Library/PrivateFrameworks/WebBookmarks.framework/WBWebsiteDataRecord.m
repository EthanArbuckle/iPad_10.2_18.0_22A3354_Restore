@implementation WBWebsiteDataRecord

+ (id)websiteDataRecordWithDomain:(id)a3 profileIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDomain:profileIdentifiers:", v7, v6);

  return v8;
}

+ (id)websiteDataRecordFromXPCDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t uint64;
  void *v6;
  void *v7;
  size_t count;
  void *v9;
  size_t i;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v3, "WebsiteDataRecordDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v3, "WebsiteDataRecordUsage");
  xpc_dictionary_get_value(v3, kWebsiteProfileIdentifiersKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    count = xpc_array_get_count(v6);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_array_get_string(v7, i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

      }
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = -[WBWebsiteDataRecord _initWithDomain:usage:profileIdentifiers:]([WBWebsiteDataRecord alloc], "_initWithDomain:usage:profileIdentifiers:", v4, uint64, v9);

  return v12;
}

- (OS_xpc_object)XPCDictionaryRepresentation
{
  xpc_object_t v3;
  xpc_object_t v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "WebsiteDataRecordDomain", -[NSString UTF8String](self->_domain, "UTF8String"));
  xpc_dictionary_set_uint64(v3, "WebsiteDataRecordUsage", self->_usage);
  v4 = xpc_array_create(0, 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_profileIdentifiers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v11 = xpc_string_create((const char *)objc_msgSend(v10, "UTF8String", (_QWORD)v13));
        xpc_array_append_value(v4, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  xpc_dictionary_set_value(v3, kWebsiteProfileIdentifiersKey, v4);
  return (OS_xpc_object *)v3;
}

- (id)_initWithDomain:(id)a3 profileIdentifiers:(id)a4
{
  return -[WBWebsiteDataRecord _initWithDomain:usage:profileIdentifiers:](self, "_initWithDomain:usage:profileIdentifiers:", a3, 0, a4);
}

- (id)_initWithDomain:(id)a3 usage:(unint64_t)a4 profileIdentifiers:(id)a5
{
  id v8;
  id v9;
  WBWebsiteDataRecord *v10;
  uint64_t v11;
  NSString *domain;
  uint64_t v13;
  NSMutableSet *profileIdentifiers;
  WBWebsiteDataRecord *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBWebsiteDataRecord;
  v10 = -[WBWebsiteDataRecord init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    v10->_usage = a4;
    v13 = objc_msgSend(v9, "mutableCopy");
    profileIdentifiers = v10->_profileIdentifiers;
    v10->_profileIdentifiers = (NSMutableSet *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSString)domain
{
  return self->_domain;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (NSMutableSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
