@implementation SBUIInteractionForwardingView

- (NSSet)ignoreAlphaSubviews
{
  NSHashTable *ignoreAlphaSubviewsTable;
  void *v3;
  void *v4;
  void *v5;

  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  v3 = (void *)MEMORY[0x1E0C99E60];
  if (ignoreAlphaSubviewsTable)
  {
    -[NSHashTable allObjects](ignoreAlphaSubviewsTable, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v5;
}

- (void)setIgnoreAlphaSubviews:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSHashTable *ignoreAlphaSubviewsTable;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[NSHashTable addObject:](v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  self->_ignoreAlphaSubviewsTable = v5;

}

- (void)addIgnoreAlphaSubview:(id)a3
{
  id v4;
  NSHashTable *ignoreAlphaSubviewsTable;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  v8 = v4;
  if (!ignoreAlphaSubviewsTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_ignoreAlphaSubviewsTable;
    self->_ignoreAlphaSubviewsTable = v6;

    v4 = v8;
    ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  }
  -[NSHashTable addObject:](ignoreAlphaSubviewsTable, "addObject:", v4);

}

- (void)removeIgnoreAlphaSubview:(id)a3
{
  -[NSHashTable removeObject:](self->_ignoreAlphaSubviewsTable, "removeObject:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBUIInteractionForwardingView *v8;
  BOOL v9;
  void *v10;
  SBUIInteractionForwardingView *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  double v16;
  double v17;
  objc_super v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v18.receiver = self;
  v18.super_class = (Class)SBUIInteractionForwardingView;
  -[SBUIInteractionForwardingView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (SBUIInteractionForwardingView *)v20[5];
  if (v8)
    v9 = v8 == self;
  else
    v9 = 1;
  if (v9)
  {
    -[SBUIInteractionForwardingView subviews](self, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__SBUIInteractionForwardingView_hitTest_withEvent___block_invoke;
    v13[3] = &unk_1E4C40C80;
    v13[4] = self;
    v16 = x;
    v17 = y;
    v14 = v7;
    v15 = &v19;
    objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v13);

    v8 = (SBUIInteractionForwardingView *)v20[5];
  }
  v11 = v8;
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __51__SBUIInteractionForwardingView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "member:");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_msgSend(v11, "isHidden") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v11, "alpha");
      v10 = v9;

      if (v10 >= 0.01)
        goto LABEL_7;
    }
    objc_msgSend(v11, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
    if (objc_msgSend(v11, "pointInside:withEvent:", *(_QWORD *)(a1 + 40)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreAlphaSubviewsTable, 0);
}

@end
