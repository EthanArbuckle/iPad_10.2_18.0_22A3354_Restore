@implementation TUIRenderUpdateArrayContainer

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p deleted=%@ inserted=%@ updated=%@>"), v5, self, self->_deleted, self->_inserted, self->_updated));

  return (NSString *)v6;
}

- (TUIRenderUpdateArrayContainer)initWithCurrent:(id)a3 from:(id)a4 to:(id)a5 tracker:(id)a6 flags:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TUIRenderUpdateArrayContainer *v17;
  TUIRenderUpdateArrayContainer *v18;
  void **p_tracker;
  TUIRenderUpdateArrayTracker *v20;
  void *v21;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TUIRenderUpdateArrayContainer;
  v17 = -[TUIRenderUpdateArrayContainer init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_current, a3);
    objc_storeStrong((id *)&v18->_from, a4);
    objc_storeStrong((id *)&v18->_to, a5);
    p_tracker = (void **)&v18->_tracker;
    objc_storeStrong((id *)&v18->_tracker, a6);
    v18->_copyingFlags = a7;
    -[TUIRenderUpdateArrayContainer _compute](v18, "_compute");
    if (!v18->_tracker)
    {
      if (-[NSArray count](v18->_deleted, "count"))
      {
        v20 = objc_alloc_init(TUIRenderUpdateArrayTracker);
        v21 = *p_tracker;
        *p_tracker = v20;

      }
    }
  }

  return v18;
}

- (BOOL)hasDeletesOrInserts
{
  BOOL v3;
  void *v5;

  if (-[NSArray count](self->_deleted, "count") || -[NSArray count](self->_inserted, "count"))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayTracker deletedModels](self->_tracker, "deletedModels"));
  v3 = objc_msgSend(v5, "count") != 0;

  return v3;
}

- (void)_compute
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  TUIRenderUpdateArrayTracker *tracker;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TUIRenderUpdateArrayTracker *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSMutableArray *v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  NSArray *v38;
  NSArray *deleted;
  NSArray *v40;
  NSArray *inserted;
  NSSet *v42;
  NSSet *insertedForAnimations;
  NSDictionary *v44;
  NSDictionary *updated;
  void *v46;
  NSMutableDictionary *v47;
  id obj;
  id v49;
  void *v50;
  NSMutableArray *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining identifierToContainedSubmodelMap](self->_from, "identifierToContainedSubmodelMap"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining identifierToContainedSubmodelMap](self->_current, "identifierToContainedSubmodelMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining identifierToContainedSubmodelMap](self->_to, "identifierToContainedSubmodelMap"));
  v49 = objc_alloc_init((Class)NSMutableSet);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining containedSubmodels](self->_from, "containedSubmodels"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  v46 = v3;
  if (!v4)
  {
    v47 = 0;
    v51 = 0;
    goto LABEL_24;
  }
  v5 = v4;
  v47 = 0;
  v51 = 0;
  v6 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));

      if (v10)
      {
        if (v8 == v10)
          goto LABEL_20;
        tracker = self->_tracker;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayTracker submodelTrackerForIdentifier:](tracker, "submodelTrackerForIdentifier:", v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "computeContainerUpdateCurrent:from:tracker:flags:", v15, v8, v13, 0));
        if (objc_msgSend(v16, "hasDeletesOrInserts"))
        {
          v17 = self->_tracker;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
          -[TUIRenderUpdateArrayTracker setSubmodelTracker:forIdentifier:](v17, "setSubmodelTracker:forIdentifier:", v13, v18);

          v19 = v47;
          if (!v47)
            v19 = objc_opt_new(NSMutableDictionary);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          v47 = v19;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v20);

          v3 = v46;
        }

      }
      else
      {
        if (!v51)
          v51 = objc_opt_new(NSMutableArray);
        v21 = -[TUIRenderModelArrayContaining copySubmodel:forFinalAppearanceWithFlags:](self->_to, "copySubmodel:forFinalAppearanceWithFlags:", v8, self->_copyingFlags);
        v22 = v21;
        if (v21)
          v23 = v21;
        else
          v23 = objc_msgSend(v8, "copyForFinalAppearanceWithFlags:", self->_copyingFlags);
        v13 = v23;

        -[NSMutableArray addObject:](v51, "addObject:", v13);
      }

LABEL_20:
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  }
  while (v5);
LABEL_24:

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining containedSubmodels](self->_to, "containedSubmodels"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v54 != v28)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v31));
        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v31));

          if (!v33)
            objc_msgSend(v49, "addObject:", v31);
        }
        else
        {
          if (!v27)
            v27 = objc_opt_new(NSMutableArray);
          v34 = -[TUIRenderModelArrayContaining copySubmodel:forInitialAppearanceWithFlags:](self->_to, "copySubmodel:forInitialAppearanceWithFlags:", v30, self->_copyingFlags);
          v35 = v34;
          if (v34)
            v36 = v34;
          else
            v36 = objc_msgSend(v30, "copyForInitialAppearanceWithFlags:", self->_copyingFlags);
          v37 = v36;

          -[NSMutableArray addObject:](v27, "addObject:", v37);
          objc_msgSend(v49, "addObject:", v31);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v26);
  }
  else
  {
    v27 = 0;
  }

  v38 = (NSArray *)-[NSMutableArray copy](v51, "copy");
  deleted = self->_deleted;
  self->_deleted = v38;

  v40 = (NSArray *)-[NSMutableArray copy](v27, "copy");
  inserted = self->_inserted;
  self->_inserted = v40;

  v42 = (NSSet *)objc_msgSend(v49, "copy");
  insertedForAnimations = self->_insertedForAnimations;
  self->_insertedForAnimations = v42;

  v44 = (NSDictionary *)-[NSMutableDictionary copy](v47, "copy");
  updated = self->_updated;
  self->_updated = v44;

}

