@implementation STStatusBarDataQuietModeEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusName, 0);
}

+ (STStatusBarDataQuietModeEntry)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "entryWithImageNamed:BOOLValue:", a4, v5);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)v9[4];
  v9[4] = v10;

  return (STStatusBarDataQuietModeEntry *)v9;
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
  v5.super_class = (Class)STStatusBarDataQuietModeEntry;
  v4 = a3;
  -[STStatusBarDataBoolImageEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, CFSTR("focusName"), v5.receiver, v5.super_class);

}

- (STStatusBarDataQuietModeEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataQuietModeEntry *v4;
  uint64_t v5;
  NSString *focusName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataQuietModeEntry;
  v3 = a3;
  v4 = -[STStatusBarDataBoolImageEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusName"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  focusName = v4->_focusName;
  v4->_focusName = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataQuietModeEntry;
  -[STStatusBarDataBoolImageEntry succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataQuietModeEntry focusName](self, "focusName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("focusName"));

  return v3;
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
  v13.super_class = (Class)STStatusBarDataQuietModeEntry;
  -[STStatusBarDataBoolImageEntry _equalsBuilderWithObject:](&v13, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STStatusBarDataQuietModeEntry focusName](self, "focusName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataQuietModeEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E91E4B00;
  v12 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v7, v11);

  return v5;
}

uint64_t __58__STStatusBarDataQuietModeEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "focusName");
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataQuietModeEntry;
  -[STStatusBarDataBoolImageEntry _hashBuilder](&v7, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataQuietModeEntry focusName](self, "focusName");
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
  v5.super_class = (Class)STStatusBarDataQuietModeEntry;
  v4 = a3;
  -[STStatusBarDataBoolImageEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, CFSTR("focusName"), v5.receiver, v5.super_class);

}

- (STStatusBarDataQuietModeEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataQuietModeEntry *v5;
  uint64_t v6;
  NSString *focusName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataQuietModeEntry;
  v5 = -[STStatusBarDataBoolImageEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("focusName"));
    v6 = objc_claimAutoreleasedReturnValue();
    focusName = v5->_focusName;
    v5->_focusName = (NSString *)v6;

  }
  return v5;
}

- (NSString)focusName
{
  return self->_focusName;
}

@end
