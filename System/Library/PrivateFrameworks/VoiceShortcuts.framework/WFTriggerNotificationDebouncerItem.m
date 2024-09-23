@implementation WFTriggerNotificationDebouncerItem

- (WFTriggerNotificationDebouncerItem)initWithConfiguredTrigger:(id)a3 reference:(id)a4 triggerEventIDs:(id)a5 debouncer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFTriggerNotificationDebouncerItem *v15;
  WFTriggerNotificationDebouncerItem *v16;
  WFTriggerNotificationDebouncerItem *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFTriggerNotificationDebouncerItem;
  v15 = -[WFTriggerNotificationDebouncerItem init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuredTrigger, a3);
    objc_storeStrong((id *)&v16->_triggerEventIDs, a5);
    objc_storeStrong((id *)&v16->_reference, a4);
    objc_storeStrong((id *)&v16->_debouncer, a6);
    v17 = v16;
  }

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerNotificationDebouncerItem configuredTrigger](self, "configuredTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerNotificationDebouncerItem reference](self, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerNotificationDebouncerItem triggerEventIDs](self, "triggerEventIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerNotificationDebouncerItem debouncer](self, "debouncer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, configuredTrigger: %@, reference: %@, triggerEventIDs: %@, debouncer: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WFConfiguredTrigger)configuredTrigger
{
  return self->_configuredTrigger;
}

- (WFWorkflowReference)reference
{
  return self->_reference;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (NSSet)triggerEventIDs
{
  return self->_triggerEventIDs;
}

- (void)setTriggerEventIDs:(id)a3
{
  objc_storeStrong((id *)&self->_triggerEventIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEventIDs, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_configuredTrigger, 0);
}

@end
