@implementation WFHMHomeAreaDescriptor

- (WFHMHomeAreaDescriptor)initWithUniqueIdentifier:(id)a3 homeIdentifier:(id)a4 name:(id)a5 areaType:(unint64_t)a6 homeName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFHMHomeAreaDescriptor *v17;
  WFHMHomeAreaDescriptor *v18;
  WFHMHomeAreaDescriptor *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WFHMHomeAreaDescriptor;
  v17 = -[WFHMHomeAreaDescriptor init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v18->_homeIdentifier, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    v18->_areaType = a6;
    objc_storeStrong((id *)&v18->_homeName, a7);
    v19 = v18;
  }

  return v18;
}

- (WFHMHomeAreaDescriptor)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFHMHomeAreaDescriptor *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAreaPickerParameter.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFHMHomeAreaDescriptor initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:](self, "initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:", v6, v7, v8, 0, v9);

  return v10;
}

- (WFHMHomeAreaDescriptor)initWithZone:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFHMHomeAreaDescriptor *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAreaPickerParameter.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zone"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAreaPickerParameter.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFHMHomeAreaDescriptor initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:](self, "initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:", v10, v11, v12, 1, v13);

  return v14;
}

- (WFHMHomeAreaDescriptor)initWithRoom:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFHMHomeAreaDescriptor *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAreaPickerParameter.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("room"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAreaPickerParameter.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFHMHomeAreaDescriptor initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:](self, "initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:", v10, v11, v12, 2, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFHMHomeAreaDescriptor uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("uniqueIdentifier"));

  -[WFHMHomeAreaDescriptor homeIdentifier](self, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("homeIdentifier"));

  -[WFHMHomeAreaDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("name"));

  -[WFHMHomeAreaDescriptor homeName](self, "homeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("homeName"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[WFHMHomeAreaDescriptor areaType](self, "areaType"), CFSTR("areaType"));
}

- (WFHMHomeAreaDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFHMHomeAreaDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("areaType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFHMHomeAreaDescriptor initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:](self, "initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:", v5, v6, v8, v7, v9);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[WFHMHomeAreaDescriptor uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WFHMHomeAreaDescriptor homeIdentifier](self, "homeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[WFHMHomeAreaDescriptor name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[WFHMHomeAreaDescriptor areaType](self, "areaType");
  -[WFHMHomeAreaDescriptor homeName](self, "homeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = (void *)objc_msgSend(v4, "initWithUniqueIdentifier:homeIdentifier:name:areaType:homeName:", v6, v8, v10, v11, v13);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  WFHMHomeAreaDescriptor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFHMHomeAreaDescriptor *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFHMHomeAreaDescriptor uniqueIdentifier](v4, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHMHomeAreaDescriptor uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  v3 = (void *)objc_opt_new();
  -[WFHMHomeAreaDescriptor uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  v7 = objc_msgSend(v3, "finalize");
  return v7;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)areaType
{
  return self->_areaType;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
