@implementation _UITextFieldEditingProcessor

- (id)beginEditingWithTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _UITextFieldEditingToken *v8;
  _UITextFieldEditingToken *v9;
  _QWORD v11[7];

  v4 = a3;
  -[_UITextFieldEditingProcessor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editingProcessorOverridingEditingAttributes:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v8 = -[_UITextFieldEditingToken initWithTextStorage:attributeNames:]([_UITextFieldEditingToken alloc], "initWithTextStorage:attributeNames:", v4, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke;
    v11[3] = &unk_1E16E62E0;
    v11[4] = self;
    v11[5] = v6;
    v11[6] = v8;
    objc_msgSend(v4, "coordinateAccess:", v11);
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)overridingEditingAttributesForAttributes:(id)a3 withOverrides:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v8 | v10)
  {
    v25 = v5;
    v11 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v6;
    objc_msgSend(v6, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!v8
            || (v18 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "isEqualToString:", v7),
                v19 = v8,
                (v18 & 1) == 0))
          {
            if (!v10)
              continue;
            v20 = objc_msgSend(v17, "isEqualToString:", v9);
            v19 = v10;
            if (!v20)
              continue;
          }
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v5 = v25;
    if (v25)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("_UILastStoredDefaultTextAttributesName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("_UILastStoredDefaultTextAttributesName"));
    }
    v22 = (void *)objc_msgSend(v11, "copy");

    v6 = v24;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v22;
}

- (_UITextFieldEditingProcessorDelegate)delegate
{
  return (_UITextFieldEditingProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
