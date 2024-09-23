@implementation _TUIElementAXActionsObjectBuilder

- (void)addAXAction:(id)a3
{
  id v4;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actions = self->_actions;
  v8 = v4;
  if (!actions)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_actions;
    self->_actions = v6;

    v4 = v8;
    actions = self->_actions;
  }
  -[NSMutableArray addObject:](actions, "addObject:", v4);

}

- (id)finalizeAXActions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
