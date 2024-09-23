@implementation TPPBPeerStableInfo

- (void)setClock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clock = a3;
}

- (void)setHasClock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClock
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFrozenPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_frozenPolicyVersion = a3;
}

- (void)setHasFrozenPolicyVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFrozenPolicyVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasFrozenPolicyHash
{
  return self->_frozenPolicyHash != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasRecoverySigningPublicKey
{
  return self->_recoverySigningPublicKey != 0;
}

- (BOOL)hasRecoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (void)setFlexiblePolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_flexiblePolicyVersion = a3;
}

- (void)setHasFlexiblePolicyVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlexiblePolicyVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFlexiblePolicyHash
{
  return self->_flexiblePolicyHash != 0;
}

- (void)clearPolicySecrets
{
  -[NSMutableArray removeAllObjects](self->_policySecrets, "removeAllObjects");
}

- (void)addPolicySecrets:(id)a3
{
  id v4;
  NSMutableArray *policySecrets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  policySecrets = self->_policySecrets;
  v8 = v4;
  if (!policySecrets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_policySecrets;
    self->_policySecrets = v6;

    v4 = v8;
    policySecrets = self->_policySecrets;
  }
  -[NSMutableArray addObject:](policySecrets, "addObject:", v4);

}

- (unint64_t)policySecretsCount
{
  return -[NSMutableArray count](self->_policySecrets, "count");
}

- (id)policySecretsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_policySecrets, "objectAtIndex:", a3);
}

- (int)userControllableViewStatus
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_userControllableViewStatus;
  else
    return 0;
}

- (void)setUserControllableViewStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userControllableViewStatus = a3;
}

- (void)setHasUserControllableViewStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserControllableViewStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)userControllableViewStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_1EA8BF6E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserControllableViewStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOLLOWING")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearCustodianRecoveryKeys
{
  -[NSMutableArray removeAllObjects](self->_custodianRecoveryKeys, "removeAllObjects");
}

- (void)addCustodianRecoveryKeys:(id)a3
{
  id v4;
  NSMutableArray *custodianRecoveryKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  v8 = v4;
  if (!custodianRecoveryKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_custodianRecoveryKeys;
    self->_custodianRecoveryKeys = v6;

    v4 = v8;
    custodianRecoveryKeys = self->_custodianRecoveryKeys;
  }
  -[NSMutableArray addObject:](custodianRecoveryKeys, "addObject:", v4);

}

- (unint64_t)custodianRecoveryKeysCount
{
  return -[NSMutableArray count](self->_custodianRecoveryKeys, "count");
}

- (id)custodianRecoveryKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_custodianRecoveryKeys, "objectAtIndex:", a3);
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0;
}

