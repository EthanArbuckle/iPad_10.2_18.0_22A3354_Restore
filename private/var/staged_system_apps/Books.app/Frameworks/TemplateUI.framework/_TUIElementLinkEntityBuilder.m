@implementation _TUIElementLinkEntityBuilder

- (void)addLinkEntityAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *actions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    actions = self->_actions;
    if (!actions)
    {
      v8 = objc_opt_new(NSMutableDictionary);
      v9 = self->_actions;
      self->_actions = v8;

      actions = self->_actions;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](actions, "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (id)finalizeLinkEntityWithContext:(id)a3
{
  id v4;
  void *v5;
  TUILinkEntityModel *v6;

  v4 = a3;
  v5 = v4;
  if (self->_type && self->_identifier && self->_title)
  {
    v6 = -[TUILinkEntityModel initWithType:identifier:title:actionsMap:]([TUILinkEntityModel alloc], "initWithType:identifier:title:actionsMap:", self->_type, self->_identifier, self->_title, self->_actions);
  }
  else
  {
    objc_msgSend(v4, "reportError:", 1016);
    v6 = 0;
  }

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
