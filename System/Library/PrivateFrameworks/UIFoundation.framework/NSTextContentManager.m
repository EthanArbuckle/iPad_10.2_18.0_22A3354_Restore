@implementation NSTextContentManager

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (unint64_t)maximumNumberOfUncachedElements
{
  return self->_maximumNumberOfUncachedElements;
}

- (void)setPrimaryTextLayoutManager:(NSTextLayoutManager *)primaryTextLayoutManager
{
  NSTextLayoutManager *v5;

  if (self->_primaryTextLayoutManager != primaryTextLayoutManager)
  {
    -[NSTextContentManager synchronizeTextLayoutManagers:](self, "synchronizeTextLayoutManagers:", 0);
    objc_sync_enter(self);

    if (-[NSMutableArray containsObject:](self->_textLayoutManagers, "containsObject:", primaryTextLayoutManager))v5 = primaryTextLayoutManager;
    else
      v5 = 0;
    self->_primaryTextLayoutManager = v5;
    objc_sync_exit(self);
  }
}

- (void)recordEditActionInRange:(NSTextRange *)originalTextRange newTextRange:(NSTextRange *)newTextRange
{
  NSMutableArray *editHistory;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  editHistory = self->_editHistory;
  if (!editHistory)
  {
    editHistory = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_editHistory = editHistory;
  }
  v8[0] = originalTextRange;
  v8[1] = newTextRange;
  -[NSMutableArray addObject:](editHistory, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));
  objc_sync_exit(self);
}

- (void)addTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  -[NSTextContentManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("textLayoutManagers"));
  objc_sync_enter(self);
  -[NSMutableArray addObject:](self->_textLayoutManagers, "addObject:", textLayoutManager);
  -[NSTextLayoutManager setTextContentManager:](textLayoutManager, "setTextContentManager:", self);
  objc_sync_exit(self);
  -[NSTextContentManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("textLayoutManagers"));
}

- (NSTextContentManager)init
{
  NSTextContentManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSTextContentManager;
  v2 = -[NSTextContentManager init](&v4, sel_init);
  if (v2)
  {
    v2->_textLayoutManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_automaticallySynchronizesTextLayoutManagers = 1;
  }
  return v2;
}

uint64_t __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke_2;
  v4[3] = &unk_1E26056F0;
  v4[4] = a2;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

