@implementation _UIResponder_Override_Host

- (void)attachOverrider:(id)a3 forTypes:(int64_t)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v11[2];
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  _UIResponder_Override_Host *v14;
  id v15;

  v6 = a3;
  -[_UIResponder_Override_Host owner](self, "owner");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v12 = __55___UIResponder_Override_Host_attachOverrider_forTypes___block_invoke;
    v13 = &unk_1E16BE3C0;
    v14 = self;
    v15 = v6;
    v8 = 3;
    v9 = 1;
    do
    {
      if ((v9 & a4) != 0)
        v12((uint64_t)v11, v9);
      v9 *= 2;
      v10 = v8 > 1;
      v8 >>= 1;
    }
    while (v10);

  }
}

- (UIResponder)owner
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_owner);
}

+ (id)hostForResponder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4;
  if (v4)
    objc_storeWeak((id *)(v4 + 16), v3);

  return v5;
}

- (_UIResponder_Override_Host)init
{
  _UIResponder_Override_Host *v2;
  uint64_t v3;
  NSMutableArray *overrides;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIResponder_Override_Host;
  v2 = -[_UIResponder_Override_Host init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    overrides = v2->_overrides;
    v2->_overrides = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _UIResponder_Override_Host *v15;
  NSMutableArray *obj;
  objc_super v17;
  _QWORD v18[2];
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "nextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = self;
  obj = self->_overrides;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type", v15);
        v18[0] = v8;
        v18[1] = 3221225472;
        v19 = __37___UIResponder_Override_Host_dealloc__block_invoke;
        v20 = &unk_1E16BE3C0;
        v21 = v10;
        v22 = v4;
        v12 = 1;
        v13 = 3;
        do
        {
          if ((v12 & v11) != 0)
            v19((uint64_t)v18, v12);
          v12 *= 2;
          v14 = v13 > 1;
          v13 >>= 1;
        }
        while (v14);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v17.receiver = v15;
  v17.super_class = (Class)_UIResponder_Override_Host;
  -[_UIResponder_Override_Host dealloc](&v17, sel_dealloc);
}

- (void)detachOverrider:(id)a3 forTypes:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UIResponder_Override_Host owner](self, "owner");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)-[NSMutableArray copy](self->_overrides, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "overridden");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (v15 != v6)
          {

LABEL_9:
            ++v11;
            continue;
          }
          v16 = objc_msgSend(v14, "type") & a4;

          if (!v16)
            goto LABEL_9;
          -[NSMutableArray removeObjectAtIndex:](self->_overrides, "removeObjectAtIndex:", v11);
          a4 &= ~objc_msgSend(v14, "type");
          if (!a4)
            goto LABEL_14;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
LABEL_14:

    if (!-[NSMutableArray count](self->_overrides, "count"))
    {
      -[_UIResponder_Override_Host owner](self, "owner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_clearOverrideHost");

    }
  }

}

- (int64_t)typesForResponder:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_overrides;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "overridden", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == a3)
          v7 |= objc_msgSend(v10, "type");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIResponder_Override_Host;
  -[_UIResponder_Override_Host description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; owner=%@; overrides=%@>"), v4, WeakRetained, self->_overrides);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
