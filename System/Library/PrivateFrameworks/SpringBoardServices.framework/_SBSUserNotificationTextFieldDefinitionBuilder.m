@implementation _SBSUserNotificationTextFieldDefinitionBuilder

- (_SBSUserNotificationTextFieldDefinitionBuilder)init
{
  _SBSUserNotificationTextFieldDefinitionBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *definitions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBSUserNotificationTextFieldDefinitionBuilder;
  v2 = -[_SBSUserNotificationTextFieldDefinitionBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    definitions = v2->_definitions;
    v2->_definitions = v3;

  }
  return v2;
}

- (void)addTextFieldDefinitionWithConfiguration:(id)a3
{
  SBSMutableUserNotificationTextFieldDefinition *v4;
  NSMutableArray *definitions;
  void *v6;
  void (**v7)(id, SBSMutableUserNotificationTextFieldDefinition *);

  v7 = (void (**)(id, SBSMutableUserNotificationTextFieldDefinition *))a3;
  v4 = objc_alloc_init(SBSMutableUserNotificationTextFieldDefinition);
  if (v7)
    v7[2](v7, v4);
  definitions = self->_definitions;
  v6 = (void *)-[SBSMutableUserNotificationTextFieldDefinition copy](v4, "copy");
  -[NSMutableArray addObject:](definitions, "addObject:", v6);

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
