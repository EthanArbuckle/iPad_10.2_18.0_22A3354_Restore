@implementation _PXImportConcurrentActionManager

- (_PXImportConcurrentActionManager)init
{
  _PXImportConcurrentActionManager *v2;
  NSMutableArray *v3;
  NSMutableArray *operations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXImportConcurrentActionManager;
  v2 = -[_PXImportConcurrentActionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    operations = v2->_operations;
    v2->_operations = v3;

  }
  return v2;
}

- (void)addOperation:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[NSMutableArray addObject:](self->_operations, "addObject:", v5);
  v4 = (id)objc_msgSend(v5, "performAction");

}

- (void)removeOperation:(id)a3
{
  -[NSMutableArray removeObject:](self->_operations, "removeObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_36279 != -1)
    dispatch_once(&sharedInstance_onceToken_36279, &__block_literal_global_36280);
  return (id)sharedInstance_sharedInstance_36281;
}

@end
