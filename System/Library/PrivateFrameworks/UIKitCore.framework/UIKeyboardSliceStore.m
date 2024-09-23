@implementation UIKeyboardSliceStore

- (UIKeyboardSliceStore)init
{
  UIKeyboardSliceStore *v2;
  uint64_t v3;
  NSMutableDictionary *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSliceStore;
  v2 = -[UIKeyboardSliceStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedStore
{
  if (qword_1ECD7F1D8 != -1)
    dispatch_once(&qword_1ECD7F1D8, &__block_literal_global_384);
  return (id)_MergedGlobals_1154;
}

void __35__UIKeyboardSliceStore_sharedStore__block_invoke()
{
  UIKeyboardSliceStore *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardSliceStore);
  v1 = (void *)_MergedGlobals_1154;
  _MergedGlobals_1154 = (uint64_t)v0;

}

- (void)addSet:(id)a3
{
  NSMutableDictionary *store;
  id v4;
  id v5;

  store = self->_store;
  v4 = a3;
  objc_msgSend(v4, "sliceSetID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](store, "setValue:forKey:", v4, v5);

}

- (id)sliceSetForID:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->_store, "valueForKey:", a3);
}

+ (id)sliceSetForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sliceSetForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sliceSetIDForKeyplaneName:(id)a3 type:(int64_t)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), a4, a5, a3, a4);
}

+ (void)archiveSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSet:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
