@implementation STUIStatusBarDisplayItemPlacementGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placements, 0);
}

+ (STUIStatusBarDisplayItemPlacementGroup)groupWithPriority:(int64_t)a3 placements:(id)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x8000000000000000;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "setPriority:", objc_msgSend(v15, "priority", (_QWORD)v20) + a3);
        v16 = objc_msgSend(v15, "priority");
        if (v12 >= v16)
          v12 = v16;
        v17 = objc_msgSend(v15, "priority");
        if (v13 <= v17)
          v13 = v17;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x8000000000000000;
  }

  v18 = (void *)v7[1];
  v7[1] = v8;

  v7[2] = v12;
  v7[3] = v13;
  return (STUIStatusBarDisplayItemPlacementGroup *)v7;
}

- (int64_t)maximumPriority
{
  return self->_maximumPriority;
}

- (int64_t)minimumPriority
{
  return self->_minimumPriority;
}

- (void)setPlacements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_placements;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSArray)placements
{
  return self->_placements;
}

- (BOOL)enabled
{
  void *v2;
  void *v3;
  char v4;

  -[STUIStatusBarDisplayItemPlacementGroup placements](self, "placements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

@end
