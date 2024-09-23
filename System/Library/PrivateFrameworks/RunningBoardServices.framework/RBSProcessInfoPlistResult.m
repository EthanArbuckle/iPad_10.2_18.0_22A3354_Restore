@implementation RBSProcessInfoPlistResult

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessInfoPlistResult)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessInfoPlistResult *v5;
  void *v6;
  uint64_t v7;
  id value;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSProcessInfoPlistResult;
  v5 = -[RBSProcessInfoPlistResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    RBSXPCUnpackObject(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v7;

  }
  return v5;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id value;
  id v4;
  id v5;

  value = self->_value;
  v4 = a3;
  RBSXPCPackObject(value);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("_value"));

}

@end
