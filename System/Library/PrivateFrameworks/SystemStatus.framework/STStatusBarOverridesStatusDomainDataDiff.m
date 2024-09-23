@implementation STStatusBarOverridesStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  STStatusBarData *v8;
  void *v9;
  void *v10;
  STStatusBarData *v11;
  STStatusBarData *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  STMutableListData *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  STMutableListData *v44;
  void *v45;
  STStatusBarOverridesStatusDomainDataDiff *v46;
  STMutableListData *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  STStatusBarData *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v53 = a4;
  v54 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v52 = v5;
  objc_msgSend(v5, "customOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(STStatusBarData);
  v55 = v8;

  objc_msgSend(v53, "customOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init(STStatusBarData);
  v12 = v11;

  objc_msgSend(v53, "editedKeys");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  +[STStatusBarData entryKeys](STStatusBarData, "entryKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v61;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v61 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v17);
        -[STStatusBarData entryForKey:](v55, "entryForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusBarData entryForKey:](v12, "entryForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v19;
        v22 = v20;
        if (v21 == v22 || (objc_msgSend(v21, "isEqual:", v22) & 1) != 0)
        {
          v23 = 0;
        }
        else
        {
          if (v22)
          {
            v24 = v22;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          v23 = v24;
        }

        if (!v23)
        {
          if (!objc_msgSend(v51, "containsObject:", v18))
            goto LABEL_23;
          if (v22)
          {
            v23 = v22;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (!v23)
              goto LABEL_23;
          }
        }
        v25 = qword_1ED0CB480;
        v26 = v18;
        if (v25 != -1)
          dispatch_once(&qword_1ED0CB480, &__block_literal_global_14);
        v27 = objc_msgSend((id)_MergedGlobals_13, "indexOfObject:", v26);

        objc_msgSend(v54, "setObject:forSetting:", v23, v27);
LABEL_23:

        ++v17;
      }
      while (v15 != v17);
      v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      v15 = v28;
    }
    while (v28);
  }

  objc_msgSend(v52, "suppressedBackgroundActivityIdentifierListData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "suppressedBackgroundActivityIdentifierListData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "editedIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "count"))
  {
    v50 = v31;
    v33 = objc_alloc_init(STMutableListData);
    v48 = objc_alloc_init(STMutableListData);
    v49 = v32;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v52, "suppressedBackgroundActivityIdentifiers", v48);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "containsObject:", v39);

          objc_msgSend(v53, "suppressedBackgroundActivityIdentifiers");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "containsObject:", v39);

          if ((v41 & 1) == 0 && (v43 & 1) == 0)
            -[STMutableListData addObject:](v33, "addObject:", v39);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v36);
    }

    v44 = v48;
    if (-[STListData count](v33, "count") || -[STListData count](v48, "count"))
    {
      +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v33, v48, v48);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "diffByApplyingDiff:", v45);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = v50;
    }

    v32 = v49;
  }
  v46 = -[STStatusBarOverridesStatusDomainDataDiff initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:]([STStatusBarOverridesStatusDomainDataDiff alloc], "initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:", v54, v31);

  return v46;
}

- (STStatusBarOverridesStatusDomainDataDiff)init
{
  id v3;
  STListDataDiff *v4;
  STStatusBarOverridesStatusDomainDataDiff *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = objc_alloc_init(STListDataDiff);
  v5 = -[STStatusBarOverridesStatusDomainDataDiff initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:](self, "initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:", v3, v4);

  return v5;
}

