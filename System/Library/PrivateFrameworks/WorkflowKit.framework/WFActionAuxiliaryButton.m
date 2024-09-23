@implementation WFActionAuxiliaryButton

- (WFActionAuxiliaryButton)initWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFActionAuxiliaryButton *v12;
  WFActionAuxiliaryButton *v13;
  void *v14;
  id handler;
  WFActionAuxiliaryButton *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFActionAuxiliaryButton;
  v12 = -[WFActionAuxiliaryButton init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_symbolName, a4);
    v14 = _Block_copy(v11);
    handler = v13->_handler;
    v13->_handler = v14;

    v16 = v13;
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (WFActionAuxiliaryButton)buttonWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:symbolName:handler:", v10, v9, v8);

  return (WFActionAuxiliaryButton *)v11;
}

@end
