@implementation AddressBookObserver

- (AddressBookObserver)init
{
  AddressBookObserver *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AddressBookObserver;
  v2 = -[AddressBookObserver init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_handleCNContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1006C2C64, CNFavoritesChangedExternallyNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[AddressBookObserver _initializePrimaryFolderVersions](v2, "_initializePrimaryFolderVersions");
    -[AddressBookObserver _initializeSecondaryFolderVersions](v2, "_initializeSecondaryFolderVersions");
    -[AddressBookObserver _initializeDatabaseIdentifer](v2, "_initializeDatabaseIdentifer");
  }
  return v2;
}

- ($5E5F304956FB491AF6F034FDF0808287)getPrimaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  $5E5F304956FB491AF6F034FDF0808287 result;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver primaryFolderVersions](self, "primaryFolderVersions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v16 = 0;
  v17 = 0;
  objc_msgSend(v7, "getValue:", &v16);
  v8 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_INFO))
  {
    v10 = v16;
    v9 = HIDWORD(v16);
    v12 = v17;
    v11 = HIDWORD(v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver _addressBookToString:](self, "_addressBookToString:", v3));
    *(_DWORD *)buf = 67110146;
    v19 = v10;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v12;
    v24 = 1024;
    v25 = v11;
    v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retrieving primary folder version %u-%u-%u-%u for '%@'", buf, 0x24u);

  }
  v14 = v16;
  v15 = v17;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- ($5E5F304956FB491AF6F034FDF0808287)getSecondaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  $5E5F304956FB491AF6F034FDF0808287 result;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver secondaryFolderVersions](self, "secondaryFolderVersions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v16 = 0;
  v17 = 0;
  objc_msgSend(v7, "getValue:", &v16);
  v8 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_INFO))
  {
    v10 = v16;
    v9 = HIDWORD(v16);
    v12 = v17;
    v11 = HIDWORD(v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver _addressBookToString:](self, "_addressBookToString:", v3));
    *(_DWORD *)buf = 67110146;
    v19 = v10;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v12;
    v24 = 1024;
    v25 = v11;
    v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retrieving secondary folder version %u-%u-%u-%u for '%@'", buf, 0x24u);

  }
  v14 = v16;
  v15 = v17;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- ($5E5F304956FB491AF6F034FDF0808287)getDatabaseIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  _QWORD v17[2];
  $5E5F304956FB491AF6F034FDF0808287 result;

  v17[0] = 0;
  v17[1] = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver databaseIdentifier](self, "databaseIdentifier"));
  objc_msgSend(v2, "getUUIDBytes:", v17);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 16));
  v7 = 0;
  v8 = 0;
  objc_msgSend(v3, "getBytes:range:", &v7, 0, 4);
  objc_msgSend(v3, "getBytes:range:", (char *)&v7 + 4, 4, 4);
  objc_msgSend(v3, "getBytes:range:", &v8, 8, 4);
  objc_msgSend(v3, "getBytes:range:", (char *)&v8 + 4, 12, 4);
  v4 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    v10 = v7;
    v11 = 1024;
    v12 = HIDWORD(v7);
    v13 = 1024;
    v14 = v8;
    v15 = 1024;
    v16 = HIDWORD(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Retrieving database identifier %u-%u-%u-%u", buf, 0x1Au);
  }

  v5 = v7;
  v6 = v8;
  result.var2 = v6;
  result.var3 = HIDWORD(v6);
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (void)incrementMainAddressBookVersions
{
  -[AddressBookObserver _incrementPrimaryFolderVersionForAddressBook:](self, "_incrementPrimaryFolderVersionForAddressBook:", 2);
  -[AddressBookObserver _incrementSecondaryFolderVersionForAddressBook:](self, "_incrementSecondaryFolderVersionForAddressBook:", 2);
}

- (void)_incrementPrimaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;

  v3 = *(_QWORD *)&a3;
  v5 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver _addressBookToString:](self, "_addressBookToString:", v3));
    LODWORD(v11) = 138412290;
    *(_QWORD *)((char *)&v11 + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incrementing primary folder version for '%@'", (uint8_t *)&v11, 0xCu);

  }
  *(_QWORD *)&v11 = -[AddressBookObserver getPrimaryFolderVersionForAddressBook:](self, "getPrimaryFolderVersionForAddressBook:", v3);
  *((_QWORD *)&v11 + 1) = v7;
  if (-[AddressBookObserver _incrementOI_UINT128:](self, "_incrementOI_UINT128:", &v11))
    -[AddressBookObserver _initializeDatabaseIdentifer](self, "_initializeDatabaseIdentifer");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", &v11, "{?=IIII}"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver primaryFolderVersions](self, "primaryFolderVersions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

}

