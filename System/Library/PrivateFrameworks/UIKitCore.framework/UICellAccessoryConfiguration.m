@implementation UICellAccessoryConfiguration

- (BOOL)alwaysNeedsLayout
{
  return self->_leadingAlwaysNeedsLayout || self->_trailingAlwaysNeedsLayout;
}

- (UICellAccessoryConfiguration)init
{
  UICellAccessoryConfiguration *v2;
  NSArray *leadingAccessories;
  NSArray *v4;
  NSArray *trailingAccessories;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryConfiguration;
  v2 = -[UICellAccessoryConfiguration init](&v7, sel_init);
  leadingAccessories = v2->_leadingAccessories;
  v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  v2->_leadingAccessories = (NSArray *)MEMORY[0x1E0C9AA60];

  trailingAccessories = v2->_trailingAccessories;
  v2->_trailingAccessories = v4;

  return v2;
}

- (void)setTrailingAccessories:(id)a3
{
  NSArray *v4;
  NSArray *trailingAccessories;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  trailingAccessories = self->_trailingAccessories;
  self->_trailingAccessories = v4;

  v6 = self->_trailingAccessories;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "alwaysNeedsLayout", (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  self->_trailingAlwaysNeedsLayout = v8;
}

- (void)setLeadingAccessories:(id)a3
{
  NSArray *v4;
  NSArray *leadingAccessories;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  leadingAccessories = self->_leadingAccessories;
  self->_leadingAccessories = v4;

  v6 = self->_leadingAccessories;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "alwaysNeedsLayout", (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  self->_leadingAlwaysNeedsLayout = v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UICellAccessoryConfiguration leadingAccessories](self, "leadingAccessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      v13 = v8;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_16;
    }
    -[UICellAccessoryConfiguration trailingAccessories](self, "trailingAccessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAccessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    v16 = v15;
    v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16)
        LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v16);
    }

    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return v11;
}

- (NSArray)leadingAccessories
{
  return self->_leadingAccessories;
}

- (NSArray)trailingAccessories
{
  return self->_trailingAccessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessories, 0);
  objc_storeStrong((id *)&self->_leadingAccessories, 0);
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, &unk_1E1A94C28);
}

@end
