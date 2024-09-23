@implementation SUCompletionsResponse

- (SUCompletionsResponse)init
{
  return -[SUCompletionsResponse initWithPropertyList:](self, "initWithPropertyList:", 0);
}

- (SUCompletionsResponse)initWithPropertyList:(id)a3
{
  SUCompletionsResponse *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SUCompletionItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)SUCompletionsResponse;
  v4 = -[SUCompletionsResponse init](&v18, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_title = (NSString *)v5;
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("hints"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v6);
            v12 = -[SUCompletionItem initWithPropertyList:]([SUCompletionItem alloc], "initWithPropertyList:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
            -[NSArray addObject:](v7, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v9);
      }
      v4->_completionItems = v7;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCompletionsResponse;
  -[SUCompletionsResponse dealloc](&v3, sel_dealloc);
}

- (NSArray)completionItems
{
  return self->_completionItems;
}

- (NSString)title
{
  return self->_title;
}

@end
