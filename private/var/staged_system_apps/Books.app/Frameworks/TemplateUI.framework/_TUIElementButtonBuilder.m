@implementation _TUIElementButtonBuilder

- (id)finalizeStateMapWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  void *v30;
  _BYTE v31[128];

  v29.receiver = self;
  v29.super_class = (Class)_TUIElementButtonBuilder;
  v3 = a3;
  v4 = -[TUIStateAndActionBuilder finalizeStateMapWithContext:](&v29, "finalizeStateMapWithContext:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(TUIButtonStateModel, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "submodel"));
        v16 = TUIDynamicCast(v13, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "modelForButtonType:context:", -[_TUIElementButtonBuilder buttonType](self, "buttonType"), v3));
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "submodel"));

          if (v20 != v18)
          {
            v30 = v18;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
            objc_msgSend(v19, "updateModelChildren:", v21);

          }
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, v12, v23);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v9);
  }

  return v23;
}

- (void)addMenuContainer:(id)a3
{
  objc_storeStrong((id *)&self->_menuContainer, a3);
}

- (void)addLinkEntity:(id)a3
{
  id v4;
  NSMutableArray *linkEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  linkEntities = self->_linkEntities;
  v8 = v4;
  if (!linkEntities)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_linkEntities;
    self->_linkEntities = v6;

    v4 = v8;
    linkEntities = self->_linkEntities;
  }
  -[NSMutableArray addObject:](linkEntities, "addObject:", v4);

}

- (id)finalizeLinkEntities
{
  return -[NSMutableArray copy](self->_linkEntities, "copy");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (NSMutableArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
  objc_storeStrong((id *)&self->_linkEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
