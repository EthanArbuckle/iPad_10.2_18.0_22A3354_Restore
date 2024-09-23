@implementation PLPhotosHighlightCluster

- (PLPhotosHighlightCluster)initWithMoments:(id)a3
{
  id v5;
  PLPhotosHighlightCluster *v6;
  PLPhotosHighlightCluster *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotosHighlightCluster;
  v6 = -[PLPhotosHighlightCluster init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_moments, a3);
    *(_DWORD *)&v7->_category = 0;
  }

  return v7;
}

- (void)setMoments:(id)a3
{
  NSSet *v5;
  NSSet *assets;
  NSDate *startDate;
  NSDate *endDate;
  NSSet *v9;

  v5 = (NSSet *)a3;
  if (self->_moments != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_moments, a3);
    assets = self->_assets;
    self->_assets = 0;

    startDate = self->_startDate;
    self->_startDate = 0;

    endDate = self->_endDate;
    self->_endDate = 0;

    v5 = v9;
  }

}

- (NSDate)startDate
{
  NSDate *startDate;

  startDate = self->_startDate;
  if (!startDate)
  {
    -[PLPhotosHighlightCluster _calculatePropertyValues](self, "_calculatePropertyValues");
    startDate = self->_startDate;
  }
  return startDate;
}

- (NSDate)endDate
{
  NSDate *endDate;

  endDate = self->_endDate;
  if (!endDate)
  {
    -[PLPhotosHighlightCluster _calculatePropertyValues](self, "_calculatePropertyValues");
    endDate = self->_endDate;
  }
  return endDate;
}

- (NSSet)assets
{
  NSSet *assets;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  assets = self->_assets;
  if (!assets)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PLPhotosHighlightCluster moments](self, "moments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "assets");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (NSSet *)objc_msgSend(v4, "copy");
    v12 = self->_assets;
    self->_assets = v11;

    assets = self->_assets;
  }
  return assets;
}

- (void)_calculatePropertyValues
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSDate *v5;
  NSDate *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *v13;
  NSDate *startDate;
  NSDate *v15;
  NSDate *endDate;
  NSDate *v17;
  id obj;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PLPhotosHighlightCluster moments](self, "moments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v20 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6 || objc_msgSend(v10, "compare:", v6) == -1)
        {
          v12 = v10;

          v20 = objc_msgSend(v9, "timeZoneOffset");
          v6 = v12;
          if (v5)
          {
LABEL_11:
            if (objc_msgSend(v11, "compare:", v5) != 1)
              goto LABEL_13;
          }
        }
        else if (v5)
        {
          goto LABEL_11;
        }
        v13 = v11;

        v4 = objc_msgSend(v9, "timeZoneOffset");
        v5 = v13;
LABEL_13:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v3)
        goto LABEL_17;
    }
  }
  v4 = 0;
  v20 = 0;
  v5 = 0;
  v6 = 0;
LABEL_17:

  startDate = self->_startDate;
  self->_startDate = v6;
  v15 = v6;

  endDate = self->_endDate;
  self->_endDate = v5;
  v17 = v5;

  self->_startTimeZoneOffset = v20;
  self->_endTimeZoneOffset = v4;

}

- (NSSet)moments
{
  return self->_moments;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)category
{
  return self->_category;
}

- (void)setCategory:(unsigned __int16)a3
{
  self->_category = a3;
}

- (unsigned)kind
{
  return self->_kind;
}

- (void)setKind:(unsigned __int16)a3
{
  self->_kind = a3;
}

- (int)startTimeZoneOffset
{
  return self->_startTimeZoneOffset;
}

- (void)setStartTimeZoneOffset:(int)a3
{
  self->_startTimeZoneOffset = a3;
}

- (int)endTimeZoneOffset
{
  return self->_endTimeZoneOffset;
}

- (void)setEndTimeZoneOffset:(int)a3
{
  self->_endTimeZoneOffset = a3;
}

- (NSCopying)objectID
{
  return self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

@end
