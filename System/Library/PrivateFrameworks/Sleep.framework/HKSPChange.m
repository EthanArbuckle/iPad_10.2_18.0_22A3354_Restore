@implementation HKSPChange

- (HKSPChange)initWithProperty:(id)a3 changedValue:(id)a4 originalValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPChange *v11;
  uint64_t v12;
  HKSPProperty *property;
  HKSPChange *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPChange;
  v11 = -[HKSPChange init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    property = v11->_property;
    v11->_property = (HKSPProperty *)v12;

    objc_storeStrong((id *)&v11->_changedValue, a4);
    objc_storeStrong((id *)&v11->_originalValue, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKSPChange *v4;
  HKSPChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChange *v9;
  id v10;
  void *v11;
  HKSPChange *v12;
  id v13;
  void *v14;
  HKSPChange *v15;
  id v16;
  char v17;
  _QWORD v19[4];
  HKSPChange *v20;
  _QWORD v21[4];
  HKSPChange *v22;
  _QWORD v23[4];
  HKSPChange *v24;

  v4 = (HKSPChange *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPChange property](self, "property");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __22__HKSPChange_isEqual___block_invoke;
      v23[3] = &unk_1E4E3A948;
      v9 = v5;
      v24 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", v7, v23);

      -[HKSPChange originalValue](self, "originalValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __22__HKSPChange_isEqual___block_invoke_2;
      v21[3] = &unk_1E4E3A970;
      v12 = v9;
      v22 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", v11, v21);

      -[HKSPChange changedValue](self, "changedValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __22__HKSPChange_isEqual___block_invoke_3;
      v19[3] = &unk_1E4E3A970;
      v20 = v12;
      v15 = v12;
      v16 = (id)objc_msgSend(v6, "appendObject:counterpart:", v14, v19);

      v17 = objc_msgSend(v6, "isEqual");
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

uint64_t __22__HKSPChange_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "property");
}

uint64_t __22__HKSPChange_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "originalValue");
}

uint64_t __22__HKSPChange_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changedValue");
}

- (id)deepCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  v4 = (void *)-[HKSPProperty copy](self->_property, "copy");
  v5 = (void *)-[NSObject copyWithZone:](self->_changedValue, "copyWithZone:", 0);
  v6 = (void *)-[NSObject copyWithZone:](self->_originalValue, "copyWithZone:", 0);
  v7 = (void *)objc_msgSend(v3, "initWithProperty:changedValue:originalValue:", v4, v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPProperty *property;
  id v5;

  property = self->_property;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", property, CFSTR("HKSPProperty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changedValue, CFSTR("HKSPChangedValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalValue, CFSTR("HKSPOriginalValue"));

}

- (HKSPChange)initWithCoder:(id)a3
{
  id v4;
  HKSPChange *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKSPProperty *property;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *changedValue;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *originalValue;
  HKSPChange *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKSPChange;
  v5 = -[HKSPChange init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    +[HKSPProperty allowedSubclassesForSecureCoding](HKSPProperty, "allowedSubclassesForSecureCoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HKSPProperty"));
    v9 = objc_claimAutoreleasedReturnValue();
    property = v5->_property;
    v5->_property = (HKSPProperty *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    -[HKSPProperty allowedInnerClassesForSecureCoding](v5->_property, "allowedInnerClassesForSecureCoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HKSPChangedValue"));
    v14 = objc_claimAutoreleasedReturnValue();
    changedValue = v5->_changedValue;
    v5->_changedValue = v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    -[HKSPProperty allowedInnerClassesForSecureCoding](v5->_property, "allowedInnerClassesForSecureCoding");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HKSPOriginalValue"));
    v19 = objc_claimAutoreleasedReturnValue();
    originalValue = v5->_originalValue;
    v5->_originalValue = v19;

    v21 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPChange property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[HKSPChange changedValue](self, "changedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[HKSPChange originalValue](self, "originalValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (NSString)description
{
  return (NSString *)-[HKSPChange descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPChange descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPProperty identifier](self->_property, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("identifier"));

  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_changedValue, CFSTR("changedValue"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_originalValue, CFSTR("originalValue"));
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return -[HKSPChange descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", 0);
}

- (HKSPProperty)property
{
  return self->_property;
}

- (NSObject)changedValue
{
  return self->_changedValue;
}

- (NSObject)originalValue
{
  return self->_originalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_changedValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
