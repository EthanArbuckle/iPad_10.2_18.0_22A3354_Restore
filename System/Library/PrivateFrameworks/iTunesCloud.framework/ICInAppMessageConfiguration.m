@implementation ICInAppMessageConfiguration

- (ICInAppMessageConfiguration)initWithDictionary:(id)a3
{
  id v4;
  ICInAppMessageConfiguration *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICInAppMessageConfiguration;
  v5 = -[ICInAppMessageConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSURL)reportEventURL
{
  void *v2;
  void *v3;

  -[NSDictionary ic_stringValueForKey:](self->_dictionary, "ic_stringValueForKey:", CFSTR("inAppMessagesReportEvent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)serialCheckURL
{
  void *v2;
  void *v3;

  -[NSDictionary ic_stringValueForKey:](self->_dictionary, "ic_stringValueForKey:", CFSTR("inAppMessagesSerialCheck"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)syncURL
{
  void *v2;
  void *v3;

  -[NSDictionary ic_stringValueForKey:](self->_dictionary, "ic_stringValueForKey:", CFSTR("inAppMessagesSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)resourceDomainURL
{
  void *v2;
  void *v3;

  -[NSDictionary ic_stringValueForKey:](self->_dictionary, "ic_stringValueForKey:", CFSTR("inAppMessagesResourceDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (int64_t)syncPollingInterval
{
  return -[NSDictionary ic_int64ValueForKey:](self->_dictionary, "ic_int64ValueForKey:", CFSTR("inAppMessagesPollingIntervalSeconds"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
