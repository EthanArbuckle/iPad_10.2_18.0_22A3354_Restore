@implementation PGLocationsResolver

- (PGLocationsResolver)initWithMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGLocationsResolver *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3928];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PGLocationsResolver initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:](self, "initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:", v16, v10, v9);
  return v17;
}

- (PGLocationsResolver)initWithSortedMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGLocationsResolver *v12;
  PGLocationsResolver *v13;
  PGIncompleteLocationResolver *v14;
  void *incompleteLocationResolver;
  void *v16;
  PGIncompleteLocationResolver *v17;
  PGIncompleteLocationResolver *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGLocationsResolver;
  v12 = -[PGLocationsResolver init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_maximumMissingLocationsThreshold = 0.25;
    objc_storeStrong((id *)&v12->_sortedMoments, a3);
    objc_storeStrong((id *)&v13->_locationHelper, a5);
    if (v10)
    {
      v14 = (PGIncompleteLocationResolver *)v10;
      incompleteLocationResolver = v13->_incompleteLocationResolver;
      v13->_incompleteLocationResolver = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGCommonTitleUtility addressNodesFromMomentNodes:](PGCommonTitleUtility, "addressNodesFromMomentNodes:", v16);
      incompleteLocationResolver = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", incompleteLocationResolver, v11);
      v18 = v13->_incompleteLocationResolver;
      v13->_incompleteLocationResolver = v17;

    }
  }

  return v13;
}

- (NSArray)resolvedMomentNodes
{
  NSArray *resolvedMomentNodes;

  resolvedMomentNodes = self->_resolvedMomentNodes;
  if (!resolvedMomentNodes)
  {
    -[PGLocationsResolver _resolve](self, "_resolve");
    resolvedMomentNodes = self->_resolvedMomentNodes;
  }
  return resolvedMomentNodes;
}

- (NSArray)resolvedLocationNodes
{
  NSArray *resolvedLocationNodes;

  resolvedLocationNodes = self->_resolvedLocationNodes;
  if (!resolvedLocationNodes)
  {
    -[PGLocationsResolver _resolve](self, "_resolve");
    resolvedLocationNodes = self->_resolvedLocationNodes;
  }
  return resolvedLocationNodes;
}

