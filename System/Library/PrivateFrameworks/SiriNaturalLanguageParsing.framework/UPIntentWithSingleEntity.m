@implementation UPIntentWithSingleEntity

- (UPIntentWithSingleEntity)initWithIntent:(id)a3 singleEntity:(id)a4
{
  id v7;
  id v8;
  UPIntentWithSingleEntity *v9;
  UPIntentWithSingleEntity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPIntentWithSingleEntity;
  v9 = -[UPIntentWithSingleEntity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

- (BOOL)isEqualToIntentWithSingleEntity:(id)a3
{
  id v4;
  NSString *intent;
  void *v6;
  UPEntityWithValue *entity;
  void *v8;
  BOOL v9;

  v4 = a3;
  intent = self->_intent;
  objc_msgSend(v4, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](intent, "isEqualToString:", v6))
  {
    entity = self->_entity;
    objc_msgSend(v4, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UPEntityWithValue isEqualToEntityWithValue:](entity, "isEqualToEntityWithValue:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (UPEntityWithValue)entity
{
  return (UPEntityWithValue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
