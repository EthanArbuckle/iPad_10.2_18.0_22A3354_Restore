@implementation SUItem

- (SUItem)initWithDictionary:(id)a3
{
  SUItem *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUItem;
  v4 = -[SUItem init](&v7, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", a3);
    v4->_dictionary = (NSDictionary *)objc_msgSend((id)objc_msgSend(v5, "dictionaryByEvaluatingConditions"), "copy");
    v4->_isInstalled = -1;

    -[SUItem _reloadProperties](v4, "_reloadProperties");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItem;
  -[SUItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_collectionName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = self->_containerItem;
  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_containerName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 56) = -[SUItemContentRating copyWithZone:](self->_contentRating, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_copyrightString, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 72) = -[SSItemOffer copyWithZone:](self->_defaultStoreOffer, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_disclaimerString, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 96) = self->_gameCenterEnabled;
  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_genreName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_humanReadableDescription, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 120) = self->_isInstalled;
  *(_OWORD *)(v5 + 128) = *(_OWORD *)&self->_itemDisplayType;
  *(_QWORD *)(v5 + 144) = -[SSItemImageCollection copyWithZone:](self->_itemImageCollection, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 152) = -[NSArray copyWithZone:](self->_itemLinks, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_itemMediaKind, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 168) = self->_itemType;
  *(_QWORD *)(v5 + 176) = self->_releaseDate;
  *(_QWORD *)(v5 + 184) = -[NSString copyWithZone:](self->_releaseDateString, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 192) = self->_representedItemCount;
  *(_QWORD *)(v5 + 200) = -[SUItemReviewStatistics copyWithZone:](self->_reviewStatistics, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 208) = -[NSString copyWithZone:](self->_secondaryTitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 216) = -[NSString copyWithZone:](self->_softwareType, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 224) = -[NSArray copyWithZone:](self->_storeOffers, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 232) = -[NSDictionary copyWithZone:](self->_tellAFriendDictionary, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 240) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 248) = -[NSDictionary copyWithZone:](self->_tweetDictionary, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 256) = -[NSString copyWithZone:](self->_unmodifiedTitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 264) = -[NSNumber copyWithZone:](self->_versionIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 272) = -[NSArray copyWithZone:](self->_versionOrdering, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)BOOLValueForProperty:(id)a3
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (id)copyReleaseDateStringWithStyle:(int64_t)a3
{
  id result;

  result = -[SUItem stringValueForProperty:](self, "stringValueForProperty:", CFSTR("release-date-string"));
  if (!result)
    return SUCopyDateStringForDate((const __CFDate *)-[SUItem releaseDate](self, "releaseDate"), (CFDateFormatterStyle)a3);
  return result;
}

- (id)dateValueForProperty:(id)a3
{
  id v3;
  id v5;
  void *v6;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
  v6 = (void *)objc_msgSend(v5, "dateFromString:", v3);

  return v6;
}

- (SUItemLink)externalArtistPageLink
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SUItemLink *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = -[SUItem itemLinksForType:](self, "itemLinksForType:", 2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v10;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v10 != v5)
      objc_enumerationMutation(v2);
    v7 = *(SUItemLink **)(*((_QWORD *)&v9 + 1) + 8 * v6);
    if (-[SUItemLink linkTarget](v7, "linkTarget") == 1)
      return v7;
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)firstItemLinkForType:(int64_t)a3
{
  id v3;
  id result;

  v3 = -[SUItem itemLinksForType:](self, "itemLinksForType:", a3);
  result = (id)objc_msgSend(v3, "count");
  if (result)
    return (id)objc_msgSend(v3, "objectAtIndex:", 0);
  return result;
}

- (int64_t)integerValueForProperty:(id)a3
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (int)objc_msgSend(v3, "intValue");
  else
    return 0;
}

- (BOOL)isDisplayable:(id *)a3
{
  void *v5;
  SUItemValidator *v6;
  void *v7;
  char v8;
  void *v10;

  v10 = 0;
  v5 = (void *)objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "newDisplayItemValidationTestsForItem:", self);
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(SUItemValidator);
    -[SUItemValidator addItemValidationTests:](v6, "addItemValidationTests:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", self, 0);
    v8 = -[SUItemValidator validateItems:error:](v6, "validateItems:error:", v7, &v10);

  }
  else
  {
    v8 = 1;
  }

  if (a3)
    *a3 = v10;
  return v8;
}

