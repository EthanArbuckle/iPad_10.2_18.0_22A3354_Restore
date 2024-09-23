@implementation ICQUIManageStorageListCell

- (id)getLazyIcon
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ICQUIDrilldownImage *v12;
  uint64_t v13;
  ICQUIDrilldownImage *v14;
  ICQUIDrilldownImage *v15;
  void *v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PSSpecifier objectForKeyedSubscript:](self->_currentSpecifier, "objectForKeyedSubscript:", CFSTR("DRILLDOWN_APP_INFO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "fetchLocally"))
    goto LABEL_12;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "bundleIds");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v5)
  {
LABEL_10:

    -[ICQUIManageStorageListCell _settingsIconCacheForAppInfo:](self, "_settingsIconCacheForAppInfo:", v3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [ICQUIDrilldownImage alloc];
      v4 = objc_retainAutorelease(v11);
      v13 = objc_msgSend(v4, "CGImage");
      v14 = v12;
LABEL_13:
      v9 = -[ICQUIDrilldownImage initWithCGImage:](v14, "initWithCGImage:", v13);
      goto LABEL_14;
    }
LABEL_12:
    v15 = [ICQUIDrilldownImage alloc];
    v18.receiver = self;
    v18.super_class = (Class)ICQUIManageStorageListCell;
    -[PSTableCell getLazyIcon](&v18, sel_getLazyIcon);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v4, "CGImage");
    v14 = v15;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = *(_QWORD *)v20;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v7)
      objc_enumerationMutation(v4);
    +[_ICQUIHelperFunctions appIconWithSize:forBundleID:](_ICQUIHelperFunctions, "appIconWithSize:forBundleID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8), 29.0, 29.0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      break;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
LABEL_14:
  v16 = (void *)v9;

  return v16;
}

+ (int64_t)cellStyle
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  objc_storeStrong((id *)&self->_currentSpecifier, a3);
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIManageStorageListCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, v5);
  -[ICQUIManageStorageListCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v7);
  -[ICQUIManageStorageListCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  -[ICQUIManageStorageListCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_settingsIconCacheForAppInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "bundleIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.CloudDocs"));

  if ((v5 & 1) != 0)
  {
    v6 = (_QWORD *)MEMORY[0x24BE75818];
  }
  else
  {
    objc_msgSend(v3, "bundleIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.__mobilebackup__"));

    if ((v8 & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x24BE75810];
    }
    else
    {
      objc_msgSend(v3, "bundleIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.siri"));

      if (!v10)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v6 = (_QWORD *)MEMORY[0x24BE75800];
    }
  }
  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageForKey:", *v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpecifier, 0);
}

@end
