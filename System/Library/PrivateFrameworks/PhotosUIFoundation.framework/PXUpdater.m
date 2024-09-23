@implementation PXUpdater

- (void)addUpdateSelector:(SEL)a3
{
  -[PXUpdater addUpdateSelector:needsUpdate:](self, "addUpdateSelector:needsUpdate:", a3, 0);
}

- (void)addUpdateSelector:(SEL)a3 needsUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v8;
  unint64_t orderedUpdateSelectorsCount;
  uint64_t i;
  void *orderedUpdateSelectors;
  unint64_t orderedUpdateSelectorsCapacity;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a4;
  v8 = -[PXUpdater extraChecksEnabled](self, "extraChecksEnabled");
  orderedUpdateSelectorsCount = self->_orderedUpdateSelectorsCount;
  if (v8 && orderedUpdateSelectorsCount)
  {
    for (i = 0; i != orderedUpdateSelectorsCount; ++i)
    {
      if (self->_orderedUpdateSelectors[i] == a3)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUpdater.m"), 67, CFSTR("%@ update selector %@ already added"), self, v15);

        abort();
      }
    }
  }
  orderedUpdateSelectors = self->_orderedUpdateSelectors;
  orderedUpdateSelectorsCapacity = self->_orderedUpdateSelectorsCapacity;
  while (orderedUpdateSelectorsCount >= orderedUpdateSelectorsCapacity)
  {
    if (orderedUpdateSelectorsCapacity <= 1)
      v13 = 1;
    else
      v13 = orderedUpdateSelectorsCapacity;
    self->_orderedUpdateSelectorsCapacity = 2 * v13;
    orderedUpdateSelectors = malloc_type_realloc(orderedUpdateSelectors, 16 * v13, 0x80040B8603338uLL);
    self->_orderedUpdateSelectors = (SEL *)orderedUpdateSelectors;
    orderedUpdateSelectorsCapacity = self->_orderedUpdateSelectorsCapacity;
    orderedUpdateSelectorsCount = self->_orderedUpdateSelectorsCount;
  }
  *((_QWORD *)orderedUpdateSelectors + orderedUpdateSelectorsCount) = a3;
  self->_orderedUpdateSelectorsCount = orderedUpdateSelectorsCount + 1;
  if (v4)
    -[PXUpdater setNeedsUpdateOf:](self, "setNeedsUpdateOf:", a3);
}

- (BOOL)extraChecksEnabled
{
  return self->_extraChecksEnabled;
}

- (void)_scheduleUpdatePassIfNeeded
{
  const char *v3;
  const char *v4;
  void *v5;

  if (!-[PXUpdater isUpdatePassScheduled](self, "isUpdatePassScheduled"))
  {
    v3 = -[PXUpdater needsUpdateSelector](self, "needsUpdateSelector");
    if (v3)
    {
      v4 = v3;
      self->_hasUpdatedForCurrentPass = 0;
      -[PXUpdater target](self, "target");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performSelector:withObject:", v4, 0);

      if (!self->_hasUpdatedForCurrentPass)
        -[PXUpdater setUpdatePassScheduled:](self, "setUpdatePassScheduled:", 1);
    }
  }
}

- (BOOL)isUpdatePassScheduled
{
  return self->_updatePassScheduled;
}

