@implementation PPRecordLoadingDelegate

- (PPRecordLoadingDelegate)initWithName:(id)a3
{
  id v6;
  PPRecordLoadingDelegate *v7;
  PPRecordLoadingDelegate *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPRecordLoadingDelegate.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPRecordLoadingDelegate.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name.length > 0"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PPRecordLoadingDelegate;
  v7 = -[PPRecordLoadingDelegate init](&v12, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_name, a3);

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ '%@'>"), v5, self->_name);

  return v6;
}

- (unsigned)recordLoadingHandler:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
  return v3;
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
