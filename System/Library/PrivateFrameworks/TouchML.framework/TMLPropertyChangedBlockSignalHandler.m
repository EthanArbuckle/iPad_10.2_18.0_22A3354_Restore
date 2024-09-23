@implementation TMLPropertyChangedBlockSignalHandler

- (TMLPropertyChangedBlockSignalHandler)initWithBlock:(id)a3 binding:(id)a4
{
  id v7;
  TMLPropertyChangedBlockSignalHandler *v8;
  TMLPropertyChangedBlockSignalHandler *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  v8 = -[TMLBlockSignalHandler initWithBlock:](&v11, sel_initWithBlock_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_binding, a4);

  return v9;
}

- (int64_t)bindingOrder
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)attach
{
  const char *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  -[TMLBlockSignalHandler attach](&v5, sel_attach);
  objc_msgSend_bind_(self->_binding, v3, v4, self);
}

- (void)detach
{
  double v2;
  objc_super v4;

  objc_msgSend_unbind_(self->_binding, a2, v2, self);
  v4.receiver = self;
  v4.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  -[TMLBlockSignalHandler detach](&v4, sel_detach);
}

- (void)bindingValueChanged:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_target(a3, a2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v7, v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_callWithArguments_(self, v9, v10, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binding, 0);
}

@end
