@implementation _UIRIPReceiver

- (_UIRIPReceiver)initWithResponder:(id)a3 class:(Class)a4 press:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  id v13;
  id v14;
  id v15;
  _UIRIPReceiver *v16;
  _UIRIPReceiver *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_UIRIPReceiver;
  v16 = -[_UIRIPReceiver init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_responder, a3);
    objc_storeStrong((id *)&v17->_clazz, a4);
    objc_storeStrong((id *)&v17->_press, a5);
    v17->_phase = a6;
    objc_storeStrong((id *)&v17->_event, a7);
  }

  return v17;
}

- (unint64_t)hash
{
  return -[UIResponder hash](self->_responder, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self->_responder == (UIResponder *)v5[2] && self->_clazz == (Class)v5[3] && self->_press == (UIPress *)v5[5];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UIResponder *responder;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  responder = self->_responder;
  NSStringFromClass(self->_clazz);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%p:%@]"), v5, responder, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIResponder)responder
{
  return self->_responder;
}

- (Class)clazz
{
  return self->_clazz;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIPress)press
{
  return self->_press;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_press, 0);
  objc_storeStrong((id *)&self->_clazz, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
