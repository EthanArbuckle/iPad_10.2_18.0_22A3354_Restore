@implementation TMLBlockReactiveValue

- (TMLBlockReactiveValue)initWithBlock:(id)a3 bindings:(id)a4 valueType:(unint64_t)a5
{
  id v8;
  TMLBlockReactiveValue *v9;
  uint64_t v10;
  id block;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TMLBlockReactiveValue;
  v9 = -[TMLReactiveValue initWithBindings:valueType:](&v13, sel_initWithBindings_valueType_, a4, a5);
  if (v9)
  {
    v10 = MEMORY[0x22E2E7E44](v8);
    block = v9->_block;
    v9->_block = (id)v10;

  }
  return v9;
}

- (id)value
{
  double v2;
  void (**block)(_QWORD, _QWORD);
  void *v4;

  block = (void (**)(_QWORD, _QWORD))self->_block;
  if (block)
  {
    objc_msgSend_bindings(self, a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))block)[2](block, v4);
    block = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  }
  return block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