- (BOOL)hasWalrus
{
  return self->_walrus != 0;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isInheritedAccount = a3;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TPPBPeerStableInfo;
  -[TPPBPeerStableInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *frozenPolicyHash;
  NSString *osVersion;
  NSString *deviceName;
  NSData *recoverySigningPublicKey;
  NSData *recoveryEncryptionPublicKey;
  NSString *serialNumber;
  void *v13;
  NSString *flexiblePolicyHash;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t userControllableViewStatus;
  __CFString *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  TPPBSecureElementIdentity *secureElementIdentity;
  void *v32;
  TPPBPeerStableInfoSetting *walrus;
  void *v34;
  TPPBPeerStableInfoSetting *webAccess;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_clock);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("clock"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_frozenPolicyVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("frozen_policy_version"));

  }
  frozenPolicyHash = self->_frozenPolicyHash;
  if (frozenPolicyHash)
    objc_msgSend(v3, "setObject:forKey:", frozenPolicyHash, CFSTR("frozen_policy_hash"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v3, "setObject:forKey:", osVersion, CFSTR("os_version"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("device_name"));
  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if (recoverySigningPublicKey)
    objc_msgSend(v3, "setObject:forKey:", recoverySigningPublicKey, CFSTR("recovery_signing_public_key"));
  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if (recoveryEncryptionPublicKey)
    objc_msgSend(v3, "setObject:forKey:", recoveryEncryptionPublicKey, CFSTR("recovery_encryption_public_key"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v3, "setObject:forKey:", serialNumber, CFSTR("serial_number"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_flexiblePolicyVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("flexible_policy_version"));

  }
  flexiblePolicyHash = self->_flexiblePolicyHash;
  if (flexiblePolicyHash)
    objc_msgSend(v3, "setObject:forKey:", flexiblePolicyHash, CFSTR("flexible_policy_hash"));
  if (-[NSMutableArray count](self->_policySecrets, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_policySecrets, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v16 = self->_policySecrets;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("policy_secrets"));
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    userControllableViewStatus = self->_userControllableViewStatus;
    if (userControllableViewStatus >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userControllableViewStatus);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1EA8BF6E8[userControllableViewStatus];
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("user_controllable_view_status"));

  }
  if (-[NSMutableArray count](self->_custodianRecoveryKeys, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_custodianRecoveryKeys, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = self->_custodianRecoveryKeys;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("custodian_recovery_keys"));
  }
  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity)
  {
    -[TPPBSecureElementIdentity dictionaryRepresentation](secureElementIdentity, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureElementIdentity"));

  }
  walrus = self->_walrus;
  if (walrus)
  {
    -[TPPBPeerStableInfoSetting dictionaryRepresentation](walrus, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("walrus"));

  }
  webAccess = self->_webAccess;
  if (webAccess)
  {
    -[TPPBPeerStableInfoSetting dictionaryRepresentation](webAccess, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("web_access"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInheritedAccount);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("isInheritedAccount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerStableInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_frozenPolicyHash)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_policySecrets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (self->_osVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  if (self->_recoverySigningPublicKey)
    PBDataWriterWriteDataField();
  if (self->_recoveryEncryptionPublicKey)
    PBDataWriterWriteDataField();
  if (self->_serialNumber)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_flexiblePolicyHash)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_custodianRecoveryKeys;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (self->_secureElementIdentity)
    PBDataWriterWriteSubmessage();
  if (self->_walrus)
    PBDataWriterWriteSubmessage();
  if (self->_webAccess)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  _BYTE *v15;
  id v16;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_clock;
    *((_BYTE *)v4 + 140) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = self->_frozenPolicyVersion;
    *((_BYTE *)v4 + 140) |= 4u;
  }
  v16 = v4;
  if (self->_frozenPolicyHash)
    objc_msgSend(v4, "setFrozenPolicyHash:");
  if (-[TPPBPeerStableInfo policySecretsCount](self, "policySecretsCount"))
  {
    objc_msgSend(v16, "clearPolicySecrets");
    v6 = -[TPPBPeerStableInfo policySecretsCount](self, "policySecretsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[TPPBPeerStableInfo policySecretsAtIndex:](self, "policySecretsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPolicySecrets:", v9);

      }
    }
  }
  if (self->_osVersion)
    objc_msgSend(v16, "setOsVersion:");
  v10 = v16;
  if (self->_deviceName)
  {
    objc_msgSend(v16, "setDeviceName:");
    v10 = v16;
  }
  if (self->_recoverySigningPublicKey)
  {
    objc_msgSend(v16, "setRecoverySigningPublicKey:");
    v10 = v16;
  }
  if (self->_recoveryEncryptionPublicKey)
  {
    objc_msgSend(v16, "setRecoveryEncryptionPublicKey:");
    v10 = v16;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v16, "setSerialNumber:");
    v10 = v16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[2] = self->_flexiblePolicyVersion;
    *((_BYTE *)v10 + 140) |= 2u;
  }
  if (self->_flexiblePolicyHash)
  {
    objc_msgSend(v16, "setFlexiblePolicyHash:");
    v10 = v16;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v10 + 28) = self->_userControllableViewStatus;
    *((_BYTE *)v10 + 140) |= 8u;
  }
  if (-[TPPBPeerStableInfo custodianRecoveryKeysCount](self, "custodianRecoveryKeysCount"))
  {
    objc_msgSend(v16, "clearCustodianRecoveryKeys");
    v11 = -[TPPBPeerStableInfo custodianRecoveryKeysCount](self, "custodianRecoveryKeysCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[TPPBPeerStableInfo custodianRecoveryKeysAtIndex:](self, "custodianRecoveryKeysAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addCustodianRecoveryKeys:", v14);

      }
    }
  }
  if (self->_secureElementIdentity)
    objc_msgSend(v16, "setSecureElementIdentity:");
  v15 = v16;
  if (self->_walrus)
  {
    objc_msgSend(v16, "setWalrus:");
    v15 = v16;
  }
  if (self->_webAccess)
  {
    objc_msgSend(v16, "setWebAccess:");
    v15 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15[136] = self->_isInheritedAccount;
    v15[140] |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_clock;
    *(_BYTE *)(v5 + 140) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_frozenPolicyVersion;
    *(_BYTE *)(v5 + 140) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_frozenPolicyHash, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = self->_policySecrets;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPolicySecrets:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v16;

  v18 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v18;

  v20 = -[NSData copyWithZone:](self->_recoverySigningPublicKey, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v20;

  v22 = -[NSData copyWithZone:](self->_recoveryEncryptionPublicKey, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v22;

  v24 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v24;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_flexiblePolicyVersion;
    *(_BYTE *)(v6 + 140) |= 2u;
  }
  v26 = -[NSString copyWithZone:](self->_flexiblePolicyHash, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v26;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_userControllableViewStatus;
    *(_BYTE *)(v6 + 140) |= 8u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = self->_custodianRecoveryKeys;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v41);
        objc_msgSend((id)v6, "addCustodianRecoveryKeys:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v30);
  }

  v34 = -[TPPBSecureElementIdentity copyWithZone:](self->_secureElementIdentity, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v34;

  v36 = -[TPPBPeerStableInfoSetting copyWithZone:](self->_walrus, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v36;

  v38 = -[TPPBPeerStableInfoSetting copyWithZone:](self->_webAccess, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v38;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 136) = self->_isInheritedAccount;
    *(_BYTE *)(v6 + 140) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *frozenPolicyHash;
  NSMutableArray *policySecrets;
  NSString *osVersion;
  NSString *deviceName;
  NSData *recoverySigningPublicKey;
  NSData *recoveryEncryptionPublicKey;
  NSString *serialNumber;
  char has;
  char v13;
  NSString *flexiblePolicyHash;
  NSMutableArray *custodianRecoveryKeys;
  TPPBSecureElementIdentity *secureElementIdentity;
  TPPBPeerStableInfoSetting *walrus;
  TPPBPeerStableInfoSetting *webAccess;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 1) == 0 || self->_clock != *((_QWORD *)v4 + 1))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 140) & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 4) == 0 || self->_frozenPolicyVersion != *((_QWORD *)v4 + 3))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 140) & 4) != 0)
  {
    goto LABEL_49;
  }
  frozenPolicyHash = self->_frozenPolicyHash;
  if ((unint64_t)frozenPolicyHash | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](frozenPolicyHash, "isEqual:"))
  {
    goto LABEL_49;
  }
  policySecrets = self->_policySecrets;
  if ((unint64_t)policySecrets | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](policySecrets, "isEqual:"))
      goto LABEL_49;
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:"))
      goto LABEL_49;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_49;
  }
  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if ((unint64_t)recoverySigningPublicKey | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](recoverySigningPublicKey, "isEqual:"))
      goto LABEL_49;
  }
  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if ((unint64_t)recoveryEncryptionPublicKey | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](recoveryEncryptionPublicKey, "isEqual:"))
      goto LABEL_49;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_49;
  }
  has = (char)self->_has;
  v13 = *((_BYTE *)v4 + 140);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 2) == 0 || self->_flexiblePolicyVersion != *((_QWORD *)v4 + 2))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 140) & 2) != 0)
  {
    goto LABEL_49;
  }
  flexiblePolicyHash = self->_flexiblePolicyHash;
  if ((unint64_t)flexiblePolicyHash | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](flexiblePolicyHash, "isEqual:"))
      goto LABEL_49;
    has = (char)self->_has;
    v13 = *((_BYTE *)v4 + 140);
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_userControllableViewStatus != *((_DWORD *)v4 + 28))
      goto LABEL_49;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_49;
  }
  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  if ((unint64_t)custodianRecoveryKeys | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](custodianRecoveryKeys, "isEqual:"))
  {
    goto LABEL_49;
  }
  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((_QWORD *)v4 + 12))
  {
    if (!-[TPPBSecureElementIdentity isEqual:](secureElementIdentity, "isEqual:"))
      goto LABEL_49;
  }
  walrus = self->_walrus;
  if ((unint64_t)walrus | *((_QWORD *)v4 + 15))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](walrus, "isEqual:"))
      goto LABEL_49;
  }
  webAccess = self->_webAccess;
  if ((unint64_t)webAccess | *((_QWORD *)v4 + 16))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](webAccess, "isEqual:"))
      goto LABEL_49;
  }
  v19 = (*((_BYTE *)v4 + 140) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 0x10) != 0)
    {
      if (self->_isInheritedAccount)
      {
        if (!*((_BYTE *)v4 + 136))
          goto LABEL_49;
      }
      else if (*((_BYTE *)v4 + 136))
      {
        goto LABEL_49;
      }
      v19 = 1;
      goto LABEL_50;
    }