- (BOOL)isDownloadable
{
  SUItemContentRating *contentRating;
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if ((objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode") & 1) != 0)
    return 0;
  contentRating = self->_contentRating;
  if (contentRating)
  {
    if (-[SUItemContentRating isRestricted](contentRating, "isRestricted"))
      return 0;
  }
  v5 = +[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource");
  v6 = objc_msgSend(v5, "newPurchaseWithItem:storeOffer:", self, -[SUItem defaultStoreOffer](self, "defaultStoreOffer"));
  v7 = objc_msgSend(v5, "newExternalDownloadWithItem:storeOffer:", self, -[SUItem defaultStoreOffer](self, "defaultStoreOffer"));
  v4 = (v6 | v7) != 0;

  return v4;
}

- (BOOL)isInstalled
{
  int isInstalled;
  NSString *v4;
  uint64_t v5;
  void *v6;

  isInstalled = self->_isInstalled;
  if (isInstalled == 255)
  {
    if (-[SUItem itemType](self, "itemType") == 2000
      && (v4 = -[SUItem bundleIdentifier](self, "bundleIdentifier"), -[NSString length](v4, "length"))
      && (v5 = objc_msgSend(MEMORY[0x24BEC8C20], "applicationForBundleIdentifier:", v4)) != 0)
    {
      v6 = (void *)v5;
      if (!-[SUItem versionOrdering](self, "versionOrdering"))
        objc_msgSend(v6, "versionOrdering");
      objc_msgSend(v6, "versionIdentifier");
      -[SUItem versionIdentifier](self, "versionIdentifier");
      isInstalled = ISCompareSoftwareVersions() != -1;
    }
    else
    {
      isInstalled = 0;
    }
    self->_isInstalled = isInstalled;
  }
  return isInstalled != 0;
}

- (id)itemLinksForType:(int64_t)a3
{
  void *v5;
  NSArray *itemLinks;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  itemLinks = self->_itemLinks;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](itemLinks, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(itemLinks);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "linkType") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](itemLinks, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (NSString)itemMediaKind
{
  NSString *itemMediaKind;
  SSItemOffer *v5;
  void *v6;
  NSString *v7;

  itemMediaKind = self->_itemMediaKind;
  if (itemMediaKind)
    return itemMediaKind;
  v5 = -[SUItem defaultStoreOffer](self, "defaultStoreOffer");
  -[SUItem itemTypeString](self, "itemTypeString");
  -[SSItemOffer offerIdentifier](v5, "offerIdentifier");
  v6 = (void *)SSItemMediaKindForItemKind();
  v7 = (NSString *)*MEMORY[0x24BEB2720];
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB2720]))
    v6 = (void *)objc_msgSend((id)-[SSItemOffer offerMedia](v5, "offerMedia"), "mediaKind");
  if (v6)
    return (NSString *)v6;
  else
    return v7;
}

- (id)relatedItemsForRelationType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("related-items"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = +[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(v6, "newItemWithItemDictionary:", v12);
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v7, "addObject:", v13);

          }
        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  return v7;
}

- (void)setStoreOffers:(id)a3
{
  NSArray *storeOffers;

  storeOffers = self->_storeOffers;
  if (storeOffers != a3)
  {

    self->_storeOffers = (NSArray *)objc_msgSend(a3, "copy");
    -[SUItem _reloadDefaultStoreOffer](self, "_reloadDefaultStoreOffer");
  }
}

