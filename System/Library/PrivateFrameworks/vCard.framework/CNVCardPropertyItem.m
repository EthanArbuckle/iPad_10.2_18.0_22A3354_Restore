@implementation CNVCardPropertyItem

+ (id)itemWithValue:(id)a3 label:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:label:identifier:", v10, v9, v8);

  return v11;
}

- (CNVCardPropertyItem)initWithValue:(id)a3 label:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNVCardPropertyItem *v11;
  uint64_t v12;
  id value;
  uint64_t v14;
  NSString *label;
  uint64_t v16;
  NSString *identifier;
  CNVCardPropertyItem *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CNVCardPropertyItem init](self, "init");
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    value = v11->_value;
    v11->_value = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    label = v11->_label;
    v11->_label = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), self->_value);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("label"), self->_label);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
