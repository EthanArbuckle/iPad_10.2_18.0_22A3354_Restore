@implementation SBHTestWidgetIconDescriptor

+ (id)widgetIconDescriptorFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHTestWidgetIconDescriptor *v8;
  void *v9;
  SBHTestWidgetIconDescriptor *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("containerBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("widgetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gridSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [SBHTestWidgetIconDescriptor alloc];
  SBHIconGridSizeClassForString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBHTestWidgetIconDescriptor initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:](v8, "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", v5, v4, v6, v9);

  return v10;
}

- (SBHTestWidgetIconDescriptor)initWithBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 widgetIdentifier:(id)a5 sizeClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBHTestWidgetIconDescriptor *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  NSString *containerBundleIdentifier;
  uint64_t v19;
  NSString *widgetIdentifier;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBHTestWidgetIconDescriptor;
  v14 = -[SBHTestWidgetIconDescriptor init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    widgetIdentifier = v14->_widgetIdentifier;
    v14->_widgetIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_sizeClass, a6);
  }

  return v14;
}

- (SBHTestWidgetIconDescriptor)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", self->_bundleIdentifier, self->_containerBundleIdentifier, self->_widgetIdentifier, self->_sizeClass);
}

- (BOOL)isEqual:(id)a3
{
  SBHTestWidgetIconDescriptor *v4;
  SBHTestWidgetIconDescriptor *v5;
  SBHTestWidgetIconDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  char v12;

  v4 = (SBHTestWidgetIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[SBHTestWidgetIconDescriptor bundleIdentifier](v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", self->_bundleIdentifier))
    {
      -[SBHTestWidgetIconDescriptor containerBundleIdentifier](v6, "containerBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", self->_containerBundleIdentifier))
      {
        -[SBHTestWidgetIconDescriptor widgetIdentifier](v6, "widgetIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", self->_widgetIdentifier))
        {
          -[SBHTestWidgetIconDescriptor sizeClass](v6, "sizeClass");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (v10 == self->_sizeClass)
          {
            v12 = 1;
          }
          else
          {
            -[SBHTestWidgetIconDescriptor sizeClass](v6, "sizeClass");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", self->_sizeClass);

          }
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
