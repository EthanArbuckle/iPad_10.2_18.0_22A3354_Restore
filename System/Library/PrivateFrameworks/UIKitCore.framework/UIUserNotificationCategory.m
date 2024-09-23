@implementation UIUserNotificationCategory

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSDictionary hash](self->_actionsByContext, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *identifier;
  _QWORD *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)v4[1];
    identifier = self->_identifier;
    v7 = v4;
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", identifier);
    v8 = (void *)v7[2];

    v9 = v5 & objc_msgSend(v8, "isEqual:", self->_actionsByContext);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setActionsByContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)actionsByContext
{
  return self->_actionsByContext;
}

- (UIUserNotificationCategory)initWithIdentifier:(id)a3 actionsByContext:(id)a4
{
  id v6;
  id v7;
  UIUserNotificationCategory *v8;
  UIUserNotificationCategory *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[UIUserNotificationCategory init](self, "init");
  v9 = v8;
  if (v8)
    UIUserNotificationCategoryCommonInit(v8, v6, v7);

  return v9;
}

- (UIUserNotificationCategory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIUserNotificationCategory;
  return -[UIUserNotificationCategory init](&v3, sel_init);
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationCategory)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIUserNotificationCategory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UIUserNotificationCategory;
  v5 = -[UIUserNotificationCategory init](&v12, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCategoryIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kActionsByContextKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    UIUserNotificationCategoryCommonInit(v5, v6, v10);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("kCategoryIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionsByContext, CFSTR("kActionsByContextKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UIUserNotificationCategory initWithIdentifier:actionsByContext:]([UIMutableUserNotificationCategory alloc], "initWithIdentifier:actionsByContext:", self->_identifier, self->_actionsByContext);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, actions: %@>"),
               objc_opt_class(),
               self,
               self->_identifier,
               self->_actionsByContext);
}

- (id)actions
{
  return -[UIUserNotificationCategory actionsForContext:](self, "actionsForContext:", 0);
}

- (NSArray)actionsForContext:(UIUserNotificationActionContext)context
{
  NSDictionary *actionsByContext;
  void *v4;
  void *v5;

  actionsByContext = self->_actionsByContext;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", context);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](actionsByContext, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)validatedCategory
{
  UIUserNotificationCategory *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  UIUserNotificationCategory *v19;
  UIUserNotificationCategory *v21;
  id obj;
  uint64_t v23;
  UIUserNotificationCategory *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  -[UIUserNotificationCategory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NSLog(CFSTR("Ignoring UIUserNotificationCategory because identifier is nil: %@"), v2);
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](v2->_actionsByContext, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSDictionary allKeys](v2->_actionsByContext, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v26)
  {

LABEL_22:
    v19 = v2;
    goto LABEL_23;
  }
  v5 = 0;
  v23 = *(_QWORD *)v32;
  v24 = v2;
  obj = v4;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v32 != v23)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      -[NSDictionary objectForKey:](v2->_actionsByContext, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIUserNotificationCategory _maximumActionsForContext:](v2, "_maximumActionsForContext:", objc_msgSend(v7, "unsignedIntegerValue"));
      if (objc_msgSend(v8, "count") > v9)
      {
        objc_msgSend(v8, "subarrayWithRange:", 0, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = 1;
        v8 = (void *)v10;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            objc_msgSend(v17, "validatedAction");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v5 |= v18 != v17;
            objc_msgSend(v11, "addObject:", v18);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v14);
      }

      objc_msgSend(v25, "setObject:forKey:", v11, v7);
      v2 = v24;
    }
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v26);

  if ((v5 & 1) == 0)
    goto LABEL_22;
  v19 = (UIUserNotificationCategory *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:actionsByContext:", v24->_identifier, v25);
LABEL_23:
  v21 = v19;

  return v21;
}

- (unint64_t)_maximumActionsForContext:(unint64_t)a3
{
  if (a3 == 1)
    return 2;
  else
    return 4;
}

@end