- (id)storeOfferForIdentifier:(id)a3
{
  NSArray *storeOffers;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  storeOffers = self->_storeOffers;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](storeOffers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(storeOffers);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "offerIdentifier"), "isEqualToString:", a3))
          return v9;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](storeOffers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)stringValueForProperty:(id)a3
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSString)tellAFriendBody
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tellAFriendDictionary, "objectForKey:", CFSTR("body"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSString)tellAFriendBodyMIMEType
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tellAFriendDictionary, "objectForKey:", CFSTR("body-mime-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSURL)tellAFriendBodyURL
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tellAFriendDictionary, "objectForKey:", CFSTR("body-url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  else
    return 0;
}

- (NSString)tellAFriendSubject
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tellAFriendDictionary, "objectForKey:", CFSTR("subject"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSString)tweetInitialText
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tweetDictionary, "objectForKey:", CFSTR("text"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSURL)tweetURL
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_tweetDictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  else
    return 0;
}

- (NSString)unmodifiedTitle
{
  NSString *unmodifiedTitle;

  unmodifiedTitle = self->_unmodifiedTitle;
  if (unmodifiedTitle)
    return unmodifiedTitle;
  else
    return -[SUItem title](self, "title");
}

- (id)valueForProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (NSString)itemTypeString
{
  id v3;
  char isKindOfClass;
  void *v5;
  int v6;
  id v7;

  v3 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("type"), 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB2680]);
    v5 = v3;
    if (v6)
    {
      v7 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("link-type"), 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v7;
      else
        v5 = v3;
    }
  }
  return (NSString *)v5;
}

- (int64_t)_linkTargetForTargetString:(id)a3 typeString:(id)a4
{
  uint64_t v6;
  char v7;
  char v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = v7;
      if ((-[__CFString isEqualToString:](*(&kLinkTargets + 2 * v6), "isEqualToString:", a3) & 1) != 0)
        return (int64_t)*(&kLinkTargets + 2 * v6 + 1);
      v7 = 0;
      v6 = 1;
      if ((v8 & 1) == 0)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(a4, "isEqualToString:", CFSTR("safari"));
    else
      return 0;
  }
}

- (int64_t)_linkTypeForString:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a3, "hasPrefix:", CFSTR("account")) & 1) != 0)
    return 1;
  v5 = 0;
  while (!-[__CFString isEqualToString:](*(__CFString **)((char *)&kLinkTypes + v5), "isEqualToString:", a3))
  {
    v5 += 16;
    if (v5 == 48)
      return 0;
  }
  return *(int64_t *)((char *)&kLinkTypes + v5 + 8);
}