LABEL_49:
    v19 = 0;
  }
LABEL_50:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v20 = 2654435761u * self->_clock;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v19 = 2654435761u * self->_frozenPolicyVersion;
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_6:
  v18 = -[NSString hash](self->_frozenPolicyHash, "hash");
  v17 = -[NSMutableArray hash](self->_policySecrets, "hash");
  v16 = -[NSString hash](self->_osVersion, "hash");
  v15 = -[NSString hash](self->_deviceName, "hash");
  v14 = -[NSData hash](self->_recoverySigningPublicKey, "hash");
  v13 = -[NSData hash](self->_recoveryEncryptionPublicKey, "hash");
  v3 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761u * self->_flexiblePolicyVersion;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_flexiblePolicyHash, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_userControllableViewStatus;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_custodianRecoveryKeys, "hash");
  v8 = -[TPPBSecureElementIdentity hash](self->_secureElementIdentity, "hash");
  v9 = -[TPPBPeerStableInfoSetting hash](self->_walrus, "hash");
  v10 = -[TPPBPeerStableInfoSetting hash](self->_webAccess, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_isInheritedAccount;
  else
    v11 = 0;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  TPPBSecureElementIdentity *secureElementIdentity;
  unint64_t v18;
  TPPBPeerStableInfoSetting *walrus;
  unint64_t v20;
  TPPBPeerStableInfoSetting *webAccess;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 140);
  if ((v6 & 1) != 0)
  {
    self->_clock = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 140);
  }
  if ((v6 & 4) != 0)
  {
    self->_frozenPolicyVersion = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (v4[7])
    -[TPPBPeerStableInfo setFrozenPolicyHash:](self, "setFrozenPolicyHash:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (id)v5[9];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        -[TPPBPeerStableInfo addPolicySecrets:](self, "addPolicySecrets:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  if (v5[8])
    -[TPPBPeerStableInfo setOsVersion:](self, "setOsVersion:");
  if (v5[5])
    -[TPPBPeerStableInfo setDeviceName:](self, "setDeviceName:");
  if (v5[11])
    -[TPPBPeerStableInfo setRecoverySigningPublicKey:](self, "setRecoverySigningPublicKey:");
  if (v5[10])
    -[TPPBPeerStableInfo setRecoveryEncryptionPublicKey:](self, "setRecoveryEncryptionPublicKey:");
  if (v5[13])
    -[TPPBPeerStableInfo setSerialNumber:](self, "setSerialNumber:");
  if ((*((_BYTE *)v5 + 140) & 2) != 0)
  {
    self->_flexiblePolicyVersion = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v5[6])
    -[TPPBPeerStableInfo setFlexiblePolicyHash:](self, "setFlexiblePolicyHash:");
  if ((*((_BYTE *)v5 + 140) & 8) != 0)
  {
    self->_userControllableViewStatus = *((_DWORD *)v5 + 28);
    *(_BYTE *)&self->_has |= 8u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (id)v5[4];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        -[TPPBPeerStableInfo addCustodianRecoveryKeys:](self, "addCustodianRecoveryKeys:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  secureElementIdentity = self->_secureElementIdentity;
  v18 = v5[12];
  if (secureElementIdentity)
  {
    if (v18)
      -[TPPBSecureElementIdentity mergeFrom:](secureElementIdentity, "mergeFrom:");
  }
  else if (v18)
  {
    -[TPPBPeerStableInfo setSecureElementIdentity:](self, "setSecureElementIdentity:");
  }
  walrus = self->_walrus;
  v20 = v5[15];
  if (walrus)
  {
    if (v20)
      -[TPPBPeerStableInfoSetting mergeFrom:](walrus, "mergeFrom:");
  }
  else if (v20)
  {
    -[TPPBPeerStableInfo setWalrus:](self, "setWalrus:");
  }
  webAccess = self->_webAccess;
  v22 = v5[16];
  if (webAccess)
  {
    if (v22)
      -[TPPBPeerStableInfoSetting mergeFrom:](webAccess, "mergeFrom:");
  }
  else if (v22)
  {
    -[TPPBPeerStableInfo setWebAccess:](self, "setWebAccess:");
  }
  if ((*((_BYTE *)v5 + 140) & 0x10) != 0)
  {
    self->_isInheritedAccount = *((_BYTE *)v5 + 136);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)frozenPolicyVersion
{
  return self->_frozenPolicyVersion;
}

- (NSString)frozenPolicyHash
{
  return self->_frozenPolicyHash;
}

- (void)setFrozenPolicyHash:(id)a3
{
  objc_storeStrong((id *)&self->_frozenPolicyHash, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSData)recoverySigningPublicKey
{
  return self->_recoverySigningPublicKey;
}

- (void)setRecoverySigningPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoverySigningPublicKey, a3);
}

- (NSData)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey;
}

- (void)setRecoveryEncryptionPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryEncryptionPublicKey, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (unint64_t)flexiblePolicyVersion
{
  return self->_flexiblePolicyVersion;
}

- (NSString)flexiblePolicyHash
{
  return self->_flexiblePolicyHash;
}

- (void)setFlexiblePolicyHash:(id)a3
{
  objc_storeStrong((id *)&self->_flexiblePolicyHash, a3);
}

- (NSMutableArray)policySecrets
{
  return self->_policySecrets;
}

- (void)setPolicySecrets:(id)a3
{
  objc_storeStrong((id *)&self->_policySecrets, a3);
}

- (NSMutableArray)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setCustodianRecoveryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, a3);
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setSecureElementIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementIdentity, a3);
}

- (TPPBPeerStableInfoSetting)walrus
{
  return self->_walrus;
}

- (void)setWalrus:(id)a3
{
  objc_storeStrong((id *)&self->_walrus, a3);
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return self->_webAccess;
}

- (void)setWebAccess:(id)a3
{
  objc_storeStrong((id *)&self->_webAccess, a3);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_recoverySigningPublicKey, 0);
  objc_storeStrong((id *)&self->_recoveryEncryptionPublicKey, 0);
  objc_storeStrong((id *)&self->_policySecrets, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_frozenPolicyHash, 0);
  objc_storeStrong((id *)&self->_flexiblePolicyHash, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, 0);
}

+ (Class)policySecretsType
{
  return (Class)objc_opt_class();
}

+ (Class)custodianRecoveryKeysType
{
  return (Class)objc_opt_class();
}

@end
