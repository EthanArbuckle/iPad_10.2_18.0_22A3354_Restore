@implementation WFConcreteRunnableEntry

- (WFConcreteRunnableEntry)initWithIdentifier:(id)a3 name:(id)a4 entryIcon:(id)a5 accessoryIcon:(id)a6 serializedParameterState:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFConcreteRunnableEntry *v17;
  uint64_t v18;
  NSString *identifier;
  void *v20;
  uint64_t v21;
  NSString *uniqueIdentifier;
  uint64_t v23;
  NSString *name;
  WFConcreteRunnableEntry *v25;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)WFConcreteRunnableEntry;
  v17 = -[WFConcreteRunnableEntry init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v17->_uniqueIdentifier;
    v17->_uniqueIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v13, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v23;

    objc_storeStrong((id *)&v17->_entryIcon, a5);
    objc_storeStrong((id *)&v17->_accessoryIcon, a6);
    objc_storeStrong((id *)&v17->_serializedParameterState, a7);
    v25 = v17;
  }

  return v17;
}

- (WFConcreteRunnableEntry)initWithCoder:(id)a3
{
  id v4;
  WFConcreteRunnableEntry *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  WFIcon *entryIcon;
  uint64_t v14;
  WFIcon *accessoryIcon;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  WFPropertyListObject *serializedParameterState;
  WFConcreteRunnableEntry *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFConcreteRunnableEntry;
  v5 = -[WFConcreteRunnableEntry init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryIcon"));
    v12 = objc_claimAutoreleasedReturnValue();
    entryIcon = v5->_entryIcon;
    v5->_entryIcon = (WFIcon *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryIcon"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryIcon = v5->_accessoryIcon;
    v5->_accessoryIcon = (WFIcon *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("serializedParameterState"));
    v23 = objc_claimAutoreleasedReturnValue();
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFConcreteRunnableEntry identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFConcreteRunnableEntry uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uniqueIdentifier"));

  -[WFConcreteRunnableEntry name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("name"));

  -[WFConcreteRunnableEntry entryIcon](self, "entryIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("entryIcon"));

  -[WFConcreteRunnableEntry accessoryIcon](self, "accessoryIcon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("accessoryIcon"));

  -[WFConcreteRunnableEntry serializedParameterState](self, "serializedParameterState");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("serializedParameterState"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (WFIcon)entryIcon
{
  return self->_entryIcon;
}

- (WFIcon)accessoryIcon
{
  return self->_accessoryIcon;
}

- (WFPropertyListObject)serializedParameterState
{
  return self->_serializedParameterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParameterState, 0);
  objc_storeStrong((id *)&self->_accessoryIcon, 0);
  objc_storeStrong((id *)&self->_entryIcon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
