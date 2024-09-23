@implementation SBFUIViewFloatAnimatableProperty

+ (id)sbf_animatablePropertyWithProgressMilestonesToBlocks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__SBFUIViewFloatAnimatableProperty_sbf_animatablePropertyWithProgressMilestonesToBlocks___block_invoke;
  v12[3] = &unk_1E200F4F0;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x18D774178](v12);
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbf_animatablePropertyWithProgressMilestones:block:", v9, v6);
  v10 = (id *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v10[6], "removeObjectForKey:", &unk_1E203B9F8);

  return v10;
}

void __89__SBFUIViewFloatAnimatableProperty_sbf_animatablePropertyWithProgressMilestonesToBlocks___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, double, double);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v9)
  {
    if (!*((_BYTE *)v11 + 40))
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v13 = (void *)*((_QWORD *)v11 + 6);
      *((_QWORD *)v11 + 6) = v12;

      *((_BYTE *)v11 + 40) = 1;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*((id *)v11 + 6), "allKeys", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v19, "bs_CGFloatValue");
          if (BSFloatApproximatelyEqualToFloat())
          {
            objc_msgSend(*((id *)v11 + 6), "objectForKey:", v19);
            v20 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v11 + 6), "removeObjectForKey:", v19);
            ((void (**)(_QWORD, id, _QWORD, double, double))v20)[2](v20, v11, 0, a3, a4);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

  }
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIViewFloatAnimatableProperty presentationValue](self, "presentationValue");
  v14.receiver = self;
  v14.super_class = (Class)SBFUIViewFloatAnimatableProperty;
  -[UIAnimatablePropertyWrapper invalidate](&v14, sel_invalidate);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableMilestonesToBlocks, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_mutableMilestonesToBlocks, "objectForKey:", v8);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "bs_CGFloatValue");
          ((void (**)(_QWORD, SBFUIViewFloatAnimatableProperty *, uint64_t))v9)[2](v9, self, 1);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_mutableMilestonesToBlocks, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableMilestonesToBlocks, 0);
}

@end
