@implementation WFShowActionInterfaceDialogRequest

- (WFShowActionInterfaceDialogRequest)initWithActionClassName:(id)a3 classNamesByType:(id)a4 attribution:(id)a5
{
  id v8;
  id v9;
  WFShowActionInterfaceDialogRequest *v10;
  uint64_t v11;
  NSString *actionClassName;
  uint64_t v13;
  NSDictionary *classNamesByType;
  WFShowActionInterfaceDialogRequest *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFShowActionInterfaceDialogRequest;
  v10 = -[WFDialogRequest initWithAttribution:prompt:](&v17, sel_initWithAttribution_prompt_, a5, 0);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    actionClassName = v10->_actionClassName;
    v10->_actionClassName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    classNamesByType = v10->_classNamesByType;
    v10->_classNamesByType = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

- (WFShowActionInterfaceDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFShowActionInterfaceDialogRequest *v5;
  uint64_t v6;
  NSString *actionClassName;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *classNamesByType;
  WFShowActionInterfaceDialogRequest *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFShowActionInterfaceDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionClassName"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionClassName = v5->_actionClassName;
    v5->_actionClassName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("classNamesByType"));
    v11 = objc_claimAutoreleasedReturnValue();
    classNamesByType = v5->_classNamesByType;
    v5->_classNamesByType = (NSDictionary *)v11;

    v13 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowActionInterfaceDialogRequest actionClassName](self, "actionClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowActionInterfaceDialogRequest classNamesByType](self, "classNamesByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, actionClassName: %@, classNamesByType: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFShowActionInterfaceDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFShowActionInterfaceDialogRequest actionClassName](self, "actionClassName", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionClassName"));

  -[WFShowActionInterfaceDialogRequest classNamesByType](self, "classNamesByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("classNamesByType"));

}

- (BOOL)isCatalystInterfaceRequest
{
  return 0;
}

- (NSString)catalystInterfaceClassName
{
  void *v3;

  if (-[WFShowActionInterfaceDialogRequest isCatalystInterfaceRequest](self, "isCatalystInterfaceRequest"))
  {
    -[NSDictionary objectForKey:](self->_classNamesByType, "objectForKey:", *MEMORY[0x1E0D14330]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)actionClassName
{
  return self->_actionClassName;
}

- (NSDictionary)classNamesByType
{
  return self->_classNamesByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNamesByType, 0);
  objc_storeStrong((id *)&self->_actionClassName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
