@implementation MZUniversalPlaybackPositionMetadata

- (MZUniversalPlaybackPositionMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MZUniversalPlaybackPositionMetadata;
  return -[MZUniversalPlaybackPositionMetadata init](&v3, "init");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  double v10;
  id v11;
  void *v12;
  unsigned int v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MZUniversalPlaybackPositionMetadata;
  v3 = -[MZUniversalPlaybackPositionMetadata description](&v22, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier"));
  -[MZUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02lu:%02lu:%.2f"), (uint64_t)(v6 / 3600.0), (uint64_t)((v6 - (double)(3600 * (uint64_t)(v6 / 3600.0))) / 60.0), v6- (double)(3600 * (uint64_t)(v6 / 3600.0))- (double)(60 * (uint64_t)((v6 - (double)(3600 * (uint64_t)(v6 / 3600.0))) / 60.0))));
  v8 = -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed");
  v9 = -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount");
  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  v11 = sub_100080318(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[MZUniversalPlaybackPositionMetadata isNew](self, "isNew");
  -[MZUniversalPlaybackPositionMetadata lastUserMarkedAsPlayedDate](self, "lastUserMarkedAsPlayedDate");
  v15 = sub_100080318(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[MZUniversalPlaybackPositionMetadata lastDatePlayed](self, "lastDatePlayed");
  v18 = sub_100080318(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: id=%@, bktm=%@, hbpl=%d, plct=%lu, timestamp=%@, isNew=%d, lastUserMarkedAsPlayedDate=%@, lastDatePlayed=%@, playStateManuallySet=%d"), v4, v5, v7, v8, v9, v12, v13, v16, v19, -[MZUniversalPlaybackPositionMetadata playStateManuallySet](self, "playStateManuallySet")));

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MZUniversalPlaybackPositionMetadata *v4;
  void *v5;

  v4 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier"));
  -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v4, "setItemIdentifier:", v5);

  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v4, "setTimestamp:");
  -[MZUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v4, "setBookmarkTime:");
  -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v4, "setHasBeenPlayed:", -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed"));
  -[MZUniversalPlaybackPositionMetadata setPlayCount:](v4, "setPlayCount:", -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_itemIdentifier, "hash") ^ self->_hasBeenPlayed ^ self->_playCount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_bookmarkTime));
  v5 = v3 ^ (unint64_t)objc_msgSend(v4, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  v7 = v5 ^ (unint64_t)objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  double *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(MZUniversalPlaybackPositionMetadata);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (double *)v4;
    v7 = -[NSString isEqual:](self->_itemIdentifier, "isEqual:", *((_QWORD *)v6 + 2))
      && self->_timestamp == v6[3]
      && self->_bookmarkTime == v6[4]
      && self->_hasBeenPlayed == *((unsigned __int8 *)v6 + 8)
      && self->_playCount == *((_QWORD *)v6 + 5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  void ***v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  uint64_t v31;
  id (*v32)(uint64_t, void *);
  void *v33;
  id v34;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("storeItemAdamID"), CFSTR("mediaEntityType"), 0));
  v5 = sub_10008086C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("mediaEntityType")));
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("storeItemAdamID")));
  v10 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("storeItemAdamID")));
  v13 = v12;
  if ((isKindOfClass & 1) != 0)
    v14 = objc_msgSend(v12, "longLongValue");
  else
    v14 = objc_msgSend(v12, "unsignedLongLongValue");
  v15 = v14;

  if (v15)
    v16 = v8 == (id)3;
  else
    v16 = 1;
  if (v16 || v8 == (id)4)
  {
    v30 = _NSConcreteStackBlock;
    v31 = 3221225472;
    v32 = sub_100080944;
    v33 = &unk_1004A8008;
    v34 = v3;
    v18 = objc_retainBlock(&v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("podcastURL"), CFSTR("podcastGUID"), 0));

    v20 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (v21)
    {
LABEL_13:
      v22 = (void *)v21;
LABEL_16:

      v4 = v19;
      goto LABEL_17;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("title"), CFSTR("artist"), CFSTR("albumTitle"), 0, v30, v31, v32, v33));

    v24 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!v25)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("title"), CFSTR("albumTitle"), 0));

      v27 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v27);
      if (v21)
        goto LABEL_13;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("title"), CFSTR("artist"), 0));

      v28 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v23);
      v25 = objc_claimAutoreleasedReturnValue(v28);
      if (!v25)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("title"), 0));

        v29 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v29);
        goto LABEL_13;
      }
    }
    v22 = (void *)v25;
    v19 = v23;
    goto LABEL_16;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v15));
