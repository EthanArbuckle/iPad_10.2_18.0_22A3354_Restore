@implementation SBHTestWidgetStackIconDescriptor

- (SBHTestWidgetStackIconDescriptor)initWithWidgetIconDescriptors:(id)a3
{
  id v4;
  SBHTestWidgetStackIconDescriptor *v5;
  uint64_t v6;
  NSArray *widgetIconDescriptors;
  void *v8;
  uint64_t v9;
  NSString *sizeClass;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHTestWidgetStackIconDescriptor;
  v5 = -[SBHTestWidgetStackIconDescriptor init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
    widgetIconDescriptors = v5->_widgetIconDescriptors;
    v5->_widgetIconDescriptors = (NSArray *)v6;

    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeClass");
    v9 = objc_claimAutoreleasedReturnValue();
    sizeClass = v5->_sizeClass;
    v5->_sizeClass = (NSString *)v9;

  }
  return v5;
}

- (SBHTestWidgetStackIconDescriptor)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithWidgetIconDescriptors:", self->_widgetIconDescriptors);
}

- (BOOL)isEqual:(id)a3
{
  SBHTestWidgetStackIconDescriptor *v4;
  SBHTestWidgetStackIconDescriptor *v5;
  SBHTestWidgetStackIconDescriptor *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (SBHTestWidgetStackIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[SBHTestWidgetStackIconDescriptor widgetIconDescriptors](v6, "widgetIconDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToArray:", self->_widgetIconDescriptors);

    if (v8)
    {
      -[SBHTestWidgetStackIconDescriptor sizeClass](v6, "sizeClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHTestWidgetStackIconDescriptor sizeClass](self, "sizeClass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 == v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 3;
}

- (NSArray)widgetIconDescriptors
{
  return self->_widgetIconDescriptors;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_widgetIconDescriptors, 0);
}

@end
