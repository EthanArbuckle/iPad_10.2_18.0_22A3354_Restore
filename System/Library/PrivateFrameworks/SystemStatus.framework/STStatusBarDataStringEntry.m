@implementation STStatusBarDataStringEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

uint64_t __55__STStatusBarDataStringEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringValue");
}

+ (STStatusBarDataStringEntry)entryWithStringValue:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[2];
  v5[2] = v6;

  return (STStatusBarDataStringEntry *)v5;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataStringEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v13, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STStatusBarDataStringEntry stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__STStatusBarDataStringEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E91E4B00;
  v12 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v7, v11);

  return v5;
}

- (NSString)stringValue
{
  return self->_stringValue;
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
  v5.super_class = (Class)STStatusBarDataStringEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"), v5.receiver, v5.super_class);

}

- (STStatusBarDataStringEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataStringEntry *v4;
  uint64_t v5;
  NSString *stringValue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataStringEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  stringValue = v4->_stringValue;
  v4->_stringValue = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataStringEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataStringEntry stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("stringValue"));

  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataStringEntry;
  -[STStatusBarDataEntry _hashBuilder](&v7, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataStringEntry stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataStringEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"), v5.receiver, v5.super_class);

}

- (STStatusBarDataStringEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataStringEntry *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataStringEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

@end
