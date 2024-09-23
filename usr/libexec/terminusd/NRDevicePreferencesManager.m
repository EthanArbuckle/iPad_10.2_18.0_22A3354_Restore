@implementation NRDevicePreferencesManager

- (void)dealloc
{
  NRDevicePreferencesManager *v2;
  void *v3;
  int IsLevelEnabled;
  NSUUID *nrUUID;
  NSUUID *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v2 = self;
  if (self)
    self = (NRDevicePreferencesManager *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v6 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
    _NRLogWithArgs(v8, 1, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDevicePreferencesManager dealloc]", 64, v2);

  }
  v9.receiver = v2;
  v9.super_class = (Class)NRDevicePreferencesManager;
  -[NRDevicePreferencesManager dealloc](&v9, "dealloc");
}

- (id)description
{
  id v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *policyTrafficClassifiersDict;
  id v6;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    v4 = self->_devicePreferencesTypeLink;
    policyTrafficClassifiersDict = self->_policyTrafficClassifiersDict;
  }
  else
  {
    v4 = 0;
    policyTrafficClassifiersDict = 0;
  }
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("Active Link Preferences: %@, Policy Traffic Classifiers: %@"), v4, policyTrafficClassifiersDict);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyTrafficClasses, 0);
  objc_storeStrong((id *)&self->_policyTrafficClassifiersDict, 0);
  objc_storeStrong((id *)&self->_devicePreferencesTypeLink, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
