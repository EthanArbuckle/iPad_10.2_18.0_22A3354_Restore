@implementation SUItemDataSource

+ (void)setSharedDataSource:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedInstance_3 != a3)
  {

    __SharedInstance_3 = (uint64_t)a3;
  }
  _os_nospin_lock_unlock();
}

+ (id)sharedDataSource
{
  id v2;
  id v3;

  _os_nospin_lock_lock();
  v2 = (id)__SharedInstance_3;
  if (!__SharedInstance_3)
  {
    v2 = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance_3 = (uint64_t)v2;
  }
  v3 = v2;
  _os_nospin_lock_unlock();
  return v3;
}

- (int64_t)estimatedDiskSpaceNeededForItem:(id)a3 storeOffer:(id)a4
{
  int64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "mediaFileSize");
  if (objc_msgSend(a3, "itemType") == 2000)
    return (uint64_t)((double)v5 * 2.5);
  else
    return v5;
}

- (int64_t)itemTypeForItem:(id)a3
{
  int64_t result;

  result = -[SUItemDataSource itemTypeForTypeString:](self, "itemTypeForTypeString:", objc_msgSend(a3, "itemTypeString"));
  if (!result)
    return -[SUItemDataSource itemTypeForTypeString:](self, "itemTypeForTypeString:", objc_msgSend(a3, "stringValueForProperty:", CFSTR("type")));
  return result;
}

- (int64_t)itemTypeForTypeString:(id)a3
{
  uint64_t v4;

  v4 = 0;
  while (!-[__CFString isEqualToString:](*(__CFString **)((char *)&kItemTypes + v4), "isEqualToString:", a3))
  {
    v4 += 16;
    if (v4 == 496)
      return 0;
  }
  return *(int64_t *)((char *)&kItemTypes + v4 + 8);
}

- (id)newDisplayItemValidationTestsForItem:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", +[SUItemValidatorTest defaultTest](SUItemValidatorRatingTest, "defaultTest"), 0);
}

- (id)newExternalDownloadWithItem:(id)a3 storeOffer:(id)a4
{
  void *v7;

  if (objc_msgSend(a3, "itemType") == 11)
    return -[SUItemDataSource _newDownloadForDocumentItem:storeOffer:](self, "_newDownloadForDocumentItem:storeOffer:", a3, a4);
  v7 = (void *)objc_msgSend(a3, "itemMediaKind");
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB2710]))
    return -[SUItemDataSource _newDownloadForDocumentItem:storeOffer:](self, "_newDownloadForDocumentItem:storeOffer:", a3, a4);
  if (objc_msgSend(a3, "itemType") == 1007)
    return -[SUItemDataSource _newDownloadForPodcastEpisode:storeOffer:](self, "_newDownloadForPodcastEpisode:storeOffer:", a3, a4);
  return 0;
}

- (id)newItemWithItemDictionary:(id)a3
{
  SUItem *v4;

  v4 = -[SUItem initWithDictionary:]([SUItem alloc], "initWithDictionary:", a3);
  -[SUItem setItemType:](v4, "setItemType:", -[SUItemDataSource itemTypeForItem:](self, "itemTypeForItem:", v4));
  return v4;
}

- (id)newPurchaseWithItem:(id)a3 storeOffer:(id)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (objc_msgSend((id)objc_msgSend(a4, "buyParameters"), "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E48]), "initWithItemDictionary:", objc_msgSend(a3, "itemDictionary"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F78]), "initWithItem:offer:", v7, a4);
    v9 = -[SUItemDataSource _thumbnailImageForItem:](self, "_thumbnailImageForItem:", a3);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isPrerendered"));
      objc_msgSend(v8, "setValue:forDownloadProperty:", v11, *MEMORY[0x24BEB2330]);
      v12 = objc_msgSend((id)objc_msgSend(v10, "URL"), "absoluteString");
      objc_msgSend(v8, "setValue:forDownloadProperty:", v12, *MEMORY[0x24BEB2468]);
    }

    v13 = objc_msgSend(a3, "itemType");
    if (v8 && (v13 == 1011 || v13 == 1005))
    {
      v14 = -[SUItemDataSource _newTonePurchaseWithPurchase:](self, "_newTonePurchaseWithPurchase:", v8);
      objc_msgSend(v14, "setAllowedToneStyles:", objc_msgSend(a4, "allowedToneStyles"));

      return v14;
    }
  }
  else
  {
    objc_msgSend(a3, "itemType");
    return 0;
  }
  return v8;
}

- (id)typeStringForItemType:(int64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while (*(__CFString **)((char *)&kItemTypes + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 496)
      return 0;
  }
  return *(__CFString **)((char *)&kItemTypes + v3);
}

- (id)_newDownloadForDocumentItem:(id)a3 storeOffer:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "URL");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x24BEB1E08]);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v8, "setValue:forProperty:", v9, *MEMORY[0x24BEB23A0]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E48]), "initWithItemDictionary:", objc_msgSend(a3, "itemDictionary"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E30]), "initWithItem:offer:", v10, a4);
  objc_msgSend(v11, "setKind:", *MEMORY[0x24BEB2280]);
  objc_msgSend(v8, "setValuesWithStoreDownloadMetadata:", v11);

  v12 = objc_alloc(MEMORY[0x24BEB1E10]);
  v13 = (void *)objc_msgSend(v12, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v7));
  objc_msgSend(v8, "addAsset:forType:", v13, *MEMORY[0x24BEB2248]);

  return v8;
}

