@implementation PGPotentialMemory

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4
{
  PGPotentialMemory *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGPotentialMemory;
  result = -[PGPotentialMemory init](&v7, sel_init);
  if (result)
  {
    result->_category = a3;
    result->_subcategory = a4;
    result->_score = -1.0;
    result->_contentScore = -1.0;
  }
  return result;
}

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNode:(id)a5
{
  id v9;
  PGPotentialMemory *v10;
  PGPotentialMemory *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGPotentialMemory;
  v10 = -[PGPotentialMemory init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_category = a3;
    v10->_subcategory = a4;
    v10->_sourceType = 1;
    objc_storeStrong((id *)&v10->_momentNode, a5);
    v11->_score = -1.0;
    v11->_contentScore = -1.0;
  }

  return v11;
}

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNodes:(id)a5 sourceType:(int64_t)a6
{
  id v11;
  PGPotentialMemory *v12;
  PGPotentialMemory *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialMemory;
  v12 = -[PGPotentialMemory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_category = a3;
    v12->_subcategory = a4;
    v12->_sourceType = a6;
    objc_storeStrong((id *)&v12->_momentNodes, a5);
    v13->_score = -1.0;
    v13->_contentScore = -1.0;
  }

  return v13;
}

- (NSDate)localStartDate
{
  id *p_localStartDate;
  uint64_t v3;
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_localStartDate = (id *)&self->_localStartDate;
  if (!self->_localStartDate)
  {
    if (self->_momentNode)
    {
      -[PGGraphMomentNode localStartDate](self->_momentNode, "localStartDate");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *p_localStartDate;
      *p_localStartDate = (id)v3;

    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->_momentNodes;
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "localStartDate", (_QWORD)v12);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!*p_localStartDate
              || objc_msgSend(MEMORY[0x1E0D4B130], "compareDate:toDate:toUnitGranularity:", v10, *p_localStartDate, 16) == -1)
            {
              objc_storeStrong(p_localStartDate, v10);
            }

          }
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

    }
  }
  return (NSDate *)*p_localStartDate;
}

- (NSDate)localEndDate
{
  id *p_localEndDate;
  uint64_t v3;
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_localEndDate = (id *)&self->_localEndDate;
  if (!self->_localEndDate)
  {
    if (self->_momentNode)
    {
      -[PGGraphMomentNode localEndDate](self->_momentNode, "localEndDate");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *p_localEndDate;
      *p_localEndDate = (id)v3;

    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->_momentNodes;
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "localEndDate", (_QWORD)v12);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!*p_localEndDate
              || objc_msgSend(MEMORY[0x1E0D4B130], "compareDate:toDate:toUnitGranularity:", v10, *p_localEndDate, 16) == 1)
            {
              objc_storeStrong(p_localEndDate, v10);
            }

          }
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

    }
  }
  return (NSDate *)*p_localEndDate;
}

- (NSDate)universalStartDate
{
  id *p_universalStartDate;
  uint64_t v3;
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_universalStartDate = (id *)&self->_universalStartDate;
  if (!self->_universalStartDate)
  {
    if (self->_momentNode)
    {
      -[PGGraphMomentNode universalStartDate](self->_momentNode, "universalStartDate");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *p_universalStartDate;
      *p_universalStartDate = (id)v3;

    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = self->_momentNodes;
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "universalStartDate", (_QWORD)v14);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (!*p_universalStartDate || (objc_msgSend(v10, "timeIntervalSinceDate:"), v12 < 0.0))
              objc_storeStrong(p_universalStartDate, v11);

            ++v9;
          }
          while (v7 != v9);
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

    }
  }
  return (NSDate *)*p_universalStartDate;
}

- (NSDate)universalEndDate
{
  id *p_universalEndDate;
  uint64_t v3;
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_universalEndDate = (id *)&self->_universalEndDate;
  if (!self->_universalEndDate)
  {
    if (self->_momentNode)
    {
      -[PGGraphMomentNode universalEndDate](self->_momentNode, "universalEndDate");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *p_universalEndDate;
      *p_universalEndDate = (id)v3;

    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = self->_momentNodes;
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "universalEndDate", (_QWORD)v14);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (!*p_universalEndDate || (objc_msgSend(v10, "timeIntervalSinceDate:"), v12 > 0.0))
              objc_storeStrong(p_universalEndDate, v11);

            ++v9;
          }
          while (v7 != v9);
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

    }
  }
  return (NSDate *)*p_universalEndDate;
}