- (id)_newItemLinkWithType:(int64_t)a3 dictionary:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SUItemLink *v10;
  uint64_t v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v7 = objc_msgSend(a4, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
  if (!v8)
    return 0;
  v9 = (void *)v8;
  v10 = objc_alloc_init(SUItemLink);
  -[SUItemLink setLinkTarget:](v10, "setLinkTarget:", -[SUItem _linkTargetForTargetString:typeString:](self, "_linkTargetForTargetString:typeString:", 0, objc_msgSend(a4, "objectForKey:", CFSTR("url-page-type"))));
  -[SUItemLink setLinkType:](v10, "setLinkType:", a3);
  -[SUItemLink setURL:](v10, "setURL:", v9);
  v11 = objc_msgSend(a4, "objectForKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUItemLink setTitle:](v10, "setTitle:", v11);

  return v10;
}

- (id)_newItemLinkWithType:(int64_t)a3 URLKey:(id)a4 titleKey:(id)a5
{
  id v8;
  SUItemLink *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v8 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", a4, 0);
  objc_opt_class();
  v9 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v8);
    if (v10)
    {
      v11 = (void *)v10;
      v9 = objc_alloc_init(SUItemLink);
      -[SUItemLink setLinkType:](v9, "setLinkType:", a3);
      -[SUItemLink setURL:](v9, "setURL:", v11);
      v12 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", a5, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUItemLink setTitle:](v9, "setTitle:", v12);

    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (id)_newPrimaryItemLink
{
  id v3;
  SUItemLink *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("url"), 0);
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v3);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("url-target"), 0);
      v8 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("url-page-type"), 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("page-type"), 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = (id)objc_msgSend(v9, "objectForKey:", CFSTR("template-name"));
      }
      v4 = objc_alloc_init(SUItemLink);
      -[SUItemLink setLinkTarget:](v4, "setLinkTarget:", -[SUItem _linkTargetForTargetString:typeString:](self, "_linkTargetForTargetString:typeString:", v7, v8));
      -[SUItemLink setLinkType:](v4, "setLinkType:", -[SUItem _linkTypeForString:](self, "_linkTypeForString:", v8));
      -[SUItemLink setURL:](v4, "setURL:", v6);

    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)_reloadDefaultStoreOffer
{
  uint64_t v3;
  id v4;
  void *v5;

  if (-[NSArray count](self->_storeOffers, "count"))
  {
    v3 = 0;
    while (1)
    {
      v4 = -[SUItem storeOfferForIdentifier:](self, "storeOfferForIdentifier:", _reloadDefaultStoreOffer_sOfferNames[v3]);
      if (v4)
        break;
      if (++v3 == 6)
      {
        v4 = -[NSArray objectAtIndex:](self->_storeOffers, "objectAtIndex:", 0);
        break;
      }
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  self->_defaultStoreOffer = (SSItemOffer *)v5;
}

- (void)_reloadImagesAndLinksFromSquishes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  const __CFString *v17;
  uint64_t v18;
  SUItemLink *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = CFSTR("url");
    v9 = 0x24BDBC000uLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = -[SUItem _squishImageForSquishDictionary:](self, "_squishImageForSquishDictionary:", v11);
          v12 = objc_msgSend(v11, "objectForKey:", v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v6;
            v14 = v7;
            v15 = v9;
            v16 = a3;
            v17 = v8;
            v18 = objc_msgSend(v11, "objectForKey:", CFSTR("url-page-type"));
            v19 = objc_alloc_init(SUItemLink);
            -[SUItemLink setLinkTarget:](v19, "setLinkTarget:", -[SUItem _linkTargetForTargetString:typeString:](self, "_linkTargetForTargetString:typeString:", 0, v18));
            v20 = v18;
            v8 = v17;
            a3 = v16;
            v9 = v15;
            v7 = v14;
            v6 = v13;
            -[SUItemLink setLinkType:](v19, "setLinkType:", -[SUItem _linkTypeForString:](self, "_linkTypeForString:", v20));
            -[SUItemLink setURL:](v19, "setURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12));
          }
          else
          {
            v19 = 0;
          }
          if (objc_msgSend(v26, "URL") && -[SUItemLink URL](v19, "URL"))
          {
            objc_msgSend(v25, "addObject:", v26);
            objc_msgSend(v24, "addObject:", v19);
          }

        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E60]), "initWithItemImages:", v25);
  if (objc_msgSend(v25, "count"))
    v22 = v21;
  else
    v22 = 0;
  -[SUItem setItemImageCollection:](self, "setItemImageCollection:", v22);
  if (objc_msgSend(v24, "count"))
    v23 = v24;
  else
    v23 = 0;
  -[SUItem setItemLinks:](self, "setItemLinks:", v23);

}

- (void)_reloadItemImages
{
  id v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E60]), "initWithImageCollection:", -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("artwork-urls"), 0));
  if (objc_msgSend((id)objc_msgSend(v4, "itemImages"), "count"))
    v3 = v4;
  else
    v3 = 0;
  -[SUItem setItemImageCollection:](self, "setItemImageCollection:", v3);

}

