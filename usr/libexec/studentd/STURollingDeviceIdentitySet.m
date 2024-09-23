@implementation STURollingDeviceIdentitySet

- (STURollingDeviceIdentitySet)initWithDevicePrivateIdentity:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  STURollingDeviceIdentitySet *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identityPersistentId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stagedIdentityPersistentId"));

  v10 = -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:](self, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", v8, v9, v6);
  return v10;
}

- (BOOL)stagedCertificateCommonNameContainsMultipleMemberPrefixes
{
  STURollingDeviceIdentitySet *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
  LOBYTE(v2) = -[STURollingDeviceIdentitySet identityWithPersistentIDContainsMultipleMemberPrefixes:](v2, "identityWithPersistentIDContainsMultipleMemberPrefixes:", v3);

  return (char)v2;
}

- (BOOL)identityWithPersistentIDContainsMultipleMemberPrefixes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingDeviceIdentitySet keychain](self, "keychain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identityWithPersistentID:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("member:"), CFSTR("member:")));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "certificate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commonNames"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "hasPrefix:", v7) & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (id)keychain
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keychain"));

  return v3;
}

- (id)commonNamePrefix
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STURollingDeviceIdentitySet;
  v2 = -[STURollingUserIdentitySet commonNamePrefix](&v6, "commonNamePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("member:"), v3));

  return v4;
}

- (void)migrateFromCorruptStagedCertificateCommonNames
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[STURollingDeviceIdentitySet stagedCertificateCommonNameContainsMultipleMemberPrefixes](self, "stagedCertificateCommonNameContainsMultipleMemberPrefixes"))
  {
    if (qword_1000FC580 != -1)
      dispatch_once(&qword_1000FC580, &stru_1000CB850);
    v3 = qword_1000FC578;
    if (os_log_type_enabled((os_log_t)qword_1000FC578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Flushing staged identity because common name contains multiple member prefixes.", v4, 2u);
    }
    -[STURollingIdentitySet flushStagedIdentity](self, "flushStagedIdentity");
    -[STURollingIdentitySet refreshIdentities](self, "refreshIdentities");
  }
}

@end