- (STStatusBarOverridesStatusDomainDataDiff)initWithChanges:(id)a3 suppressedBackgroundActivityIdentifierListDataDiff:(id)a4
{
  id v6;
  id v7;
  STStatusBarOverridesStatusDomainDataDiff *v8;
  uint64_t v9;
  BSSettings *changes;
  uint64_t v11;
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STStatusBarOverridesStatusDomainDataDiff;
  v8 = -[STStatusBarOverridesStatusDomainDataDiff init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    changes = v8->_changes;
    v8->_changes = (BSSettings *)v9;

    v11 = objc_msgSend(v7, "copy");
    suppressedBackgroundActivityIdentifierListDataDiff = v8->_suppressedBackgroundActivityIdentifierListDataDiff;
    v8->_suppressedBackgroundActivityIdentifierListDataDiff = (STListDataDiff *)v11;

  }
  return v8;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STStatusBarOverridesStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  BSSettings *changes;
  BSSettings *v5;
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;
  STListDataDiff *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v5 = changes;
  if ((-[BSSettings isEmpty](v5, "isEmpty") & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__STStatusBarOverridesStatusDomainDataDiff_applyToMutableData___block_invoke;
    v10[3] = &unk_1E91E4A88;
    v11 = v9;
    -[BSSettings enumerateObjectsWithBlock:](v5, "enumerateObjectsWithBlock:", v10);

  }
  if (self)
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  else
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  v7 = suppressedBackgroundActivityIdentifierListDataDiff;
  objc_msgSend(v9, "suppressedBackgroundActivityIdentifierListData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListDataDiff applyToMutableListData:](v7, "applyToMutableListData:", v8);

}

void __63__STStatusBarOverridesStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  if (qword_1ED0CB480 != -1)
    dispatch_once(&qword_1ED0CB480, &__block_literal_global_14);
  objc_msgSend((id)_MergedGlobals_13, "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v7;
  }
  else
  {

    v6 = 0;
  }
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setEntry:forKey:", v6, v5);

}

- (BOOL)isEmpty
{
  BSSettings *changes;
  BSSettings *v4;
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;
  BOOL v6;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v4 = changes;
  if (-[BSSettings isEmpty](v4, "isEmpty"))
  {
    if (self)
      suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
    else
      suppressedBackgroundActivityIdentifierListDataDiff = 0;
    v6 = -[STListDataDiff isEmpty](suppressedBackgroundActivityIdentifierListDataDiff, "isEmpty");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  BSSettings *changes;
  void *v7;
  void *v8;
  id v9;
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;
  uint64_t v11;
  STListDataDiff *v12;
  void *v13;
  STStatusBarOverridesStatusDomainDataDiff *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v7 = (void *)-[BSSettings mutableCopy](changes, "mutableCopy");
  if (v5)
    v8 = (void *)v5[1];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v7, "applySettings:", v9);
  if (!self)
  {
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
    if (v5)
      goto LABEL_8;
LABEL_15:
    v11 = 0;
    goto LABEL_9;
  }
  suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  if (!v5)
    goto LABEL_15;
LABEL_8:
  v11 = v5[2];
LABEL_9:
  v12 = suppressedBackgroundActivityIdentifierListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v12, "diffByApplyingDiff:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[STStatusBarOverridesStatusDomainDataDiff initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:]([STStatusBarOverridesStatusDomainDataDiff alloc], "initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:", v7, v13);
LABEL_11:

  return v14;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STStatusBarOverridesStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BSSettings *changes;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke;
  v20[3] = &unk_1E91E5C28;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", changes, v20);
  if (self)
    self = (STStatusBarOverridesStatusDomainDataDiff *)self->_suppressedBackgroundActivityIdentifierListDataDiff;
  v15 = v8;
  v16 = 3221225472;
  v17 = __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke_2;
  v18 = &unk_1E91E5C50;
  v19 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v15);
  v13 = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return v13;
}

id __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_changes);
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", suppressedBackgroundActivityIdentifierListDataDiff);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarOverridesStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  STListDataDiff *suppressedBackgroundActivityIdentifierListDataDiff;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("changes"));
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", suppressedBackgroundActivityIdentifierListDataDiff, CFSTR("suppressedBackgroundActivityIdentifierListDataDiff"));

}

- (STStatusBarOverridesStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STStatusBarOverridesStatusDomainDataDiff *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suppressedBackgroundActivityIdentifierListDataDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STStatusBarOverridesStatusDomainDataDiff initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:](self, "initWithChanges:suppressedBackgroundActivityIdentifierListDataDiff:", v5, v6);
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarOverridesStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarOverridesStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarOverridesStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((uint64_t)self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend((id)a1, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", a3);
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v7 = *(id *)(a1 + 8);
  if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v6, "activeMultilinePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v14 = &unk_1E91E4AD8;
    v15 = v7;
    v16 = v6;
    objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, &v11);

  }
  v9 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", *(_QWORD *)(a1 + 16), CFSTR("suppressedBackgroundActivityIdentifiers"), 1, v11, v12, v13, v14);

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarOverridesStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((uint64_t)self, a3, 0);
}

void __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
  v2[3] = &unk_1E91E4A88;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsWithBlock:", v2);

}

void __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (qword_1ED0CB480 != -1)
    dispatch_once(&qword_1ED0CB480, &__block_literal_global_14);
  objc_msgSend((id)_MergedGlobals_13, "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", v7, v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifierListDataDiff, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
