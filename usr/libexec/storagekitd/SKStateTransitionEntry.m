@implementation SKStateTransitionEntry

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v14, "setState:", v13);

  objc_msgSend(v14, "setEvent:", v12);
  objc_msgSend(v14, "setAction:", v11);

  objc_msgSend(v14, "setNextState:", v10);
  objc_msgSend(v14, "setSelector:", 0);
  return v14;
}

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend((id)objc_opt_class(a1), "entryWithState:event:action:nextState:", v10, v9, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v13, "setState:", v12);

  objc_msgSend(v13, "setEvent:", v11);
  objc_msgSend(v13, "setAction:", 0);
  objc_msgSend(v13, "setNextState:", v10);

  objc_msgSend(v13, "setSelector:", a5);
  return v13;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(a1), "entryWithState:event:selector:nextState:", v9, v8, a5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (id)entryWithState:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(a1), "entryWithState:event:action:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
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
