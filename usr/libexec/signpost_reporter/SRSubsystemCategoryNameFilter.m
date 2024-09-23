@implementation SRSubsystemCategoryNameFilter

- (SRSubsystemCategoryNameFilter)initWithDictionaryArray:(id)a3
{
  id v4;
  FilterRootTier *v5;
  FilterTier *filterTreeRoot;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SRSubsystemCategoryNameFilter *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v30;
  id obj;
  uint8_t v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];

  v4 = a3;
  if (!v4)
  {
LABEL_24:
    v19 = 0;
    goto LABEL_25;
  }
  v38.receiver = self;
  v38.super_class = (Class)SRSubsystemCategoryNameFilter;
  self = -[SRSubsystemCategoryNameFilter init](&v38, "init");
  if (!self)
    goto LABEL_14;
  v5 = objc_alloc_init(FilterRootTier);
  filterTreeRoot = self->_filterTreeRoot;
  self->_filterTreeRoot = &v5->super;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v30 = v4;
  v9 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Subsystem")));
      if (!v12)
      {
        v20 = sub_100003384();
        v13 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          sub_1000097C4(v13, v21, v22);
        goto LABEL_23;
      }
      v13 = v12;
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Cap")));
      if (!v14)
      {
        v23 = sub_100003384();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_1000097F8(v24, v25, v26);

        goto LABEL_23;
      }
      v15 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DownsampleRatio")));
      if (!v16)
      {
        v27 = sub_100003384();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          sub_10000982C(&v32, v33, v28);

LABEL_23:
        v4 = v30;

        goto LABEL_24;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Category")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Name")));
      -[SRSubsystemCategoryNameFilter addEntryWithSubsystem:category:name:cap:downsampleRatio:](self, "addEntryWithSubsystem:category:name:cap:downsampleRatio:", v13, v17, v18, objc_msgSend(v15, "unsignedLongLongValue"), objc_msgSend(v16, "unsignedLongLongValue"));

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v4 = v30;
    if (v8)
      continue;
    break;
  }
LABEL_13:

LABEL_14:
  self = self;
  v19 = self;
LABEL_25:

  return v19;
}

- (BOOL)shouldReportObject:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter downsampleEntryForObject:](self, "downsampleEntryForObject:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "shouldReportThisTime");
  else
    v5 = 1;

  return v5;
}

- (id)downsampleEntryForObject:(id)a3
{
  id v4;
  FilterQuery *v5;
  void *v6;
  void *v7;
  void *v8;
  FilterQuery *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = [FilterQuery alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v9 = -[FilterQuery initWithSubsystem:category:name:](v5, "initWithSubsystem:category:name:", v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter filterTreeRoot](self, "filterTreeRoot"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entryForQuery:", v9));

  return v11;
}

- (void)addEntryWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 cap:(unint64_t)a6 downsampleRatio:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  FilterQuery *v16;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v16 = -[FilterQuery initWithSubsystem:category:name:]([FilterQuery alloc], "initWithSubsystem:category:name:", v14, v13, v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter filterTreeRoot](self, "filterTreeRoot"));
  objc_msgSend(v15, "setCap:downsampleRatio:forQuery:", a6, a7, v16);

}

- (FilterTier)filterTreeRoot
{
  return (FilterTier *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterTreeRoot, 0);
}

@end
