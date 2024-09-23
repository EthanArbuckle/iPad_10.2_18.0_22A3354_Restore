@implementation PRPosterCollectionDiffInspector

- (PRPosterCollectionDiffInspector)initWithCollection:(id)a3 newCollection:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  PRPosterCollectionDiffInspector *v11;
  PRPosterCollectionDiffInspector *v12;
  id *p_lhsCollection;
  id *p_rhsCollection;
  void *v15;
  void *v16;
  uint64_t v17;
  NSOrderedCollectionDifference *postersDiff;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  uint64_t v46;
  NSOrderedCollectionDifference *assocPostersDiff;
  void *v48;
  void *v49;
  BOOL associatedPostersAreEqual;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  BOOL *p_selectedPostersAreEqual;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9)
  {
    NSClassFromString(CFSTR("PRPosterCollection"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterCollectionClass]"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterCollectionDiffInspector initWithCollection:newCollection:].cold.3();
      objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6A07C8);
    }
  }

  v10 = v8;
  NSClassFromString(CFSTR("PRPosterCollection"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollectionDiffInspector initWithCollection:newCollection:].cold.1();
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A0700);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterCollectionClass]"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollectionDiffInspector initWithCollection:newCollection:].cold.1();
    objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A0764);
  }

  v73.receiver = self;
  v73.super_class = (Class)PRPosterCollectionDiffInspector;
  v11 = -[PRPosterCollectionDiffInspector init](&v73, sel_init);
  v12 = v11;
  if (v11)
  {
    p_lhsCollection = (id *)&v11->_lhsCollection;
    objc_storeStrong((id *)&v11->_lhsCollection, a3);
    p_rhsCollection = (id *)&v12->_rhsCollection;
    objc_storeStrong((id *)&v12->_rhsCollection, a4);
    if (v9)
    {
      -[PRPosterCollection orderedPosters](v12->_rhsCollection, "orderedPosters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterCollection orderedPosters](v12->_lhsCollection, "orderedPosters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "differenceFromOrderedSet:withOptions:usingEquivalenceTest:", v16, 0, &__block_literal_global_91_0);
      v17 = objc_claimAutoreleasedReturnValue();
      postersDiff = v12->_postersDiff;
      v12->_postersDiff = (NSOrderedCollectionDifference *)v17;

    }
    else
    {
      v15 = v12->_postersDiff;
      v12->_postersDiff = 0;
    }

    -[PRPosterCollection orderedPosters](v12->_lhsCollection, "orderedPosters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterCollection orderedPosters](v12->_rhsCollection, "orderedPosters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_postersAreEqual = BSEqualObjects();

    v12->_orderedPostersAreEqual = !-[NSOrderedCollectionDifference hasChanges](v12->_postersDiff, "hasChanges");
    -[PRPosterCollection selectedPoster](v12->_lhsCollection, "selectedPoster");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterCollection selectedPoster](v12->_rhsCollection, "selectedPoster");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_path");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "serverIdentity");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "posterUUID");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_path");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "serverIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "posterUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v25;
    v58 = v10;
    v59 = v9;
    v64 = v23;
    v57 = v24;
    if ((BSEqualObjects() & 1) != 0)
    {
      objc_msgSend(v23, "_path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "serverIdentity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "serverIdentity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_selectedPostersAreEqual = objc_msgSend(v29, "compare:", v31) == 0;
      p_selectedPostersAreEqual = &v12->_selectedPostersAreEqual;

    }
    else
    {
      v12->_selectedPostersAreEqual = 0;
      p_selectedPostersAreEqual = &v12->_selectedPostersAreEqual;
    }

    v32 = (void *)objc_opt_new();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(*p_lhsCollection, "orderedPosters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v70 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*p_lhsCollection, "associatedPosterForPoster:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      }
      while (v35);
    }

    v39 = (void *)objc_opt_new();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(*p_rhsCollection, "orderedPosters");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v66 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*p_rhsCollection, "associatedPosterForPoster:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            objc_msgSend(v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      }
      while (v42);
    }

    objc_msgSend(v39, "differenceFromOrderedSet:withOptions:usingEquivalenceTest:", v32, 0, &__block_literal_global_93);
    v46 = objc_claimAutoreleasedReturnValue();
    assocPostersDiff = v12->_assocPostersDiff;
    v12->_assocPostersDiff = (NSOrderedCollectionDifference *)v46;

    objc_msgSend(v39, "set");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "set");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_associatedPostersAreEqual = objc_msgSend(v48, "isEqualToSet:", v49);

    associatedPostersAreEqual = v12->_associatedPostersAreEqual;
    if (associatedPostersAreEqual)
    {
      v51 = v57;
      associatedPostersAreEqual = *p_selectedPostersAreEqual;
      v10 = v58;
      v9 = v59;
      if (*p_selectedPostersAreEqual)
      {
        associatedPostersAreEqual = v12->_orderedPostersAreEqual;
        if (associatedPostersAreEqual)
          associatedPostersAreEqual = v12->_postersAreEqual;
      }
    }
    else
    {
      v10 = v58;
      v9 = v59;
      v51 = v57;
    }
    v12->_isEqual = associatedPostersAreEqual;

  }
  return v12;
}

