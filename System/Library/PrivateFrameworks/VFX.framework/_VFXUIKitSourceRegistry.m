@implementation _VFXUIKitSourceRegistry

+ (id)sharedInstance
{
  if (qword_1EEF65F48 != -1)
    dispatch_once(&qword_1EEF65F48, &unk_1E63D0EB0);
  return (id)qword_1EEF65F50;
}

- (_VFXUIKitSourceRegistry)init
{
  _VFXUIKitSourceRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_VFXUIKitSourceRegistry;
  v2 = -[_VFXUIKitSourceRegistry init](&v4, sel_init);
  if (v2)
    v2->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_VFXUIKitSourceRegistry;
  -[_VFXUIKitSourceRegistry dealloc](&v3, sel_dealloc);
}

- (void)add:(id)a3
{
  const char *v5;
  uint64_t v6;

  objc_sync_enter(self);
  objc_msgSend_addObject_(self->_sources, v5, (uint64_t)a3, v6);
  objc_sync_exit(self);
}

- (void)remove:(id)a3
{
  const char *v5;
  uint64_t v6;

  objc_sync_enter(self);
  objc_msgSend_removeObject_(self->_sources, v5, (uint64_t)a3, v6);
  objc_sync_exit(self);
}

- (void)apply:(id)a3
{
  NSMutableArray *sources;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sources = self->_sources;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(sources, v6, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(sources);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(sources, v10, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
}

+ (void)registerUIKitSource:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_sharedInstance(a1, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_add_, a3, v6);
}

+ (void)unregisterUIKitSource:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_sharedInstance(a1, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_remove_, a3, v6);
}

@end
