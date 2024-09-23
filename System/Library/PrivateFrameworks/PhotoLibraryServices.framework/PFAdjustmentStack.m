@implementation PFAdjustmentStack

- (PFAdjustmentStack)init
{
  PFAdjustmentStack *v2;
  uint64_t v3;
  NSArray *adjustments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAdjustmentStack;
  v2 = -[PFAdjustmentStack init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    adjustments = v2->_adjustments;
    v2->_adjustments = (NSArray *)v3;

    v2->_formatVersion = 1;
  }
  return v2;
}

- (PFAdjustmentStack)initWithAdjustments:(id)a3
{
  id v4;
  PFAdjustmentStack *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *adjustments;
  uint64_t v18;
  NSOrderedSet *maskUUIDs;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PFAdjustmentStack init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v13, "maskUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "maskUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    adjustments = v5->_adjustments;
    v5->_adjustments = (NSArray *)v16;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
      maskUUIDs = v5->_maskUUIDs;
      v5->_maskUUIDs = (NSOrderedSet *)v18;

    }
    v4 = v21;
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_adjustments, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)adjustmentAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_adjustments, "objectAtIndex:", a3);
}

- (id)firstAdjustmentWithIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_adjustments;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "identifier", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v4))
          {
            v6 = v9;

            goto LABEL_12;
          }

        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)adjustmentsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_adjustments;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "identifier", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v4))
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)maskUUIDs
{
  return self->_maskUUIDs;
}

- (unint64_t)count
{
  return -[NSArray count](self->_adjustments, "count");
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p adjustments=%@ masks=%@>"), objc_opt_class(), self, self->_adjustments, self->_maskUUIDs);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskUUIDs, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
}

- (PFAdjustmentStack)initWithEnvelopeDictionary:(id)a3
{
  id v4;
  PFAdjustmentStack *v5;
  void *v6;
  void *v7;
  void *v8;
  NSOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  PFAdjustment *v14;
  PFAdjustment *v15;
  void *v16;
  uint64_t v17;
  NSArray *adjustments;
  uint64_t v19;
  NSOrderedSet *maskUUIDs;
  PFAdjustmentStack *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PFAdjustmentStack;
    v5 = -[PFAdjustmentStack init](&v28, sel_init);
    if (v5)
    {
      v23 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", PFAdjustmentEnvelopeAdjustmentsKey);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = v6;
      v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = -[PFAdjustment initWithArchiveDictionary:]([PFAdjustment alloc], "initWithArchiveDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            if (!v14)
            {

              v5 = 0;
              maskUUIDs = v9;
              goto LABEL_17;
            }
            v15 = v14;
            objc_msgSend(v7, "addObject:", v14);
            -[PFAdjustment maskUUID](v15, "maskUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_msgSend(v8, "addObject:", v16);

          }
          v11 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v11)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
      v17 = objc_claimAutoreleasedReturnValue();
      adjustments = v5->_adjustments;
      v5->_adjustments = (NSArray *)v17;

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v8);
        v19 = objc_claimAutoreleasedReturnValue();
        maskUUIDs = v5->_maskUUIDs;
        v5->_maskUUIDs = (NSOrderedSet *)v19;
LABEL_17:
        v4 = v23;

      }
      else
      {
        v4 = v23;
      }

    }
    self = v5;
    v21 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("envelope must not be nil"));
    v21 = 0;
  }

  return v21;
}

- (id)envelopeDictionary
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_adjustments, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_adjustments;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "archiveDictionary", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E3760F20, PFAdjustmentEnvelopeEnvelopeVersionKey);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, PFAdjustmentEnvelopeAdjustmentsKey);

  return v10;
}

+ (BOOL)isValidEnvelopeDictionary:(id)a3 errors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (+[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentEnvelopeEnvelopeVersionKey, objc_opt_class(), v6))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentEnvelopeEnvelopeVersionKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "unsignedIntegerValue") != 1)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v23 = PFAdjustmentEnvelopeEnvelopeVersionKey;
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), 4, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v16);

      v14 = 0;
LABEL_20:

      goto LABEL_21;
    }

    if (+[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentEnvelopeAdjustmentsKey, objc_opt_class(), v6))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentEnvelopeAdjustmentsKey);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (!+[PFAdjustmentSerialization validateValue:isOfType:errors:](PFAdjustmentSerialization, "validateValue:isOfType:errors:", v13, objc_opt_class(), v6, (_QWORD)v18)|| !+[PFAdjustment isValidArchiveDictionary:errors:](PFAdjustment, "isValidArchiveDictionary:errors:", v13, v6))
            {
              v14 = 0;
              goto LABEL_19;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          v14 = 1;
          if (v10)
            continue;
          break;
        }
      }
      else
      {
        v14 = 1;
      }
LABEL_19:
      v7 = v8;
      goto LABEL_20;
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
LABEL_21:

  return v14;
}

@end
