@implementation PLSearchIndexingNormalizedWorkItem

- (PLSearchIndexingNormalizedWorkItem)initWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 entityToIndex:(unint64_t)a6 timestamp:(id)a7
{
  id v12;
  id v13;
  PLSearchIndexingNormalizedWorkItem *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSDate *timestamp;
  objc_super v20;

  v12 = a3;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PLSearchIndexingNormalizedWorkItem;
  v14 = -[PLSearchIndexingNormalizedWorkItem init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v14->_jobType = a4;
    v14->_jobFlags = a5;
    v14->_entityToIndex = a6;
    v17 = objc_msgSend(v13, "copy");
    timestamp = v14->_timestamp;
    v14->_timestamp = (NSDate *)v17;

  }
  return v14;
}

- (BOOL)isInsert
{
  return (LOBYTE(self->_jobFlags) >> 1) & 1;
}

- (BOOL)isRemoval
{
  return self->_jobFlags & 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (signed)jobType
{
  return self->_jobType;
}

- (int64_t)jobFlags
{
  return self->_jobFlags;
}

- (unint64_t)entityToIndex
{
  return self->_entityToIndex;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)coalesceWorkItemA:(id)a3 itemB:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v9))
  {
    v29 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v10 = objc_msgSend(v6, "entityToIndex");
  v11 = objc_msgSend(v7, "entityToIndex");

  if (v10 == v11)
  {
    objc_msgSend(v6, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14 == -1)
      v15 = v6;
    else
      v15 = v7;
    if (v14 == -1)
      v16 = v7;
    else
      v16 = v6;
    v8 = v15;
    v9 = v16;
    if ((objc_msgSend(v9, "isRemoval") & 1) != 0
      || objc_msgSend(v8, "isRemoval") && (objc_msgSend(v9, "isInsert") & 1) == 0)
    {
      v30 = objc_alloc((Class)a1);
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v6, "jobType");
      v32 = objc_msgSend(v8, "entityToIndex");
      objc_msgSend(v8, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v30;
      v25 = v18;
      v26 = v31;
      v27 = 1;
      v28 = v32;
    }
    else
    {
      v17 = objc_alloc((Class)a1);
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "jobType");
      v20 = objc_msgSend(v9, "jobFlags");
      v21 = objc_msgSend(v8, "jobFlags") | v20;
      v22 = objc_msgSend(v8, "entityToIndex");
      objc_msgSend(v8, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      v25 = v18;
      v26 = v19;
      v27 = v21;
      v28 = v22;
    }
    v29 = (void *)objc_msgSend(v24, "initWithIdentifier:jobType:jobFlags:entityToIndex:timestamp:", v25, v26, v27, v28, v23);

    goto LABEL_17;
  }
  v29 = 0;
LABEL_18:

  return v29;
}

@end
