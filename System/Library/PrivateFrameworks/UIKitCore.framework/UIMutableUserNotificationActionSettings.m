@implementation UIMutableUserNotificationActionSettings

- (id)copyWithZone:(_NSZone *)a3
{
  UIUserNotificationActionSettings *v4;
  void *v5;
  void *v6;
  UIUserNotificationActionSettings *v7;

  v4 = [UIUserNotificationActionSettings alloc];
  -[UIUserNotificationActionSettings category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationActionSettings actionsByContext](self, "actionsByContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIUserNotificationActionSettings initWithCategory:actionsByContext:](v4, "initWithCategory:actionsByContext:", v5, v6);

  return v7;
}

- (void)setActions:(id)a3 forContext:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
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
  v6 = a3;
  -[UIUserNotificationActionSettings actionsByContext](self, "actionsByContext");
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v19);

  -[UIUserNotificationActionSettings setActionsByContext:](self, "setActionsByContext:", v11);
}

@end