uint64_t __68__PRPosterCollectionDiffInspector_initWithCollection_newCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  return v11;
}

uint64_t __68__PRPosterCollectionDiffInspector_initWithCollection_newCollection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  return v11;
}

- (PRPosterCollection)initialCollection
{
  return self->_lhsCollection;
}

- (PRPosterCollection)newCollection
{
  return self->_rhsCollection;
}

- (NSSet)removedPosters
{
  NSSet *removedPosters;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  int v16;
  NSSet *v17;
  NSSet *v18;
  id obj;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  removedPosters = self->_removedPosters;
  if (removedPosters)
  {
    v3 = removedPosters;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[NSOrderedCollectionDifference removals](self->_postersDiff, "removals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_95_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)objc_msgSend(v8, "copy");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NSOrderedCollectionDifference insertions](self->_postersDiff, "insertions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v12;
          v21[1] = 3221225472;
          v21[2] = __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke_2;
          v21[3] = &unk_1E2185378;
          v21[4] = v14;
          v16 = objc_msgSend(v15, "bs_containsObjectPassingTest:", v21);

          if (v16)
            objc_msgSend(v8, "removeObject:", v14);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v17 = (NSSet *)objc_msgSend(v8, "copy");
    v18 = self->_removedPosters;
    self->_removedPosters = v17;

    v3 = self->_removedPosters;
  }
  return v3;
}

uint64_t __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (NSSet)addedPosters
{
  NSSet *addedPosters;
  PRPosterCollectionDiffInspector *v3;
  NSOrderedCollectionDifference *postersDiff;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PRPosterCollectionDiffInspector *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  uint64_t v21;
  NSSet *v22;
  id obj;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  addedPosters = self->_addedPosters;
  if (!addedPosters)
  {
    v3 = self;
    postersDiff = self->_postersDiff;
    if (postersDiff)
    {
      v5 = (void *)MEMORY[0x1E0C99E20];
      -[NSOrderedCollectionDifference insertions](postersDiff, "insertions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bs_map:", &__block_literal_global_97);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = (id)objc_msgSend(v8, "copy");
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        v12 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            v15 = v3;
            -[NSOrderedCollectionDifference removals](v3->_postersDiff, "removals");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = v12;
            v25[1] = 3221225472;
            v25[2] = __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke_2;
            v25[3] = &unk_1E2185378;
            v25[4] = v14;
            v17 = objc_msgSend(v16, "bs_containsObjectPassingTest:", v25);

            if (v17)
              objc_msgSend(v8, "removeObject:", v14);
            v3 = v15;
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v10);
      }

      v18 = objc_msgSend(v8, "copy");
      v19 = v3->_addedPosters;
      v3->_addedPosters = (NSSet *)v18;

    }
    else
    {
      -[PRPosterCollection orderedPosters](v3->_rhsCollection, "orderedPosters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      v22 = v3->_addedPosters;
      v3->_addedPosters = (NSSet *)v21;

    }
    addedPosters = v3->_addedPosters;
  }
  return addedPosters;
}

uint64_t __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (NSSet)updatedPosters
{
  NSSet *updatedPosters;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  PRPosterCollection *rhsCollection;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSSet *v20;
  NSSet *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  updatedPosters = self->_updatedPosters;
  if (updatedPosters)
    return updatedPosters;
  v22 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PRPosterCollection orderedPosters](self->_lhsCollection, "orderedPosters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        rhsCollection = self->_rhsCollection;
        objc_msgSend(v9, "_path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serverIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "posterUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterCollection posterWithUUID:](rhsCollection, "posterWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "_path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "serverIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "serverIdentity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "isNewerVersionOfIdentity:", v18);

          if (v19)
            objc_msgSend(v22, "addObject:", v14);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v20 = (NSSet *)objc_msgSend(v22, "copy");
  v21 = self->_updatedPosters;
  self->_updatedPosters = v20;

  return (NSSet *)v22;
}

