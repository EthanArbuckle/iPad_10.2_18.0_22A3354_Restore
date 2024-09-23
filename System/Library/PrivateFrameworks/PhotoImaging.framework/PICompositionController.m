@implementation PICompositionController

- (PICompositionController)initWithComposition:(id)a3
{
  id v3;
  PICompositionController *v4;
  uint64_t v5;
  NUComposition *composition;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PICompositionController;
  v3 = a3;
  v4 = -[PICompositionController init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  composition = v4->_composition;
  v4->_composition = (NUComposition *)v5;

  return v4;
}

- (NUComposition)composition
{
  return (NUComposition *)(id)-[NUComposition copy](self->_composition, "copy");
}

- (id)_internalComposition
{
  return self->_composition;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithComposition:", self->_composition);
  objc_msgSend(v4, "setImageOrientation:", -[PICompositionController imageOrientation](self, "imageOrientation"));
  return v4;
}

- (void)setChangeDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);

  if (WeakRetained != obj)
  {
    self->_delegateFlags.hasDidAdd = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidRemove = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidUpdate = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidUpdateMultiple = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasClassForController = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&self->_changeDelegate, obj);
  }

}

- (id)compositionKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NUComposition schema](self->_composition, "schema", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v3, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)adjustmentKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PICompositionController compositionKeys](self, "compositionKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("source")) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)availableKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[NUComposition schema](self->_composition, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v6);
  return v3;
}

- (void)addAdjustmentWithKey:(id)a3
{
  id v4;
  objc_class *v5;
  NUComposition *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)MEMORY[0x1E0D520F0];
  v6 = self->_composition;
  v7 = [v5 alloc];
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:", v8);

  objc_msgSend(v9, "reset");
  -[NUComposition setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, v4);

  -[PICompositionController _didAddAdjustment:](self, "_didAddAdjustment:", v4);
}

- (void)_didAddAdjustment:(id)a3
{
  id v4;
  _PICompositionControllerTransaction *transaction;
  id WeakRetained;
  id v7;

  v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    v7 = v4;
    -[_PICompositionControllerTransaction didAddAdjustment:](transaction, "didAddAdjustment:", v4);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (self->_delegateFlags.hasDidAdd)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    objc_msgSend(WeakRetained, "compositionController:didAddAdjustment:", self, v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)replaceAdjustment:(id)a3 withKey:(id)a4
{
  NUComposition *composition;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  composition = self->_composition;
  v7 = a3;
  -[NUComposition objectForKeyedSubscript:](composition, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUComposition setObject:forKeyedSubscript:](self->_composition, "setObject:forKeyedSubscript:", v7, v9);
  if (!v8)
    -[PICompositionController _didAddAdjustment:](self, "_didAddAdjustment:", v9);
  -[PICompositionController _didUpdateAdjustment:](self, "_didUpdateAdjustment:", v9);

}

- (void)_didUpdateAdjustment:(id)a3
{
  id v4;
  _PICompositionControllerTransaction *transaction;
  id WeakRetained;
  id v7;

  v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    v7 = v4;
    -[_PICompositionControllerTransaction didUpdateAdjustment:](transaction, "didUpdateAdjustment:", v4);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (self->_delegateFlags.hasDidUpdate)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    objc_msgSend(WeakRetained, "compositionController:didUpdateAdjustment:", self, v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)removeAdjustmentWithKey:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NUComposition setObject:forKeyedSubscript:](self->_composition, "setObject:forKeyedSubscript:", 0, v6);
    if (self->_delegateFlags.hasDidRemove)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
      objc_msgSend(WeakRetained, "compositionController:didRemoveAdjustment:", self, v6);

    }
  }

}