- (void)_reloadItemLinks
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = -[SUItem _newPrimaryItemLink](self, "_newPrimaryItemLink");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v22, "addObject:", v3);

  }
  v5 = -[SUItem _newItemLinkWithType:dictionary:](self, "_newItemLinkWithType:dictionary:", 2, -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("company"), 0));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setLinkTarget:", 1);
    objc_msgSend(v22, "addObject:", v6);

  }
  v7 = -[SUItem _newItemLinkWithType:URLKey:titleKey:](self, "_newItemLinkWithType:URLKey:titleKey:", 3, CFSTR("submit-user-review-url"), CFSTR("submit-user-review-title"));
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v22, "addObject:", v7);

  }
  v9 = -[SUItem _newItemLinkWithType:URLKey:titleKey:](self, "_newItemLinkWithType:URLKey:titleKey:", 4, CFSTR("deletion-url"), CFSTR("deletion-action-name"));
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v22, "addObject:", v9);

  }
  v11 = -[SUItem _newItemLinkWithType:dictionary:](self, "_newItemLinkWithType:dictionary:", 5, -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("gifting-button"), 0));
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v22, "addObject:", v11);

  }
  v13 = -[SUItem _newItemLinkWithType:dictionary:](self, "_newItemLinkWithType:dictionary:", 6, -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("apple-eula"), 0));
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v22, "addObject:", v13);

  }
  v15 = -[SUItem _newItemLinkWithType:dictionary:](self, "_newItemLinkWithType:dictionary:", 6, -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("developers-eula"), 0));
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v22, "addObject:", v15);

  }
  v17 = -[SUItem _newItemLinkWithType:dictionary:](self, "_newItemLinkWithType:dictionary:", 8, -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("view-more-info-button"), 0));
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v22, "addObject:", v17);

  }
  v19 = -[SUItem _newItemLinkWithType:URLKey:titleKey:](self, "_newItemLinkWithType:URLKey:titleKey:", 9, CFSTR("view-user-reviews-url"), 0);
  v20 = v22;
  if (v19)
  {
    objc_msgSend(v22, "addObject:", v19);

    v20 = v22;
  }
  if (objc_msgSend(v20, "count"))
    v21 = v22;
  else
    v21 = 0;
  -[SUItem setItemLinks:](self, "setItemLinks:", v21);

}

- (void)_reloadProperties
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  id v28;
  int64_t v29;
  id v30;
  id v31;
  id v32;

  v3 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("artist-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_artistName = (NSString *)v3;
  }
  v4 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("bundle-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_bundleIdentifier = (NSString *)v4;
  }
  v5 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("version"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_bundleVersion = (NSString *)v5;
  }
  v6 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("collection-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_collectionName = (NSString *)v6;
  }
  v7 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("container-name"), CFSTR("mix-type-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_containerName = (NSString *)v7;
  }
  v8 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("copyright"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_copyrightString = (NSString *)v8;
  }
  v9 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("disclaimer"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_disclaimerString = (NSString *)v9;
  }
  v10 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("game-center-enabled"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_gameCenterEnabled = objc_msgSend(v10, "BOOLValue");
  v11 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("genre-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_genreName = (NSString *)v11;
  }
  v12 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("rating"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_contentRating = -[SUItemContentRating initWithDictionary:]([SUItemContentRating alloc], "initWithDictionary:", v12);
  }
  v13 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("release-date"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_releaseDate = (NSDate *)v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));

      self->_releaseDate = (NSDate *)(id)objc_msgSend(v14, "dateFromString:", v13);
    }
  }
  v15 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("release-date-string"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_releaseDateString = (NSString *)v15;
  }
  v16 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("tell-a-friend"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_tellAFriendDictionary = (NSDictionary *)v16;
  }
  v17 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("tweet-info"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_tweetDictionary = (NSDictionary *)v17;
  }
  v18 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("title2"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_secondaryTitle = (NSString *)v18;
  }
  v19 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("software-type"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_softwareType = (NSString *)v19;
  }
  v20 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("title"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_title = (NSString *)v20;
  }
  v21 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("unmodified-title"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_unmodifiedTitle = (NSString *)v21;
  }
  v22 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("version-external-identifier"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_versionIdentifier = (NSNumber *)v22;
  }
  v23 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("version-external-identifiers"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_versionOrdering = (NSArray *)v23;
  }
  -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", *MEMORY[0x24BEC8AF0], 0);
  -[SUItem setItemIdentifier:](self, "setItemIdentifier:", SSGetUnsignedLongLongFromValue());
  v24 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("media-type"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_itemMediaKind = (NSString *)v24;
  }
  v25 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("total-items"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_48;
  v26 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("content-count"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("songs"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_48:
      v27 = (int)objc_msgSend(v25, "intValue");
      goto LABEL_51;
    }
    v27 = 0;
  }
  else
  {
    v27 = -1;
  }
LABEL_51:
  self->_representedItemCount = v27;
  self->_itemDisplayType = 0;
  v28 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("display-type"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_57;
  if ((objc_msgSend(v28, "isEqualToString:", CFSTR("left-justified-text")) & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    if (!objc_msgSend(v28, "isEqualToString:", CFSTR("now-playing")))
      goto LABEL_57;
    v29 = 2;
  }
  self->_itemDisplayType = v29;
LABEL_57:
  v30 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("update-info"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v31 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("text")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && v31
    || (v31 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("description"), CFSTR("markup"), CFSTR("text"), 0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& v31)
  {

    self->_humanReadableDescription = (NSString *)v31;
  }

  self->_reviewStatistics = -[SUItemReviewStatistics initWithDictionary:]([SUItemReviewStatistics alloc], "initWithDictionary:", self->_dictionary);
  -[SUItem _reloadStoreOffers](self, "_reloadStoreOffers");
  v32 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("squishes"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUItem _reloadImagesAndLinksFromSquishes:](self, "_reloadImagesAndLinksFromSquishes:", v32);
  }
  else
  {
    -[SUItem _reloadItemImages](self, "_reloadItemImages");
    -[SUItem _reloadItemLinks](self, "_reloadItemLinks");
  }
}

- (void)_reloadStoreOffers
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  SUItem *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = self;
  v4 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", *MEMORY[0x24BEB2748], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v10 = objc_msgSend(v4, "objectForKey:", v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1E70]), "initWithOfferIdentifier:dictionary:", v9, v10);
              if (v11)
              {
                v12 = (void *)v11;
                objc_msgSend(v3, "addObject:", v11);

              }
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
  }
  if (objc_msgSend(v3, "count"))
    v13 = v3;
  else
    v13 = 0;
  -[SUItem setStoreOffers:](v14, "setStoreOffers:", v13);

}

