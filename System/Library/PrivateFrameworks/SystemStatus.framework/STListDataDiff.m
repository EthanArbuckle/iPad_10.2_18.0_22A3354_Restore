@implementation STListDataDiff

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsRemoved, 0);
  objc_storeStrong((id *)&self->_objectsAdded, 0);
}

- (void)applyToMutableListData:(id)a3
{
  id v4;
  STListData *objectsAdded;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  STListData *objectsRemoved;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    objectsAdded = self->_objectsAdded;
  else
    objectsAdded = 0;
  -[STListData objects](objectsAdded, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "addObjectsFromArray:", v6);
  if (self)
    objectsRemoved = self->_objectsRemoved;
  else
    objectsRemoved = 0;
  -[STListData objects](objectsRemoved, "objects");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "removeObjectAtIndex:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "setObjects:", v11);
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  id *v5;
  STListData *objectsAdded;
  void *v7;
  void *v8;
  STMutableListData *v9;
  _QWORD *v10;
  STMutableListData *v11;
  STListData *objectsRemoved;
  void *v13;
  void *v14;
  STMutableListData *v15;
  STMutableListData *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  id *v37;
  id *v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    if (self)
      objectsAdded = self->_objectsAdded;
    else
      objectsAdded = 0;
    v7 = (void *)-[STListData mutableCopy](objectsAdded, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = objc_alloc_init(STMutableListData);
    v11 = v9;

    if (self)
      objectsRemoved = self->_objectsRemoved;
    else
      objectsRemoved = 0;
    v13 = (void *)-[STListData mutableCopy](objectsRemoved, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(STMutableListData);
    v16 = v15;

    v39 = v5;
    v40 = v4;
    if (v5)
    {
      v17 = v5[1];
      v18 = v5[2];
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    v41 = v18;
    objc_msgSend(v41, "objects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          -[STListData objects](v11, "objects", v39, v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "indexOfObject:", v26) == 0x7FFFFFFFFFFFFFFFLL)
            -[STMutableListData addObject:](v16, "addObject:", v26);
          else
            -[STMutableListData removeObject:](v11, "removeObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v23);
    }

    v42 = v17;
    objc_msgSend(v17, "objects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          -[STListData objects](v16, "objects", v39, v40);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "indexOfObject:", v35) == 0x7FFFFFFFFFFFFFFFLL)
            -[STMutableListData addObject:](v11, "addObject:", v35);
          else
            -[STMutableListData removeObject:](v16, "removeObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v32);
    }

    if (!-[STListData count](v11, "count"))
    {

      v11 = 0;
    }
    v37 = v39;
    v4 = v40;
    if (!-[STListData count](v16, "count", v39, v40))
    {

      v16 = 0;
    }
    v10 = -[STListDataDiff initWithObjectsAdded:objectsRemoved:]([STListDataDiff alloc], v11, v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)diffFromListData:(id)a3 toListData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  STListData *v28;
  STListData *v29;
  _QWORD *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "objects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(v14, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v14, "removeObjectAtIndex:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v15, "mutableCopy");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(v21, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), (_QWORD)v32);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v21, "removeObjectAtIndex:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v14, "count"))
    v28 = -[STListData initWithObjects:]([STListData alloc], "initWithObjects:", v14);
  else
    v28 = 0;
  if (objc_msgSend(v21, "count", (_QWORD)v32))
    v29 = -[STListData initWithObjects:]([STListData alloc], "initWithObjects:", v21);
  else
    v29 = 0;
  v30 = -[STListDataDiff initWithObjectsAdded:objectsRemoved:]([STListDataDiff alloc], v28, v29);

  return v30;
}

- (BOOL)isEmpty
{
  STListData *objectsAdded;
  STListData *v4;
  BOOL v5;
  STListData *objectsRemoved;

  if (self)
    objectsAdded = self->_objectsAdded;
  else
    objectsAdded = 0;
  v4 = objectsAdded;
  if (-[STListData count](v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    if (self)
      objectsRemoved = self->_objectsRemoved;
    else
      objectsRemoved = 0;
    v5 = -[STListData count](objectsRemoved, "count") == 0;
  }

  return v5;
}

- (_QWORD)initWithObjectsAdded:(void *)a3 objectsRemoved:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STListDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  STListData *objectsRemoved;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_objectsAdded, CFSTR("objectsAdded"));
    objectsRemoved = self->_objectsRemoved;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("objectsAdded"));
    objectsRemoved = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", objectsRemoved, CFSTR("objectsRemoved"));

}

- (STListDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STListDataDiff *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectsAdded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectsRemoved"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[STListDataDiff initWithObjectsAdded:objectsRemoved:](self, v5, v6);
    v8 = self;
  }

  return v8;
}

- (STListDataDiff)init
{
  return (STListDataDiff *)-[STListDataDiff initWithObjectsAdded:objectsRemoved:](self, 0, 0);
}

- (id)listDataByApplyingToListData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STListDataDiff applyToMutableListData:](self, "applyToMutableListData:", v4);
  return v4;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STListDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  STListData *objectsAdded;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objectsAdded = self->_objectsAdded;
  else
    objectsAdded = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __26__STListDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E91E4AB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", objectsAdded, v19);
  if (self)
    self = (STListDataDiff *)self->_objectsRemoved;
  v14 = v7;
  v15 = 3221225472;
  v16 = __26__STListDataDiff_isEqual___block_invoke_2;
  v17 = &unk_1E91E4AB0;
  v18 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v14);
  v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __26__STListDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __26__STListDataDiff_isEqual___block_invoke_2(uint64_t a1)
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
  STListData *objectsRemoved;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_objectsAdded);
    objectsRemoved = self->_objectsRemoved;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    objectsRemoved = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", objectsRemoved);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STListDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STListDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STListDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  STListDataDiff *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STListDataDiff *v11;

  v3 = self;
  if (self)
  {
    v4 = a3;
    -[STListDataDiff succinctDescriptionBuilder](v3, "succinctDescriptionBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUseDebugDescription:", 0);
    objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

    objc_msgSend(v5, "activeMultilinePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__STListDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v5;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v9);

    v3 = (STListDataDiff *)v7;
  }
  return v3;
}

id __66__STListDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("objects added"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("objects removed"), 1);
}

@end
