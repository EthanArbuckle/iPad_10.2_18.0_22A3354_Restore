@implementation PKPickerContactFieldConfiguration

- (PKPickerContactFieldConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKPickerContactFieldConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKContactPickerItem *v14;
  PKContactPickerItem *v15;
  uint64_t v16;
  NSArray *pickerItems;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPickerContactFieldConfiguration;
  v5 = -[PKContactFieldConfiguration initWithType:](&v23, sel_initWithType_, 2);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("items"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          v14 = [PKContactPickerItem alloc];
          v15 = -[PKContactPickerItem initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v19);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "copy");
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("items"), self->_pickerItems);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPickerContactFieldConfiguration;
  v4 = a3;
  -[PKContactFieldConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickerItems, CFSTR("items"), v5.receiver, v5.super_class);

}

- (PKPickerContactFieldConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPickerContactFieldConfiguration *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *pickerItems;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPickerContactFieldConfiguration;
  v5 = -[PKContactFieldConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItems, 0);
}

@end