- (void)_didRemoveAdjustment:(id)a3
{
  id v4;
  _PICompositionControllerTransaction *transaction;
  id WeakRetained;
  id v7;

  v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    v7 = v4;
    -[_PICompositionControllerTransaction didRemoveAdjustment:](transaction, "didRemoveAdjustment:", v4);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (self->_delegateFlags.hasDidRemove)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    objc_msgSend(WeakRetained, "compositionController:didRemoveAdjustment:", self, v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)adjustmentControllerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = (void *)objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v4)), "initWithAdjustment:", v8);
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

    v11 = v9;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)modifyAdjustmentWithKey:(id)a3 modificationBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (a4)
  {
    v6 = (void (**)(id, void *))a4;
    objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0D520F0]);
      objc_msgSend(v7, "objectForKeyedSubscript:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithIdentifier:", v11);

      objc_msgSend(v9, "reset");
    }
    v12 = (void *)objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v16)), "initWithAdjustment:", v9);
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", v13);

    objc_msgSend(v12, "setContainingComposition:", self->_composition);
    v6[2](v6, v12);

    objc_msgSend(v12, "adjustment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[NUComposition setObject:forKeyedSubscript:](self->_composition, "setObject:forKeyedSubscript:", v15, v16);

    -[PICompositionController _didUpdateAdjustment:](self, "_didUpdateAdjustment:", v16);
  }

}

- (void)applyChangesFromCompositionController:(id)a3
{
  NUComposition *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NUComposition *composition;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "composition");
  v4 = (NUComposition *)objc_claimAutoreleasedReturnValue();
  -[PICompositionController differingAdjustmentsWithComposition:](self, "differingAdjustmentsWithComposition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "arrayByAddingObject:", CFSTR("source"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  composition = self->_composition;
  self->_composition = v4;

  -[PICompositionController setImageOrientation:](self, "setImageOrientation:", objc_msgSend(v11, "imageOrientation"));
  if (objc_msgSend(v5, "count"))
    -[PICompositionController _didUpdateAdjustments:](self, "_didUpdateAdjustments:", v5);

}

- (void)_didUpdateAdjustments:(id)a3
{
  id v4;
  _PICompositionControllerTransaction *transaction;
  id WeakRetained;
  id v7;

  v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    v7 = v4;
    -[_PICompositionControllerTransaction didUpdateAdjustments:](transaction, "didUpdateAdjustments:", v4);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (self->_delegateFlags.hasDidUpdateMultiple)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    objc_msgSend(WeakRetained, "compositionController:didUpdateAdjustments:", self, v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)performChanges:(id)a3
{
  _PICompositionControllerTransaction *transaction;
  _PICompositionControllerTransaction *v5;
  _PICompositionControllerTransaction *v6;
  void *v7;
  id WeakRetained;
  _PICompositionControllerTransaction *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  transaction = self->_transaction;
  if (!transaction)
  {
    v5 = objc_alloc_init(_PICompositionControllerTransaction);
    v6 = self->_transaction;
    self->_transaction = v5;

    transaction = self->_transaction;
  }
  -[_PICompositionControllerTransaction begin](transaction, "begin");
  v10[2]();
  if (-[_PICompositionControllerTransaction commit](self->_transaction, "commit"))
  {
    -[_PICompositionControllerTransaction changes](self->_transaction, "changes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") && self->_delegateFlags.hasDidUpdateMultiple)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
      objc_msgSend(WeakRetained, "compositionController:didUpdateAdjustments:", self, v7);

    }
    v9 = self->_transaction;
    self->_transaction = 0;

  }
}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  return -[PICompositionController isEqual:forKeys:visualChangesOnly:](self, "isEqual:forKeys:visualChangesOnly:", a3, 0, a4);
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4 visualChangesOnly:(BOOL)a5
{
  id v7;
  id v8;
  NUComposition *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  void *v30;
  char v31;
  int v32;
  void *v33;
  int v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v49;
  _BOOL4 v50;
  void *v51;
  PICompositionController *v52;
  char v53;
  id v54;
  NUComposition *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v50 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self->_composition;
  objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PICompositionController availableKeys](self, "availableKeys");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v49 = v8;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v12)
  {
    v53 = 1;
    goto LABEL_61;
  }
  v13 = v12;
  v52 = self;
  v53 = 1;
  v58 = *(_QWORD *)v60;
  v55 = v9;
  v56 = v7;
  v54 = v11;
  do
  {
    v14 = 0;
    v57 = v13;
    do
    {
      if (*(_QWORD *)v60 != v58)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v14);
      -[NUComposition objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15, v49);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("source")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("raw")) & 1) != 0)
      {
        goto LABEL_11;
      }
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("inpaintMasks")))
      {
        v22 = objc_msgSend(v15, "isEqualToString:", CFSTR("mute"));
        v23 = objc_msgSend(v15, "isEqualToString:", CFSTR("autoLoop"));
        v24 = objc_msgSend(v15, "isEqualToString:", CFSTR("portraitVideo"));
        objc_msgSend(v16, "schema");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "settings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsObject:", CFSTR("enabled")) & ~v22 & ((v23 | v24) ^ 1);

        v29 = v28 != 1 || v16 == 0;
        if (!v29)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("enabled"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "BOOLValue");

          if ((v31 & 1) == 0)
          {

            v16 = 0;
          }
        }
        v9 = v55;
        v7 = v56;
        v11 = v54;
        if (v17)
          v32 = v28;
        else
          v32 = 0;
        if (v32 == 1)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("enabled"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "BOOLValue");

          v13 = v57;
          if (v34)
          {
            if (!v16)
            {
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("orientation")) & 1) == 0)
              {
                v16 = 0;
LABEL_60:

                v53 = 0;
                goto LABEL_61;
              }