- (id)newToContainerPlusDeletedWithInterests:(id)a3 changes:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSDictionary *updated;
  TUIRenderUpdateChanges *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  TUIRenderUpdateChanges *v25;
  TUIRenderModelArrayContaining *to;
  TUIRenderModelArrayContaining *v27;
  TUIRenderModelArrayContaining *v28;
  TUIRenderUpdateChanges **v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  TUIRenderUpdateArrayContainer *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining identifierToContainedSubmodelMap](self->_to, "identifierToContainedSubmodelMap"));
  if (-[NSArray count](self->_deleted, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayTracker addDeletedInterestInDeletedModels:](self->_tracker, "addDeletedInterestInDeletedModels:", self->_deleted));
    objc_msgSend(v5, "addObject:", v7);

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_A95D4;
  v50 = sub_A95E4;
  v51 = 0;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = sub_A95D4;
  v44 = sub_A95E4;
  v45 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayTracker deletedModels](self->_tracker, "deletedModels", a4));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_A95EC;
  v35[3] = &unk_2407D0;
  v9 = v6;
  v36 = v9;
  v37 = self;
  v38 = &v46;
  v39 = &v40;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);

  if (-[NSDictionary count](self->_updated, "count"))
  {
    if (!v41[5])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining containedSubmodels](self->_to, "containedSubmodels"));
      v11 = (NSMutableArray *)objc_msgSend(v10, "mutableCopy");
      v12 = v11;
      if (!v11)
        v12 = objc_opt_new(NSMutableArray);
      objc_storeStrong(v41 + 5, v12);
      if (!v11)

    }
    updated = self->_updated;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_A9730;
    v32[3] = &unk_240820;
    v34 = &v40;
    v32[4] = self;
    v33 = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](updated, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
  if (v47[5])
    -[TUIRenderUpdateArrayTracker setDeletedModels:](self->_tracker, "setDeletedModels:");
  if (v31)
  {
    v14 = objc_alloc_init(TUIRenderUpdateChanges);
    -[TUIRenderUpdateChanges setInserts:](v14, "setInserts:", self->_insertedForAnimations);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayContainer updated](self, "updated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

    if (!objc_msgSend(v17, "count"))
    {

      v17 = 0;
    }
    -[TUIRenderUpdateChanges setUpdates:](v14, "setUpdates:", v17);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateArrayContainer deleted](self, "deleted"));
    v19 = objc_alloc_init((Class)NSMutableSet);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v22)
            objc_enumerationMutation(v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "identifier"));
          if (v24)
            objc_msgSend(v19, "addObject:", v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v21);
    }

    if (!objc_msgSend(v19, "count"))
    {

      v19 = 0;
    }

    -[TUIRenderUpdateChanges setDeletes:](v14, "setDeletes:", v19);
    v25 = objc_retainAutorelease(v14);
    *v31 = v25;

  }
  to = self->_to;
  if (v41[5])
    v27 = (TUIRenderModelArrayContaining *)-[TUIRenderModelArrayContaining copyWithContainedSubmodels:](to, "copyWithContainedSubmodels:");
  else
    v27 = to;
  v28 = v27;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

- (id)newCurrentContainerPlusInserted
{
  TUIRenderModelArrayContaining *v3;
  void *v4;
  id v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  NSDictionary *updated;
  TUIRenderModelArrayContaining *v14;
  _QWORD v16[4];
  NSMutableArray *v17;
  TUIRenderUpdateArrayContainer *v18;

  v3 = self->_current;
  if (-[NSArray count](self->_inserted, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining containedSubmodels](self->_current, "containedSubmodels"));
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = (NSMutableArray *)v5;
    else
      v7 = objc_opt_new(NSMutableArray);
    v8 = v7;

    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", self->_inserted);
  }
  else
  {
    v8 = 0;
  }
  if (-[NSDictionary count](self->_updated, "count"))
  {
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelArrayContaining containedSubmodels](self->_current, "containedSubmodels"));
      v10 = objc_msgSend(v9, "mutableCopy");
      v11 = v10;
      if (v10)
        v12 = (NSMutableArray *)v10;
      else
        v12 = objc_opt_new(NSMutableArray);
      v8 = v12;

    }
    updated = self->_updated;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_A99E0;
    v16[3] = &unk_240848;
    v8 = v8;
    v17 = v8;
    v18 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](updated, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  if (v8)
  {
    v14 = (TUIRenderModelArrayContaining *)-[TUIRenderModelArrayContaining copyWithContainedSubmodels:](self->_current, "copyWithContainedSubmodels:", v8);

    v3 = v14;
  }

  return v3;
}

- (TUIRenderModelArrayContaining)current
{
  return self->_current;
}

- (TUIRenderModelArrayContaining)from
{
  return self->_from;
}

- (TUIRenderModelArrayContaining)to
{
  return self->_to;
}

- (TUIRenderUpdateArrayTracker)tracker
{
  return self->_tracker;
}

- (NSArray)deleted
{
  return self->_deleted;
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (NSDictionary)updated
{
  return self->_updated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_insertedForAnimations, 0);
}

@end
