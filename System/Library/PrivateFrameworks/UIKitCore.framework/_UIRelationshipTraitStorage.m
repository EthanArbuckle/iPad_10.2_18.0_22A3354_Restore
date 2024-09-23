@implementation _UIRelationshipTraitStorage

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _UIRelationshipTraitStorage *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSOrderedSet mutableCopy](self->_relationshipCandidates, "mutableCopy");
  -[_UITraitStorage object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitStorage keyPath](self, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = v8;
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsObject:", v12) & 1) != 0)
        break;
      objc_msgSend(v9, "insertObject:atIndex:", v12, v11);

      if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_7;
    }

  }
LABEL_7:
  v13 = objc_msgSend(v10, "count");
  if (v13 >= 1)
  {
    v14 = v13;
    do
    {
      v15 = v14 - 1;
      objc_msgSend(v10, "objectAtIndex:", v14 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsObject:", v16) & 1) == 0)
      {
        if (v14 == objc_msgSend(v10, "count"))
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "insertObject:atIndex:", v16, objc_msgSend(v9, "indexOfObject:", v17));

        }
      }

      v14 = v15;
    }
    while ((unint64_t)(v15 + 1) > 1);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = self;
  -[_UITraitStorage records](self, "records");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v24, "traitCollection");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (!v4 || v25)
        {
          v27 = -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v4, v25);

          if (!v27)
            continue;
        }
        objc_msgSend(v24, "addedObjects");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "minusSet:", v28);

        objc_msgSend(v24, "removedObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "unionSet:", v29);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

  objc_msgSend(v9, "minusSet:", v18);
  -[_UITraitStorage object](v33, "object");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitStorage keyPath](v33, "keyPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_uikit_applyValueFromTraitStorage:forKeyPath:", v31, v32);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipCandidates, 0);
}

- (_UIRelationshipTraitStorage)initWithCoder:(id)a3
{
  id v4;
  _UIRelationshipTraitStorage *v5;
  uint64_t v6;
  NSOrderedSet *relationshipCandidates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRelationshipTraitStorage;
  v5 = -[_UITraitStorage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRelationshipCandidates"));
    v6 = objc_claimAutoreleasedReturnValue();
    relationshipCandidates = v5->_relationshipCandidates;
    v5->_relationshipCandidates = (NSOrderedSet *)v6;

  }
  return v5;
}

- (_UIRelationshipTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 relationshipCandidates:(id)a5
{
  id v8;
  _UIRelationshipTraitStorage *v9;
  uint64_t v10;
  NSOrderedSet *relationshipCandidates;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIRelationshipTraitStorage;
  v9 = -[_UITraitStorage initWithObject:keyPath:](&v13, sel_initWithObject_keyPath_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    relationshipCandidates = v9->_relationshipCandidates;
    v9->_relationshipCandidates = (NSOrderedSet *)v10;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRelationshipTraitStorage;
  v4 = a3;
  -[_UITraitStorage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipCandidates, CFSTR("UIRelationshipCandidates"), v5.receiver, v5.super_class);

}

- (void)addRecordWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  _UIRelationshipTraitStorageRecord *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[NSOrderedSet set](self->_relationshipCandidates, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isSubsetOfSet:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 407, CFSTR("Can only add known relationship candidates."));

  }
  -[NSOrderedSet set](self->_relationshipCandidates, "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "isSubsetOfSet:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 408, CFSTR("Can only remove known relationship candidates."));

  }
  if (objc_msgSend(v10, "intersectsSet:", v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 409, CFSTR("Can't both add and remove an object."));

  }
  -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_traitsDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 411, CFSTR("Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@"), v22);

      goto LABEL_8;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        goto LABEL_17;
      objc_msgSend(v16, "_traitsDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }
    else
    {
      v23 = addRecordWithTraitCollection_addedObjects_removedObjects____s_category;
      if (!addRecordWithTraitCollection_addedObjects_removedObjects____s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&addRecordWithTraitCollection_addedObjects_removedObjects____s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v25 = v24;
      objc_msgSend(v16, "_traitsDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }

LABEL_17:
  }
LABEL_8:
  v17 = -[_UIRelationshipTraitStorageRecord initWithTraitCollection:addedObjects:removedObjects:]([_UIRelationshipTraitStorageRecord alloc], "initWithTraitCollection:addedObjects:removedObjects:", v9, v10, v11);
  -[_UITraitStorage addRecord:](self, "addRecord:", v17);

}

- (id)_propertyDescriptionString
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UIRelationshipTraitStorage;
  -[_UITraitStorage _propertyDescriptionString](&v7, sel__propertyDescriptionString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, relationshipCandidates=%@"), v4, self->_relationshipCandidates);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