- (void)_prepareForOverlapCheck
{
  PGGraphMomentNode *momentNode;
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  unint64_t v7;
  void *numberOfAssetsByMomentIDs;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSUInteger v12;
  NSSet *v13;
  NSDictionary *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSSet *momentIDs;
  PGPotentialMemory *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  momentNode = self->_momentNode;
  if (!momentNode)
  {
    v12 = -[NSSet count](self->_momentNodes, "count");
    v13 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v12);
    v14 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = self;
    v15 = self->_momentNodes;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[NSSet addObject:](v13, "addObject:", v22);
            v23 = objc_msgSend(v21, "numberOfAssets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v24, v22);

            v18 += v23;
          }

        }
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v25, CFSTR("totalNumberOfAssets"));

    momentIDs = v27->_momentIDs;
    v27->_momentIDs = v13;
    v4 = v13;

    numberOfAssetsByMomentIDs = v27->_numberOfAssetsByMomentIDs;
    v27->_numberOfAssetsByMomentIDs = v14;
    goto LABEL_16;
  }
  -[PGGraphMomentNode uuid](momentNode, "uuid");
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_momentIDs;
    self->_momentIDs = v5;

    v7 = -[PGGraphMomentNode numberOfAssets](self->_momentNode, "numberOfAssets");
    v33[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    numberOfAssetsByMomentIDs = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = CFSTR("totalNumberOfAssets");
    v34[0] = numberOfAssetsByMomentIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_numberOfAssetsByMomentIDs;
    self->_numberOfAssetsByMomentIDs = v10;

LABEL_16:
  }

}

- (void)_resetOverlapCheck
{
  NSSet *momentIDs;
  NSDictionary *numberOfAssetsByMomentIDs;

  momentIDs = self->_momentIDs;
  self->_momentIDs = 0;

  numberOfAssetsByMomentIDs = self->_numberOfAssetsByMomentIDs;
  self->_numberOfAssetsByMomentIDs = 0;

}

- (double)computeContentScore
{
  PGGraphMomentNode *momentNode;
  double result;
  NSSet *momentNodes;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  _BOOL4 v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  momentNode = self->_momentNode;
  if (momentNode)
  {
    -[PGGraphMomentNode contentScore](momentNode, "contentScore");
LABEL_16:
    self->_contentScore = result;
    return result;
  }
  momentNodes = self->_momentNodes;
  if (momentNodes)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = momentNodes;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "contentScore");
          v10 = v10 + v12;
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    result = v10 / (double)-[NSSet count](self->_momentNodes, "count");
    goto LABEL_16;
  }
  self->_contentScore = 0.0;
  v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  result = 0.0;
  if (v13)
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Memory Creation: computeContentScore called with no momentNode set.", v14, 2u);
    return self->_contentScore;
  }
  return result;
}

