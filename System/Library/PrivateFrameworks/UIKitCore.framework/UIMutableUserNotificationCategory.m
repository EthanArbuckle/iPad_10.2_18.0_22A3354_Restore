@implementation UIMutableUserNotificationCategory

- (void)setActions:(NSArray *)actions forContext:(UIUserNotificationActionContext)context
{
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = actions;
  -[UIUserNotificationCategory actionsByContext](self, "actionsByContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v6;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v12, "addObject:", v18, (_QWORD)v20);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", context);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v19);

  -[UIUserNotificationCategory setActionsByContext:](self, "setActionsByContext:", v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIUserNotificationCategory *v4;
  void *v5;
  void *v6;
  UIUserNotificationCategory *v7;

  v4 = [UIUserNotificationCategory alloc];
  -[UIUserNotificationCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationCategory actionsByContext](self, "actionsByContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIUserNotificationCategory initWithIdentifier:actionsByContext:](v4, "initWithIdentifier:actionsByContext:", v5, v6);

  return v7;
}

@end