LABEL_17:

  return v22;
}

+ (id)metadataWithValuesFromDataSourceItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  MZUniversalPlaybackPositionMetadata *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v30 = a3;
  v28 = objc_alloc((Class)NSMutableDictionary);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v29, "timeIntervalSinceReferenceDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v8 = objc_msgSend(v28, "initWithObjectsAndKeys:", v27, CFSTR("bookmarkTime"), v26, CFSTR("bookmarkMetadataTimestamp"), v25, CFSTR("hasBeenPalyed"), v23, CFSTR("playCount"), v3, CFSTR("isNew"), v4, CFSTR("lastUserMarkedAsPlayedDate"), v6, CFSTR("lastDatePlayed"), v7, CFSTR("playStateManuallySet"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100080FA4;
  v31[3] = &unk_1004A8030;
  v32 = v8;
  v11 = v8;
  objc_msgSend(v30, "enumerateValuesForProperties:usingBlock:", v10, v31);

  v12 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:](MZUniversalPlaybackPositionMetadata, "keyValueStoreItemIdentifierForItem:", v30));

  -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v12, "setItemIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("bookmarkMetadataTimestamp")));
  objc_msgSend(v14, "doubleValue");
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v12, "setTimestamp:");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("bookmarkTime")));
  objc_msgSend(v15, "doubleValue");
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v12, "setBookmarkTime:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("hasBeenPalyed")));
  -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v12, "setHasBeenPlayed:", objc_msgSend(v16, "BOOLValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("playCount")));
  -[MZUniversalPlaybackPositionMetadata setPlayCount:](v12, "setPlayCount:", objc_msgSend(v17, "integerValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("isNew")));
  -[MZUniversalPlaybackPositionMetadata setIsNew:](v12, "setIsNew:", objc_msgSend(v18, "BOOLValue"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("lastUserMarkedAsPlayedDate")));
  objc_msgSend(v19, "doubleValue");
  -[MZUniversalPlaybackPositionMetadata setLastUserMarkedAsPlayedDate:](v12, "setLastUserMarkedAsPlayedDate:");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("lastDatePlayed")));
  objc_msgSend(v20, "doubleValue");
  -[MZUniversalPlaybackPositionMetadata setLastDatePlayed:](v12, "setLastDatePlayed:");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("playStateManuallySet")));
  -[MZUniversalPlaybackPositionMetadata setPlayStateManuallySet:](v12, "setPlayStateManuallySet:", objc_msgSend(v21, "BOOLValue"));

  return v12;
}

+ (id)metadataWithValuesItemIdentifier:(id)a3 keyValueStorePayload:(id)a4
{
  void *v4;
  id v6;
  const __CFData *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  MZUniversalPlaybackPositionMetadata *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[7];

  v6 = a3;
  v7 = (const __CFData *)a4;
  v8 = (void *)CFPropertyListCreateWithData(0, v7, 0, 0, 0);
  if (!v8)
  {
    v38[0] = objc_opt_class(NSDictionary);
    v38[1] = objc_opt_class(NSArray);
    v38[2] = objc_opt_class(NSString);
    v38[3] = objc_opt_class(NSNumber);
    v38[4] = objc_opt_class(NSData);
    v38[5] = objc_opt_class(NSDate);
    v38[6] = objc_opt_class(NSNull);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

    v37 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v7, &v37));

    if (!v8)
      goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector(v8, "objectForKey:") & 1) == 0)
    goto LABEL_10;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("pver")));
  if (!v10
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("pver"))),
        v11 = objc_opt_class(NSNumber),
        (objc_opt_isKindOfClass(v4, v11) & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("pver")));
    v13 = objc_msgSend(v14, "integerValue");

    if (!v10)
      goto LABEL_9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("pver")));
    v13 = objc_msgSend(v12, "integerValue");

  }
