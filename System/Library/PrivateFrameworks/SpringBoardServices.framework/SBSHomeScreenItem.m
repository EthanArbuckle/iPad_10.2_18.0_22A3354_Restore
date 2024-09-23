@implementation SBSHomeScreenItem

- (int64_t)kind
{
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SBSHomeScreenItem)initWithBSXPCCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSHomeScreenItem;
  return -[SBSHomeScreenItem init](&v4, sel_init, a3);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBSHomeScreenItem kind](self, "kind"));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSHomeScreenItem kind](self, "kind");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__SBSHomeScreenItem_isEqual___block_invoke;
  v10[3] = &unk_1E288EE88;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v10);
  LOBYTE(v6) = objc_msgSend(v5, "isEqual");

  return v6;
}

uint64_t __29__SBSHomeScreenItem_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "kind");
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[SBSHomeScreenItem kind](self, "kind"), CFSTR("kind"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
