@implementation _TUIElementFocusItemBuilder

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v6;
  NSMutableDictionary *actions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    actions = self->_actions;
    if (!actions)
    {
      v8 = objc_opt_new(NSMutableDictionary);
      v9 = self->_actions;
      self->_actions = v8;

      actions = self->_actions;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](actions, "setObject:forKeyedSubscript:", v6, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionsWithRefId, "setObject:forKeyedSubscript:", 0, v10);
  }

}

- (void)addTrigger:(id)a3 withRefId:(id)a4
{
  id v6;
  NSMutableDictionary *actionsWithRefId;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    actionsWithRefId = self->_actionsWithRefId;
    if (!actionsWithRefId)
    {
      v8 = objc_opt_new(NSMutableDictionary);
      v9 = self->_actionsWithRefId;
      self->_actionsWithRefId = v8;

      actionsWithRefId = self->_actionsWithRefId;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](actionsWithRefId, "setObject:forKeyedSubscript:", v6, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actions, "setObject:forKeyedSubscript:", 0, v10);
  }

}

- (id)finalizeTriggers
{
  return -[TUIElementTriggerBehaviorMap initWithMap:refIdMap:]([TUIElementTriggerBehaviorMap alloc], "initWithMap:refIdMap:", self->_actions, self->_actionsWithRefId);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_actionsWithRefId, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
