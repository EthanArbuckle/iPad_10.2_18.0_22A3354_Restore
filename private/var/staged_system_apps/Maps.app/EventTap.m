@implementation EventTap

+ (EventTap)eventTapWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithHandler:", v4);

  return (EventTap *)v5;
}

- (EventTap)initWithHandler:(id)a3
{
  id v4;
  EventTap *v5;
  id v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EventTap;
  v5 = -[EventTap init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    handler = v5->_handler;
    v5->_handler = v6;

  }
  return v5;
}

- (void)sendEvent:(id)a3
{
  (*((void (**)(void))self->_handler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
