@implementation TUIStateAndActionBuilder

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

- (void)addModel:(id)a3 forState:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *states;
  TUIStateModel *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (!self->_states)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    states = self->_states;
    self->_states = v8;

  }
  v10 = objc_alloc_init(TUIStateModel);
  -[TUIStateModel setState:](v10, "setState:", v7);
  v12 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  -[TUISingleModelContainer updateModelChildren:](v10, "updateModelChildren:", v11);

  -[NSMutableDictionary setObject:forKey:](self->_states, "setObject:forKey:", v10, v7);
}

- (id)finalizeStateMapWithContext:(id)a3
{
  return self->_states;
}

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v6;
  NSMutableDictionary *animations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](animations, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)finalizeAnimationGroups
{
  TUIAnimationGroupCollection *v3;

  if (-[NSMutableDictionary count](self->_animations, "count"))
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    -[TUIAnimationGroupCollection setGroups:](v3, "setGroups:", self->_animations);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_actionsMap, 0);
}

@end