- (NSMapTable)resolvedLocationNodesToAddressNodesMapTable
{
  NSMapTable *resolvedLocationNodesToAddressNodesMapTable;
  NSMapTable *v4;

  if (self->_shouldCreateLocationToAddressMapTable)
  {
    resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    if (!resolvedLocationNodesToAddressNodesMapTable)
    {
      -[PGLocationsResolver _resolve](self, "_resolve");
      resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    }
    v4 = resolvedLocationNodesToAddressNodesMapTable;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setCreateLocationToAddressMapTable:(BOOL)a3
{
  NSArray *resolvedLocationNodes;
  NSArray *resolvedMomentNodes;
  NSMapTable *resolvedLocationNodesToAddressNodesMapTable;

  if (self->_shouldCreateLocationToAddressMapTable != a3)
  {
    self->_shouldCreateLocationToAddressMapTable = a3;
    resolvedLocationNodes = self->_resolvedLocationNodes;
    self->_resolvedLocationNodes = 0;

    resolvedMomentNodes = self->_resolvedMomentNodes;
    self->_resolvedMomentNodes = 0;

    resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    self->_resolvedLocationNodesToAddressNodesMapTable = 0;

  }
}

- (void)setMaximumMissingLocationsThreshold:(float)a3
{
  float v3;
  float v4;

  if (self->_maximumMissingLocationsThreshold != a3)
  {
    v3 = 0.0;
    if (a3 >= 0.0)
      v3 = a3;
    if (a3 <= 1.0)
      v4 = v3;
    else
      v4 = 1.0;
    self->_maximumMissingLocationsThreshold = v4;
  }
}

- (void)_resolve
{
  double v3;
  uint64_t i;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSArray *v41;
  double v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  unint64_t v48;
  uint64_t v49;
  NSArray *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  NSArray *resolvedMomentNodes;
  NSArray *v66;
  NSArray *resolvedLocationNodes;
  NSArray *v68;
  NSMapTable *resolvedLocationNodesToAddressNodesMapTable;
  NSMapTable *v70;
  NSArray *obj;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSArray *v78;
  void *v79;
  NSMapTable *v80;
  NSArray *v81;
  void *v82;
  id v83;
  id v84;
  char v85;
  NSArray *v86;
  id v87;
  NSArray *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t v103[128];
  uint8_t buf[16];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldCreateLocationToAddressMapTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v80 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v80 = 0;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = self->_sortedMoments;
  v75 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
  if (v75)
  {
    v74 = *(_QWORD *)v100;
    v73 = 0.0;
    v72 = 0.0;
    v3 = 0.0;
    while (1)
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v100 != v74)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1CAA4EB2C]();
        v7 = (double)(unint64_t)objc_msgSend(v5, "numberOfAssets");
        objc_msgSend(v5, "addressEdges");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
        if (!v10)
        {

          -[NSArray addObject:](v78, "addObject:", v5);
          goto LABEL_66;
        }
        v11 = v10;
        v79 = v5;
        v76 = v6;
        v77 = i;
        v85 = 0;
        v87 = *(id *)v96;
        v12 = 0.0;
        v13 = 0.0;
        v14 = 0.0;
        v83 = v9;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(id *)v96 != v87)
              objc_enumerationMutation(v83);
            v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            v17 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v16, "targetNode");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NSSet count](self->_ignoredAddressNodes, "count")
              || !-[NSSet containsObject:](self->_ignoredAddressNodes, "containsObject:", v18))
            {
              -[PGGraphLocationHelper closestLocationNodeFromLocationNode:withDimension:reverse:](self->_locationHelper, "closestLocationNodeFromLocationNode:withDimension:reverse:", v18, 6, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                goto LABEL_20;
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "loggingConnection");
              v21 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v18;
                _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cannot find city node from address node: %@. Will look for inEdges", buf, 0xCu);
              }

              -[PGGraphLocationHelper closestLocationNodeFromLocationNode:withDimension:reverse:](self->_locationHelper, "closestLocationNodeFromLocationNode:withDimension:reverse:", v18, 6, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
LABEL_20:
                objc_msgSend(v19, "label");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v22);

                if (v23 <= 6)
                {
                  objc_msgSend(v18, "isOcean");
                  v28 = 0;
                  goto LABEL_30;
                }
                *(_QWORD *)buf = 0;
                -[PGIncompleteLocationResolver resolvedLocationNodeForIncompleteAddressNode:withPreferredTargetDimension:resolvedDimension:](self->_incompleteLocationResolver, "resolvedLocationNodeForIncompleteAddressNode:withPreferredTargetDimension:resolvedDimension:", v18, 6, buf);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v24;
                if (v24)
                  v26 = *(_QWORD *)buf >= v23;
                else
                  v26 = 1;
                if (!v26)
                {
                  v27 = v24;

                  v23 = *(_QWORD *)buf;
                  v19 = v27;
                }

                v28 = v23 > 6;
                if (!objc_msgSend(v18, "isOcean") || v23 <= 6)
                {
LABEL_30:
                  if (!-[NSSet count](self->_ignoredLocationNodes, "count")
                    || !-[NSSet containsObject:](self->_ignoredLocationNodes, "containsObject:", v19))
                  {
                    objc_msgSend(v16, "relevance");
                    v30 = v29;
                    objc_msgSend(v16, "relevance");
                    v32 = v31 * v7;
                    if (v28)
                      v33 = v32;
                    else
                      v33 = -0.0;
                    if (v23 <= 8)
                      v34 = -0.0;
                    else
                      v34 = v32;
                    if (v23 <= 8)
                      v35 = v33;
                    else
                      v35 = -0.0;
                    if (!-[NSArray containsObject:](v81, "containsObject:", v19))
                      -[NSArray addObject:](v81, "addObject:", v19);
                    objc_msgSend(v82, "objectForKey:", v19);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "universalStartDate");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = v37;
                    if (!v36 || v37 && objc_msgSend(v37, "compare:", v36) == -1)
                      objc_msgSend(v82, "setObject:forKey:", v38, v19);
                    if ((v85 & 1) == 0)
                      -[NSArray addObject:](v78, "addObject:", v79);
                    if (self->_shouldCreateLocationToAddressMapTable)
                    {
                      -[NSMapTable objectForKey:](v80, "objectForKey:", v19);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v39)
                      {
                        objc_msgSend(MEMORY[0x1E0C99E20], "set");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMapTable setObject:forKey:](v80, "setObject:forKey:", v39, v19);
                      }
                      objc_msgSend(v39, "addObject:", v18);

                    }
                    v14 = v14 + v30;
                    v12 = v12 + v34;
                    v13 = v13 + v35;

                    goto LABEL_57;
                  }
                }
              }
              else
              {
                if ((v85 & 1) == 0)
                  -[NSArray addObject:](v78, "addObject:", v79);
                v19 = 0;
LABEL_57:
                v85 = 1;
              }

            }
            objc_autoreleasePoolPop(v17);
          }
          v9 = v83;
          v11 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
        }
        while (v11);

        if (v13 > 0.0)
          v72 = v72 + v13 / v14;
        v6 = v76;
        i = v77;
        if (v12 > 0.0)
          v73 = v73 + v12 / v14;
LABEL_66:
        v3 = v3 + v7;

        objc_autoreleasePoolPop(v6);
      }
      v75 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
      if (!v75)
        goto LABEL_70;
    }
  }
  v72 = 0.0;
  v73 = 0.0;
  v3 = 0.0;