- (id)buildAssetCollectionUsingMemoryController:(id)a3 withMinimumNumberOfAssets:(unint64_t)a4
{
  id v6;
  void *v7;
  PGGraphMomentNode *v8;
  void *v9;
  PHAssetCollection *v10;
  PHAssetCollection *v11;
  PHAssetCollection *assetCollection;
  NSSet *momentNodes;
  uint64_t v14;
  NSSet *v15;
  id v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v36;
  uint64_t v37;
  PGPotentialMemory *v38;
  void *v39;
  NSSet *obj;
  PHAssetCollection *obja;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v8 = self->_momentNode;
    if (v8)
    {
LABEL_3:
      -[PGGraphMomentNode uuid](v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PGGraphMomentNode numberOfAssets](v8, "numberOfAssets") < a4)
      {

        v10 = 0;
LABEL_40:

        goto LABEL_41;
      }
      objc_msgSend(v6, "momentForMomentID:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "estimatedAssetCount") >= a4)
        objc_storeStrong((id *)&self->_assetCollection, v32);

LABEL_39:
      v10 = self->_assetCollection;
      goto LABEL_40;
    }
    momentNodes = self->_momentNodes;
    if (!momentNodes)
      goto LABEL_31;
    v14 = -[NSSet count](momentNodes, "count");
    v15 = self->_momentNodes;
    if (v14 == 1)
    {
      -[NSSet anyObject](v15, "anyObject");
      v8 = (PGGraphMomentNode *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_3;
      v15 = self->_momentNodes;
    }
    if (v15)
    {
      v36 = a4;
      v39 = v7;
      v37 = MEMORY[0x1CAA4EB2C]();
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "curationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultAssetFetchOptionsForMemoriesWithoutPrefetch");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v38 = self;
      obj = self->_momentNodes;
      v44 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v44)
      {
        v42 = v6;
        v43 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v52 != v43)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v19, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "momentForMomentID:", v21);
            v22 = objc_claimAutoreleasedReturnValue();
            if (!v22)
            {
              objc_msgSend(v6, "loggingConnection");
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "Memory Creation: Nil asset collection for momentNode, graph is out-of-sync with the photo library.", buf, 2u);
              }

              objc_autoreleasePoolPop(v20);
              self = v38;
              v7 = v39;
              v30 = (void *)v37;

              goto LABEL_37;
            }
            v23 = (void *)v22;
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v22, v45);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v48 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "localIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "addObject:", v29);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v26);
            }

            objc_autoreleasePoolPop(v20);
            v6 = v42;
          }
          v44 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (v44)
            continue;
          break;
        }
      }

      v30 = (void *)v37;
      self = v38;
      v7 = v39;
      if (objc_msgSend(v16, "count") >= v36)
      {
        objc_msgSend(v6, "assetCollectionWithAssetLocalIdentifiers:", v16);
        v31 = objc_claimAutoreleasedReturnValue();
        obja = v38->_assetCollection;
        v38->_assetCollection = (PHAssetCollection *)v31;

      }
LABEL_37:

      objc_autoreleasePoolPop(v30);
    }
    else
    {
LABEL_31:
      objc_msgSend(v6, "loggingConnection");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v33, OS_LOG_TYPE_ERROR, "Memory Creation: buildAssetCollection called with no momentNode set.", buf, 2u);
      }

    }
    v8 = 0;
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v7);
  v11 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
  assetCollection = self->_assetCollection;
  self->_assetCollection = v11;

  v10 = self->_assetCollection;
LABEL_41:

  return v10;
}

- (unint64_t)memoryCategory
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ must implement %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithName:reason:userInfo:", v6, v11, 0);

  objc_exception_throw(objc_retainAutorelease(v12));
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  void *v3;
  PGGraphMomentNodeCollection *v4;
  PGGraphMomentNodeCollection *v5;
  NSSet *momentNodes;
  void *v7;

  if (-[PGPotentialMemory sourceType](self, "sourceType") == 1 && self->_momentNode)
  {
    -[PGPotentialMemory momentNode](self, "momentNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collection");
    v4 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [PGGraphMomentNodeCollection alloc];
    momentNodes = self->_momentNodes;
    -[NSSet anyObject](momentNodes, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MAElementCollection initWithSet:graph:](v5, "initWithSet:graph:", momentNodes, v7);

  }
  return v4;
}

- (PHAssetCollection)assetCollection
{
  return (PHAssetCollection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMomentNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (void)setSubcategory:(unint64_t)a3
{
  self->_subcategory = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSDate)localDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)peopleUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPeopleUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEventName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (double)contentScore
{
  return self->_contentScore;
}

- (void)setContentScore:(double)a3
{
  self->_contentScore = a3;
}

- (NSSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (NSSet)momentIDs
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)numberOfAssetsByMomentIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfAssetsByMomentIDs, 0);
  objc_storeStrong((id *)&self->_momentIDs, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_peopleUUIDs, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

@end
