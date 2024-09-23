@implementation TUIActionBuilder

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsMap, 0);
}

@end
