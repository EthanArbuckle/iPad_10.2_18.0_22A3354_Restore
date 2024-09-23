@implementation WBSAddressBookValueSpecifier

- (WBSAddressBookValueSpecifier)initWithProperty:(id)a3 component:(id)a4 label:(id)a5 category:(id)a6 parentProperty:(id)a7 classification:(id)a8 classificationHint:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  WBSAddressBookValueSpecifier *v22;
  uint64_t v23;
  NSString *property;
  uint64_t v25;
  NSString *component;
  uint64_t v27;
  NSString *label;
  uint64_t v29;
  NSString *category;
  uint64_t v31;
  NSString *parentProperty;
  uint64_t v33;
  NSString *classification;
  uint64_t v35;
  NSString *classificationHint;
  WBSAddressBookValueSpecifier *v37;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)WBSAddressBookValueSpecifier;
  v22 = -[WBSAddressBookValueSpecifier init](&v39, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    property = v22->_property;
    v22->_property = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    component = v22->_component;
    v22->_component = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    label = v22->_label;
    v22->_label = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    category = v22->_category;
    v22->_category = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    parentProperty = v22->_parentProperty;
    v22->_parentProperty = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    classification = v22->_classification;
    v22->_classification = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    classificationHint = v22->_classificationHint;
    v22->_classificationHint = (NSString *)v35;

    v37 = v22;
  }

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_property, "hash");
  v4 = -[NSString hash](self->_component, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_label, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSAddressBookValueSpecifier *v4;
  WBSAddressBookValueSpecifier *v5;
  NSString *property;
  NSString *component;
  NSString *label;
  BOOL v9;

  v4 = (WBSAddressBookValueSpecifier *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      property = self->_property;
      v9 = 0;
      if (property == v5->_property || -[NSString isEqualToString:](property, "isEqualToString:"))
      {
        component = self->_component;
        if (component == v5->_component || -[NSString isEqualToString:](component, "isEqualToString:"))
        {
          label = self->_label;
          if (label == v5->_label || -[NSString isEqualToString:](label, "isEqualToString:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p property: %@; component: %@; label: %@>"),
    v5,
    self,
    self->_property,
    self->_component,
    self->_label);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *property;
  NSString *component;
  NSString *label;
  NSString *category;
  NSString *parentProperty;
  NSString *classification;
  NSString *classificationHint;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  property = self->_property;
  if (property)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", property, CFSTR("property"));
  component = self->_component;
  if (component)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", component, CFSTR("component"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", label, CFSTR("label"));
  category = self->_category;
  if (category)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", category, CFSTR("category"));
  parentProperty = self->_parentProperty;
  if (parentProperty)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", parentProperty, CFSTR("parentProperty"));
  classification = self->_classification;
  if (classification)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", classification, CFSTR("classification"));
  classificationHint = self->_classificationHint;
  if (classificationHint)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", classificationHint, CFSTR("classificationHint"));
  return (NSDictionary *)v4;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)component
{
  return self->_component;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)parentProperty
{
  return self->_parentProperty;
}

- (NSString)classification
{
  return self->_classification;
}

- (NSString)classificationHint
{
  return self->_classificationHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationHint, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_parentProperty, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
