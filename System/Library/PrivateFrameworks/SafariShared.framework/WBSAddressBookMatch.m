@implementation WBSAddressBookMatch

- (void)_setValue:(id)a3
{
  void *v4;
  id value;

  if (self->_value != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    value = self->_value;
    self->_value = v4;

  }
}

- (NSString)stringValue
{
  id value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    value = self->_value;
  else
    value = 0;
  return (NSString *)value;
}

- (NSDate)dateValue
{
  id value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    value = self->_value;
  else
    value = 0;
  return (NSDate *)value;
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6
{
  return -[WBSAddressBookMatch initWithValue:property:key:identifier:label:](self, "initWithValue:property:key:identifier:label:", a3, a4, a5, a6, 0);
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSAddressBookMatch *v17;
  uint64_t v18;
  id value;
  uint64_t v20;
  NSString *property;
  uint64_t v22;
  NSString *key;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *label;
  WBSAddressBookMatch *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSAddressBookMatch;
  v17 = -[WBSAddressBookMatch init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    value = v17->_value;
    v17->_value = (id)v18;

    v20 = objc_msgSend(v13, "copy");
    property = v17->_property;
    v17->_property = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    key = v17->_key;
    v17->_key = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    label = v17->_label;
    v17->_label = (NSString *)v26;

    v28 = v17;
  }

  return v17;
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7 uniqueID:(id)a8
{
  id v14;
  WBSAddressBookMatch *v15;
  uint64_t v16;
  NSString *uniqueID;
  WBSAddressBookMatch *v18;

  v14 = a8;
  v15 = -[WBSAddressBookMatch initWithValue:property:key:identifier:label:](self, "initWithValue:property:key:identifier:label:", a3, a4, a5, a6, a7);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = (NSString *)v16;

    v18 = v15;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = objc_msgSend(self->_value, "hash");
  v4 = -[NSString hash](self->_property, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSAddressBookMatch *v4;
  WBSAddressBookMatch *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *property;
  NSString *key;
  NSString *identifier;
  NSString *label;
  char v17;
  void *v19;

  v4 = (WBSAddressBookMatch *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSAddressBookMatch stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch dateValue](self, "dateValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch stringValue](v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch dateValue](v5, "dateValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch property](v5, "property");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch key](v5, "key");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch identifier](v5, "identifier");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[WBSAddressBookMatch label](v5, "label");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((v6 == v7 || objc_msgSend(v6, "isEqualToString:", v7))
        && (v19 == v8 || objc_msgSend(v19, "isEqualToDate:", v8))
        && ((property = self->_property, property == v9)
         || -[NSString isEqualToString:](property, "isEqualToString:", v9))
        && ((key = self->_key, key == v10) || -[NSString isEqualToString:](key, "isEqualToString:", v10))
        && ((identifier = self->_identifier, identifier == v11)
         || -[NSString isEqualToString:](identifier, "isEqualToString:", v11)))
      {
        label = self->_label;
        if (label == v12)
          v17 = 1;
        else
          v17 = -[NSString isEqualToString:](label, "isEqualToString:", v12);
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  -[WBSAddressBookMatch dateValue](self, "dateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "description");
  else
    -[WBSAddressBookMatch stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_key, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; key = %@"), self->_key);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E4B40D18;
  }
  if (-[NSString length](self->_identifier, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; identifier = %@"), self->_identifier);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E4B40D18;
  }
  if (-[NSString length](self->_label, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; label = '%@'"), self->_label);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E4B40D18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p%@; property = %@%@; value = '%@'%@>"),
    objc_opt_class(),
    self,
    v8,
    self->_property,
    v6,
    v5,
    v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)completion
{
  return (NSString *)self->_value;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id value;
  NSString *property;
  NSString *key;
  NSString *identifier;
  NSString *label;
  NSString *uniqueID;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", value, CFSTR("Value"));
  property = self->_property;
  if (property)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", property, CFSTR("Property"));
  key = self->_key;
  if (key)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", key, CFSTR("Key"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", identifier, CFSTR("Identifier"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", label, CFSTR("Label"));
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", uniqueID, CFSTR("UniqueID"));
  return (NSDictionary *)v4;
}

+ (id)addressBookMatchWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Property"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("UniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:property:key:identifier:label:uniqueID:", v5, v6, v7, v8, v9, v10);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSAddressBookMatch)initWithCoder:(id)a3
{
  id v4;
  WBSAddressBookMatch *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSAddressBookMatch;
  v5 = -[WBSAddressBookMatch init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Property"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSAddressBookMatch initWithValue:property:key:identifier:label:uniqueID:](v5, "initWithValue:property:key:identifier:label:uniqueID:", v9, v10, v11, v12, v13, v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("Value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_property, CFSTR("Property"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("Key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("Label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueID, CFSTR("UniqueID"));

}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)key
{
  return self->_key;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
