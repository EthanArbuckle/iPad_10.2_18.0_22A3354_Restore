@implementation SBFDateTimeController

- (NSDate)currentDate
{
  NSDate *v3;
  uint64_t v4;

  v3 = self->_overrideDate;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_overrideDateOffset != 0.0)
  {
    -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSDate *)v4;
  }
  return v3;
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

+ (SBFDateTimeController)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_22);
  return (SBFDateTimeController *)(id)sharedInstance___sharedInstance;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

void __39__SBFDateTimeController_sharedInstance__block_invoke()
{
  SBFDateTimeController *v0;
  void *v1;

  v0 = objc_alloc_init(SBFDateTimeController);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (void)setOverrideDate:(id)a3
{
  NSDate *overrideDate;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  overrideDate = self->_overrideDate;
  if (overrideDate != a3)
  {
    v6 = overrideDate;
    v7 = (NSDate *)objc_msgSend(a3, "copy");
    v8 = self->_overrideDate;
    self->_overrideDate = v7;

    self->_overrideDateOffset = 0.0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "controller:didChangeOverrideDateFromDate:", self, v6);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)setOverrideDateOffset:(double)a3
{
  NSDate *v5;
  NSDate *overrideDate;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_overrideDateOffset != a3)
  {
    v5 = self->_overrideDate;
    overrideDate = self->_overrideDate;
    self->_overrideDate = 0;

    self->_overrideDateOffset = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "controller:didChangeOverrideDateFromDate:", self, v5);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (double)overrideDateOffset
{
  return self->_overrideDateOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end
