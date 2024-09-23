@implementation _HKSPObjectProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValueClasses, 0);
}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  -[_HKSPObjectProperty expectedValueClasses](self, "expectedValueClasses");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPProperty identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hksp_setValue:forProperty:", v11, self);
}

- (NSArray)expectedValueClasses
{
  return self->_expectedValueClasses;
}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "hksp_valueForProperty:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPProperty identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, v7);

}

- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClass:(Class)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  _HKSPObjectProperty *v11;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](self, "initWithIdentifier:propertyName:expectedValueClasses:", v9, v8, v10, v13, v14);

  return v11;
}

- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClasses:(id)a5
{
  id v8;
  _HKSPObjectProperty *v9;
  uint64_t v10;
  NSArray *expectedValueClasses;
  _HKSPObjectProperty *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_HKSPObjectProperty;
  v9 = -[HKSPProperty initWithIdentifier:propertyName:](&v14, sel_initWithIdentifier_propertyName_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    expectedValueClasses = v9->_expectedValueClasses;
    v9->_expectedValueClasses = (NSArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKSPObjectProperty;
  if (-[HKSPProperty isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[_HKSPObjectProperty expectedValueClasses](self, "expectedValueClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expectedValueClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToArray:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSPObjectProperty;
  v4 = a3;
  -[HKSPProperty encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NSArray na_map:](self->_expectedValueClasses, "na_map:", &__block_literal_global_23, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKSPExpectedClasses"));

}

- (_HKSPObjectProperty)initWithCoder:(id)a3
{
  id v3;
  _HKSPObjectProperty *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *expectedValueClasses;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_HKSPObjectProperty;
  v3 = a3;
  v4 = -[HKSPProperty initWithCoder:](&v12, sel_initWithCoder_, v3);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("HKSPExpectedClasses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_map:", &__block_literal_global_217);
  v9 = objc_claimAutoreleasedReturnValue();
  expectedValueClasses = v4->_expectedValueClasses;
  v4->_expectedValueClasses = (NSArray *)v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "hksp_valueForProperty:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "hksp_setValue:forProperty:", v7, self);

}

@end
