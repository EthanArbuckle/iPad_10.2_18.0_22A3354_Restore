@implementation WFAnyPropertyListObject

- (WFAnyPropertyListObject)initWithPropertyListObject:(id)a3
{
  id v5;
  WFAnyPropertyListObject *v6;
  uint64_t v7;
  WFPropertyListObject *propertyListObject;
  WFAnyPropertyListObject *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPropertyListObject.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyListObject"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnyPropertyListObject;
  v6 = -[WFAnyPropertyListObject init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copyWithZone:", 0);
    propertyListObject = v6->_propertyListObject;
    v6->_propertyListObject = (WFPropertyListObject *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFAnyPropertyListObject)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WFAnyPropertyListObject *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("propertyListObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self = -[WFAnyPropertyListObject initWithPropertyListObject:](self, "initWithPropertyListObject:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAnyPropertyListObject propertyListObject](self, "propertyListObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyListObject"));

}

- (WFPropertyListObject)propertyListObject
{
  return self->_propertyListObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyListObject, 0);
}

+ (id)objectWithPropertyListObject:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPropertyListObject:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