- (id)_newDownloadForPodcastEpisode:(id)a3 storeOffer:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  v7 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "URL");
  if (!v7)
    return 0;
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x24BEB1E08]);
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v9, "setValue:forProperty:", v10, *MEMORY[0x24BEB23A0]);
  v11 = -[SUItemDataSource _newDownloadMetadataForPodcastEpisode:storeOffer:](self, "_newDownloadMetadataForPodcastEpisode:storeOffer:", a3, a4);
  objc_msgSend(v9, "setValuesWithStoreDownloadMetadata:", v11);

  v12 = objc_alloc(MEMORY[0x24BEB1E10]);
  v13 = (void *)objc_msgSend(v12, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v8));
  objc_msgSend(v9, "addAsset:forType:", v13, *MEMORY[0x24BEB2248]);

  v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "itemImageCollection"), "bestImageForSize:", 600.0, 600.0);
  if (v14
    || (v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "containerItem"), "itemImageCollection"), "bestImageForSize:", 600.0, 600.0)) != 0)
  {
    v15 = objc_alloc(MEMORY[0x24BEB1E10]);
    v16 = (void *)objc_msgSend(v15, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", objc_msgSend(v14, "URL")));
    objc_msgSend(v9, "addAsset:forType:", v16, *MEMORY[0x24BEB2240]);

  }
  v17 = objc_msgSend(a3, "stringValueForProperty:", CFSTR("podcast-feed-url"));
  if (v17
    || (v17 = objc_msgSend((id)objc_msgSend(a3, "containerItem"), "stringValueForProperty:", CFSTR("podcast-feed-url"))) != 0)
  {
    v18 = objc_alloc(MEMORY[0x24BEB1E10]);
    v19 = (void *)objc_msgSend(v18, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17)));
    objc_msgSend(v9, "addAsset:forType:", v19, *MEMORY[0x24BEB2250]);

  }
  return v9;
}

- (id)_newDownloadMetadataForPodcastEpisode:(id)a3 storeOffer:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "itemDictionary"), "mutableCopy");
  v8 = objc_msgSend(v7, "objectForKey:", CFSTR("url"));
  if (v8)
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8), "sanitizedURL");
    if (v9)
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v9, "absoluteString"), CFSTR("url"));
  }
  if (!objc_msgSend(v7, "objectForKey:", CFSTR("podcast-feed-url")))
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "containerItem"), "stringValueForProperty:", CFSTR("podcast-feed-url"));
    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("podcast-feed-url"));
  }
  v11 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "fullDurationInMilliseconds");
  if ((v11 & 0x8000000000000000) == 0)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11), CFSTR("duration"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E30]), "initWithDictionary:", v7);
  objc_msgSend(v12, "setItemIdentifier:", objc_msgSend(a3, "itemIdentifier"));
  objc_msgSend(v12, "setSubtitle:", objc_msgSend(a3, "artistName"));
  objc_msgSend(v12, "setThumbnailImageURL:", objc_msgSend(-[SUItemDataSource _thumbnailImageForItem:](self, "_thumbnailImageForItem:", a3), "URL"));
  objc_msgSend(v12, "setTitle:", objc_msgSend(a3, "unmodifiedTitle"));
  v13 = (void *)objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "mediaKind");
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEB2728]);
  v15 = (_QWORD *)MEMORY[0x24BEB22D0];
  if (!v14)
    v15 = (_QWORD *)MEMORY[0x24BEB22B0];
  objc_msgSend(v12, "setKind:", *v15);

  return v12;
}

- (id)_newTonePurchaseWithPurchase:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BEB1FE8]);
  objc_msgSend(v4, "setAccountIdentifier:", objc_msgSend(a3, "accountIdentifier"));
  objc_msgSend(v4, "setBuyParameters:", objc_msgSend(a3, "buyParameters"));
  objc_msgSend(v4, "setDownloadProperties:", objc_msgSend(a3, "downloadProperties"));
  return v4;
}

- (id)_thumbnailImageForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id result;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v4 = (void *)objc_msgSend(a3, "itemImageCollection");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "containerItem"), "itemImageCollection");
  if (objc_msgSend(a3, "itemType") == 2000)
  {
    v6 = (void *)objc_msgSend(a3, "softwareType");
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB2478]))
      v7 = (void *)objc_msgSend(v4, "imagesForKind:", *MEMORY[0x24BEB2648]);
    else
      v7 = 0;
    if (!objc_msgSend(v7, "count"))
      v7 = (void *)objc_msgSend(v4, "imagesForKind:", *MEMORY[0x24BEB2610]);
    if (objc_msgSend(v7, "count"))
      return (id)objc_msgSend(v7, "objectAtIndex:", 0);
    v11 = 57.0;
    v12 = v4;
    v13 = 57.0;
    return (id)objc_msgSend(v12, "bestImageForSize:", v11, v13);
  }
  result = (id)objc_msgSend(v4, "bestImageForSize:", 88.0, 88.0);
  if (!result)
  {
    result = (id)objc_msgSend(v5, "bestImageForSize:", 88.0, 88.0);
    if (!result)
    {
      v9 = *MEMORY[0x24BDBF148];
      v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
      result = (id)objc_msgSend(v4, "bestImageForSize:", *MEMORY[0x24BDBF148], v10);
      if (!result)
      {
        v12 = v5;
        v11 = v9;
        v13 = v10;
        return (id)objc_msgSend(v12, "bestImageForSize:", v11, v13);
      }
    }
  }
  return result;
}

@end
