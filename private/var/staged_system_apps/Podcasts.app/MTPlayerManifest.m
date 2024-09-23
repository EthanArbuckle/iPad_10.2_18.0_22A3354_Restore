@implementation MTPlayerManifest

- (id)metricsContentIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (void)setPlayReason:(unint64_t)a3
{
  self->_playReason = a3;
}

- (id)metricsAdditionalData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MTPlayerManifest count](self, "count")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("count"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest title](self, "title"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest title](self, "title"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest manifestIdentifier](self, "manifestIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("manifest_id"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreReportingController reportingStringForPlayReason:](MTStoreReportingController, "reportingStringForPlayReason:", -[MTPlayerManifest playReason](self, "playReason")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("manifest_source"));

  return v3;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (NSString)manifestIdentifier
{
  return self->_manifestIdentifier;
}

- (MTPlayerManifest)init
{
  MTPlayerManifest *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPlayerManifest;
  v2 = -[MTPlayerManifest init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    -[MTPlayerManifest setManifestIdentifier:](v2, "setManifestIdentifier:", v4);

  }
  return v2;
}

- (void)setManifestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_manifestIdentifier, a3);
}

- (id)activity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTPlayerManifest;
  v3 = -[MTPlayerManifest activity](&v10, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setEligibleForHandoff:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest currentItem](self, "currentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeShareUrl"));
  objc_msgSend(v4, "setWebpageURL:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest activitySpotlightIdentifier](self, "activitySpotlightIdentifier"));
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", kUTTypeAudiovisualContent);
    objc_msgSend(v8, "setRelatedUniqueIdentifier:", v7);
    objc_msgSend(v4, "setContentAttributeSet:", v8);

  }
  return v4;
}

- (id)activitySpotlightIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest currentItem](self, "currentItem"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest currentItem](self, "currentItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil uniqueIdentifierForPodcastInPlayerItem:](MTCoreSpotlightUtil, "uniqueIdentifierForPodcastInPlayerItem:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  unint64_t v5;
  void *v6;
  int v7;
  unsigned __int8 v8;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (v4 && -[MTPlayerManifest count](self, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest objectAtIndex:](self, "objectAtIndex:", v5));
      v8 = 0;
      v4[2](v4, v6, &v8);
      v7 = v8;

      if (v7)
        break;
      ++v5;
    }
    while ((unint64_t)-[MTPlayerManifest count](self, "count") > v5);
  }

}

- (BOOL)userActivityContainsPlayhead
{
  return 0;
}

- (void)setNetworkUPPEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  MTPlayerManifest *v11;

  v3 = a3;
  v5 = _MTLogCategoryPlayback(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Disabled");
    if (v3)
      v7 = CFSTR("Enabled");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network UPP %@ for manifest %@", (uint8_t *)&v8, 0x16u);
  }

  self->_networkUPPEnabled = v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPlayerManifest;
  v3 = -[MTPlayerManifest objectAtIndex:](&v5, "objectAtIndex:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (BOOL)networkUPPEnabled
{
  return self->_networkUPPEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestIdentifier, 0);
}

@end
