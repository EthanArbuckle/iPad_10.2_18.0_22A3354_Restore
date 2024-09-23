@implementation SKStateTransitionEntry

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v13, "setState:", v12);

  objc_msgSend(v13, "setEvent:", v11);
  objc_msgSend(v13, "setAction:", v10);

  objc_msgSend(v13, "setNextState:", v9);
  objc_msgSend(v13, "setSelector:", 0);
  return v13;
}

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "entryWithState:event:action:nextState:", v9, v8, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v12, "setState:", v11);

  objc_msgSend(v12, "setEvent:", v10);
  objc_msgSend(v12, "setAction:", 0);
  objc_msgSend(v12, "setNextState:", v9);

  objc_msgSend(v12, "setSelector:", a5);
  return v12;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "entryWithState:event:selector:nextState:", v8, v7, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryWithState:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "entryWithState:event:action:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (NSString)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
  objc_storeStrong((id *)&self->_nextState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
