@implementation SSRestoreContentItem

- (id)_initSSRestoreContentItem
{
  SSRestoreContentItem *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSRestoreContentItem;
  v2 = -[SSRestoreContentItem init](&v4, sel_init);
  if (v2)
    v2->_properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (SSRestoreContentItem)initWithRestoreDownload:(id)a3
{
  SSRestoreContentItem *v4;
  uint64_t i;
  uint64_t j;
  _BYTE v8[24];
  _QWORD v9[3];
  _BYTE v10[96];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v4 = -[SSRestoreContentItem _initSSRestoreContentItem](self, "_initSSRestoreContentItem");
  if (v4)
  {
    v11[0] = CFSTR("c");
    v11[1] = CFSTR("A");
    v11[2] = CFSTR("1");
    v11[3] = CFSTR("V");
    v11[4] = CFSTR("U");
    v11[5] = CFSTR("Z");
    v11[6] = CFSTR("4");
    v11[7] = CFSTR("T");
    v11[8] = CFSTR("7");
    v11[9] = CFSTR("01");
    v11[10] = CFSTR("Y");
    v11[11] = CFSTR("R");
    objc_msgSend(a3, "getValues:forProperties:count:", v10, v11, 12);
    for (i = 0; i != 12; ++i)
      -[SSRestoreContentItem setValue:forDownloadProperty:](v4, "setValue:forDownloadProperty:", *(_QWORD *)&v10[i * 8], v11[i]);
    v9[0] = CFSTR("h");
    v9[1] = CFSTR("f");
    v9[2] = CFSTR("g");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "assetsForType:", CFSTR("media")), "lastObject"), "getValues:forProperties:count:", v8, v9, 3);
    for (j = 0; j != 3; ++j)
      -[SSRestoreContentItem setValue:forAssetProperty:](v4, "setValue:forAssetProperty:", *(_QWORD *)&v8[j * 8], v9[j]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRestoreContentItem;
  -[SSRestoreContentItem dealloc](&v3, sel_dealloc);
}

- (NSNumber)cloudItemID
{
  return (NSNumber *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("cloud-id"));
}

- (NSNumber)cloudMatchStatus
{
  return self->_cloudMatchStatus;
}

- (id)copyRestoreDictionary
{
  void *v3;
  void *v4;
  NSNumber *originalPurchaserAccountID;

  v3 = 0;
  if (-[SSRestoreContentItem isEligibleForRestore:](self, "isEligibleForRestore:", 0))
  {
    v3 = (void *)-[NSMutableDictionary mutableCopy](self->_properties, "mutableCopy");
    if (objc_msgSend(v3, "objectForKey:", CFSTR("flavor")))
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("drm-free"));
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("dimensions"));
    }
    v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("store-front-id"));
    if (v4
      || (v4 = (void *)objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "storeFrontIdentifier")) != 0)
    {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "integerValue")), CFSTR("store-front-id"));
    }
    originalPurchaserAccountID = self->_originalPurchaserAccountID;
    if (originalPurchaserAccountID)
      objc_msgSend(v3, "setObject:forKey:", originalPurchaserAccountID, CFSTR("ownerDsid"));
  }
  return v3;
}

- (NSString)downloadKind
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("kind"));
}

- (BOOL)isDRMFree
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("drm-free")), "BOOLValue");
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  BOOL v11;

  if (self->_isRestore)
  {
    v5 = SSGetItemIdentifierFromValue(-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("cloud-id")));
    v6 = SSGetItemIdentifierFromValue(-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("item-id")));
    v7 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("kind"));
    if (SSDownloadKindIsPodcastKind(v7))
    {
      if (!v6 && !-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("episode-guid")))
        goto LABEL_8;
    }
    else
    {
      if (!(v5 | v6))
      {
LABEL_8:
        v8 = 116;
        goto LABEL_24;
      }
      if (!self->_accountID && !self->_appleID)
      {
        v8 = 119;
        goto LABEL_24;
      }
      if (!v7)
      {
        v8 = 117;
        goto LABEL_24;
      }
      if (SSDownloadKindIsMediaKind(v7))
      {
        if (-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("dimensions")))
          goto LABEL_20;
      }
      else if ((SSDownloadKindIsEBookKind(v7, v9) & 1) == 0 && !SSDownloadKindIsToneKind(v7))
      {
        v11 = 0;
        v10 = 0;
        goto LABEL_25;
      }
      if (!-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("drm-free"))
        && !-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("flavor")))
      {
        v8 = 118;
        goto LABEL_24;
      }
    }
LABEL_20:
    v10 = 0;
    v11 = 1;
    goto LABEL_25;
  }
  v8 = 100;
LABEL_24:
  v10 = (void *)SSError((uint64_t)CFSTR("SSErrorDomain"), v8, 0, 0);
  v11 = 0;
LABEL_25:
  if (a3)
    *a3 = v10;
  return v11;
}

