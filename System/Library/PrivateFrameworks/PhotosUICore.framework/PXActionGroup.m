@implementation PXActionGroup

- (PXActionGroup)initWithActions:(id)a3
{
  id v4;
  PXActionGroup *v5;
  uint64_t v6;
  NSArray *actions;
  PXActionGroup *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXActionGroup;
  v5 = -[PXActionGroup init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (PXActionGroup)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionGroup.m"), 36, CFSTR("%s is not available as initializer"), "-[PXActionGroup init]");

  abort();
}

- (void)performAction:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6140;
  v20 = __Block_byref_object_dispose__6141;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXActionGroup actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __31__PXActionGroup_performAction___block_invoke;
      v11[3] = &unk_1E5146878;
      v11[4] = &v22;
      v11[5] = &v16;
      objc_msgSend(v10, "performAction:", v11);
      if (v17[5])
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)performUndo:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6140;
  v20 = __Block_byref_object_dispose__6141;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXActionGroup actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __29__PXActionGroup_performUndo___block_invoke;
      v11[3] = &unk_1E5146878;
      v11[4] = &v22;
      v11[5] = &v16;
      objc_msgSend(v10, "performUndo:", v11);
      if (v17[5])
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)performRedo:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6140;
  v20 = __Block_byref_object_dispose__6141;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXActionGroup actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __29__PXActionGroup_performRedo___block_invoke;
      v11[3] = &unk_1E5146878;
      v11[4] = &v22;
      v11[5] = &v16;
      objc_msgSend(v10, "performRedo:", v11);
      if (v17[5])
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (NSString)actionNameLocalizationKey
{
  return self->actionNameLocalizationKey;
}

- (void)setActionNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)localizedActionName
{
  return self->localizedActionName;
}

- (void)setLocalizedActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->localizedActionName, 0);
  objc_storeStrong((id *)&self->actionNameLocalizationKey, 0);
}

void __29__PXActionGroup_performRedo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  uint64_t v7;
  char v8;
  id v9;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  if (v6)
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v9;
  }

}

void __29__PXActionGroup_performUndo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  uint64_t v7;
  char v8;
  id v9;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  if (v6)
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v9;
  }

}

void __31__PXActionGroup_performAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  uint64_t v7;
  char v8;
  id v9;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  if (v6)
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v9;
  }

}

@end
