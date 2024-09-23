@implementation TUIFeedBehaviors

+ (TUIFeedBehaviors)feedBehaviorsWithDictionary:(id)a3
{
  id v3;
  TUIFeedBehaviors *v4;

  v3 = a3;
  v4 = -[TUIFeedBehaviors initWithDictionary:]([TUIFeedBehaviors alloc], "initWithDictionary:", v3);

  return v4;
}

- (TUIFeedBehaviors)initWithDictionary:(id)a3
{
  id v4;
  TUIFeedBehaviors *v5;
  NSDictionary *v6;
  NSDictionary *behaviors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIFeedBehaviors;
  v5 = -[TUIFeedBehaviors init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    behaviors = v5->_behaviors;
    v5->_behaviors = v6;

  }
  return v5;
}

- (id)behaviorWithName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_behaviors, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviors, 0);
}

@end