- (NSSet)updatedAssocPosters
{
  NSSet *updatedAssocPosters;
  PRPosterCollectionDiffInspector *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PRPosterCollection *rhsCollection;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PRPosterCollectionDiffInspector *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSSet *v26;
  NSSet *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  updatedAssocPosters = self->_updatedAssocPosters;
  if (updatedAssocPosters)
    return updatedAssocPosters;
  v4 = self;
  v28 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PRPosterCollection orderedPosters](v4->_lhsCollection, "orderedPosters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      v29 = v7;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        rhsCollection = v4->_rhsCollection;
        objc_msgSend(v10, "_path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "posterUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterCollection posterWithUUID:](rhsCollection, "posterWithUUID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[PRPosterCollection associatedPosterForPoster:](v4->_lhsCollection, "associatedPosterForPoster:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[PRPosterCollection associatedPosterForPoster:](v4->_rhsCollection, "associatedPosterForPoster:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              objc_msgSend(v17, "_path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "serverIdentity");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "_path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "serverIdentity");
              v21 = v8;
              v22 = v4;
              v23 = v5;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v19, "isNewerVersionOfIdentity:", v24);

              v5 = v23;
              v4 = v22;
              v8 = v21;

              v7 = v29;
              if (v30)
                objc_msgSend(v28, "addObject:", v18);
            }

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  v25 = objc_msgSend(v28, "copy");
  v26 = v4->_updatedAssocPosters;
  v4->_updatedAssocPosters = (NSSet *)v25;

  v27 = v4->_updatedAssocPosters;
  return v27;
}

- (NSSet)removedAssocPosters
{
  NSSet *removedAssocPosters;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  NSSet *v16;
  NSSet *v17;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  removedAssocPosters = self->_removedAssocPosters;
  if (removedAssocPosters)
  {
    v3 = removedAssocPosters;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[NSOrderedCollectionDifference removals](self->_assocPostersDiff, "removals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_98);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_msgSend(v5, "copy");
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[NSOrderedCollectionDifference insertions](self->_assocPostersDiff, "insertions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v11;
          v20[1] = 3221225472;
          v20[2] = __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke_2;
          v20[3] = &unk_1E2185378;
          v20[4] = v13;
          v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v20);

          if (v15)
            objc_msgSend(v5, "removeObject:", v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v16 = (NSSet *)objc_msgSend(v5, "copy");
    v17 = self->_removedAssocPosters;
    self->_removedAssocPosters = v16;

    v3 = self->_removedAssocPosters;
  }
  return v3;
}

uint64_t __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (NSSet)addedAssocPosters
{
  NSSet *addedAssocPosters;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  NSSet *v16;
  NSSet *v17;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  addedAssocPosters = self->_addedAssocPosters;
  if (addedAssocPosters)
  {
    v3 = addedAssocPosters;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[NSOrderedCollectionDifference insertions](self->_assocPostersDiff, "insertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_99_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_msgSend(v5, "copy");
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[NSOrderedCollectionDifference removals](self->_assocPostersDiff, "removals");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v11;
          v20[1] = 3221225472;
          v20[2] = __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke_2;
          v20[3] = &unk_1E2185378;
          v20[4] = v13;
          v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v20);

          if (v15)
            objc_msgSend(v5, "removeObject:", v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v16 = (NSSet *)objc_msgSend(v5, "copy");
    v17 = self->_addedAssocPosters;
    self->_addedAssocPosters = v16;

    v3 = self->_addedAssocPosters;
  }
  return v3;
}

uint64_t __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (NSOrderedCollectionDifference)postersDiff
{
  return self->_postersDiff;
}

- (BOOL)associatedPostersAreEqual
{
  return self->_associatedPostersAreEqual;
}

- (BOOL)orderedPostersAreEqual
{
  return self->_orderedPostersAreEqual;
}

- (BOOL)postersAreEqual
{
  return self->_postersAreEqual;
}

- (BOOL)selectedPostersAreEqual
{
  return self->_selectedPostersAreEqual;
}

- (BOOL)isEqual
{
  return self->_isEqual;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postersDiff, 0);
  objc_storeStrong((id *)&self->_assocPostersDiff, 0);
  objc_storeStrong((id *)&self->_addedAssocPosters, 0);
  objc_storeStrong((id *)&self->_removedAssocPosters, 0);
  objc_storeStrong((id *)&self->_updatedAssocPosters, 0);
  objc_storeStrong((id *)&self->_addedPosters, 0);
  objc_storeStrong((id *)&self->_removedPosters, 0);
  objc_storeStrong((id *)&self->_updatedPosters, 0);
  objc_storeStrong((id *)&self->_rhsCollection, 0);
  objc_storeStrong((id *)&self->_lhsCollection, 0);
}

- (void)initWithCollection:newCollection:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCollection:newCollection:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
