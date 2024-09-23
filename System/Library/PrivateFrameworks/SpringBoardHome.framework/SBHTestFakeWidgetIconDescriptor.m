@implementation SBHTestFakeWidgetIconDescriptor

- (SBHTestFakeWidgetIconDescriptor)initWithElement:(id)a3 sizeClass:(id)a4
{
  id v7;
  id v8;
  SBHTestFakeWidgetIconDescriptor *v9;
  SBHTestFakeWidgetIconDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHTestFakeWidgetIconDescriptor;
  v9 = -[SBHTestFakeWidgetIconDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeStrong((id *)&v10->_sizeClass, a4);
  }

  return v10;
}

- (SBHTestFakeWidgetIconDescriptor)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithElement:sizeClass:", self->_element, self->_sizeClass);
}

- (BOOL)isEqual:(id)a3
{
  SBHTestFakeWidgetIconDescriptor *v4;
  SBHTestFakeWidgetIconDescriptor *v5;
  SBHTestFakeWidgetIconDescriptor *v6;
  void *v7;
  NSString *v8;
  void *v9;
  char v10;

  v4 = (SBHTestFakeWidgetIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[SBHTestFakeWidgetIconDescriptor element](v6, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", self->_element))
    {
      -[SBHTestFakeWidgetIconDescriptor sizeClass](v6, "sizeClass");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v8 == self->_sizeClass)
      {
        v10 = 1;
      }
      else
      {
        -[SBHTestFakeWidgetIconDescriptor sizeClass](v6, "sizeClass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", self->_sizeClass);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return self->_element != 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 2;
}

- (SBHCustomIconElement)element
{
  return self->_element;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
