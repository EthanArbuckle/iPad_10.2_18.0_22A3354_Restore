@implementation SBSystemActionAbstractOverridableDataSource

- (void)addOverrider:(id)a3
{
  id v4;
  NSMutableSet *overriders;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  overriders = self->_overriders;
  v8 = v4;
  if (!overriders)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_overriders;
    self->_overriders = v6;

    v4 = v8;
    overriders = self->_overriders;
  }
  -[NSMutableSet addObject:](overriders, "addObject:", v4);
  -[SBSystemActionAbstractDataSource updateSelectedAction](self, "updateSelectedAction");

}

- (void)removeOverrider:(id)a3
{
  -[NSMutableSet removeObject:](self->_overriders, "removeObject:", a3);
  -[SBSystemActionAbstractDataSource updateSelectedAction](self, "updateSelectedAction");
}

- (void)setSelectedSystemAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  SBSystemActionAbstractOverridableDataSource *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_overriders, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "systemActionDataSource:overrideActionForAction:", self, v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          SBLogSystemActionDataSource();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v19 = self;
            v20 = 2114;
            v21 = v11;
            v22 = 2114;
            v23 = v4;
            _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found override action: %{public}@ for action: %{public}@", buf, 0x20u);
          }

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = v4;
LABEL_13:

  v13.receiver = self;
  v13.super_class = (Class)SBSystemActionAbstractOverridableDataSource;
  -[SBSystemActionAbstractDataSource setSelectedSystemAction:](&v13, sel_setSelectedSystemAction_, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriders, 0);
}

@end
