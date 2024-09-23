@implementation SSSoftwareUpdatesResponse

- (SSSoftwareUpdatesResponse)initWithError:(id)a3
{
  SSSoftwareUpdatesResponse *v4;
  NSError *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSoftwareUpdatesResponse;
  v4 = -[SSSoftwareUpdatesResponse init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSError *)a3;
    v4->_error = v5;
    v4->_failed = v5 != 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesResponse;
  -[SSSoftwareUpdatesResponse dealloc](&v3, sel_dealloc);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (NSArray)updateItems
{
  return self->_updateItems;
}

- (id)description
{
  objc_super v3;
  objc_super v4;

  if (self->_failed)
  {
    v4.receiver = self;
    v4.super_class = (Class)SSSoftwareUpdatesResponse;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Failed with error: %@"), -[SSSoftwareUpdatesResponse description](&v4, sel_description), self->_error);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SSSoftwareUpdatesResponse;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Found %ld updates"), -[SSSoftwareUpdatesResponse description](&v3, sel_description), -[NSArray count](self->_updateItems, "count"));
  }
}

- (id)copyUpdateItemDictionaries
{
  id v3;
  NSArray *updateItems;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  updateItems = self->_updateItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](updateItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(updateItems);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "rawItemDictionary"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](updateItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)setUpdateItemsWithItemDictionaries:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SSItem *v11;
  SSItem *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v10);
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v5, "addObject:", v11);

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  self->_updateItems = (NSArray *)objc_msgSend(v5, "copy");
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  __CFString *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_error);
  xpc_dictionary_set_BOOL(v3, "1", self->_failed);
  v4 = -[SSSoftwareUpdatesResponse copyUpdateItemDictionaries](self, "copyUpdateItemDictionaries");
  SSXPCDictionarySetCFObject(v3, "2", v4);

  return v3;
}

- (SSSoftwareUpdatesResponse)initWithXPCEncoding:(id)a3
{
  SSSoftwareUpdatesResponse *v5;
  CFArrayRef v7;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSoftwareUpdatesResponse;
    v5 = -[SSSoftwareUpdatesResponse init](&v8, sel_init);
    if (v5)
    {
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      v5->_failed = xpc_dictionary_get_BOOL(a3, "1");
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      -[SSSoftwareUpdatesResponse setUpdateItemsWithItemDictionaries:](v5, "setUpdateItemsWithItemDictionaries:", v7);

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
