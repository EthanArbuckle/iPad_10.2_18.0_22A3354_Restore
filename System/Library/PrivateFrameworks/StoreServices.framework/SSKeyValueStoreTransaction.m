@implementation SSKeyValueStoreTransaction

- (void)removeAccountFromDomain:(id)a3
{
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountAvailableServiceTypes"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountURLBagType"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AltDSID"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AppleID"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountServiceTypes"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountIsNewCustomer"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountSocialEnabled"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountKind"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountSource"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountStoreFront"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("CreditDisplayString"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("DidFallbackToPassword"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("DSPersonID"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("UserName"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountITunesPassSerial"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("FirstName"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("LastName"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountFreeDownloadsPasswordSetting"));
  -[SSKeyValueStoreTransaction setValue:forDomain:key:](self, "setValue:forDomain:key:", 0, a3, CFSTR("AccountPaidPurchasesPasswordSetting"));
}

- (BOOL)setData:(id)a3 forDomain:(id)a4 key:(id)a5
{
  id v9;
  SSKeyValueStoreValueEntity *v10;
  BOOL v11;
  id v13;

  if (a3)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKey:", a4, CFSTR("domain"));
    objc_msgSend(v9, "setObject:forKey:", a5, CFSTR("key"));
    objc_msgSend(v9, "setObject:forKey:", a3, CFSTR("value"));
    v10 = -[SSSQLiteEntity initWithPropertyValues:inDatabase:]([SSKeyValueStoreValueEntity alloc], "initWithPropertyValues:inDatabase:", v9, -[SSKeyValueStoreSession database](self, "database"));
    v11 = v10 != 0;

    return v11;
  }
  v13 = -[SSKeyValueStoreSession existingEntityForDomain:key:](self, "existingEntityForDomain:key:", a4, a5);
  if (!v13)
    return 1;
  return objc_msgSend(v13, "deleteFromDatabase");
}

- (BOOL)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  void *v8;

  if (!a3)
    goto LABEL_4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  if (v8)
  {
    a3 = v8;
LABEL_4:
    LOBYTE(v8) = -[SSKeyValueStoreTransaction setData:forDomain:key:](self, "setData:forDomain:key:", a3, a4, a5);
  }
  return (char)v8;
}

@end