LABEL_70:

  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __31__PGLocationsResolver__resolve__block_invoke;
  v93[3] = &unk_1E842F2E0;
  v40 = v82;
  v94 = v40;
  -[NSArray sortUsingComparator:](v81, "sortUsingComparator:", v93);
  if (v72 > 0.0 || v73 > 0.0)
  {
    v84 = v40;
    v42 = v3 - v72 - v73;
    v43 = v42;
    v44 = v3;
    v45 = v43 / v44;
    v46 = 1.0 - self->_maximumMissingLocationsThreshold;
    if (v45 >= v46)
    {
      v48 = 6;
    }
    else
    {
      v47 = v72 + v42;
      if ((float)(v47 / v44) >= v46)
        v48 = 8;
      else
        v48 = 9;
    }
    v49 = -[NSArray count](v81, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v49);
    v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v88 = v81;
    v52 = -[NSArray countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v90;
      v86 = v50;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v90 != v54)
            objc_enumerationMutation(v88);
          v56 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
          objc_msgSend(v56, "label");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v57);

          if (v58 == v48)
          {
            if ((objc_msgSend(v51, "containsObject:", v56) & 1) == 0)
            {
              objc_msgSend(v51, "addObject:", v56);
              -[NSArray addObject:](v50, "addObject:", v56);
            }
          }
          else if (v58 >= v48)
          {
            if (self->_shouldCreateLocationToAddressMapTable)
              -[NSMapTable removeObjectForKey:](v80, "removeObjectForKey:", v56);
          }
          else
          {
            -[PGGraphLocationHelper closestLocationNodeFromLocationNode:withDimension:reverse:](self->_locationHelper, "closestLocationNodeFromLocationNode:withDimension:reverse:", v56, v48, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v59;
            if (v59)
            {
              objc_msgSend(v59, "label");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v61);

              v50 = v86;
              if (v62 == v48 && (objc_msgSend(v51, "containsObject:", v60) & 1) == 0)
              {
                objc_msgSend(v51, "addObject:", v60);
                -[NSArray addObject:](v86, "addObject:", v60);
              }
              if (self->_shouldCreateLocationToAddressMapTable)
              {
                -[NSMapTable objectForKey:](v80, "objectForKey:", v56);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMapTable removeObjectForKey:](v80, "removeObjectForKey:", v56);
                -[NSMapTable objectForKey:](v80, "objectForKey:", v60);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v64)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMapTable setObject:forKey:](v80, "setObject:forKey:", v64, v60);
                }
                objc_msgSend(v64, "unionSet:", v63);

                v50 = v86;
              }
            }

          }
        }
        v53 = -[NSArray countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
      }
      while (v53);
    }

    v41 = v50;
    v40 = v84;
  }
  else
  {
    v41 = v81;
  }
  resolvedMomentNodes = self->_resolvedMomentNodes;
  self->_resolvedMomentNodes = v78;
  v66 = v78;

  resolvedLocationNodes = self->_resolvedLocationNodes;
  self->_resolvedLocationNodes = v41;
  v68 = v41;

  resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
  self->_resolvedLocationNodesToAddressNodesMapTable = v80;
  v70 = v80;

}

- (float)maximumMissingLocationsThreshold
{
  return self->_maximumMissingLocationsThreshold;
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return self->_incompleteLocationResolver;
}

- (void)setIncompleteLocationResolver:(id)a3
{
  objc_storeStrong((id *)&self->_incompleteLocationResolver, a3);
}

- (NSArray)sortedMoments
{
  return self->_sortedMoments;
}

- (void)setSortedMoments:(id)a3
{
  objc_storeStrong((id *)&self->_sortedMoments, a3);
}

- (NSSet)ignoredLocationNodes
{
  return self->_ignoredLocationNodes;
}

- (void)setIgnoredLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredLocationNodes, a3);
}

- (NSSet)ignoredAddressNodes
{
  return self->_ignoredAddressNodes;
}

- (void)setIgnoredAddressNodes:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredAddressNodes, a3);
}

- (void)setResolvedMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedMomentNodes, a3);
}

- (void)setResolvedLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedLocationNodes, a3);
}

- (BOOL)shouldCreateLocationToAddressMapTable
{
  return self->_shouldCreateLocationToAddressMapTable;
}

- (void)setShouldCreateLocationToAddressMapTable:(BOOL)a3
{
  self->_shouldCreateLocationToAddressMapTable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedLocationNodesToAddressNodesMapTable, 0);
  objc_storeStrong((id *)&self->_resolvedLocationNodes, 0);
  objc_storeStrong((id *)&self->_resolvedMomentNodes, 0);
  objc_storeStrong((id *)&self->_ignoredAddressNodes, 0);
  objc_storeStrong((id *)&self->_ignoredLocationNodes, 0);
  objc_storeStrong((id *)&self->_sortedMoments, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

uint64_t __31__PGLocationsResolver__resolve__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
      v9 = objc_msgSend(v7, "compare:", v8);
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
