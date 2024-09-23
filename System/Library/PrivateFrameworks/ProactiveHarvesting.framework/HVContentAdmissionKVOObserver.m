@implementation HVContentAdmissionKVOObserver

- (HVContentAdmissionKVOObserver)initWithKey:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  HVContentAdmissionKVOObserver *v9;
  HVContentAdmissionKVOObserver *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HVContentAdmissionKVOObserver;
  v9 = -[HVContentAdmissionKVOObserver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v11 = MEMORY[0x22074FF64](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (**handler)(void);

  if (objc_msgSend(a3, "isEqualToString:", self->_key, a4, a5, a6))
  {
    handler = (void (**)(void))self->_handler;
    if (handler)
      handler[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)observeObject:(id)a3 key:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  HVContentAdmissionKVOObserver *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HVContentAdmissionKVOObserver initWithKey:handler:]([HVContentAdmissionKVOObserver alloc], "initWithKey:handler:", v8, v7);

  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v10, v8, 0, 0);
  return v10;
}

@end
