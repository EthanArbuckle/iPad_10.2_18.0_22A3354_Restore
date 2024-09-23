@implementation _TUIElementSmartGridBuilder

- (Class)builderClassForDynamicInstantiation
{
  return (Class)objc_opt_class(_TUIElementSmartSectionBuilder, a2);
}

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v6;
  NSMutableDictionary *actionsMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  actionsMap = self->_actionsMap;
  if (!actionsMap)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_actionsMap;
    self->_actionsMap = v8;

    actionsMap = self->_actionsMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](actionsMap, "setObject:forKeyedSubscript:", v6, v10);

}

- (id)finalizeTriggers
{
  return -[TUIElementTriggerBehaviorMap initWithMap:]([TUIElementTriggerBehaviorMap alloc], "initWithMap:", self->_actionsMap);
}

- (void)addCellOrAdornment:(id)a3
{
  id v4;
  NSMutableArray *cellsAndAdornments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cellsAndAdornments = self->_cellsAndAdornments;
  v8 = v4;
  if (!cellsAndAdornments)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_cellsAndAdornments;
    self->_cellsAndAdornments = v6;

    v4 = v8;
    cellsAndAdornments = self->_cellsAndAdornments;
  }
  -[NSMutableArray addObject:](cellsAndAdornments, "addObject:", v4);

}

- (void)addSectionOrAdornment:(id)a3
{
  id v4;
  NSMutableArray *sectionsAndAdornments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionsAndAdornments = self->_sectionsAndAdornments;
  v8 = v4;
  if (!sectionsAndAdornments)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_sectionsAndAdornments;
    self->_sectionsAndAdornments = v6;

    v4 = v8;
    sectionsAndAdornments = self->_sectionsAndAdornments;
  }
  -[NSMutableArray addObject:](sectionsAndAdornments, "addObject:", v4);

}

- (void)addAdornment:(id)a3
{
  id v4;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "role") - 3 > (_BYTE *)&dword_0 + 1)
    -[_TUIElementSmartGridBuilder addSectionOrAdornment:](self, "addSectionOrAdornment:", v4);
  else
    -[_TUIElementSmartGridBuilder addCellOrAdornment:](self, "addCellOrAdornment:", v4);

}

- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4
{
  return a3 != 0;
}

- (id)finalizeContentsWithContext:(id)a3
{
  TUISectionModel *v4;
  NSMutableArray *cellsAndAdornments;
  NSMutableArray *sectionsAndAdornments;
  NSMutableArray *v7;
  NSMutableArray *v8;

  if (-[NSMutableArray count](self->_cellsAndAdornments, "count", a3))
  {
    v4 = objc_alloc_init(TUISectionModel);
    -[TUIModelContainer updateModelChildren:](v4, "updateModelChildren:", self->_cellsAndAdornments);
    cellsAndAdornments = self->_cellsAndAdornments;
    self->_cellsAndAdornments = 0;

    sectionsAndAdornments = self->_sectionsAndAdornments;
    if (!sectionsAndAdornments)
    {
      v7 = objc_opt_new(NSMutableArray);
      v8 = self->_sectionsAndAdornments;
      self->_sectionsAndAdornments = v7;

      sectionsAndAdornments = self->_sectionsAndAdornments;
    }
    -[NSMutableArray addObject:](sectionsAndAdornments, "addObject:", v4);

  }
  return self->_sectionsAndAdornments;
}

- (void)addConfiguration:(id)a3
{
  NSDictionary *v4;
  NSDictionary *configuration;

  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "data"));
  configuration = self->_configuration;
  self->_configuration = v4;

}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_TUIElementSmartGridBuilder finalizeContentsWithContext:](self, "finalizeContentsWithContext:", a4));
  objc_msgSend(v6, "updateModelChildren:", v7);

}

- (void)finalizeModelsWithParent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_TUIElementSmartGridBuilder finalizeContentsWithContext:](self, "finalizeContentsWithContext:", 0));
  objc_msgSend(v4, "updateModelChildren:", v5);

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionsAndAdornments, 0);
  objc_storeStrong((id *)&self->_cellsAndAdornments, 0);
  objc_storeStrong((id *)&self->_actionsMap, 0);
}

@end
