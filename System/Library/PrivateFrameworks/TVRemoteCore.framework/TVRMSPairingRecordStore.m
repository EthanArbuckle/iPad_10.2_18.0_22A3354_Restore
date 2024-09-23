@implementation TVRMSPairingRecordStore

+ (id)sharedRecordStore
{
  if (sharedRecordStore_onceToken != -1)
    dispatch_once(&sharedRecordStore_onceToken, &__block_literal_global_3);
  return (id)sharedRecordStore_sharedRecordStore;
}

void __44__TVRMSPairingRecordStore_sharedRecordStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedRecordStore_sharedRecordStore;
  sharedRecordStore_sharedRecordStore = v0;

}

- (TVRMSPairingRecordStore)init
{
  TVRMSPairingRecordStore *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *pairingRecords;
  uint64_t v6;
  NSMutableDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRMSPairingRecordStore;
  v2 = -[TVRMSPairingRecordStore init](&v9, sel_init);
  if (v2)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("PairingRecordStore"), CFSTR("com.apple.TVRemoteMediaServices"));
    v4 = objc_msgSend(v3, "mutableCopy");
    pairingRecords = v2->_pairingRecords;
    v2->_pairingRecords = (NSMutableDictionary *)v4;

    if (!v2->_pairingRecords)
    {
      v6 = objc_opt_new();
      v7 = v2->_pairingRecords;
      v2->_pairingRecords = (NSMutableDictionary *)v6;

    }
  }
  return v2;
}

- (id)allPairingRecords
{
  return (id)-[NSMutableDictionary copy](self->_pairingRecords, "copy");
}

- (id)pairedServiceNetworkNames
{
  return (id)-[NSMutableDictionary allKeys](self->_pairingRecords, "allKeys");
}

- (id)pairingRecordForServiceWithNetworkName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pairingRecords, "objectForKeyedSubscript:", a3);
}

- (void)savePairingRecord:(id)a3 forServiceWithNetworkName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pairingRecords, "setObject:forKeyedSubscript:", a3, a4);
  -[TVRMSPairingRecordStore _synchronizePreferences](self, "_synchronizePreferences");
}

- (void)removePairingRecordForServiceWithNetworkName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_pairingRecords, "removeObjectForKey:", a3);
  -[TVRMSPairingRecordStore _synchronizePreferences](self, "_synchronizePreferences");
}

- (void)_synchronizePreferences
{
  CFPreferencesSetAppValue(CFSTR("PairingRecordStore"), self->_pairingRecords, CFSTR("com.apple.TVRemoteMediaServices"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingRecords, 0);
}

@end
