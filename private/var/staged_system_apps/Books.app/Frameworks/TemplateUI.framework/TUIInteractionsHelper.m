@implementation TUIInteractionsHelper

- (TUIInteractionsHelper)initWithView:(id)a3
{
  TUIInteractionsHelper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIInteractionsHelper;
  result = -[TUIInteractionsHelper init](&v5, "init");
  if (result)
  {
    result->_view = (UIView *)a3;
    result->_flags.linkEntitiesNeedsUpdate = 0;
  }
  return result;
}

- (void)updateWithLinkEntities:(id)a3
{
  NSArray *v4;
  NSArray *linkEntities;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  linkEntities = self->_linkEntities;
  if (linkEntities != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqual:](linkEntities, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->_linkEntities;
      self->_linkEntities = v7;

      v4 = v9;
      self->_flags.linkEntitiesNeedsUpdate = 1;
    }
  }

}

- (void)detachInteractions
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSArray *linkEntityInteractions;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_linkEntityInteractions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[UIView removeInteraction:](self->_view, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  linkEntityInteractions = self->_linkEntityInteractions;
  self->_linkEntityInteractions = 0;

}

- (void)updateInteractionsWithBuilder:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSArray *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  uint64_t v14;
  void *j;
  void *v16;
  NSArray *v17;
  NSArray *linkEntityInteractions;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  if (self->_flags.linkEntitiesNeedsUpdate)
  {
    self->_flags.linkEntitiesNeedsUpdate = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = self->_linkEntityInteractions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          -[UIView removeInteraction:](self->_view, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i));
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_linkEntities;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionForLinkEntity:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), (_QWORD)v19));
          if (v16)
          {
            if (!v13)
              v13 = objc_opt_new(NSMutableArray);
            -[NSMutableArray addObject:](v13, "addObject:", v16);
            -[UIView addInteraction:](self->_view, "addInteraction:", v16);
          }

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v17 = (NSArray *)-[NSMutableArray copy](v13, "copy");
    linkEntityInteractions = self->_linkEntityInteractions;
    self->_linkEntityInteractions = v17;

  }
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (NSArray)linkEntityInteractions
{
  return self->_linkEntityInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntityInteractions, 0);
  objc_storeStrong((id *)&self->_linkEntities, 0);
}

@end
