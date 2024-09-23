@implementation ICQUsageStorageMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_once != -1)
    dispatch_once(&sharedMonitor_once, &__block_literal_global_145);
  return (id)sharedMonitor_monitor;
}

void __39__ICQUsageStorageMonitor_sharedMonitor__block_invoke()
{
  ICQUsageStorageMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(ICQUsageStorageMonitor);
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;

}

- (ICQUsageStorageMonitor)init
{
  ICQUsageStorageMonitor *v2;
  ICQUsageStorageMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQUsageStorageMonitor;
  v2 = -[ICQUsageStorageMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICQUsageStorageMonitor fetchSystemSizeStrings](v2, "fetchSystemSizeStrings");
  return v3;
}

- (void)registerUsageStorageClient
{
  int64_t storageClientCount;
  __CFNotificationCenter *DarwinNotifyCenter;

  storageClientCount = self->_storageClientCount;
  self->_storageClientCount = storageClientCount + 1;
  if (!storageClientCount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AppDeleted, CFSTR("com.apple.mobile.application_deletion_complete"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
}

- (void)deregisterUsageStorageClient
{
  __assert_rtn("-[ICQUsageStorageMonitor deregisterUsageStorageClient]", "ICQUsageStorageMonitor.m", 536, "_storageClientCount > 0");
}

- (void)populateUsageDataWithProgressBlock:(id)a3
{
  ICQUsageStorageCache *v4;
  ICQUsageStorageCache *cache;
  id v6;

  v6 = a3;
  -[ICQUsageStorageMonitor clearUsageDataCache](self, "clearUsageDataCache");
  v4 = objc_alloc_init(ICQUsageStorageCache);
  cache = self->_cache;
  self->_cache = v4;

  -[ICQUsageStorageCache populateUsageDataWithProgressBlock:](self->_cache, "populateUsageDataWithProgressBlock:", v6);
}

- (void)clearUsageDataCache
{
  ICQUsageStorageCache *cache;

  -[ICQUsageStorageCache cancelUsageDataPopulation](self->_cache, "cancelUsageDataPopulation");
  cache = self->_cache;
  self->_cache = 0;

}

- (void)removeMediaCollectionCacheForKey:(id)a3
{
  -[ICQUsageStorageCache removeMediaCollectionCacheForKey:](self->_cache, "removeMediaCollectionCacheForKey:", a3);
}

- (id)mediaCollectionForKey:(id)a3
{
  return -[ICQUsageStorageCache mediaCollectionForKey:](self->_cache, "mediaCollectionForKey:", a3);
}

- (void)fetchSystemSizeStrings
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  id v14;

  v14 = (id)MGCopyAnswer();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BED86B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BED8690]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BED8698]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v7 = v6;
  objc_msgSend(v3, "floatValue");
  v9 = v8;
  objc_msgSend(v5, "floatValue");
  v11 = (float)(v9 - v10) - v7;
  *(float *)&v12 = v7;
  -[ICQUsageStorageMonitor _setAvailable:](self, "_setAvailable:", v12);
  *(float *)&v13 = v11;
  -[ICQUsageStorageMonitor setUsedSize:](self, "setUsedSize:", v13);

}

- (void)_setAvailable:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_availableSize != a3)
  {
    self->_availableSize = a3;
    if (self->_footerLabel)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIZE_available_DEVICE"), &stru_24E400750, CFSTR("Usage Statistics"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)self->_availableSize, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      DeviceName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_footerLabel, "setText:", v8);

    }
  }
}

- (NSArray)footerItems
{
  NSArray *footerItems;
  id v4;
  UILabel *v5;
  UILabel *footerLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *footerItem;
  void *v18;
  NSArray *v19;
  NSArray *v20;

  footerItems = self->_footerItems;
  if (!footerItems)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    footerLabel = self->_footerLabel;
    self->_footerLabel = v5;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_footerLabel, "setFont:", v7);

    PSToolbarLabelsTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_footerLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_footerLabel, "setBackgroundColor:", v9);

    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_footerLabel, "setLineBreakMode:", 5);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SIZE_available_DEVICE"), &stru_24E400750, CFSTR("Usage Statistics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)self->_availableSize, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DeviceName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_footerLabel, "setText:", v15);

    -[UILabel sizeToFit](self->_footerLabel, "sizeToFit");
    v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", self->_footerLabel);
    footerItem = self->_footerItem;
    self->_footerItem = v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v19 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v18, self->_footerItem, v18, 0);
    v20 = self->_footerItems;
    self->_footerItems = v19;

    footerItems = self->_footerItems;
  }
  return footerItems;
}

- (void)flushViews
{
  NSArray *footerItems;
  UIBarButtonItem *footerItem;
  UILabel *footerLabel;

  footerItems = self->_footerItems;
  self->_footerItems = 0;

  footerItem = self->_footerItem;
  self->_footerItem = 0;

  footerLabel = self->_footerLabel;
  self->_footerLabel = 0;

}

- (float)availableSize
{
  return self->_availableSize;
}

- (float)usedSize
{
  return self->_usedSize;
}

- (void)setUsedSize:(float)a3
{
  self->_usedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_footerItems, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_footerItem, 0);
}

@end