- (NSString)podcastEpisodeGUID
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("episode-guid"));
}

- (void)setCloudItemID:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("cloud-id"));
}

- (void)setCloudMatchStatus:(id)a3
{
  NSNumber *cloudMatchStatus;

  cloudMatchStatus = self->_cloudMatchStatus;
  if (cloudMatchStatus != a3)
  {

    self->_cloudMatchStatus = (NSNumber *)a3;
  }
}

- (void)setDownloadKind:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("kind"));
}

- (void)setDRMFree:(BOOL)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("drm-free"));
}

- (void)setStoreOriginalPurchaserAccountID:(id)a3
{
  NSNumber *originalPurchaserAccountID;

  originalPurchaserAccountID = self->_originalPurchaserAccountID;
  if (originalPurchaserAccountID != a3)
  {

    self->_originalPurchaserAccountID = (NSNumber *)a3;
  }
}

- (void)setPodcastEpisodeGUID:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("episode-guid"));
}

- (void)setStoreAccountAppleID:(id)a3
{
  NSString *appleID;

  appleID = self->_appleID;
  if (appleID != a3)
  {

    self->_appleID = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setStoreAccountID:(id)a3
{
  NSNumber *accountID;

  accountID = self->_accountID;
  if (accountID != a3)
  {

    self->_accountID = (NSNumber *)a3;
  }
}

- (void)setStoreFlavor:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("flavor"));
}

- (void)setStoreFrontID:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("store-front-id"));
}

- (void)setStoreItemID:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("item-id"));
}

- (void)setStoreSoftwareVersionID:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("software-external-version-identifier"));
}

- (void)setTitle:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("title"));
}

- (void)setValue:(id)a3 forAssetProperty:(id)a4
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, -[SSRestoreContentItem _restoreKeyForAssetProperty:](self, "_restoreKeyForAssetProperty:", a4));
}

- (void)setValue:(id)a3 forDownloadProperty:(id)a4
{
  id v7;

  v7 = -[SSRestoreContentItem _restoreKeyForDownloadProperty:](self, "_restoreKeyForDownloadProperty:", a4);
  if (v7)
  {
    -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, v7);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("c")))
  {
    -[SSRestoreContentItem setBundleID:](self, "setBundleID:", a3);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("V")))
  {
    self->_isRestore = objc_msgSend(a3, "BOOLValue");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("Z")))
  {
    -[SSRestoreContentItem setStoreAccountAppleID:](self, "setStoreAccountAppleID:", a3);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("U")))
  {
    -[SSRestoreContentItem setStoreAccountID:](self, "setStoreAccountID:", a3);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("01")))
  {
    -[SSRestoreContentItem setCloudMatchStatus:](self, "setCloudMatchStatus:", a3);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("2")))
  {
    -[SSRestoreContentItem setTitle:](self, "setTitle:", a3);
  }
}

- (void)setVideoDimensions:(id)a3
{
  -[SSRestoreContentItem _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("dimensions"));
}

- (NSString)storeAccountAppleID
{
  return self->_appleID;
}

- (NSNumber)storeAccountID
{
  return self->_accountID;
}

- (NSString)storeFlavor
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("flavor"));
}

- (NSString)storeFrontID
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("store-front-id"));
}

- (NSNumber)storeItemID
{
  return (NSNumber *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("item-id"));
}

- (NSNumber)storeOriginalPurchaserAccountID
{
  return self->_originalPurchaserAccountID;
}

- (NSString)storeSoftwareVersionID
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("software-external-version-identifier"));
}

- (NSString)title
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("title"));
}

- (NSString)videoDimensions
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("dimensions"));
}

- (id)_restoreKeyForAssetProperty:(id)a3
{
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;

  v4 = 0;
  v9 = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("f");
  v7 = CFSTR("g");
  v8 = CFSTR("h");
  while (!objc_msgSend(*(id *)((char *)&v6 + v4 * 8), "isEqualToString:", a3, v6, v7, v8, v9))
  {
    if (++v4 == 3)
      return 0;
  }
  return off_1E47BD5C8[v4];
}

- (id)_restoreKeyForDownloadProperty:(id)a3
{
  uint64_t v4;
  _QWORD v6[7];

  v4 = 0;
  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("1");
  v6[1] = CFSTR("A");
  v6[2] = CFSTR("7");
  v6[3] = CFSTR("4");
  v6[4] = CFSTR("T");
  v6[5] = CFSTR("R");
  while (!objc_msgSend((id)v6[v4], "isEqualToString:", a3))
  {
    if (++v4 == 6)
      return 0;
  }
  return off_1E47BD5E0[v4];
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v7;

  if (a4)
  {
    if (a3)
    {
      if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EE6724F0) & 1) != 0)
      {
        v7 = (id)objc_msgSend(a3, "copy");
        -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v7, a4);

      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
      }
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", a4);
    }
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
