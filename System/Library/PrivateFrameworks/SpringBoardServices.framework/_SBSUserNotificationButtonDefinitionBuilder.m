@implementation _SBSUserNotificationButtonDefinitionBuilder

- (_SBSUserNotificationButtonDefinitionBuilder)init
{
  _SBSUserNotificationButtonDefinitionBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *definitions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBSUserNotificationButtonDefinitionBuilder;
  v2 = -[_SBSUserNotificationButtonDefinitionBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    definitions = v2->_definitions;
    v2->_definitions = v3;

  }
  return v2;
}

- (void)addButtonDefinitionWithTitle:(id)a3 withConfiguration:(id)a4
{
  void (**v7)(id, SBSMutableUserNotificationButtonDefinition *);
  SBSMutableUserNotificationButtonDefinition *v8;
  NSMutableArray *definitions;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = (void (**)(id, SBSMutableUserNotificationButtonDefinition *))a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationButtonDefinition.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v8 = -[SBSUserNotificationButtonDefinition initWithTitle:]([SBSMutableUserNotificationButtonDefinition alloc], "initWithTitle:", v12);
  if (v7)
    v7[2](v7, v8);
  definitions = self->_definitions;
  v10 = (void *)-[SBSMutableUserNotificationButtonDefinition copy](v8, "copy");
  -[NSMutableArray addObject:](definitions, "addObject:", v10);

}

- (id)build
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_definitions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "build", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitions, 0);
}

@end
