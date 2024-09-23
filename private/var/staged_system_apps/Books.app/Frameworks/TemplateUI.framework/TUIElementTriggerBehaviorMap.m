@implementation TUIElementTriggerBehaviorMap

- (NSArray)allTriggers
{
  return -[NSDictionary allKeys](self->_triggerBehaviorMap, "allKeys");
}

- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3
{
  return -[TUIElementTriggerBehaviorMap initWithMap:refIdMap:](self, "initWithMap:refIdMap:", a3, 0);
}

- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3 refIdMap:(id)a4
{
  id v7;
  id v8;
  TUIElementTriggerBehaviorMap *v9;
  TUIElementTriggerBehaviorMap *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIElementTriggerBehaviorMap;
  v9 = -[TUIElementTriggerBehaviorMap init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_triggerBehaviorMap, a3);
    objc_storeStrong((id *)&v10->_triggerRefIdMap, a4);
  }

  return v10;
}

- (id)behaviorDataForTrigger:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_triggerBehaviorMap, "objectForKeyedSubscript:", a3);
}

- (id)refIdForTrigger:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_triggerRefIdMap, "objectForKeyedSubscript:", a3);
}

- (BOOL)isEqual:(id)a3
{
  TUIElementTriggerBehaviorMap *v4;
  uint64_t v5;
  TUIElementTriggerBehaviorMap *v6;
  TUIElementTriggerBehaviorMap *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = (TUIElementTriggerBehaviorMap *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if (v5 == objc_opt_class(v4))
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap triggerBehaviorMap](self, "triggerBehaviorMap"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap triggerBehaviorMap](v7, "triggerBehaviorMap"));

      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap triggerBehaviorMap](self, "triggerBehaviorMap"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap triggerBehaviorMap](v7, "triggerBehaviorMap"));
        v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSDictionary)triggerBehaviorMap
{
  return self->_triggerBehaviorMap;
}

- (void)setTriggerBehaviorMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)triggerRefIdMap
{
  return self->_triggerRefIdMap;
}

- (void)setTriggerRefIdMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerRefIdMap, 0);
  objc_storeStrong((id *)&self->_triggerBehaviorMap, 0);
}

@end
