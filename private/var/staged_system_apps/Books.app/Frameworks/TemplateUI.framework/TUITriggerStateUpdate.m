@implementation TUITriggerStateUpdate

- (TUITriggerStateUpdate)initWithTriggerStateUpdate:(id)a3
{
  id v4;
  TUITriggerStateUpdate *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *triggerNameToTriggerMapping;
  void *v9;
  NSDictionary *v10;
  NSDictionary *triggerToStateMapping;
  void *v12;
  NSArray *v13;
  NSArray *orderedKeys;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUITriggerStateUpdate;
  v5 = -[TUITriggerStateUpdate init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "triggerNameToTriggerMapping"));
    v7 = (NSDictionary *)objc_msgSend(v6, "copy");
    triggerNameToTriggerMapping = v5->_triggerNameToTriggerMapping;
    v5->_triggerNameToTriggerMapping = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "triggerToStateMapping"));
    v10 = (NSDictionary *)objc_msgSend(v9, "copy");
    triggerToStateMapping = v5->_triggerToStateMapping;
    v5->_triggerToStateMapping = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedKeys"));
    v13 = (NSArray *)objc_msgSend(v12, "copy");
    orderedKeys = v5->_orderedKeys;
    v5->_orderedKeys = v13;

  }
  return v5;
}

- (unint64_t)stateForTriggerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_triggerToStateMapping, "valueForKey:", v4))) != 0)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (unint64_t)observationModeForTriggerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_triggerNameToTriggerMapping, "valueForKey:", v4))) != 0)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "observationMode");

  }
  else
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (id)namesForTriggersInUpdate
{
  return self->_orderedKeys;
}

- (BOOL)hasUpdates
{
  return -[NSArray count](self->_orderedKeys, "count") != 0;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TUITriggerStateUpdate: %p> : \n Updates: %@"), self, self->_triggerToStateMapping);
}

- (NSDictionary)triggerNameToTriggerMapping
{
  return self->_triggerNameToTriggerMapping;
}

- (void)setTriggerNameToTriggerMapping:(id)a3
{
  objc_storeStrong((id *)&self->_triggerNameToTriggerMapping, a3);
}

- (NSDictionary)triggerToStateMapping
{
  return self->_triggerToStateMapping;
}

- (void)setTriggerToStateMapping:(id)a3
{
  objc_storeStrong((id *)&self->_triggerToStateMapping, a3);
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_triggerToStateMapping, 0);
  objc_storeStrong((id *)&self->_triggerNameToTriggerMapping, 0);
}

@end