- (id)_squishImageForSquishDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("artwork-urls"));
  if (!v4)
    v4 = objc_msgSend(a3, "objectForKey:", CFSTR("artwork-url"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E60]), "initWithImageCollection:", v4);
  v6 = (void *)objc_msgSend(v5, "itemImages");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v8 = v7;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
      objc_msgSend(v13, "imageScale");
      if (v14 == v8)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    v15 = v13;
    if (v15)
      goto LABEL_16;
  }
LABEL_13:
  if (objc_msgSend(v6, "count"))
    v15 = (id)objc_msgSend(v6, "objectAtIndex:", 0);
  else
    v15 = 0;
LABEL_16:

  return v15;
}

- (id)_valueForFirstAvailableKey:(id)a3
{
  id result;
  uint64_t *v5;
  BOOL v6;
  uint64_t *v7;
  uint64_t v8;

  v7 = &v8;
  if (!a3)
    return 0;
  do
  {
    result = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:");
    v5 = v7++;
    if (*v5)
      v6 = result == 0;
    else
      v6 = 0;
  }
  while (v6);
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SUItem)containerItem
{
  return self->_containerItem;
}

- (void)setContainerItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SUItemContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (void)setCopyrightString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SSItemOffer)defaultStoreOffer
{
  return self->_defaultStoreOffer;
}

- (NSString)disclaimerString
{
  return self->_disclaimerString;
}

- (void)setDisclaimerString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (void)setGameCenterEnabled:(BOOL)a3
{
  self->_gameCenterEnabled = a3;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (void)setGenreName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)itemDictionary
{
  return self->_dictionary;
}

- (int64_t)itemDisplayType
{
  return self->_itemDisplayType;
}

- (void)setItemDisplayType:(int64_t)a3
{
  self->_itemDisplayType = a3;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (SSItemImageCollection)itemImageCollection
{
  return self->_itemImageCollection;
}

- (void)setItemImageCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)itemLinks
{
  return self->_itemLinks;
}

- (void)setItemLinks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setItemMediaKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (int64_t)representedItemCount
{
  return self->_representedItemCount;
}

- (void)setRepresentedItemCount:(int64_t)a3
{
  self->_representedItemCount = a3;
}

- (SUItemReviewStatistics)reviewStatistics
{
  return self->_reviewStatistics;
}

- (void)setReviewStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)softwareType
{
  return self->_softwareType;
}

- (void)setSoftwareType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)storeOffers
{
  return self->_storeOffers;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setUnmodifiedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSArray)versionOrdering
{
  return self->_versionOrdering;
}

- (void)setVersionOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

@end