LABEL_41:
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("value"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "integerValue");
              v38 = -[PICompositionController imageOrientation](v52, "imageOrientation");

              if (v37 != v38)
                goto LABEL_60;
LABEL_11:

              goto LABEL_12;
            }
LABEL_50:
            v42 = (void *)objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](v52, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v16);
            objc_msgSend(v51, "objectForKeyedSubscript:", v15);
            v43 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setIdentifier:", v43);

            LOBYTE(v43) = objc_msgSend(v42, "isEqual:visualChangesOnly:", v17, v50);
            if ((v43 & 1) == 0)
              goto LABEL_60;
            goto LABEL_11;
          }

          if (!v16)
          {
            v17 = 0;
            goto LABEL_11;
          }
          v17 = 0;
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("orientation")) & 1) == 0)
            goto LABEL_60;
          v35 = 1;
LABEL_46:
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "integerValue");
          v41 = -[PICompositionController imageOrientation](v52, "imageOrientation");

          if (!v35)
            goto LABEL_60;
          v29 = v40 == v41;
          v13 = v57;
          if (!v29)
            goto LABEL_60;
          goto LABEL_11;
        }
        v35 = v17 == 0;
        v13 = v57;
        if (v35 == (v16 == 0))
        {
          if (v16)
            goto LABEL_50;
          if (v17)
          {
            v44 = (void *)objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](v52, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v17);
            objc_msgSend(v51, "objectForKeyedSubscript:", v15);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setIdentifier:", v45);

            v46 = objc_msgSend(v44, "isEqual:visualChangesOnly:", 0, v50);
            v16 = 0;
            if (!v46)
              goto LABEL_60;
            goto LABEL_11;
          }
        }
        else
        {
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("orientation")) & 1) == 0)
            goto LABEL_60;
          if (v16)
            goto LABEL_46;
          if (v17)
            goto LABEL_41;
        }
        v16 = 0;
        goto LABEL_11;
      }
      -[NUComposition objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUComposition objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((v18 != 0) != (v19 != 0) || v18 && v19 && !objc_msgSend(v18, "isEqualToArray:", v19))
      {
        v21 = 0;
        v53 = 0;
      }
      else
      {
        v21 = 1;
      }

      v13 = v57;
      if (!v21)
        goto LABEL_61;
LABEL_12:
      ++v14;
    }
    while (v13 != v14);
    v47 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    v13 = v47;
  }
  while (v47);
LABEL_61:

  return v53 & 1;
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4 comparisonBlock:(id)a5
{
  id v8;
  uint64_t (**v9)(id, _QWORD, void *, void *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  id v27;
  id obj;
  void *v29;
  NUComposition *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, _QWORD, void *, void *))a5;
  v30 = self->_composition;
  objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PICompositionController availableKeys](self, "availableKeys");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    v27 = v8;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[NUComposition objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("enabled"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLValue");

          if ((v19 & 1) == 0)
          {

            v16 = 0;
          }
        }
        if (!v17)
          goto LABEL_22;
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("enabled"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if ((v21 & 1) == 0)
        {

LABEL_22:
          v17 = 0;
          v25 = v16 == 0;
LABEL_23:

          v8 = v27;
          goto LABEL_24;
        }
        if (!v16
          || (v22 = (void *)objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v16), objc_msgSend(v29, "objectForKeyedSubscript:", v15), v23 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v22, "setIdentifier:", v23), v23, v24 = v9[2](v9, v15, v22, v17), v22, (v24 & 1) == 0))
        {
          v25 = 0;
          goto LABEL_23;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v25 = 1;
      v8 = v27;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v25 = 1;
  }