- (void)synchronizeTextLayoutManagers:(void *)completionHandler
{
  NSMutableArray *textLayoutManagers;
  _QWORD v5[5];

  objc_sync_enter(self);
  textLayoutManagers = self->_textLayoutManagers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke;
  v5[3] = &unk_1E2605718;
  v5[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](textLayoutManagers, "enumerateObjectsUsingBlock:", v5);

  self->_editHistory = 0;
  objc_sync_exit(self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processLayoutInvalidationForTextRange:synchronizing:", objc_msgSend(a2, "firstObject"), 1);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextContentManager setPrimaryTextLayoutManager:](self, "setPrimaryTextLayoutManager:", 0);
  -[NSTextContentManager setDelegate:](self, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentManager;
  -[NSTextContentManager dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)_incrementTransactionStack
{
  unint64_t *p_transactionStack;
  unint64_t v4;
  unint64_t v6;

  p_transactionStack = &self->_transactionStack;
  if (atomic_load(&self->_transactionStack))
  {
    do
      v4 = __ldaxr(p_transactionStack);
    while (__stlxr(v4 + 1, p_transactionStack));
  }
  else
  {
    -[NSTextContentManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasEditingTransaction"));
    do
      v6 = __ldaxr(p_transactionStack);
    while (__stlxr(v6 + 1, p_transactionStack));
    -[NSTextContentManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasEditingTransaction"));
  }
}

- (void)_decrementTransactionStack
{
  unint64_t *p_transactionStack;
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;

  p_transactionStack = &self->_transactionStack;
  v3 = atomic_load(&self->_transactionStack);
  if (v3 >= 2)
  {
    do
      v6 = __ldaxr(p_transactionStack);
    while (__stlxr(v6 - 1, p_transactionStack));
  }
  else
  {
    -[NSTextContentManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasEditingTransaction"));
    do
      v5 = __ldaxr(p_transactionStack);
    while (__stlxr(v5 - 1, p_transactionStack));
    -[NSTextContentManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasEditingTransaction"));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextContentManager)initWithCoder:(NSCoder *)coder
{
  char v5;
  void *v6;
  uint64_t v7;

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v5 = -[NSCoder decodeInt32ForKey:](coder, "decodeInt32ForKey:", CFSTR("NS.flags"));
    -[NSTextContentManager setDelegate:](self, "setDelegate:", -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.delegate")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    self->_textLayoutManagers = (NSMutableArray *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("NS.textLayoutManagers"));
    self->_maximumNumberOfUncachedElements = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NS.maximumNumberOfUncachedElements"));
    self->_automaticallySynchronizesToBackingStore = (v5 & 2) != 0;
    self->_automaticallySynchronizesTextLayoutManagers = v5 & 1;
    if (!self->_textLayoutManagers)
      self->_textLayoutManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v5;
  id v6;
  uint64_t v7;
  unint64_t maximumNumberOfUncachedElements;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[NSTextContentManager textLayoutManagers](self, "textLayoutManagers");
    v6 = -[NSTextContentManager delegate](self, "delegate");
    v7 = self->_automaticallySynchronizesTextLayoutManagers | (2
                                                             * self->_automaticallySynchronizesToBackingStore);
    if ((_DWORD)v7)
      objc_msgSend(a3, "encodeInt32:forKey:", v7, CFSTR("NS.flags"));
    if (v6)
      objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.delegate"));
    if (-[NSArray count](v5, "count"))
      objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NS.textLayoutManagers"));
    maximumNumberOfUncachedElements = self->_maximumNumberOfUncachedElements;
    if (maximumNumberOfUncachedElements)
      objc_msgSend(a3, "encodeInteger:forKey:", maximumNumberOfUncachedElements, CFSTR("NS.maximumNumberOfUncachedElements"));
  }
}

- (NSArray)textLayoutManagers
{
  NSArray *v3;

  objc_sync_enter(self);
  v3 = (NSArray *)(id)-[NSMutableArray copy](self->_textLayoutManagers, "copy");
  objc_sync_exit(self);
  return v3;
}

- (void)removeTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  if (-[NSMutableArray containsObject:](self->_textLayoutManagers, "containsObject:"))
  {
    if (-[NSTextContentManager primaryTextLayoutManager](self, "primaryTextLayoutManager") == textLayoutManager)
      -[NSTextContentManager setPrimaryTextLayoutManager:](self, "setPrimaryTextLayoutManager:", 0);
    -[NSTextContentManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("textLayoutManagers"));
    objc_sync_enter(self);
    -[NSTextLayoutManager setTextContentManager:](textLayoutManager, "setTextContentManager:", 0);
    -[NSMutableArray removeObject:](self->_textLayoutManagers, "removeObject:", textLayoutManager);
    objc_sync_exit(self);
    -[NSTextContentManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("textLayoutManagers"));
  }
}

- (NSTextLayoutManager)primaryTextLayoutManager
{
  NSTextLayoutManager *v3;

  objc_sync_enter(self);
  v3 = self->_primaryTextLayoutManager;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)containsExtraLineFragment
{
  return 0;
}

- (NSArray)textElementsForRange:(NSTextRange *)range
{
  id v5;
  id v6;
  NSArray *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__11;
  v14 = __Block_byref_object_dispose__11;
  v15 = 0;
  v5 = -[NSTextRange location](range, "location");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__NSTextContentManager_textElementsForRange___block_invoke;
  v9[3] = &unk_1E2603F68;
  v9[4] = range;
  v9[5] = &v10;
  -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](self, "enumerateTextElementsFromLocation:options:usingBlock:", v5, 0, v9);
  v6 = (id)v11[5];
  if (v11[5])
    v7 = (NSArray *)v11[5];
  else
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __45__NSTextContentManager_textElementsForRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "containsLocation:", objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location"));
  if ((_DWORD)v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", a2);
  }
  return v4;
}

- (BOOL)hasEditingTransaction
{
  unint64_t v2;

  v2 = atomic_load(&self->_transactionStack);
  return v2 != 0;
}

- (void)performEditingTransactionUsingBlock:(void *)transaction
{
  -[NSTextContentManager _incrementTransactionStack](self, "_incrementTransactionStack");
  (*((void (**)(void *))transaction + 2))(transaction);
  -[NSTextContentManager _decrementTransactionStack](self, "_decrementTransactionStack");
  if (!-[NSTextContentManager hasEditingTransaction](self, "hasEditingTransaction"))
  {
    if (-[NSTextContentManager automaticallySynchronizesTextLayoutManagers](self, "automaticallySynchronizesTextLayoutManagers"))
    {
      -[NSTextContentManager synchronizeTextLayoutManagers:](self, "synchronizeTextLayoutManagers:", 0);
    }
    if (-[NSTextContentManager automaticallySynchronizesToBackingStore](self, "automaticallySynchronizesToBackingStore"))
    {
      -[NSTextContentManager synchronizeToBackingStore:](self, "synchronizeToBackingStore:", 0);
    }
  }
}

- (NSTextRange)documentRange
{
  return (NSTextRange *)+[NSCountableTextRange documentRange](NSCountableTextRange, "documentRange");
}

- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  return 0;
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  return 0;
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isCountableDataSource
{
  return 0;
}

- (void)setMaximumNumberOfUncachedElements:(unint64_t)a3
{
  self->_maximumNumberOfUncachedElements = a3;
}

- (BOOL)automaticallySynchronizesTextLayoutManagers
{
  return self->_automaticallySynchronizesTextLayoutManagers;
}

- (void)setAutomaticallySynchronizesTextLayoutManagers:(BOOL)automaticallySynchronizesTextLayoutManagers
{
  self->_automaticallySynchronizesTextLayoutManagers = automaticallySynchronizesTextLayoutManagers;
}

- (BOOL)automaticallySynchronizesToBackingStore
{
  return self->_automaticallySynchronizesToBackingStore;
}

- (void)setAutomaticallySynchronizesToBackingStore:(BOOL)automaticallySynchronizesToBackingStore
{
  self->_automaticallySynchronizesToBackingStore = automaticallySynchronizesToBackingStore;
}

@end
