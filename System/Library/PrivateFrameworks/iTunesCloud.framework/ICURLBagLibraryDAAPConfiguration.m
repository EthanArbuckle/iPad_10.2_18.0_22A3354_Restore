@implementation ICURLBagLibraryDAAPConfiguration

- (ICURLBagLibraryDAAPConfiguration)initWithBagLibraryDAAPDictionary:(id)a3
{
  id v5;
  ICURLBagLibraryDAAPConfiguration *v6;
  ICURLBagLibraryDAAPConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICURLBagLibraryDAAPConfiguration;
  v6 = -[ICURLBagLibraryDAAPConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagDictionary, a3);

  return v7;
}

- (id)description
{
  return -[NSDictionary description](self->_bagDictionary, "description");
}

- (int64_t)databaseID
{
  return -[NSDictionary ic_intValueForKey:](self->_bagDictionary, "ic_intValueForKey:", CFSTR("database-id"));
}

- (NSString)databaseName
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_bagDictionary, "ic_stringValueForKey:", CFSTR("database-name"));
}

- (NSString)baseURL
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_bagDictionary, "ic_stringValueForKey:", CFSTR("base-url"));
}

- (BOOL)isOnlineGeniusForMatchEnabled
{
  return -[NSDictionary ic_BOOLValueForKey:](self->_bagDictionary, "ic_BOOLValueForKey:", CFSTR("is-online-genius-for-match-enabled"));
}

- (int64_t)playDataBatchIntervalInMinutes
{
  return -[NSDictionary ic_intValueForKey:](self->_bagDictionary, "ic_intValueForKey:", CFSTR("play-data-batch-interval-in-minutes"));
}

- (int64_t)subscribedContainerPollingFrequencySeconds
{
  return -[NSDictionary ic_intValueForKey:](self->_bagDictionary, "ic_intValueForKey:", CFSTR("subscribed-container-polling-frequency-secs"));
}

- (int64_t)updatePollingFrequencySeconds
{
  return -[NSDictionary ic_intValueForKey:](self->_bagDictionary, "ic_intValueForKey:", CFSTR("update-polling-frequency-secs"));
}

- (int64_t)autoUpdatePollingFrequencySeconds
{
  return -[NSDictionary ic_intValueForKey:](self->_bagDictionary, "ic_intValueForKey:", CFSTR("auto-update-polling-frequency-secs"));
}

- (unint64_t)maxSyncRetryIntervalSeconds
{
  return -[NSDictionary ic_uintValueForKey:](self->_bagDictionary, "ic_uintValueForKey:", CFSTR("max-sync-retry-interval-secs"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagDictionary, 0);
}

@end
