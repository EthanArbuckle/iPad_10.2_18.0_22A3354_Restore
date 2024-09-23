@implementation VUIMediaEntityPropertyDescriptor

- (NSSet)sourcePropertyNames
{
  NSSet *sourcePropertyNames;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  sourcePropertyNames = self->_sourcePropertyNames;
  if (!sourcePropertyNames)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[VUIMediaEntityPropertyDescriptor name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObjects:", v5, 0);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sourcePropertyNames;
    self->_sourcePropertyNames = v6;

    sourcePropertyNames = self->_sourcePropertyNames;
  }
  return sourcePropertyNames;
}

- (BOOL)retrievesSourcePropertiesAtFetch
{
  return self->_retrievesSourcePropertiesAtFetch;
}

- (void)setPropertyType:(unint64_t)a3
{
  self->_propertyType = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VUIMediaEntityPropertyDescriptor)init
{
  VUIMediaEntityPropertyDescriptor *v2;
  VUIMediaEntityPropertyDescriptor *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMediaEntityPropertyDescriptor;
  v2 = -[VUIMediaEntityPropertyDescriptor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1E9FF3598;

    v3->_propertyType = 4;
    v3->_allowsDefaultValue = 0;
  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setSourcePropertyNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)sourceSupportsFiltering
{
  return self->_sourceSupportsFiltering;
}

- (id)sourceFilterValueBlock
{
  return self->_sourceFilterValueBlock;
}

- (id)sourceFilterBlock
{
  return self->_sourceFilterBlock;
}

- (NSString)sortAsName
{
  return self->_sortAsName;
}

- (void)setSourceSupportsFiltering:(BOOL)a3
{
  id sourceFilterValueBlock;
  id sourceFilterBlock;

  self->_sourceSupportsFiltering = a3;
  if (!a3)
  {
    sourceFilterValueBlock = self->_sourceFilterValueBlock;
    self->_sourceFilterValueBlock = 0;

    sourceFilterBlock = self->_sourceFilterBlock;
    self->_sourceFilterBlock = 0;

  }
}

- (void)setSourceFilterValueBlock:(id)a3
{
  void *v4;
  id sourceFilterValueBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  sourceFilterValueBlock = self->_sourceFilterValueBlock;
  self->_sourceFilterValueBlock = v4;

  -[VUIMediaEntityPropertyDescriptor _updateSourceSupportsFiltering](self, "_updateSourceSupportsFiltering");
}

- (void)setSourceFilterBlock:(id)a3
{
  void *v4;
  id sourceFilterBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  sourceFilterBlock = self->_sourceFilterBlock;
  self->_sourceFilterBlock = v4;

  -[VUIMediaEntityPropertyDescriptor _updateSourceSupportsFiltering](self, "_updateSourceSupportsFiltering");
}

- (void)setSortAsName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRetrievesSourcePropertiesAtFetch:(BOOL)a3
{
  self->_retrievesSourcePropertiesAtFetch = a3;
}

- (void)setPropertyValueClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAllowsDefaultValue:(BOOL)a3
{
  self->_allowsDefaultValue = a3;
}

- (unint64_t)propertyType
{
  return self->_propertyType;
}

- (void)_updateSourceSupportsFiltering
{
  void *v3;
  void *v4;

  if (!-[VUIMediaEntityPropertyDescriptor sourceSupportsFiltering](self, "sourceSupportsFiltering"))
  {
    -[VUIMediaEntityPropertyDescriptor sourceFilterValueBlock](self, "sourceFilterValueBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      -[VUIMediaEntityPropertyDescriptor sourceFilterBlock](self, "sourceFilterBlock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        return;
    }
    -[VUIMediaEntityPropertyDescriptor setSourceSupportsFiltering:](self, "setSourceSupportsFiltering:", 1);
  }
}

- (NSString)propertyValueClassName
{
  NSString *propertyValueClassName;
  NSString *v4;
  NSString *v5;

  propertyValueClassName = self->_propertyValueClassName;
  if (!propertyValueClassName)
  {
    objc_msgSend((id)objc_opt_class(), "_classNameFromPropertyType:", -[VUIMediaEntityPropertyDescriptor propertyType](self, "propertyType"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_propertyValueClassName;
    self->_propertyValueClassName = v4;

    propertyValueClassName = self->_propertyValueClassName;
  }
  return propertyValueClassName;
}

- (id)defaultValue
{
  NSString *defaultValue;
  __CFString *v4;
  void *v5;
  id v7;
  id v8;

  if (!self->_defaultValue && -[VUIMediaEntityPropertyDescriptor allowsDefaultValue](self, "allowsDefaultValue"))
  {
    switch(-[VUIMediaEntityPropertyDescriptor propertyType](self, "propertyType"))
    {
      case 0uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E0C9AAA0];
        goto LABEL_10;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        defaultValue = (NSString *)self->_defaultValue;
        self->_defaultValue = v5;
        goto LABEL_11;
      case 3uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)&unk_1EA0B9D48;
        goto LABEL_10;
      case 4uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = &stru_1E9FF3598;
        goto LABEL_10;
      case 6uLL:
        -[VUIMediaEntityPropertyDescriptor propertyValueClassName](self, "propertyValueClassName");
        defaultValue = (NSString *)objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc_init(NSClassFromString(defaultValue));
        v8 = self->_defaultValue;
        self->_defaultValue = v7;

        goto LABEL_11;
      case 7uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E0C9AA60];
        goto LABEL_10;
      case 8uLL:
        defaultValue = (NSString *)self->_defaultValue;
        v4 = (__CFString *)MEMORY[0x1E0C9AA70];
LABEL_10:
        self->_defaultValue = v4;
LABEL_11:

        break;
      default:
        return self->_defaultValue;
    }
  }
  return self->_defaultValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityPropertyDescriptor *v4;
  uint64_t v5;
  NSString *name;
  uint64_t v7;
  NSString *sortAsName;
  uint64_t v9;
  NSString *propertyValueClassName;
  uint64_t v11;
  NSSet *sourcePropertyNames;
  uint64_t v13;
  id sourceFilterValueBlock;
  uint64_t v15;
  id sourceFilterBlock;

  v4 = objc_alloc_init(VUIMediaEntityPropertyDescriptor);
  v5 = -[NSString copy](self->_name, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v5;

  v7 = -[NSString copy](self->_sortAsName, "copy");
  sortAsName = v4->_sortAsName;
  v4->_sortAsName = (NSString *)v7;

  v4->_propertyType = self->_propertyType;
  v9 = -[NSString copy](self->_propertyValueClassName, "copy");
  propertyValueClassName = v4->_propertyValueClassName;
  v4->_propertyValueClassName = (NSString *)v9;

  v4->_allowsDefaultValue = self->_allowsDefaultValue;
  objc_storeStrong(&v4->_defaultValue, self->_defaultValue);
  v11 = -[NSSet copy](self->_sourcePropertyNames, "copy");
  sourcePropertyNames = v4->_sourcePropertyNames;
  v4->_sourcePropertyNames = (NSSet *)v11;

  v4->_retrievesSourcePropertiesAtFetch = self->_retrievesSourcePropertiesAtFetch;
  v4->_sourceSupportsFiltering = self->_sourceSupportsFiltering;
  v13 = objc_msgSend(self->_sourceFilterValueBlock, "copy");
  sourceFilterValueBlock = v4->_sourceFilterValueBlock;
  v4->_sourceFilterValueBlock = (id)v13;

  v15 = objc_msgSend(self->_sourceFilterBlock, "copy");
  sourceFilterBlock = v4->_sourceFilterBlock;
  v4->_sourceFilterBlock = (id)v15;

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v42;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42.receiver = self;
  v42.super_class = (Class)VUIMediaEntityPropertyDescriptor;
  -[VUIMediaEntityPropertyDescriptor description](&v42, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("name"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor sortAsName](self, "sortAsName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sortAsName"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaEntityPropertyDescriptor propertyType](self, "propertyType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("propertyType"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor propertyValueClassName](self, "propertyValueClassName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("propertyValueClassName"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor allowsDefaultValue](self, "allowsDefaultValue");
  VUIBoolLogString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("allowsDefaultValue"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor defaultValue](self, "defaultValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("defaultValue"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor sourcePropertyNames](self, "sourcePropertyNames");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sourcePropertyNames"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor retrievesSourcePropertiesAtFetch](self, "retrievesSourcePropertiesAtFetch");
  VUIBoolLogString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("retrievesSourcePropertiesAtFetch"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor sourceSupportsFiltering](self, "sourceSupportsFiltering");
  VUIBoolLogString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sourceSupportsFiltering"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor sourceFilterValueBlock](self, "sourceFilterValueBlock");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sourceFilterValueBlock"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityPropertyDescriptor sourceFilterBlock](self, "sourceFilterBlock");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sourceFilterBlock"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("<%@>"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)_classNameFromPropertyType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
      v5 = (objc_class *)objc_opt_class();
      break;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Property value class names cannot be derived for object based attributes"), v3, v4);
      v5 = 0;
      break;
    default:
      v5 = 0;
      break;
  }
  return NSStringFromClass(v5);
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (BOOL)allowsDefaultValue
{
  return self->_allowsDefaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceFilterBlock, 0);
  objc_storeStrong(&self->_sourceFilterValueBlock, 0);
  objc_storeStrong((id *)&self->_sourcePropertyNames, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_propertyValueClassName, 0);
  objc_storeStrong((id *)&self->_sortAsName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
