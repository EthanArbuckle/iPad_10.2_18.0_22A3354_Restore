@implementation UIUserNotificationActionSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationActionSettings)initWithCategory:(id)a3 actionsByContext:(id)a4
{
  id v6;
  id v7;
  UIUserNotificationActionSettings *v8;
  uint64_t v9;
  NSString *category;
  uint64_t v11;
  NSDictionary *actionsByContext;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIUserNotificationActionSettings;
  v8 = -[UIUserNotificationActionSettings init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    category = v8->_category;
    v8->_category = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    actionsByContext = v8->_actionsByContext;
    v8->_actionsByContext = (NSDictionary *)v11;

  }
  return v8;
}

- (UIUserNotificationActionSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIUserNotificationActionSettings *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCategoryKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kActionsByContextKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIUserNotificationActionSettings initWithCategory:actionsByContext:](self, "initWithCategory:actionsByContext:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category, CFSTR("kCategoryKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionsByContext, CFSTR("kActionsByContextKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UIUserNotificationActionSettings initWithCategory:actionsByContext:]([UIMutableUserNotificationActionSettings alloc], "initWithCategory:actionsByContext:", self->_category, self->_actionsByContext);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_category, "hash");
  return -[NSDictionary hash](self->_actionsByContext, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *category;
  _QWORD *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)v4[1];
    category = self->_category;
    v7 = v4;
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", category);
    v8 = (void *)v7[2];

    v9 = v5 & objc_msgSend(v8, "isEqual:", self->_actionsByContext);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; category: %@, actions: %@>"),
               objc_opt_class(),
               self,
               self->_category,
               self->_actionsByContext);
}

- (id)actions
{
  return -[UIUserNotificationActionSettings actionsForContext:](self, "actionsForContext:", 0);
}

- (id)actionsForContext:(unint64_t)a3
{
  NSDictionary *actionsByContext;
  void *v4;
  void *v5;

  actionsByContext = self->_actionsByContext;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](actionsByContext, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validatedSettings
{
  void *v3;
  char v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  UIUserNotificationActionSettings *v18;
  UIUserNotificationActionSettings *v19;
  id obj;
  uint64_t v22;
  UIUserNotificationActionSettings *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_actionsByContext, "count"));
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NSDictionary allKeys](self->_actionsByContext, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v25)
  {

LABEL_20:
    v18 = v23;
    goto LABEL_21;
  }
  v4 = 0;
  obj = v3;
  v22 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v31 != v22)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
      -[NSDictionary objectForKey:](v23->_actionsByContext, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIUserNotificationActionSettings _maximumActionsForContext:](v23, "_maximumActionsForContext:", v6);
      if (objc_msgSend(v7, "count") > v8)
      {
        objc_msgSend(v7, "subarrayWithRange:", 0, v8);
        v9 = objc_claimAutoreleasedReturnValue();

        v4 = 1;
        v7 = (void *)v9;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
            objc_msgSend(v16, "validatedAction");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v4 |= v17 != v16;
            objc_msgSend(v10, "addObject:", v17);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v13);
      }

      objc_msgSend(v24, "setObject:forKey:", v10, v6);
    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  }
  while (v25);

  if ((v4 & 1) == 0)
    goto LABEL_20;
  v18 = (UIUserNotificationActionSettings *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCategory:actionsByContext:", v23->_category, v24);
LABEL_21:
  v19 = v18;

  return v19;
}

- (unint64_t)_maximumActionsForContext:(unint64_t)a3
{
  if (a3 == 1)
    return 2;
  else
    return 4;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)actionsByContext
{
  return self->_actionsByContext;
}

- (void)setActionsByContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByContext, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
