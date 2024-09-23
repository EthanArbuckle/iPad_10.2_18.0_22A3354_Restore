@implementation TUIWidgetBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  NSString *v5;
  NSString *key;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "stringForAttribute:node:", 137, a3.var0));
  key = self->_key;
  self->_key = v5;

}

- (void)addWidgetData:(id)a3 withKey:(id)a4
{
  id v6;
  NSMutableDictionary *data;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  data = self->_data;
  if (!data)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_data;
    self->_data = v8;

    data = self->_data;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v10, v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_models, "setObject:forKeyedSubscript:", 0, v6);

}

- (id)finalizeWidgetWithParent:(id)a3
{
  id v4;
  NSMutableDictionary *models;
  id v6;
  NSMutableDictionary *data;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  models = self->_models;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_11AAEC;
  v10[3] = &unk_241C20;
  v6 = v4;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](models, "enumerateKeysAndObjectsUsingBlock:", v10);
  data = self->_data;
  if (data)
    v8 = -[NSMutableDictionary copy](data, "copy");
  else
    v8 = &__NSDictionary0__struct;

  return v8;
}

- (void)addModel:(id)a3
{
  id v4;
  NSMutableDictionary *models;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v4 = a3;
  if (self->_key)
  {
    v8 = v4;
    -[TUIWidgetBuilder addWidgetData:withKey:](self, "addWidgetData:withKey:", v4);
    models = self->_models;
    if (!models)
    {
      v6 = objc_opt_new(NSMutableDictionary);
      v7 = self->_models;
      self->_models = v6;

      models = self->_models;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](models, "setObject:forKeyedSubscript:", v8, self->_key);
    v4 = v8;
  }

}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  return 0;
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

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_axActions, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
