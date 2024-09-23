@implementation STStatusBarDataEntry

uint64_t __49__STStatusBarDataEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEnabled");
}

+ (id)entry
{
  return objc_alloc_init((Class)a1);
}

+ (id)disabledEntry
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[8] = 0;
  return v2;
}

- (STStatusBarDataEntry)init
{
  STStatusBarDataEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STStatusBarDataEntry;
  result = -[STStatusBarDataEntry init](&v3, sel_init);
  result->_enabled = 1;
  return result;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STStatusBarDataEntry isEnabled](self, "isEnabled");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__STStatusBarDataEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E91E4B28;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "isEnabled") & 1) != 0
    || -[STStatusBarDataEntry isEnabled](self, "isEnabled"))
  {
    -[STStatusBarDataEntry _equalsBuilderWithObject:](self, "_equalsBuilderWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
}

- (STStatusBarDataEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataEntry *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry init](&v7, sel_init);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("enabled"), v7.receiver, v7.super_class);

  v4->_enabled = v5;
  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
}

- (STStatusBarDataEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataEntry;
  v5 = -[STStatusBarDataEntry init](&v7, sel_init);
  if (v5)
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));

  return v5;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarDataEntry descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STStatusBarDataEntry debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[STStatusBarDataEntry _hashBuilder](self, "_hashBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataEntry isEnabled](self, "isEnabled"));
  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarDataEntry succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataEntry isEnabled](self, "isEnabled"), CFSTR("enabled"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarDataEntry descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarDataEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarDataEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[STStatusBarDataEntry succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  return v7;
}

@end
