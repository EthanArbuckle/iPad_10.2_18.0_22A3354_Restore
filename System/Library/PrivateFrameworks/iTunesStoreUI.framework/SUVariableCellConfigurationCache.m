@implementation SUVariableCellConfigurationCache

- (SUVariableCellConfigurationCache)initWithTableHeight:(double)a3
{
  SUVariableCellConfigurationCache *result;

  result = -[SUVariableCellConfigurationCache init](self, "init");
  if (result)
    result->_tableHeight = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_caches = 0;
  self->_cellContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUVariableCellConfigurationCache;
  -[SUVariableCellConfigurationCache dealloc](&v3, sel_dealloc);
}

- (id)cacheForClass:(Class)a3
{
  NSMutableDictionary *caches;
  SUCellConfigurationCache *v6;

  caches = self->_caches;
  if (caches)
  {
    if (a3)
      goto LABEL_3;
    return 0;
  }
  caches = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  self->_caches = caches;
  if (!a3)
    return 0;
LABEL_3:
  v6 = (SUCellConfigurationCache *)-[NSMutableDictionary objectForKey:](caches, "objectForKey:", a3);
  if (!v6)
  {
    v6 = -[SUCellConfigurationCache initWithClass:tableHeight:]([SUCellConfigurationCache alloc], "initWithClass:tableHeight:", a3, self->_tableHeight);
    -[NSMutableDictionary setObject:forKey:](self->_caches, "setObject:forKey:", v6, a3);

  }
  return v6;
}

- (NSArray)caches
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_caches, "allValues");
}

- (void)reset
{
  NSMutableDictionary *caches;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  caches = self->_caches;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](caches, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(caches);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_caches, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)), "reset");
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](caches, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)resetLayoutCaches
{
  NSMutableDictionary *caches;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  caches = self->_caches;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](caches, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(caches);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_caches, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)), "resetLayoutCaches");
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](caches, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(-[SUVariableCellConfigurationCache cellContext](self, "cellContext"), "resetLayoutCaches");
}

- (id)cellContext
{
  return self->_cellContext;
}

- (void)setCellContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
