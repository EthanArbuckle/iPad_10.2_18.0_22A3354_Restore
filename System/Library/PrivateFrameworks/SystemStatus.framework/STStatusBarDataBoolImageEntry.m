@implementation STStatusBarDataBoolImageEntry

+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4
{
  id result;

  result = (id)objc_msgSend(a1, "entryWithImageNamed:", a3);
  *((_BYTE *)result + 24) = a4;
  return result;
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
  v5.super_class = (Class)STStatusBarDataBoolImageEntry;
  v4 = a3;
  -[STStatusBarDataImageEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, CFSTR("BOOLValue"), v5.receiver, v5.super_class);

}

- (STStatusBarDataBoolImageEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataBoolImageEntry *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolImageEntry;
  v3 = a3;
  v4 = -[STStatusBarDataImageEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("BOOLValue"), v7.receiver, v7.super_class);

  v4->_BOOLValue = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolImageEntry;
  -[STStatusBarDataImageEntry succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBoolImageEntry BOOLValue](self, "BOOLValue"), CFSTR("BOOLValue"));
  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataBoolImageEntry;
  -[STStatusBarDataImageEntry _equalsBuilderWithObject:](&v13, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataBoolImageEntry BOOLValue](self, "BOOLValue");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataBoolImageEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E91E4B28;
  v12 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v7, v11);

  return v5;
}

uint64_t __58__STStatusBarDataBoolImageEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolImageEntry;
  -[STStatusBarDataImageEntry _hashBuilder](&v6, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBoolImageEntry BOOLValue](self, "BOOLValue"));
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
  v5.super_class = (Class)STStatusBarDataBoolImageEntry;
  v4 = a3;
  -[STStatusBarDataImageEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, CFSTR("BOOLValue"), v5.receiver, v5.super_class);

}

- (STStatusBarDataBoolImageEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataBoolImageEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolImageEntry;
  v5 = -[STStatusBarDataImageEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
    v5->_BOOLValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BOOLValue"));

  return v5;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end