LABEL_9:

  if (!v13)
  {
    v15 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
    -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v15, "setItemIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("bktm")));
    if (!v17
      || (v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("bktm"))),
          v18 = objc_opt_class(NSNumber),
          (objc_opt_isKindOfClass(v13, v18) & 1) != 0))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("bktm")));
      objc_msgSend(v20, "doubleValue");
      -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v15, "setBookmarkTime:");

      if (!v17)
        goto LABEL_17;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("bktm")));
      objc_msgSend(v19, "doubleValue");
      -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v15, "setBookmarkTime:");

    }
LABEL_17:

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
    v22 = v21 == 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
    v24 = v23;
    if ((v22 & 1) != 0)
    {

      if (!v24)
      {
LABEL_28:
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("plct")));
        if (!v29
          || (v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("plct"))),
              v30 = objc_opt_class(NSNumber),
              (objc_opt_isKindOfClass(v22, v30) & 1) != 0))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("plct")));
          -[MZUniversalPlaybackPositionMetadata setPlayCount:](v15, "setPlayCount:", objc_msgSend(v32, "integerValue"));

          if (!v29)
          {
LABEL_33:

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("tstm")));
            if (!v33
              || (v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("tstm"))),
                  v34 = objc_opt_class(NSNumber),
                  (objc_opt_isKindOfClass(v22, v34) & 1) != 0))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("tstm")));
              objc_msgSend(v36, "doubleValue");
              -[MZUniversalPlaybackPositionMetadata setTimestamp:](v15, "setTimestamp:");

              if (!v33)
              {
LABEL_38:

                goto LABEL_11;
              }
            }
            else
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("tstm")));
              objc_msgSend(v35, "doubleValue");
              -[MZUniversalPlaybackPositionMetadata setTimestamp:](v15, "setTimestamp:");

            }
            goto LABEL_38;
          }
        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("plct")));
          -[MZUniversalPlaybackPositionMetadata setPlayCount:](v15, "setPlayCount:", objc_msgSend(v31, "integerValue"));

        }
        goto LABEL_33;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
      if (!v24
        || (v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl"))),
            v26 = objc_opt_class(NSNumber),
            (objc_opt_isKindOfClass(v22, v26) & 1) != 0))
      {
LABEL_25:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
        -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v15, "setHasBeenPlayed:", objc_msgSend(v28, "BOOLValue"));

        if (!v24)
        {
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      if (!v23)
        goto LABEL_25;
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
      v25 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v22, v25) & 1) != 0)
        goto LABEL_25;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hbpl")));
    -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v15, "setHasBeenPlayed:", objc_msgSend(v27, "BOOLValue"));

    goto LABEL_26;
  }
LABEL_10:
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)keyValueStorePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CFDataRef Data;

  -[MZUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount")));
  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, v5, v6, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("bktm"), CFSTR("hbpl"), CFSTR("plct"), CFSTR("tstm"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v7, v8));

  Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  return Data;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (double)lastUserMarkedAsPlayedDate
{
  return self->_lastUserMarkedAsPlayedDate;
}

- (void)setLastUserMarkedAsPlayedDate:(double)a3
{
  self->_lastUserMarkedAsPlayedDate = a3;
}

- (double)lastDatePlayed
{
  return self->_lastDatePlayed;
}

- (void)setLastDatePlayed:(double)a3
{
  self->_lastDatePlayed = a3;
}

- (BOOL)playStateManuallySet
{
  return self->_playStateManuallySet;
}

- (void)setPlayStateManuallySet:(BOOL)a3
{
  self->_playStateManuallySet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
