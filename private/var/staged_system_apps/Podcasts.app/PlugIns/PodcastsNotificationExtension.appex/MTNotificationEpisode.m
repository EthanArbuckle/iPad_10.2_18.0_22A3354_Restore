@implementation MTNotificationEpisode

+ (unint64_t)versionOfDictionaryRepresentation:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_version")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_version")));
    v4 = objc_msgSend(v5, "unsignedIntegerValue");

  }
  return (unint64_t)v4;
}

- (MTNotificationEpisode)initWithUuid:(id)a3 storeTrackId:(int64_t)a4 bestTitle:(id)a5 bestSummary:(id)a6 pubDate:(id)a7 duration:(double)a8 byteSize:(int64_t)a9 isVideo:(BOOL)a10 sortPropertyValues:(id)a11 podcastUuid:(id)a12 podcastTitle:(id)a13 podcastStoreCollectionId:(int64_t)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MTNotificationEpisode *v26;
  MTNotificationEpisode *v27;
  id obj;
  id v31;
  id v33;
  objc_super v34;

  v20 = a3;
  v21 = a5;
  obj = a6;
  v22 = a6;
  v31 = a7;
  v33 = a7;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v34.receiver = self;
  v34.super_class = (Class)MTNotificationEpisode;
  v26 = -[MTNotificationEpisode init](&v34, "init");
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_uuid, a3);
    v27->_storeTrackId = a4;
    objc_storeStrong((id *)&v27->_bestTitle, a5);
    objc_storeStrong((id *)&v27->_bestSummary, obj);
    objc_storeStrong((id *)&v27->_pubDate, v31);
    v27->_duration = a8;
    v27->_byteSize = a9;
    v27->_isVideo = a10;
    objc_storeStrong((id *)&v27->_sortPropertyValues, a11);
    objc_storeStrong((id *)&v27->_podcastUuid, a12);
    objc_storeStrong((id *)&v27->_podcastTitle, a13);
    v27->_podcastStoreCollectionId = a14;
  }

  return v27;
}

- (MTNotificationEpisode)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MTNotificationEpisode *v5;
  MTNotificationEpisode *v6;
  void *v7;
  uint64_t v8;
  NSString *uuid;
  void *v10;
  uint64_t v11;
  NSString *bestTitle;
  uint64_t v13;
  NSString *bestSummary;
  uint64_t v15;
  NSDate *pubDate;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *sortPropertyValues;
  uint64_t v23;
  NSString *podcastUuid;
  uint64_t v25;
  NSString *podcastTitle;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTNotificationEpisode;
  v5 = -[MTNotificationEpisode init](&v29, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode _representationByMigratingLegacyKeysInRepresentation:](v5, "_representationByMigratingLegacyKeysInRepresentation:", v4));

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("episodeStoreTrackId")));
    v6->_storeTrackId = (int64_t)objc_msgSend(v10, "longLongValue");

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bestTitle")));
    bestTitle = v6->_bestTitle;
    v6->_bestTitle = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bestSummary")));
    bestSummary = v6->_bestSummary;
    v6->_bestSummary = (NSString *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pubDate")));
    pubDate = v6->_pubDate;
    v6->_pubDate = (NSDate *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("durationNumber")));
    objc_msgSend(v17, "doubleValue");
    v6->_duration = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("byteSizeNumber")));
    v6->_byteSize = (int64_t)objc_msgSend(v19, "longLongValue");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isVideoNumber")));
    v6->_isVideo = objc_msgSend(v20, "BOOLValue");

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sortPropertyValues")));
    sortPropertyValues = v6->_sortPropertyValues;
    v6->_sortPropertyValues = (NSDictionary *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("podcastUuid")));
    podcastUuid = v6->_podcastUuid;
    v6->_podcastUuid = (NSString *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("podcastTitle")));
    podcastTitle = v6->_podcastTitle;
    v6->_podcastTitle = (NSString *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("podcastStoreCollectionId")));
    v6->_podcastStoreCollectionId = (int64_t)objc_msgSend(v27, "longLongValue");

    v4 = v7;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  NSDate *pubDate;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode uuid](self, "uuid"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1000292B8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("episodeUuid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MTNotificationEpisode storeTrackId](self, "storeTrackId")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("episodeStoreTrackId"));

  v8 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode bestTitle](self, "bestTitle"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1000292B8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bestTitle"));

  v11 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode bestSummary](self, "bestSummary"));
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1000292B8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("bestSummary"));

  pubDate = self->_pubDate;
  if (pubDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", pubDate, CFSTR("pubDate"));
  -[MTNotificationEpisode duration](self, "duration");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("durationNumber"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MTNotificationEpisode byteSize](self, "byteSize")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("byteSizeNumber"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MTNotificationEpisode isVideo](self, "isVideo")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isVideoNumber"));

  v18 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode sortPropertyValues](self, "sortPropertyValues"));
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = &__NSDictionary0__struct;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("sortPropertyValues"));

  v21 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastUuid](self, "podcastUuid"));
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_1000292B8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("podcastUuid"));

  v24 = objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastTitle](self, "podcastTitle"));
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_1000292B8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("podcastTitle"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MTNotificationEpisode podcastStoreCollectionId](self, "podcastStoreCollectionId")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("podcastStoreCollectionId"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_10002A058, CFSTR("_version"));
  return v3;
}

- (id)_representationByMigratingLegacyKeysInRepresentation:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "versionOfDictionaryRepresentation:", v4);
  if (v5 == (id)1)
  {
    v6 = v4;
  }
  else
  {
    v8 = (uint64_t)v5;
    v6 = objc_msgSend(v4, "mutableCopy");
    if (!v8)
    {
      -[MTNotificationEpisode _upgradeRepresentationFrom0To1:](self, "_upgradeRepresentationFrom0To1:", v6);
      v8 = 1;
      goto LABEL_8;
    }
    while (v8 != 1)
    {
LABEL_8:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("_version"));

    }
  }

  return v6;
}

- (void)_upgradeRepresentationFrom0To1:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bestTitle")));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("episodeTitle")));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("bestTitle"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bestSummary")));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemDescription")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringBySmartlyStrippingHTML"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("bestSummary"));

  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int64_t)storeTrackId
{
  return self->_storeTrackId;
}

- (NSString)bestTitle
{
  return self->_bestTitle;
}

- (NSString)bestSummary
{
  return self->_bestSummary;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (NSDictionary)sortPropertyValues
{
  return self->_sortPropertyValues;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (int64_t)podcastStoreCollectionId
{
  return self->_podcastStoreCollectionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_sortPropertyValues, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_bestSummary, 0);
  objc_storeStrong((id *)&self->_bestTitle, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
