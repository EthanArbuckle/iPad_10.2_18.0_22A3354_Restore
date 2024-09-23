@implementation _REActionValue

- (_REActionValue)initWithAction:(id)a3
{
  id v5;
  _REActionValue *v6;
  _REActionValue *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *mutableUUIDs;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REActionValue;
  v6 = -[_REActionValue init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v8 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    mutableUUIDs = v7->_mutableUUIDs;
    v7->_mutableUUIDs = (NSMutableSet *)v10;

  }
  return v7;
}

- (NSSet)uuids
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableUUIDs, "copy");
}

- (void)addAction:(id)a3
{
  NSMutableSet *mutableUUIDs;
  void *v6;
  void *v7;
  REDonatedAction **p_action;
  REDonatedAction *action;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  mutableUUIDs = self->_mutableUUIDs;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](mutableUUIDs, "addObject:", v6);

  objc_msgSend(v12, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  p_action = &self->_action;
  -[REDonatedAction creationDate](action, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  if (v11 == 1)
    objc_storeStrong((id *)p_action, a3);

}

- (void)removeActionWithUUID:(id)a3
{
  -[NSMutableSet removeObject:](self->_mutableUUIDs, "removeObject:", a3);
}

- (REDonatedAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_mutableUUIDs, 0);
}

@end
