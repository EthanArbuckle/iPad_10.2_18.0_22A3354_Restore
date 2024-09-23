@implementation _UICommandIdentifier

+ (id)identifierWithAction:(SEL)a3 propertyList:(id)a4
{
  id v5;
  _UICommandIdentifier *v6;

  v5 = a4;
  v6 = -[_UICommandIdentifier initWithAction:propertyList:]([_UICommandIdentifier alloc], "initWithAction:propertyList:", a3, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandIdentifier)initWithAction:(SEL)a3 propertyList:(id)a4
{
  id v7;
  _UICommandIdentifier *v8;
  _UICommandIdentifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICommandIdentifier;
  v8 = -[_UICommandIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong(&v8->_propertyList, a4);
  }

  return v9;
}

- (_UICommandIdentifier)initWithCoder:(id)a3
{
  id v4;
  _UICommandIdentifier *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id propertyList;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICommandIdentifier;
  v5 = -[_UICommandIdentifier init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("action"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_action = NSSelectorFromString(v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("propertyList"));
    v14 = objc_claimAutoreleasedReturnValue();
    propertyList = v5->_propertyList;
    v5->_propertyList = (id)v14;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICommandIdentifier;
  -[_UICommandIdentifier description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  NSStringFromSelector(self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" -> Action: %@"), v5);

  objc_msgSend(v4, "appendFormat:", CFSTR("  PropertyList: %@"), self->_propertyList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *action;
  void *v5;
  id v6;

  action = self->_action;
  v6 = a3;
  NSStringFromSelector(action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("action"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_propertyList, CFSTR("propertyList"));
}

- (unint64_t)hash
{
  const char *Name;

  Name = sel_getName(self->_action);
  return objc_msgSend(self->_propertyList, "hash") ^ (unint64_t)Name;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  unint64_t propertyList;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_action == (SEL)v4[1])
  {
    propertyList = (unint64_t)self->_propertyList;
    if (propertyList | v4[2])
      v5 = objc_msgSend((id)propertyList, "isEqual:");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SEL)action
{
  return self->_action;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyList, 0);
}

@end
