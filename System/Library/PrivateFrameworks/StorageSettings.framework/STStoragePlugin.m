@implementation STStoragePlugin

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)identifier
{
  NSString *v3;
  void *v4;

  if (-[NSString length](self->_identifier, "length"))
  {
    v3 = self->_identifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setTips:(id)a3
{
  objc_storeStrong((id *)&self->_tips, a3);
}

- (NSArray)tips
{
  if (self->_tips)
    return self->_tips;
  else
    return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (void)notifyUsageChanged
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB1C88], "sharedNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postAppsStateChanged:", 0);

}

- (void)reloadTips
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("STStoragePluginReloadTipsNotification"), self);

}

- (void)reloadSpecifiersForApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BEB1C88];
  v4 = a3;
  objc_msgSend(v3, "sharedNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "notify:forBundleIDs:", CFSTR("STStoragePluginReloadSpecifiersNotification"), v6);
}

- (id)documentAppIdentifiers
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)documentSpecifiersForApp:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)externDataSizeAppIdentifiers
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (int64_t)externDataSizeForApp:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tips, 0);
}

@end
