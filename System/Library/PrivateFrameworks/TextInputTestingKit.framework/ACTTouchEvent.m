@implementation ACTTouchEvent

- (ACTTouchEvent)initWithTouchEvent:(id)a3
{
  id v5;
  ACTTouchEvent *v6;
  ACTTouchEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACTTouchEvent;
  v6 = -[ACTTouchEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_touchEvent, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTTouchEvent touchEvent](self, "touchEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: touchEvent=%@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ACTTouchEvent touchEvent](self, "touchEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "_performTouchEvent:typingLog:", v7, v6);

}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchEvent, 0);
}

@end
