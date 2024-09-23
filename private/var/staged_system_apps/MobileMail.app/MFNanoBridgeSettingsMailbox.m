@implementation MFNanoBridgeSettingsMailbox

+ (id)defaultSelectedMailboxes
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MFNanoBridgeSettingsUnifiedMailbox *v11;
  MFNanoBridgeSettingsSharedMailbox *v12;
  MFNanoBridgeSettingsSharedMailbox *v13;
  MFNanoBridgeSettingsSharedMailbox *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v8 = objc_opt_class(LocalAccount);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
          objc_msgSend(v2, "addObject:", v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v2, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v2, "count") + 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount nano_bridgeSettingsInboxesFromAccounts:](MailAccount, "nano_bridgeSettingsInboxesFromAccounts:", v2));
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v9, "addObjectsFromArray:", v10);
    if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    {
      v11 = -[MFNanoBridgeSettingsUnifiedMailbox initWithType:]([MFNanoBridgeSettingsUnifiedMailbox alloc], "initWithType:", 7);
      if (v11)
        objc_msgSend(v9, "addObject:", v11);

    }
    if (objc_msgSend(v2, "count"))
    {
      v12 = -[MFNanoBridgeSettingsSharedMailbox initWithType:]([MFNanoBridgeSettingsSharedMailbox alloc], "initWithType:", 3);
      objc_msgSend(v9, "addObject:", v12);

      v13 = -[MFNanoBridgeSettingsSharedMailbox initWithType:]([MFNanoBridgeSettingsSharedMailbox alloc], "initWithType:", 2);
      objc_msgSend(v9, "addObject:", v13);

      v14 = -[MFNanoBridgeSettingsSharedMailbox initWithType:]([MFNanoBridgeSettingsSharedMailbox alloc], "initWithType:", 1);
      objc_msgSend(v9, "addObject:", v14);

    }
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

+ (unint64_t)sourceTypeForMailboxFilterType:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 4;
      case 0x20uLL:
        return 6;
      case 0x40uLL:
        return 7;
    }
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        return 1;
      case 4uLL:
        return 2;
      case 8uLL:
        return 3;
    }
  }
  return 0;
}

- (unint64_t)mailboxFilterType
{
  return 0;
}

- (id)displayName
{
  return 0;
}

- (id)icon
{
  return 0;
}

- (unint64_t)level
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(self);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
