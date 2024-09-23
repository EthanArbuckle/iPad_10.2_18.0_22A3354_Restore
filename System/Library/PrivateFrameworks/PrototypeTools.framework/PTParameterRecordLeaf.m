@implementation PTParameterRecordLeaf

- (PTParameterRecordLeaf)initWithRecordClassName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  PTParameterRecordLeaf *v8;
  PTParameterRecordLeaf *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PTParameterRecordLeaf;
  v8 = -[PTParameterRecordLeaf init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PTParameterRecordLeaf setRecordClassName:](v8, "setRecordClassName:", v6);
    -[PTParameterRecordLeaf setChangedValue:](v9, "setChangedValue:", v7);
  }

  return v9;
}

- (PTParameterRecordLeaf)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PTParameterRecordLeaf *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordClassName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PTParameterRecordLeaf initWithRecordClassName:value:](self, "initWithRecordClassName:value:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PTParameterRecordLeaf recordClassName](self, "recordClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recordClassName"));

  -[PTParameterRecordLeaf changedValue](self, "changedValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("changedValue"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PTParameterRecordLeaf recordClassName](self, "recordClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordLeaf changedValue](self, "changedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithRecordClassName:value:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordLeaf recordClassName](self, "recordClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __33__PTParameterRecordLeaf_isEqual___block_invoke;
  v16[3] = &unk_1E70584B0;
  v8 = v4;
  v17 = v8;
  objc_msgSend(v5, "appendString:counterpart:", v6, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordLeaf changedValue](self, "changedValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __33__PTParameterRecordLeaf_isEqual___block_invoke_2;
  v14[3] = &unk_1E70584D8;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendObject:counterpart:", v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v12 != 0;

  return v7;
}

uint64_t __33__PTParameterRecordLeaf_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordClassName");
}

uint64_t __33__PTParameterRecordLeaf_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changedValue");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordLeaf recordClassName](self, "recordClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordLeaf changedValue](self, "changedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)recordClassName
{
  return self->_recordClassName;
}

- (void)setRecordClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)changedValue
{
  return self->_changedValue;
}

- (void)setChangedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedValue, 0);
  objc_storeStrong((id *)&self->_recordClassName, 0);
}

@end
