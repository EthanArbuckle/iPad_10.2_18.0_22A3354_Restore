@implementation SUMediaPlayerItem

- (SUMediaPlayerItem)initWithItem:(id)a3
{
  SUMediaPlayerItem *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must have item"));
  v16.receiver = self;
  v16.super_class = (Class)SUMediaPlayerItem;
  v5 = -[SUMediaPlayerItem init](&v16, sel_init);
  if (v5)
  {
    v5->_bookmarkIdentifier = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%llu"), objc_msgSend(a3, "itemIdentifier"));
    v5->_itemIdentifier = objc_msgSend(a3, "itemIdentifier");
    v5->_itemType = objc_msgSend(a3, "itemType");
    v5->_subtitle = (NSString *)(id)objc_msgSend(a3, "artistName");
    v5->_title = (NSString *)(id)objc_msgSend(a3, "unmodifiedTitle");
    if ((SUItemTypeIsVideoType(v5->_itemType) & 1) != 0)
    {
      v6 = 3;
    }
    else
    {
      v7 = (void *)objc_msgSend(a3, "itemMediaKind");
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB2728]);
      v6 = 3;
      if (!v8)
        v6 = 1;
    }
    v5->_initialOrientation = v6;
    v9 = (void *)objc_msgSend(a3, "valueForProperty:", CFSTR("pings"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SUMediaPlayerItem _newPingURLsWithArray:](v5, "_newPingURLsWithArray:", objc_msgSend(v9, "objectForKey:", CFSTR("download")));
      v5->_downloadPingURLs = (NSArray *)objc_msgSend(v10, "copy");

      v11 = -[SUMediaPlayerItem _newPingURLsWithArray:](v5, "_newPingURLsWithArray:", objc_msgSend(v9, "objectForKey:", CFSTR("play")));
      v5->_playbackPingURLs = (NSArray *)objc_msgSend(v11, "copy");

    }
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "defaultStoreOffer"), "offerMedia");
    v13 = objc_msgSend(a3, "itemType");
    v14 = (void *)objc_msgSend(v12, "URL");
    if (v13 != 1007)
      v5->_playableDuration = (double)objc_msgSend(v12, "durationInMilliseconds") / 1000.0;
    v5->_url = (NSURL *)v14;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUMediaPlayerItem;
  -[SUMediaPlayerItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSURL copyWithZone:](self->_backgroundImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_bookmarkIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSArray copyWithZone:](self->_downloadPingURLs, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = self->_initialOrientation;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_itemIdentifier;
  *(double *)(v5 + 64) = self->_playableDuration;
  *(_QWORD *)(v5 + 56) = -[NSArray copyWithZone:](self->_playbackPingURLs, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 72) = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  return (id)v5;
}

- (double)bookmarkedStartTime
{
  void *v3;
  void *v4;
  double result;

  if (!self->_bookmarkIdentifier)
    return 0.0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("MSStreamStartTimes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0.0;
  v4 = (void *)objc_msgSend(v3, "objectForKey:", self->_bookmarkIdentifier);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(v4, "doubleValue");
  return result;
}

- (void)resetBookmarkedStartTime
{
  -[SUMediaPlayerItem setBookmarkedStartTime:](self, "setBookmarkedStartTime:", -1.0);
}

- (void)setBookmarkedStartTime:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *bookmarkIdentifier;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_bookmarkIdentifier)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (id)objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("MSStreamStartTimes")), "mutableCopy");
    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v9 &= 2u;
    if (a3 >= 2.22044605e-16)
    {
      if (v9)
      {
        v15 = objc_opt_class();
        bookmarkIdentifier = self->_bookmarkIdentifier;
        v22 = 138412802;
        v23 = v15;
        v24 = 2048;
        v25 = a3;
        v26 = 2112;
        v27 = bookmarkIdentifier;
        LODWORD(v21) = 32;
        v20 = &v22;
        v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v22, v21);
          free(v18);
          v20 = (int *)v19;
          SSFileLog();
        }
      }
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3, v20), self->_bookmarkIdentifier);
    }
    else
    {
      if (v9)
      {
        v10 = objc_opt_class();
        v11 = self->_bookmarkIdentifier;
        v22 = 138412546;
        v23 = v10;
        v24 = 2112;
        v25 = *(double *)&v11;
        LODWORD(v21) = 22;
        v20 = &v22;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v22, v21);
          free(v13);
          v20 = (int *)v14;
          SSFileLog();
        }
      }
      objc_msgSend(v6, "removeObjectForKey:", self->_bookmarkIdentifier, v20);
    }
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("MSStreamStartTimes"));
    objc_msgSend(v5, "synchronize");

  }
}

- (id)_newPingURLsWithArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(a3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v9);
            if (v10)
            {
              v11 = (void *)v10;
              objc_msgSend(v4, "addObject:", v10);

            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (NSURL)backgroundImageURL
{
  return self->_backgroundImageURL;
}

- (void)setBackgroundImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)bookmarkIdentifier
{
  return self->_bookmarkIdentifier;
}

- (void)setBookmarkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)downloadPingURLs
{
  return self->_downloadPingURLs;
}

- (void)setDownloadPingURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)initialOrientation
{
  return self->_initialOrientation;
}

- (void)setInitialOrientation:(int64_t)a3
{
  self->_initialOrientation = a3;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (double)playableDuration
{
  return self->_playableDuration;
}

- (void)setPlayableDuration:(double)a3
{
  self->_playableDuration = a3;
}

- (NSArray)playbackPingURLs
{
  return self->_playbackPingURLs;
}

- (void)setPlaybackPingURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
