@implementation UIUserNotificationSettings

- (UIUserNotificationType)types
{
  return self->_types;
}

+ (UIUserNotificationSettings)settingsForTypes:(UIUserNotificationType)types categories:(NSSet *)categories
{
  NSSet *v5;
  void *v6;

  v5 = categories;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTypes:categories:", types, v5);

  return (UIUserNotificationSettings *)v6;
}

- (UIUserNotificationSettings)initWithTypes:(unint64_t)a3 categories:(id)a4
{
  id v6;
  UIUserNotificationSettings *v7;
  UIUserNotificationSettings *v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSSet *categories;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIUserNotificationSettings;
  v7 = -[UIUserNotificationSettings init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_types = a3;
    v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)objc_msgSend(v15, "copy", (_QWORD)v19);
            -[NSSet addObject:](v9, "addObject:", v16);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    categories = v8->_categories;
    v8->_categories = v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

+ (id)settingsForUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserNotificationTypes:userNotificationActionSettings:", a3, v5);

  return v6;
}

+ (id)settingsForRegisteredSettings:(id)a3 requestedSettings:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "types");
  v8 = objc_msgSend(v6, "types") & v7;
  objc_msgSend(v6, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "settingsForTypes:categories:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationSettings)initWithUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIUserNotificationCategory *v12;
  void *v13;
  void *v14;
  UIUserNotificationCategory *v15;
  UIUserNotificationSettings *v16;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = [UIUserNotificationCategory alloc];
          objc_msgSend(v11, "category");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "actionsByContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[UIUserNotificationCategory initWithIdentifier:actionsByContext:](v12, "initWithIdentifier:actionsByContext:", v13, v14);

          objc_msgSend(v5, "addObject:", v15);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v16 = -[UIUserNotificationSettings initWithTypes:categories:](self, "initWithTypes:categories:", a3, v5);
  return v16;
}

- (UIUserNotificationSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIUserNotificationSettings *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kUserNotificationTypesKey"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kUserNotificationCategoriesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIUserNotificationSettings initWithTypes:categories:](self, "initWithTypes:categories:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t types;
  id v5;

  types = self->_types;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", types, CFSTR("kUserNotificationTypesKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categories, CFSTR("kUserNotificationCategoriesKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTypes:categories:", self->_types, self->_categories);
}

- (unint64_t)hash
{
  unint64_t types;

  types = self->_types;
  return -[NSSet hash](self->_categories, "hash") ^ types;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t types;
  id v6;
  uint64_t v7;
  NSSet *categories;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    types = self->_types;
    v6 = v4;
    v7 = objc_msgSend(v6, "types");
    categories = self->_categories;
    objc_msgSend(v6, "categories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[NSSet isEqual:](categories, "isEqual:", v9);
    if (types == v7)
      v11 = v10;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)mayPresentUserNotificationOfType:(unint64_t)a3
{
  return (self->_types & a3) != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t types;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; types: ("), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  types = self->_types;
  if ((types & 4) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("UIUserNotificationTypeAlert"));
    types = self->_types;
    if ((types & 1) == 0)
    {
LABEL_3:
      if ((types & 2) == 0)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(v4, "appendString:", CFSTR(" UIUserNotificationTypeSound"));
      if (self->_types)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  else if ((types & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "appendString:", CFSTR(" UIUserNotificationTypeBadge"));
  types = self->_types;
  if ((types & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if (types)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(v4, "appendString:", CFSTR("none"));
LABEL_5:
  objc_msgSend(v4, "appendString:", CFSTR(");"));
  if (-[NSSet count](self->_categories, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("categories: %@;"), self->_categories);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (id)validatedSettings
{
  UIUserNotificationSettings *v2;
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSSet count](v2->_categories, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2->_categories;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v10, "validatedCategory", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 != v10;
      if (v11)
        objc_msgSend(v3, "addObject:", v11);
      v7 |= v12;

    }
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
  {
    v13 = -[UIUserNotificationSettings copy](v2, "copy");

    v14 = v3;
    v4 = *(NSSet **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = v14;
    v2 = (UIUserNotificationSettings *)v13;
LABEL_12:

  }
  return v2;
}

- (unint64_t)allowedUserNotificationTypes
{
  return self->_types;
}

- (id)userNotificationActionSettings
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  UIUserNotificationActionSettings *v10;
  void *v11;
  void *v12;
  UIUserNotificationActionSettings *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSSet count](self->_categories, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_categories;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [UIUserNotificationActionSettings alloc];
        objc_msgSend(v9, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "actionsByContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[UIUserNotificationActionSettings initWithCategory:actionsByContext:](v10, "initWithCategory:actionsByContext:", v11, v12);

        objc_msgSend(v3, "addObject:", v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSSet)categories
{
  return self->_categories;
}

@end
