@implementation VUICollectionComparator

void __71__VUICollectionComparator__indexByIdentifierDictionaryWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

void __67__VUICollectionComparator__identifiersWithObjects_identifierBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  VUICollisionSafeIdentifier *v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  v4 = v3 + 1;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v8);

  v7 = -[VUICollisionSafeIdentifier initWithRootIdentifier:collisionCount:]([VUICollisionSafeIdentifier alloc], "initWithRootIdentifier:collisionCount:", v8, v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6
{
  return -[VUICollectionComparator _changeSetWithSourceObjects:destinationObjects:identifierBlock:isEqualBlock:updateChangeSetBlock:](self, "_changeSetWithSourceObjects:destinationObjects:identifierBlock:isEqualBlock:updateChangeSetBlock:", a3, a4, a5, a6, 0);
}

- (id)_changeSetWithSourceObjects:(id)a3 destinationObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6 updateChangeSetBlock:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUICollectionChange *v17;
  void *v18;
  void *v19;
  VUICollectionChange *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  VUICollectionChange *v31;
  void *v33;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  id v38;
  id v39;
  VUICollectionChangeSet *v40;
  void *v41;
  void *v42;
  id obj;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v38 = a4;
  v12 = a5;
  *(_QWORD *)&v37 = a6;
  *((_QWORD *)&v37 + 1) = a7;
  v40 = objc_alloc_init(VUICollectionChangeSet);
  v33 = v11;
  v36 = v12;
  objc_msgSend((id)objc_opt_class(), "_identifiersWithObjects:identifierBlock:", v11, v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_identifiersWithObjects:identifierBlock:", v38, v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "count");
  objc_msgSend((id)objc_opt_class(), "_indexByIdentifierDictionaryWithIdentifiers:", v42);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_indexByIdentifierDictionaryWithIdentifiers:", v41);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke;
  v65[3] = &unk_1E9F2BE58;
  v44 = v14;
  v66 = v44;
  v35 = v16;
  v67 = v35;
  v34 = v15;
  v68 = v34;
  objc_msgSend(v42, "enumerateObjectsUsingBlock:", v65);
  objc_msgSend(v42, "removeObjectsAtIndexes:", v35);
  if (objc_msgSend(v35, "count"))
  {
    v17 = -[VUICollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:]([VUICollectionChange alloc], "initWithChangeKind:sourceIndexes:destinationIndexes:", 2, v35, 0);
    -[VUICollectionChangeSet setDeleteChange:](v40, "setDeleteChange:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_2;
  v62[3] = &unk_1E9F2BE80;
  v45 = v13;
  v63 = v45;
  v39 = v18;
  v64 = v39;
  objc_msgSend(v41, "enumerateObjectsUsingBlock:", v62);
  objc_msgSend(v41, "objectsAtIndexes:", v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "insertObjects:atIndexes:", v19, v39);

  if (objc_msgSend(v39, "count"))
  {
    v20 = -[VUICollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:]([VUICollectionChange alloc], "initWithChangeKind:sourceIndexes:destinationIndexes:", 1, 0, v39);
    -[VUICollectionChangeSet setInsertChange:](v40, "setInsertChange:", v20);

  }
  objc_msgSend((id)objc_opt_class(), "_movedIdentifiersWithSourceIdentifiers:destinationIdentifiers:", v42, v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v21;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v45, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v28, "unsignedIntegerValue"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[VUICollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:]([VUICollectionChange alloc], "initWithChangeKind:sourceIndexes:destinationIndexes:", 3, v29, v30);
        objc_msgSend(v22, "addObject:", v31);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v22, "count"))
    -[VUICollectionChangeSet setMoveChanges:](v40, "setMoveChanges:", v22);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v37 != 0)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_36;
    v46[3] = &unk_1E9F2BEA8;
    v47 = v33;
    v48 = v38;
    v49 = *((id *)&v37 + 1);
    v50 = (id)v37;
    v51 = &v52;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v46);

  }
  if (objc_msgSend((id)v53[5], "count"))
    -[VUICollectionChangeSet setUpdateChanges:](v40, "setUpdateChanges:", v53[5]);
  _Block_object_dispose(&v52, 8);

  return v40;
}

+ (id)_movedIdentifiersWithSourceIdentifiers:(id)a3 destinationIdentifiers:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v32;
  void *v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
      {
        objc_msgSend(v8, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = objc_msgSend(v12, "integerValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i - v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v8;
        }
        objc_msgSend(v16, "setObject:forKey:", v15, v10);

        objc_msgSend(v8, "objectForKey:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = objc_msgSend(v17, "integerValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i - v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v34;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v8;
        }
        objc_msgSend(v20, "setObject:forKey:", v19, v11);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = 0;
    v23 = 0;
    while (1)
    {
      if (v23 >= objc_msgSend(v5, "count"))
      {
        v24 = 0;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v22 >= objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v6, "objectAtIndex:", v22);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (!v24 || !v25 || (objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
        goto LABEL_27;
      if (objc_msgSend(v21, "containsObject:", v24))
        goto LABEL_25;
      if (!objc_msgSend(v21, "containsObject:", v26))
      {
        objc_msgSend(v34, "objectForKey:", v24);
        v33 = v21;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v27, "integerValue");

        objc_msgSend(v34, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");

        v21 = v33;
        if (v32 > v29)
        {
          objc_msgSend(v33, "addObject:", v24);
LABEL_25:
          ++v23;
          goto LABEL_29;
        }
        objc_msgSend(v33, "addObject:", v26);
      }
LABEL_28:
      ++v22;
LABEL_29:

      if (v23 >= v7 && v22 >= v7)
        goto LABEL_33;
    }
    v26 = 0;
LABEL_27:
    ++v23;
    goto LABEL_28;
  }
LABEL_33:
  v30 = (void *)objc_msgSend(v21, "copy");

  return v30;
}

+ (id)_indexByIdentifierDictionaryWithIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__VUICollectionComparator__indexByIdentifierDictionaryWithIdentifiers___block_invoke;
  v9[3] = &unk_1E9F2BEF8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)_identifiersWithObjects:(id)a3 identifierBlock:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__VUICollectionComparator__identifiersWithObjects_identifierBlock___block_invoke;
  v16[3] = &unk_1E9F2BED0;
  v19 = v5;
  v17 = v8;
  v10 = v9;
  v18 = v10;
  v11 = v8;
  v12 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  v13 = v18;
  v14 = v10;

  return v14;
}

- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 updateChangeSetBlock:(id)a6
{
  return -[VUICollectionComparator _changeSetWithSourceObjects:destinationObjects:identifierBlock:isEqualBlock:updateChangeSetBlock:](self, "_changeSetWithSourceObjects:destinationObjects:identifierBlock:isEqualBlock:updateChangeSetBlock:", a3, a4, a5, 0, a6);
}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  VUICollectionChange *v13;
  id v14;

  v5 = a2;
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v14, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasChanges") & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
  {
    v10 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUICollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:]([VUICollectionChange alloc], "initWithChangeKind:sourceIndexes:destinationIndexes:", 4, v11, v12);
    -[VUICollectionChange setUpdateChangeSet:](v13, "setUpdateChangeSet:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v13);

LABEL_7:
  }

}

@end
