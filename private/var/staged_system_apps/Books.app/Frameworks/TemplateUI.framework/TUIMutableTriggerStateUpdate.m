@implementation TUIMutableTriggerStateUpdate

- (TUIMutableTriggerStateUpdate)init
{
  TUIMutableTriggerStateUpdate *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *triggerNameToTriggerMapping;
  NSMutableDictionary *v5;
  NSMutableDictionary *triggerToStateMapping;
  NSMutableArray *v7;
  NSMutableArray *orderedKeys;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIMutableTriggerStateUpdate;
  v2 = -[TUIMutableTriggerStateUpdate init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerNameToTriggerMapping = v2->_triggerNameToTriggerMapping;
    v2->_triggerNameToTriggerMapping = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerToStateMapping = v2->_triggerToStateMapping;
    v2->_triggerToStateMapping = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    orderedKeys = v2->_orderedKeys;
    v2->_orderedKeys = v7;

  }
  return v2;
}

- (void)addUpdateForTrigger:(id)a3 state:(unint64_t)a4
{
  NSMutableArray *orderedKeys;
  id v7;
  void *v8;
  NSMutableDictionary *triggerToStateMapping;
  void *v10;
  void *v11;
  NSMutableDictionary *triggerNameToTriggerMapping;
  id v13;

  orderedKeys = self->_orderedKeys;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[NSMutableArray addObject:](orderedKeys, "addObject:", v8);

  triggerToStateMapping = self->_triggerToStateMapping;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[NSMutableDictionary setValue:forKey:](triggerToStateMapping, "setValue:forKey:", v10, v11);

  triggerNameToTriggerMapping = self->_triggerNameToTriggerMapping;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[NSMutableDictionary setValue:forKey:](triggerNameToTriggerMapping, "setValue:forKey:", v7, v13);

}

- (id)orderedKeys
{
  return self->_orderedKeys;
}

- (id)triggerToStateMapping
{
  return self->_triggerToStateMapping;
}

- (id)triggerNameToTriggerMapping
{
  return self->_triggerNameToTriggerMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_triggerToStateMapping, 0);
  objc_storeStrong((id *)&self->_triggerNameToTriggerMapping, 0);
}

@end
