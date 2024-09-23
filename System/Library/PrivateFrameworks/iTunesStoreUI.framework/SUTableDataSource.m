@implementation SUTableDataSource

- (SUTableDataSource)init
{
  SUTableDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTableDataSource;
  result = -[SUTableDataSource init](&v3, sel_init);
  if (result)
    result->_columnCount = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_configurationCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableDataSource;
  -[SUTableDataSource dealloc](&v3, sel_dealloc);
}

- (void)beginPreferringUserInteraction
{
  int64_t preferringUserInteractionCount;

  preferringUserInteractionCount = self->_preferringUserInteractionCount;
  self->_preferringUserInteractionCount = preferringUserInteractionCount + 1;
  if (!preferringUserInteractionCount)
    -[SUTableDataSource didBeginPreferringUserInteraction](self, "didBeginPreferringUserInteraction");
}

- (id)cachedConfigurationForClass:(Class)a3 index:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = -[SUVariableCellConfigurationCache cacheForClass:](self->_configurationCache, "cacheForClass:", a3);
  v7 = (void *)objc_msgSend(v6, "configurationForRow:", a4);
  v8 = (id)objc_msgSend(v6, "cellContext");
  if (!v8)
    v8 = -[SUVariableCellConfigurationCache cellContext](self->_configurationCache, "cellContext");
  objc_msgSend(v8, "setTableViewStyle:", -[SUTableDataSource tableViewStyle](self, "tableViewStyle"));
  objc_msgSend(v7, "setContext:", v8);
  return v7;
}

- (BOOL)canDeleteIndexPath:(id)a3
{
  return 0;
}

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  return 0;
}

- (BOOL)canSelectIndexPath:(id)a3
{
  return 1;
}

- (id)cellContextForConfigurationClass:(Class)a3
{
  return (id)objc_msgSend(-[SUVariableCellConfigurationCache cacheForClass:](self->_configurationCache, "cacheForClass:", a3), "cellContext");
}

- (id)cellForIndexPath:(id)a3
{
  return 0;
}

- (double)cellHeightForIndexPath:(id)a3
{
  return 44.0;
}

- (BOOL)deleteIndexPath:(id)a3
{
  return 0;
}

- (void)didBeginPreferringUserInteraction
{
  objc_msgSend((id)-[ISURLOperationPool operationQueue](-[SUTableDataSource imagePool](self, "imagePool"), "operationQueue"), "setSuspended:", 1);
}

- (void)didEndPreferringUserInteraction
{
  objc_msgSend((id)-[ISURLOperationPool operationQueue](-[SUTableDataSource imagePool](self, "imagePool"), "operationQueue"), "setSuspended:", 0);
}

- (void)endPreferringUserInteraction
{
  int64_t preferringUserInteractionCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  preferringUserInteractionCount = self->_preferringUserInteractionCount;
  v3 = preferringUserInteractionCount == 1;
  v4 = preferringUserInteractionCount < 1;
  v5 = preferringUserInteractionCount - 1;
  if (!v4)
  {
    self->_preferringUserInteractionCount = v5;
    if (v3)
      -[SUTableDataSource didEndPreferringUserInteraction](self, "didEndPreferringUserInteraction");
  }
}

- (id)headerViewForSection:(int64_t)a3
{
  return 0;
}

- (double)heightForFooterInSection:(int64_t)a3
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)heightForPlaceholderCells
{
  return -1.0;
}

- (SUImageCache)imageCache
{
  return (SUImageCache *)+[SUClientDispatch imageCache](SUClientDispatch, "imageCache");
}

- (ISURLOperationPool)imagePool
{
  return (ISURLOperationPool *)+[SUClientDispatch imagePool](SUClientDispatch, "imagePool");
}

- (BOOL)isPreferringUserInteraction
{
  return self->_preferringUserInteractionCount > 0;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)placeholderCellForIndexPath:(id)a3
{
  return 0;
}

- (void)reloadCellContexts
{
  SUVariableCellConfigurationCache *configurationCache;
  double v4;

  configurationCache = self->_configurationCache;
  if (!configurationCache)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    configurationCache = -[SUVariableCellConfigurationCache initWithTableHeight:]([SUVariableCellConfigurationCache alloc], "initWithTableHeight:", v4 * (double)-[SUTableDataSource columnCount](self, "columnCount"));
    self->_configurationCache = configurationCache;
  }
  -[SUVariableCellConfigurationCache reset](configurationCache, "reset");
}

- (void)resetLayoutCaches
{
  -[SUVariableCellConfigurationCache resetLayoutCaches](self->_configurationCache, "resetLayoutCaches");
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0;
}

- (NSArray)sectionIndexTitles
{
  return 0;
}

- (void)setCellReuseSource:(id)a3
{
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUTableDataSource.m"), 180, CFSTR("Invalid cell reuse source"));
  self->_cellReuseSource = a3;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (id)titleForDeleteConfirmationForIndexPath:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_24DE83F60, 0);
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)cellReuseSource
{
  return self->_cellReuseSource;
}

- (int64_t)columnCount
{
  return self->_columnCount;
}

- (void)setColumnCount:(int64_t)a3
{
  self->_columnCount = a3;
}

@end