- (void)_incrementSecondaryFolderVersionForAddressBook:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;

  v3 = *(_QWORD *)&a3;
  v5 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver _addressBookToString:](self, "_addressBookToString:", v3));
    LODWORD(v11) = 138412290;
    *(_QWORD *)((char *)&v11 + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incrementing secondary folder version for '%@'", (uint8_t *)&v11, 0xCu);

  }
  *(_QWORD *)&v11 = -[AddressBookObserver getSecondaryFolderVersionForAddressBook:](self, "getSecondaryFolderVersionForAddressBook:", v3);
  *((_QWORD *)&v11 + 1) = v7;
  if (-[AddressBookObserver _incrementOI_UINT128:](self, "_incrementOI_UINT128:", &v11))
    -[AddressBookObserver _initializeDatabaseIdentifer](self, "_initializeDatabaseIdentifer");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", &v11, "{?=IIII}"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver secondaryFolderVersions](self, "secondaryFolderVersions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

}

- (BOOL)_incrementOI_UINT128:(id *)a3
{
  unsigned int var3;
  BOOL result;
  unsigned int var2;
  unsigned int var1;

  var3 = a3->var3;
  if (var3 == -1)
  {
    var2 = a3->var2;
    if (var2 == -1)
    {
      var1 = a3->var1;
      result = var1 == -1 && a3->var0++ == -1;
      a3->var1 = var1 + 1;
    }
    else
    {
      result = 0;
    }
    a3->var2 = var2 + 1;
  }
  else
  {
    result = 0;
  }
  a3->var3 = var3 + 1;
  return result;
}

- (void)_initializePrimaryFolderVersions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[2];
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  -[AddressBookObserver setPrimaryFolderVersions:](self, "setPrimaryFolderVersions:", v3);

  v14[0] = 0;
  v14[1] = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", v14, "{?=IIII}"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(&off_100961368, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&off_100961368);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver primaryFolderVersions](self, "primaryFolderVersions"));
        objc_msgSend(v9, "setObject:forKey:", v4, v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_100961368, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

- (void)_initializeSecondaryFolderVersions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[2];
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  -[AddressBookObserver setSecondaryFolderVersions:](self, "setSecondaryFolderVersions:", v3);

  v14[0] = 0;
  v14[1] = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", v14, "{?=IIII}"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(&off_100961380, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&off_100961380);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookObserver secondaryFolderVersions](self, "secondaryFolderVersions"));
        objc_msgSend(v9, "setObject:forKey:", v4, v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_100961380, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

- (void)_initializeDatabaseIdentifer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[AddressBookObserver setDatabaseIdentifier:](self, "setDatabaseIdentifier:");

}

- (id)_addressBookToString:(int)a3
{
  if ((a3 - 2) > 6)
    return CFSTR("Invalid");
  else
    return off_100940988[a3 - 2];
}

- (void)_handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = qword_100999888;
  if (os_log_type_enabled((os_log_t)qword_100999888, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received 'contact store changed' notification", v6, 2u);
  }
  -[AddressBookObserver _incrementPrimaryFolderVersionForAddressBook:](self, "_incrementPrimaryFolderVersionForAddressBook:", 2);
  -[AddressBookObserver _incrementSecondaryFolderVersionForAddressBook:](self, "_incrementSecondaryFolderVersionForAddressBook:", 2);

}

- (NSMutableDictionary)primaryFolderVersions
{
  return self->_primaryFolderVersions;
}

- (void)setPrimaryFolderVersions:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFolderVersions, a3);
}

- (NSMutableDictionary)secondaryFolderVersions
{
  return self->_secondaryFolderVersions;
}

- (void)setSecondaryFolderVersions:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFolderVersions, a3);
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_databaseIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFolderVersions, 0);
  objc_storeStrong((id *)&self->_primaryFolderVersions, 0);
}

@end
