@implementation WFContentItemAction

- (WFContentItemAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  WFContentItemAction *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("WFContentItemClass"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = (WFContentItemAction *)NSClassFromString(v11);

  if (v12)
  {
    if (-[WFContentItemAction isSubclassOfClass:](v12, "isSubclassOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)WFContentItemAction;
      self = -[WFAction initWithIdentifier:definition:serializedParameters:](&v14, sel_initWithIdentifier_definition_serializedParameters_, v8, v9, v10);
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (WFContentProperty)defaultProperty
{
  WFContentProperty *defaultProperty;
  objc_class *v4;
  void *v5;
  void *v6;
  WFContentProperty *v7;
  WFContentProperty *v8;

  defaultProperty = self->_defaultProperty;
  if (!defaultProperty)
  {
    v4 = -[WFAction contentItemClass](self, "contentItemClass");
    -[WFAction definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFContentItemDefaultProperty"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class propertyForName:](v4, "propertyForName:", v6);
    v7 = (WFContentProperty *)objc_claimAutoreleasedReturnValue();
    v8 = self->_defaultProperty;
    self->_defaultProperty = v7;

    defaultProperty = self->_defaultProperty;
  }
  return defaultProperty;
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
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[WFAction contentItemClass](self, "contentItemClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, contentItemClass: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)inputContentClasses
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)WFContentItemAction;
  -[WFAction inputContentClasses](&v8, sel_inputContentClasses);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFContentItemAction;
    -[WFAction inputContentClasses](&v7, sel_inputContentClasses);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = -[WFAction contentItemClass](self, "contentItemClass");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)inputsMultipleItems
{
  return 1;
}

- (BOOL)outputsMultipleItems
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProperty, 0);
}

@end
