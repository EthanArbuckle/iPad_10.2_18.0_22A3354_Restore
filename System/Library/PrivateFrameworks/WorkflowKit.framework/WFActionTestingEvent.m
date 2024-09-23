@implementation WFActionTestingEvent

- (WFActionTestingEvent)initWithAction:(id)a3
{
  id v5;
  WFActionTestingEvent *v6;
  WFActionTestingEvent *v7;
  WFActionTestingEvent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFActionTestingEvent;
  v6 = -[WFActionTestingEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v8 = v7;
  }

  return v7;
}

- (WFAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
