@implementation UIRuntimeOutletCollectionConnection

- (UIRuntimeOutletCollectionConnection)initWithCoder:(id)a3
{
  id v4;
  UIRuntimeOutletCollectionConnection *v5;
  uint64_t v6;
  NSString *runtimeCollectionClassName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRuntimeOutletCollectionConnection;
  v5 = -[UIRuntimeConnection initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("runtimeCollectionClassName"));
    v6 = objc_claimAutoreleasedReturnValue();
    runtimeCollectionClassName = v5->runtimeCollectionClassName;
    v5->runtimeCollectionClassName = (NSString *)v6;

    v5->addsContentToExistingCollection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("addsContentToExistingCollection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *runtimeCollectionClassName;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIRuntimeOutletCollectionConnection;
  -[UIRuntimeConnection encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  runtimeCollectionClassName = self->runtimeCollectionClassName;
  if (runtimeCollectionClassName)
    objc_msgSend(v4, "encodeObject:forKey:", runtimeCollectionClassName, CFSTR("runtimeCollectionClassName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->addsContentToExistingCollection, CFSTR("addsContentToExistingCollection"));

}

- (void)performConnect
{
  NSString *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[UIRuntimeOutletCollectionConnection runtimeCollectionClassName](self, "runtimeCollectionClassName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRuntimeOutletCollectionConnection runtimeCollectionClassName](self, "runtimeCollectionClassName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRuntimeOutletCollectionConnection.m"), 37, CFSTR("No class named '%@'."), v17);

  }
  if (-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class()))
  {
    v6 = [v5 alloc];
    -[UIRuntimeConnection destination](self, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v6, "initWithArray:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRuntimeOutletCollectionConnection.m"), 41, CFSTR("'%@' is not a supported collection class. Expected subclass of NSArray."), v8);

    v18 = 0;
  }

  if (!self->addsContentToExistingCollection)
    goto LABEL_9;
  -[UIRuntimeConnection source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIRuntimeConnection source](self, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRuntimeConnection label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutableArrayValueForKeyPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObjectsFromArray:", v18);
  }
  else
  {
LABEL_9:
    -[UIRuntimeConnection source](self, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRuntimeConnection label](self, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKeyPath:", v18, v15);

  }
}

- (void)connectForSimulator
{
  -[UIRuntimeOutletCollectionConnection performConnect](self, "performConnect");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIRuntimeConnection source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeOutletCollectionConnection runtimeCollectionClassName](self, "runtimeCollectionClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Outlet collection connection with source %@, value %@, variable name %@, and runtime collection class name %@."), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)runtimeCollectionClassName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRuntimeCollectionClassName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)addsContentToExistingCollection
{
  return self->addsContentToExistingCollection;
}

- (void)setAddsContentToExistingCollection:(BOOL)a3
{
  self->addsContentToExistingCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->runtimeCollectionClassName, 0);
}

@end
