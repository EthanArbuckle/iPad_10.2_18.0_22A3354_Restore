@implementation SBKUniversalPlaybackPositionMetadata

+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8
{
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v13 = (__CFString *)a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v17 = (const __CFString *)a8;
  v18 = (__CFString *)v17;
  if (!a3 || v16 || v17)
  {
    v20 = &stru_24E2A84D0;
    if (v13)
      v21 = v13;
    else
      v21 = &stru_24E2A84D0;
    v37[0] = CFSTR("title");
    v37[1] = CFSTR("albumTitle");
    if (v14)
      v22 = v14;
    else
      v22 = &stru_24E2A84D0;
    v38[0] = v21;
    v38[1] = v22;
    if (v15)
      v23 = v15;
    else
      v23 = &stru_24E2A84D0;
    v37[2] = CFSTR("artist");
    v37[3] = CFSTR("podcastGUID");
    if (v17)
      v20 = v17;
    v38[2] = v23;
    v38[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    if (v16)
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, CFSTR("podcastURL"));
    v36[0] = CFSTR("podcastURL");
    v36[1] = CFSTR("podcastGUID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    storageItemIdentifierForProperties(v26, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v35[0] = CFSTR("title");
      v35[1] = CFSTR("artist");
      v35[2] = CFSTR("albumTitle");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      storageItemIdentifierForProperties(v27, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v34[0] = CFSTR("title");
        v34[1] = CFSTR("albumTitle");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        storageItemIdentifierForProperties(v28, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v33[0] = CFSTR("title");
          v33[1] = CFSTR("artist");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          storageItemIdentifierForProperties(v29, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            v32 = CFSTR("title");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            storageItemIdentifierForProperties(v30, v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (SBKUniversalPlaybackPositionMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  return -[SBKUniversalPlaybackPositionMetadata init](&v3, sel_init);
}

- (id)initAsTestableItem
{
  SBKUniversalPlaybackPositionMetadata *v2;
  SBKUniversalPlaybackPositionMetadata *v3;
  NSString *itemIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  v2 = -[SBKUniversalPlaybackPositionMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    itemIdentifier = v2->_itemIdentifier;
    v2->_itemIdentifier = (NSString *)CFSTR("test-item-identifier");

    v3->_hasBeenPlayed = 1;
    v3->_playCount = 10;
    *(_OWORD *)&v3->_timestamp = xmmword_21E51C550;
  }
  return v3;
}

- (SBKUniversalPlaybackPositionMetadata)initWithCoder:(id)a3
{
  id v4;
  SBKUniversalPlaybackPositionMetadata *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  v5 = -[SBKUniversalPlaybackPositionMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bookmarkTime"));
    v5->_bookmarkTime = v9;
    v5->_hasBeenPlayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBeenPlayed"));
    v5->_playCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("itemIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("bookmarkTime"), self->_bookmarkTime);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBeenPlayed, CFSTR("hasBeenPlayed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playCount, CFSTR("playCount"));

}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  double v10;
  double v11;
  __CFString *v12;
  void *v13;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SBKUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  -[SBKUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02llu:%02llu:%.2f"), (unint64_t)(v6 / 3600.0), (unint64_t)((v6 - (double)(3600 * (unint64_t)(v6 / 3600.0))) / 60.0), v6- (double)(3600 * (unint64_t)(v6 / 3600.0))- (double)(60 * (unint64_t)((v6 - (double)(3600 * (unint64_t)(v6 / 3600.0))) / 60.0)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBKUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed");
  v9 = -[SBKUniversalPlaybackPositionMetadata playCount](self, "playCount");
  -[SBKUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  v11 = v10;
  if (fabs(v10) <= 0.00000011920929)
  {
    v12 = CFSTR("no timestamp");
  }
  else if (v10 == 978307200.0)
  {
    v12 = CFSTR("*** 1970 timestamp ***");
  }
  else if (v10 == -978307200.0)
  {
    v12 = CFSTR("*** (-) 1970 timestamp ***");
  }
  else if (*MEMORY[0x24BDBD230] == v10)
  {
    v12 = CFSTR("*** 1904 timestamp ***");
  }
  else if (v10 == -*MEMORY[0x24BDBD230])
  {
    v12 = CFSTR("*** (-) 1904 timestamp ***");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;

    if (v17 == v11)
    {
      v12 = CFSTR("*** distant past timestamp ***");
    }
    else
    {
      if (TimestampStringFromNSTimeInterval_onceToken != -1)
        dispatch_once(&TimestampStringFromNSTimeInterval_onceToken, &__block_literal_global_628);
      v18 = (void *)TimestampStringFromNSTimeInterval_dateFormatter;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v20;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%f) %@"), *(_QWORD *)&v11, v20);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SBKMetadata:%p, id=%-32s, bktm=%@, hbpl=%d, plct=%llu, timestamp=%@>"), self, v5, v7, v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBKUniversalPlaybackPositionMetadata *v4;
  void *v5;

  v4 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  -[SBKUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKUniversalPlaybackPositionMetadata setItemIdentifier:](v4, "setItemIdentifier:", v5);

  -[SBKUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v4, "setTimestamp:");
  -[SBKUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v4, "setBookmarkTime:");
  -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v4, "setHasBeenPlayed:", -[SBKUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed"));
  -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v4, "setPlayCount:", -[SBKUniversalPlaybackPositionMetadata playCount](self, "playCount"));
  return v4;
}

- (void)setTimestamp:(double)a3
{
  if (-*MEMORY[0x24BDBD230] >= a3 || a3 == 0.0)
    a3 = -*MEMORY[0x24BDBD230];
  self->_timestamp = a3;
}

- (double)timestamp
{
  double result;

  result = self->_timestamp;
  if (result <= -*MEMORY[0x24BDBD230] || result == 0.0)
    return -*MEMORY[0x24BDBD230];
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_itemIdentifier, "hash") ^ self->_hasBeenPlayed ^ self->_playCount;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bookmarkTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = -[NSString isEqual:](self->_itemIdentifier, "isEqual:", *((_QWORD *)v5 + 2))
      && self->_timestamp == v5[3]
      && self->_bookmarkTime == v5[4]
      && self->_hasBeenPlayed == *((unsigned __int8 *)v5 + 8)
      && self->_playCount == *((_QWORD *)v5 + 5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  SBKUniversalPlaybackPositionMetadata *v18;
  __int16 v19;
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SBKUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SBKUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SBKUniversalPlaybackPositionMetadata playCount](self, "playCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SBKUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCE70];
  v21[0] = v4;
  v21[1] = v5;
  v21[2] = v6;
  v21[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:", v10, &unk_24E2B00D8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v13)
  {
    v14 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - error serializing data. %{public}@ error=%{public}@,", buf, 0x16u);
    }

  }
  return v12;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  return +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:](SBKUniversalPlaybackPositionMetadata, "metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:", a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_testableMetadataItem_1
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initAsTestableItem");
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v32[0] = CFSTR("storeItemAdamID");
  v32[1] = CFSTR("subscriptionStoreItemAdamID");
  v32[2] = CFSTR("mediaEntityType");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  valuesForProperties(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("mediaEntityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("storeItemAdamID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v5, "objectForKey:", CFSTR("storeItemAdamID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
    v12 = objc_msgSend(v10, "longLongValue");
  else
    v12 = objc_msgSend(v10, "unsignedLongLongValue");
  v13 = v12;

  if (!v13)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("subscriptionStoreItemAdamID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();
    objc_msgSend(v5, "objectForKey:", CFSTR("subscriptionStoreItemAdamID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v15 & 1) != 0)
      v18 = objc_msgSend(v16, "longLongValue");
    else
      v18 = objc_msgSend(v16, "unsignedLongLongValue");
    v13 = v18;

  }
  if (!v13 || v7 == 3 || v7 == 4)
  {
    v31[0] = CFSTR("podcastURL");
    v31[1] = CFSTR("podcastGUID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    valuesForProperties(v3, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    storageItemIdentifierForProperties(v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v30[0] = CFSTR("title");
      v30[1] = CFSTR("artist");
      v30[2] = CFSTR("albumTitle");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      valuesForProperties(v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      storageItemIdentifierForProperties(v4, v5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
        goto LABEL_13;
      v29[0] = CFSTR("title");
      v29[1] = CFSTR("albumTitle");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      valuesForProperties(v3, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      storageItemIdentifierForProperties(v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        v28[0] = CFSTR("title");
        v28[1] = CFSTR("artist");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        valuesForProperties(v3, v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        storageItemIdentifierForProperties(v4, v5);
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v27 = CFSTR("title");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          valuesForProperties(v3, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          storageItemIdentifierForProperties(v25, v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v25;
          v5 = v26;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
    }
    v20 = (void *)v23;
    v4 = v21;
    v5 = v22;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v13);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v20 = (void *)v19;
LABEL_16:

  return v20;
}

+ (id)metadataWithValuesFromDataSourceItem:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SBKUniversalPlaybackPositionMetadata *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("bookmarkTime"), v9, CFSTR("bookmarkMetadataTimestamp"), v10, CFSTR("hasBeenPalyed"), v11, CFSTR("playCount"), 0);

  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v12, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __77__SBKUniversalPlaybackPositionMetadata_metadataWithValuesFromDataSourceItem___block_invoke;
  v24[3] = &unk_24E2A7968;
  v25 = v12;
  v16 = v12;
  objc_msgSend(v4, "enumerateValuesForProperties:usingBlock:", v15, v24);

  v17 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  +[SBKUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:](SBKUniversalPlaybackPositionMetadata, "keyValueStoreItemIdentifierForItem:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBKUniversalPlaybackPositionMetadata setItemIdentifier:](v17, "setItemIdentifier:", v18);
  objc_msgSend(v16, "valueForKey:", CFSTR("bookmarkMetadataTimestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v17, "setTimestamp:");

  objc_msgSend(v16, "valueForKey:", CFSTR("bookmarkTime"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v17, "setBookmarkTime:");

  objc_msgSend(v16, "valueForKey:", CFSTR("hasBeenPalyed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v17, "setHasBeenPlayed:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v16, "valueForKey:", CFSTR("playCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v17, "setPlayCount:", objc_msgSend(v22, "integerValue"));

  return v17;
}

+ (id)metadataWithItemIdentifier:(id)a3 bookmarkTime:(double)a4 bookmarkTimestamp:(double)a5 hasBeenPlayed:(BOOL)a6 playCount:(unint64_t)a7
{
  _BOOL8 v8;
  id v11;
  SBKUniversalPlaybackPositionMetadata *v12;

  v8 = a6;
  v11 = a3;
  v12 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  -[SBKUniversalPlaybackPositionMetadata setItemIdentifier:](v12, "setItemIdentifier:", v11);

  -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v12, "setTimestamp:", a5);
  -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v12, "setBookmarkTime:", a4);
  -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v12, "setHasBeenPlayed:", v8);
  -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v12, "setPlayCount:", a7);
  return v12;
}

+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4
{
  return (id)objc_msgSend(a1, "metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:", a3, a4, 0);
}

+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5
{
  NSObject *v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  SBKUniversalPlaybackPositionMetadata *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  int v36;
  double v37;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 1, 0, &v41);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v41;
    if (v11)
    {
      v12 = v11;
      v5 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v12;
        _os_log_impl(&dword_21E4FD000, v5, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - error deserializing data. error=%{public}@,", buf, 0xCu);
      }

    }
    if (v10)
    {
      v13 = 0;
    }
    else
    {
      v40 = 0;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v9, &v40);
      v13 = v40;
      -[NSObject setDecodingFailurePolicy:](v5, "setDecodingFailurePolicy:", 0);
      v15 = (void *)MEMORY[0x24BDBCF20];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject decodeObjectOfClasses:forKey:](v5, "decodeObjectOfClasses:forKey:", v19, *MEMORY[0x24BDD0E88]);
      v10 = objc_claimAutoreleasedReturnValue();

      -[NSObject finishDecoding](v5, "finishDecoding");
      if (!v10)
      {
        if (!a5)
        {
          v33 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v8;
            _os_log_impl(&dword_21E4FD000, v33, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - encountered invalid data while unarchiving payload for itemIdentifier: %@", buf, 0xCu);
          }
          v10 = 0;
          v14 = 0;
          goto LABEL_56;
        }
        v10 = 0;
        goto LABEL_52;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_52;
    -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("pver"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20
      || (-[NSObject objectForKey:](v10, "objectForKey:", CFSTR("pver")),
          v5 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("pver"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v23, "integerValue");

      if (!v20)
        goto LABEL_18;
    }
    else
    {
      -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("pver"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "integerValue");

    }
LABEL_18:

    if (!v22)
    {
      v14 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
      -[SBKUniversalPlaybackPositionMetadata setItemIdentifier:](v14, "setItemIdentifier:", v8);
      -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("bktm"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24
        || (-[NSObject objectForKey:](v10, "objectForKey:", CFSTR("bktm")),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("bktm"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");

        if (!v24)
        {
LABEL_24:

          -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("hbpl"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27
            || (-[NSObject objectForKey:](v10, "objectForKey:", CFSTR("hbpl")),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("hbpl"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", objc_msgSend(v29, "BOOLValue"));

            if (!v27)
            {
LABEL_29:

              -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("plct"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v30
                || (-[NSObject objectForKey:](v10, "objectForKey:", CFSTR("plct")),
                    v22 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("plct"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", objc_msgSend(v32, "integerValue"));

                if (!v30)
                  goto LABEL_34;
              }
              else
              {
                -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("plct"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", objc_msgSend(v31, "integerValue"));

              }
LABEL_34:

              -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("tstm"));
              v33 = objc_claimAutoreleasedReturnValue();
              if (!v33
                || (-[NSObject objectForKey:](v10, "objectForKey:", CFSTR("tstm")),
                    v22 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("tstm"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 0;
                v35 = 1;
              }
              else
              {
                -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("tstm"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = 0;
                v36 = 1;
              }
              objc_msgSend(v34, "doubleValue");
              if (v37 <= -*MEMORY[0x24BDBD230] || v37 == 0.0)
                v37 = -*MEMORY[0x24BDBD230];
              -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v14, "setTimestamp:", v37);
              if (v36)

              if (v35)
              if (v33)

LABEL_56:
              goto LABEL_57;
            }
          }
          else
          {
            -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("hbpl"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", objc_msgSend(v28, "BOOLValue"));

          }
          goto LABEL_29;
        }
      }
      else
      {
        -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("bktm"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");

      }
      goto LABEL_24;
    }
LABEL_52:
    v14 = 0;
LABEL_57:

    goto LABEL_58;
  }
  v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4FD000, v10, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - keyValueStorePayload=nil", buf, 2u);
  }
  v14 = 0;
LABEL_58:

  return v14;
}

uint64_t __77__SBKUniversalPlaybackPositionMetadata_metadataWithValuesFromDataSourceItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKey:", a3, a2);
  return result;
}

@end
