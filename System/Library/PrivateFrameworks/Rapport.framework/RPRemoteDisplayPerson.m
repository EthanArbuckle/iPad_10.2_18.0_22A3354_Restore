@implementation RPRemoteDisplayPerson

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayPerson)initWithCoder:(id)a3
{
  id v4;
  RPRemoteDisplayPerson *v5;
  id v6;
  id v7;
  id v8;
  RPRemoteDisplayPerson *v9;
  objc_super v11;
  uint64_t v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRemoteDisplayPerson;
  v5 = -[RPRemoteDisplayPerson init](&v11, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v12;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *accountAltDSID;
  NSString *accountID;
  NSString *contactID;
  NSMutableArray *discoveredDevices;
  uint64_t flags;
  id v10;

  v4 = a3;
  accountAltDSID = self->_accountAltDSID;
  v10 = v4;
  if (accountAltDSID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", accountAltDSID, CFSTR("_altDSID"));
    v4 = v10;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", accountID, CFSTR("_aID"));
    v4 = v10;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", contactID, CFSTR("_cnID"));
    v4 = v10;
  }
  discoveredDevices = self->_discoveredDevices;
  if (discoveredDevices)
  {
    objc_msgSend(v10, "encodeObject:forKey:", discoveredDevices, CFSTR("_dv"));
    v4 = v10;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", flags, CFSTR("_fl"));
    v4 = v10;
  }

}

- (id)description
{
  return -[RPRemoteDisplayPerson descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  NSString *accountAltDSID;
  id v8;
  NSString *contactID;
  id v10;
  id v11;
  id v12;
  NSString *accountID;
  NSString *v15;
  void *v16;

  if (a3 <= 49)
    v4 = 100;
  else
    v4 = 8;
  accountID = self->_accountID;
  NSAppendPrintF();
  v5 = 0;
  v6 = v5;
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    v16 = v5;
    accountID = accountAltDSID;
    NSAppendPrintF();
    v8 = v16;

    v6 = v8;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    accountID = (NSString *)v4;
    v15 = contactID;
    NSAppendPrintF();
    v10 = v6;

    v6 = v10;
  }
  if (-[NSMutableArray count](self->_discoveredDevices, "count", accountID, v15))
  {
    NSAppendPrintF();
    v11 = v6;

    v6 = v11;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    v12 = v6;

    v6 = v12;
  }
  return v6;
}

- (id)initPersonWithDevice:(id)a3
{
  id v4;
  RPRemoteDisplayPerson *v5;
  uint64_t v6;
  NSString *accountAltDSID;
  uint64_t v8;
  NSString *accountID;
  uint64_t v10;
  NSString *contactID;
  uint64_t v12;
  NSMutableArray *discoveredDevices;
  int v14;
  RPRemoteDisplayPerson *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RPRemoteDisplayPerson;
  v5 = -[RPRemoteDisplayPerson init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accountAltDSID");
    v6 = objc_claimAutoreleasedReturnValue();
    accountAltDSID = v5->_accountAltDSID;
    v5->_accountAltDSID = (NSString *)v6;

    objc_msgSend(v4, "accountID");
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    objc_msgSend(v4, "contactID");
    v10 = objc_claimAutoreleasedReturnValue();
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    v12 = objc_opt_new();
    discoveredDevices = v5->_discoveredDevices;
    v5->_discoveredDevices = (NSMutableArray *)v12;

    -[NSMutableArray addObject:](v5->_discoveredDevices, "addObject:", v4);
    if ((objc_msgSend(v4, "statusFlags") & 0x80000) != 0)
    {
      v14 = 1;
    }
    else
    {
      if ((objc_msgSend(v4, "statusFlags") & 0x1000000000) == 0)
      {
LABEL_7:
        v15 = v5;
        goto LABEL_8;
      }
      v14 = 2;
    }
    v5->_flags |= v14;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)addDevice:(id)a3
{
  id v4;
  RPRemoteDisplayPerson *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *discoveredDevices;
  uint64_t v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5->_discoveredDevices;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "isEqualToDevice:", v4, (_QWORD)v13) & 1) != 0)
        {

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  discoveredDevices = v5->_discoveredDevices;
  if (!discoveredDevices)
  {
    v11 = objc_opt_new();
    v12 = v5->_discoveredDevices;
    v5->_discoveredDevices = (NSMutableArray *)v11;

    discoveredDevices = v5->_discoveredDevices;
  }
  -[NSMutableArray addObject:](discoveredDevices, "addObject:", v4, (_QWORD)v13);
LABEL_13:
  objc_sync_exit(v5);

}

- (void)removeDevice:(id)a3
{
  id v4;
  RPRemoteDisplayPerson *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5->_discoveredDevices;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToDevice:", v4, (_QWORD)v12) & 1) != 0)
        {
          v11 = v10;

          if (v11)
            -[NSMutableArray removeObject:](v5->_discoveredDevices, "removeObject:", v11);
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = 0;
LABEL_12:
  objc_sync_exit(v5);

}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSMutableArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
}

@end
