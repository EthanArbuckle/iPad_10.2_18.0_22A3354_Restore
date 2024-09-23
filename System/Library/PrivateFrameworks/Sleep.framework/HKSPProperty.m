@implementation HKSPProperty

uint64_t __24__HKSPProperty_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPProperty identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[HKSPProperty propertyName](self, "propertyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (HKSPProperty)initWithIdentifier:(id)a3 propertyName:(id)a4
{
  id v6;
  id v7;
  HKSPProperty *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *propertyName;
  HKSPProperty *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPProperty;
  v8 = -[HKSPProperty init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    propertyName = v8->_propertyName;
    v8->_propertyName = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKSPProperty *v4;
  HKSPProperty *v5;
  void *v6;
  NSString *identifier;
  uint64_t v8;
  HKSPProperty *v9;
  id v10;
  NSString *propertyName;
  HKSPProperty *v12;
  id v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  HKSPProperty *v20;
  _QWORD v21[4];
  HKSPProperty *v22;

  v4 = (HKSPProperty *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v8 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __24__HKSPProperty_isEqual___block_invoke;
      v21[3] = &unk_1E4E3B360;
      v9 = v5;
      v22 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", identifier, v21);
      propertyName = self->_propertyName;
      v16 = v8;
      v17 = 3221225472;
      v18 = __24__HKSPProperty_isEqual___block_invoke_2;
      v19 = &unk_1E4E3B360;
      v20 = v9;
      v12 = v9;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", propertyName, &v16);
      v14 = objc_msgSend(v6, "isEqual", v16, v17, v18, v19);

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (NSArray)allowedSubclassesForSecureCoding
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allowedInnerClassesForSecureCoding
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPChange.m"), 38, CFSTR("subclasses must implement"));

  return (NSArray *)MEMORY[0x1E0C9AA60];
}

uint64_t __24__HKSPProperty_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "propertyName");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("HKSPIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_propertyName, CFSTR("HKSPPropertyName"));

}

- (HKSPProperty)initWithCoder:(id)a3
{
  id v4;
  HKSPProperty *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *propertyName;
  HKSPProperty *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPProperty;
  v5 = -[HKSPProperty init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPPropertyName"));
    v8 = objc_claimAutoreleasedReturnValue();
    propertyName = v5->_propertyName;
    v5->_propertyName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[HKSPProperty descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPProperty descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_propertyName, CFSTR("propertyName"));
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return -[HKSPProperty descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", 0);
}

- (BOOL)isRelationshipProperty
{
  return 0;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPProperty+Subclasses.m"), 18, CFSTR("Subclass must implement"));

}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPProperty+Subclasses.m"), 22, CFSTR("Subclass must implement"));

}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPProperty+Subclasses.m"), 26, CFSTR("Subclass must implement"));

}

@end