- (void)setNeedsUpdateOf:(SEL)a3
{
  void *v6;
  void *v7;

  if (self->_isPerformingUpdates
    && -[NSMutableIndexSet containsIndex:](self->_updateSelectorsAlreadyUpdated, "containsIndex:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUpdater.m"), 98, CFSTR("%@ marking %@ as needing update after it already has been updated"), self, v7);

    abort();
  }
  -[NSMutableIndexSet addIndex:](self->_updateSelectorsNeedingUpdate, "addIndex:", a3);
  -[PXUpdater _scheduleUpdatePassIfNeeded](self, "_scheduleUpdatePassIfNeeded");
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)updateIfNeeded
{
  _BOOL4 isPerformingUpdates;
  unint64_t v5;
  SEL v6;
  void *v7;
  NSMutableIndexSet *updateSelectorsNeedingUpdate;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  self->_hasUpdatedForCurrentPass = 1;
  if (-[NSMutableIndexSet count](self->_updateSelectorsNeedingUpdate, "count"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[NSMutableIndexSet removeAllIndexes](self->_updateSelectorsAlreadyUpdated, "removeAllIndexes");
    -[PXUpdater target](self, "target");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_orderedUpdateSelectorsCount)
    {
      v5 = 0;
      do
      {
        v6 = self->_orderedUpdateSelectors[v5];
        -[NSMutableIndexSet addIndex:](self->_updateSelectorsAlreadyUpdated, "addIndex:", v6);
        if (-[NSMutableIndexSet containsIndex:](self->_updateSelectorsNeedingUpdate, "containsIndex:", v6))
        {
          -[NSMutableIndexSet removeIndex:](self->_updateSelectorsNeedingUpdate, "removeIndex:", v6);
          objc_msgSend(v11, "performSelector:withObject:", v6, 0);
        }
        ++v5;
      }
      while (v5 < self->_orderedUpdateSelectorsCount);
    }
    self->_isPerformingUpdates = isPerformingUpdates;
    if (!isPerformingUpdates)
    {
      -[PXUpdater setUpdatePassScheduled:](self, "setUpdatePassScheduled:", 0);
      if (-[NSMutableIndexSet count](self->_updateSelectorsNeedingUpdate, "count"))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableIndexSet count](self->_updateSelectorsNeedingUpdate, "count"));
        updateSelectorsNeedingUpdate = self->_updateSelectorsNeedingUpdate;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __27__PXUpdater_updateIfNeeded__block_invoke;
        v12[3] = &unk_2514D0E38;
        v9 = v7;
        v12[4] = v9;
        -[NSMutableIndexSet enumerateIndexesUsingBlock:](updateSelectorsNeedingUpdate, "enumerateIndexesUsingBlock:", v12);
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUpdater.m"), 171, CFSTR("%@ still needing update after update pass: %@"), self, v9);

        abort();
      }
    }

  }
}

- (void)setUpdatePassScheduled:(BOOL)a3
{
  self->_updatePassScheduled = a3;
}

- (SEL)needsUpdateSelector
{
  return self->_needsUpdateSelector;
}

- (PXUpdater)initWithTarget:(id)a3
{
  return -[PXUpdater initWithTarget:needsUpdateSelector:](self, "initWithTarget:needsUpdateSelector:", a3, 0);
}

- (void)setNeedsUpdateSelector:(SEL)a3
{
  if (self->_needsUpdateSelector != a3)
  {
    self->_needsUpdateSelector = a3;
    -[PXUpdater setUpdatePassScheduled:](self, "setUpdatePassScheduled:", 0);
  }
}

- (PXUpdater)initWithTarget:(id)a3 needsUpdateSelector:(SEL)a4
{
  id v6;
  PXUpdater *v7;
  PXUpdater *v8;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *updateSelectorsNeedingUpdate;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *updateSelectorsAlreadyUpdated;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXUpdater;
  v7 = -[PXUpdater init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_needsUpdateSelector = a4;
    v8->_orderedUpdateSelectorsCapacity = 32;
    v8->_orderedUpdateSelectors = (SEL *)malloc_type_calloc(0x20uLL, 8uLL, 0x80040B8603338uLL);
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    updateSelectorsNeedingUpdate = v8->_updateSelectorsNeedingUpdate;
    v8->_updateSelectorsNeedingUpdate = v9;

    v11 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    updateSelectorsAlreadyUpdated = v8->_updateSelectorsAlreadyUpdated;
    v8->_updateSelectorsAlreadyUpdated = v11;

    v8->_extraChecksEnabled = 0;
  }

  return v8;
}

- (PXUpdater)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUpdater.m"), 28, CFSTR("%s is not available as initializer"), "-[PXUpdater init]");

  abort();
}

- (void)dealloc
{
  SEL *orderedUpdateSelectors;
  objc_super v4;

  orderedUpdateSelectors = self->_orderedUpdateSelectors;
  if (orderedUpdateSelectors)
    free(orderedUpdateSelectors);
  v4.receiver = self;
  v4.super_class = (Class)PXUpdater;
  -[PXUpdater dealloc](&v4, sel_dealloc);
}

- (BOOL)isPerformingUpdates
{
  return self->_isPerformingUpdates;
}

- (void)setExtraChecksEnabled:(BOOL)a3
{
  self->_extraChecksEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_updateSelectorsAlreadyUpdated, 0);
  objc_storeStrong((id *)&self->_updateSelectorsNeedingUpdate, 0);
}

void __27__PXUpdater_updateIfNeeded__block_invoke(uint64_t a1, SEL aSelector)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(aSelector);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