LABEL_24:

  return v25;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUComposition debugDescription](self->_composition, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PICompositionController(%p): %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)differingAdjustmentsWithComposition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PICompositionController availableKeys](self, "availableKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v20 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PICompositionController isEqual:forKeys:visualChangesOnly:](self, "isEqual:forKeys:visualChangesOnly:", v4, v12, 1);

        if (!v13)
          objc_msgSend(v15, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  return v15;
}

- (int64_t)userOrientation
{
  void *v3;
  int64_t v4;
  int64_t v5;

  -[PICompositionController orientationAdjustmentControllerCreatingIfNecessary:](self, "orientationAdjustmentControllerCreatingIfNecessary:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PICompositionController imageOrientation](self, "imageOrientation");
    v5 = 1;
    if (objc_msgSend(v3, "orientation") && v4)
    {
      NUOrientationInverse();
      objc_msgSend(v3, "orientation");
      v5 = NUOrientationConcat();
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (Class)_adjustmentControllerClassForKey:(id)a3
{
  id v4;
  objc_class *v5;
  id WeakRetained;
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  v7 = WeakRetained;
  if (WeakRetained && self->_delegateFlags.hasClassForController)
  {
    v8 = (objc_class *)objc_msgSend(WeakRetained, "compositionController:adjustmentControllerClassForKey:", self, v4);
    if ((-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", v5) & 1) != 0)
    {
      v5 = v8;
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_282);
      v9 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        NSStringFromClass(v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_DEFAULT, "class %@ is not the correct type, its superclass should be %@", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  v13 = v5;

  return v13;
}

- (void)setSource:(id)a3 mediaType:(int64_t)a4
{
  -[NUComposition setObject:forKeyedSubscript:](self->_composition, "setObject:forKeyedSubscript:", a3, CFSTR("source"));
  -[NUComposition setMediaType:](self->_composition, "setMediaType:", a4);
}

- (id)source
{
  return (id)-[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:", CFSTR("source"));
}

- (void)setMediaType:(int64_t)a3
{
  -[NUComposition setMediaType:](self->_composition, "setMediaType:", a3);
}

- (int64_t)mediaType
{
  return -[NUComposition mediaType](self->_composition, "mediaType");
}

- (PICompositionControllerDelegate)changeDelegate
{
  return (PICompositionControllerDelegate *)objc_loadWeakRetained((id *)&self->_changeDelegate);
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

+ (id)schemaForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_keyToIdentifierMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D522D0], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schemaWithIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)settingForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "schemaForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)photosSchema
{
  if (photosSchema_onceToken != -1)
    dispatch_once(&photosSchema_onceToken, &__block_literal_global_1257);
  return (id)photosSchema_photosSchema;
}

+ (id)_keyToIdentifierMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PICompositionController__keyToIdentifierMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_keyToIdentifierMap_onceToken != -1)
    dispatch_once(&_keyToIdentifierMap_onceToken, block);
  return (id)_keyToIdentifierMap_identifierMap;
}

+ (Class)adjustmentControllerClassForKey:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("smartTone")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("smartColor")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("smartBlackAndWhite")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("cropStraighten")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("redEye")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("depthEffect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("livePhotoKeyFrame")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("videoPosterFrame")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("trim")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("slomo")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("effect3D")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("portraitEffect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("orientation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("autoLoop")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("highResFusion")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("rawNoiseReduction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("sharpen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("whiteBalance")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("noiseReduction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("definition")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("raw")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("vignette")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("videoStabilize")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("videoCrossfadeLoop")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("semanticEnhance")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("semanticStyle")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("portraitVideo")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("cinematicAudio")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("retouch")))
  {
    v4 = (void *)objc_opt_class();
  }
  v5 = v4;

  return v5;
}

void __46__PICompositionController__keyToIdentifierMap__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photosSchema");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
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
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v1, "contents", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v13 = (void *)_keyToIdentifierMap_identifierMap;
  _keyToIdentifierMap_identifierMap = (uint64_t)v2;

}

void __39__PICompositionController_photosSchema__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[PISchema registeredPhotosSchemaIdentifier](PISchema, "registeredPhotosSchemaIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D522D0], "sharedRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "schemaWithIdentifier:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)photosSchema_photosSchema;
  photosSchema_photosSchema = v1;

}

- (PIAdjustmentConstants)adjustmentConstants
{
  if (adjustmentConstants_onceToken != -1)
    dispatch_once(&adjustmentConstants_onceToken, &__block_literal_global_15812);
  return (PIAdjustmentConstants *)(id)adjustmentConstants_constants;
}

- (id)_adjustmentControllerForKey:(id)a3 creatingIfNecessary:(BOOL)a4 expectedClass:(Class)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PICompositionController adjustmentControllerForKey:](self, "adjustmentControllerForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 && v6)
  {
    -[PICompositionController addAdjustmentWithKey:](self, "addAdjustmentWithKey:", v8);
    -[PICompositionController adjustmentControllerForKey:](self, "adjustmentControllerForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_15802();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adjustment controller for key %@ is of class: %@, but was expected to be %@"), v8, objc_opt_class(), a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15802();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_opt_class();
    _NUAssertFailHandler();
  }

  return v9;
}

- (id)smartToneAdjustmentController
{
  return -[PICompositionController smartToneAdjustmentControllerCreatingIfNecessary:](self, "smartToneAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)smartToneAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("smartTone"), a3, objc_opt_class());
}

- (id)smartColorAdjustmentController
{
  return -[PICompositionController smartColorAdjustmentControllerCreatingIfNecessary:](self, "smartColorAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)smartColorAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("smartColor"), a3, objc_opt_class());
}

- (id)smartBWAdjustmentController
{
  return -[PICompositionController smartBWAdjustmentControllerCreatingIfNecessary:](self, "smartBWAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)smartBWAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("smartBlackAndWhite"), a3, objc_opt_class());
}

- (id)cropAdjustmentController
{
  return -[PICompositionController cropAdjustmentControllerCreatingIfNecessary:](self, "cropAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)cropAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("cropStraighten"), a3, objc_opt_class());
}

- (id)redEyeAdjustmentController
{
  return -[PICompositionController redEyeAdjustmentControllerCreatingIfNecessary:](self, "redEyeAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)redEyeAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("redEye"), a3, objc_opt_class());
}

- (id)livePhotoKeyFrameAdjustmentController
{
  return -[PICompositionController livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:](self, "livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("livePhotoKeyFrame"), a3, objc_opt_class());
}

- (id)videoPosterFrameAdjustmentController
{
  return -[PICompositionController videoPosterFrameAdjustmentControllerCreatingIfNecessary:](self, "videoPosterFrameAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)videoPosterFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("videoPosterFrame"), a3, objc_opt_class());
}

- (id)depthAdjustmentController
{
  return -[PICompositionController depthAdjustmentControllerCreatingIfNecessary:](self, "depthAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)depthAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("depthEffect"), a3, objc_opt_class());
}

- (id)trimAdjustmentController
{
  return -[PICompositionController trimAdjustmentControllerCreatingIfNecessary:](self, "trimAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)trimAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("trim"), a3, objc_opt_class());
}

- (id)slomoAdjustmentController
{
  return -[PICompositionController slomoAdjustmentControllerCreatingIfNecessary:](self, "slomoAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)slomoAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("slomo"), a3, objc_opt_class());
}

- (id)effectAdjustmentController
{
  return -[PICompositionController effectAdjustmentControllerCreatingIfNecessary:](self, "effectAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)effectAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("effect"), a3, objc_opt_class());
}

- (id)effect3DAdjustmentController
{
  return -[PICompositionController effect3DAdjustmentControllerCreatingIfNecessary:](self, "effect3DAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)effect3DAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("effect3D"), a3, objc_opt_class());
}

- (id)portraitAdjustmentController
{
  return -[PICompositionController portraitAdjustmentControllerCreatingIfNecessary:](self, "portraitAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)portraitAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("portraitEffect"), a3, objc_opt_class());
}

- (id)orientationAdjustmentController
{
  return -[PICompositionController orientationAdjustmentControllerCreatingIfNecessary:](self, "orientationAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)orientationAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("orientation"), a3, objc_opt_class());
}

- (id)autoLoopAdjustmentController
{
  return -[PICompositionController autoLoopAdjustmentControllerCreatingIfNecessary:](self, "autoLoopAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)autoLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("autoLoop"), a3, objc_opt_class());
}

- (id)highResFusionAdjustmentController
{
  return -[PICompositionController highResFusionAdjustmentControllerCreatingIfNecessary:](self, "highResFusionAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)highResFusionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("highResFusion"), a3, objc_opt_class());
}

- (id)rawAdjustmentController
{
  return -[PICompositionController rawAdjustmentControllerCreatingIfNecessary:](self, "rawAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)rawAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("raw"), a3, objc_opt_class());
}

- (id)rawNoiseReductionAdjustmentController
{
  return -[PICompositionController rawNoiseReductionAdjustmentControllerCreatingIfNecessary:](self, "rawNoiseReductionAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)rawNoiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("rawNoiseReduction"), a3, objc_opt_class());
}

- (id)sharpenAdjustmentController
{
  return -[PICompositionController sharpenAdjustmentControllerCreatingIfNecessary:](self, "sharpenAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)sharpenAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("sharpen"), a3, objc_opt_class());
}

- (id)whiteBalanceAdjustmentController
{
  return -[PICompositionController whiteBalanceAdjustmentControllerCreatingIfNecessary:](self, "whiteBalanceAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)whiteBalanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("whiteBalance"), a3, objc_opt_class());
}

- (id)noiseReductionAdjustmentController
{
  return -[PICompositionController noiseReductionAdjustmentControllerCreatingIfNecessary:](self, "noiseReductionAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)noiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("noiseReduction"), a3, objc_opt_class());
}

- (id)definitionAdjustmentController
{
  return -[PICompositionController definitionAdjustmentControllerCreatingIfNecessary:](self, "definitionAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)definitionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("definition"), a3, objc_opt_class());
}

- (id)vignetteAdjustmentController
{
  return -[PICompositionController vignetteAdjustmentControllerCreatingIfNecessary:](self, "vignetteAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)vignetteAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("vignette"), a3, objc_opt_class());
}

- (id)videoStabilizeAdjustmentController
{
  return -[PICompositionController videoStabilizeAdjustmentControllerCreatingIfNecessary:](self, "videoStabilizeAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)videoStabilizeAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("videoStabilize"), a3, objc_opt_class());
}

- (id)videoCrossfadeLoopAdjustmentController
{
  return -[PICompositionController videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:](self, "videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("videoCrossfadeLoop"), a3, objc_opt_class());
}

- (id)semanticEnhanceAdjustmentController
{
  return -[PICompositionController semanticEnhanceAdjustmentControllerCreatingIfNecessary:](self, "semanticEnhanceAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)semanticEnhanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("semanticEnhance"), a3, objc_opt_class());
}

- (id)portraitVideoAdjustmentController
{
  return -[PICompositionController portraitVideoAdjustmentControllerCreatingIfNecessary:](self, "portraitVideoAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)portraitVideoAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("portraitVideo"), a3, objc_opt_class());
}

- (id)cinematicAudioAdjustmentController
{
  return -[PICompositionController cinematicAudioAdjustmentControllerCreatingIfNecessary:](self, "cinematicAudioAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)cinematicAudioAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("cinematicAudio"), a3, objc_opt_class());
}

- (id)retouchAdjustmentController
{
  return -[PICompositionController retouchAdjustmentControllerCreatingIfNecessary:](self, "retouchAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)retouchAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("retouch"), a3, objc_opt_class());
}

- (id)semanticStyleAdjustmentController
{
  return -[PICompositionController semanticStyleAdjustmentControllerCreatingIfNecessary:](self, "semanticStyleAdjustmentControllerCreatingIfNecessary:", 0);
}

- (id)semanticStyleAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  return -[PICompositionController _adjustmentControllerForKey:creatingIfNecessary:expectedClass:](self, "_adjustmentControllerForKey:creatingIfNecessary:expectedClass:", CFSTR("semanticStyle"), a3, objc_opt_class());
}

void __68__PICompositionController_AdjustmentExtensions__adjustmentConstants__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PIPhotoEditHelper adjustmentConstants](PIPhotoEditHelper, "adjustmentConstants");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)adjustmentConstants_constants;
  adjustmentConstants_constants = v0;

}

@end
