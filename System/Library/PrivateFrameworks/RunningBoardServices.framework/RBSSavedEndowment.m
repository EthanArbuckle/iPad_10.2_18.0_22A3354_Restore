@implementation RBSSavedEndowment

- (id)_initWithEndowment:(id)a3 andKey:(id)a4
{
  id v7;
  id v8;
  RBSSavedEndowment *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBSSavedEndowment;
  v9 = -[RBSSavedEndowment init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endowment, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)savedEndowment:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSSavedEndowment _initWithEndowment:andKey:]([RBSSavedEndowment alloc], "_initWithEndowment:andKey:", v6, v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RBSSavedEndowment *v4;
  uint64_t v5;
  char v6;
  NSString *key;
  NSString *v8;

  v4 = (RBSSavedEndowment *)a3;
  if (self == v4)
    goto LABEL_8;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = 0;
    goto LABEL_9;
  }
  key = self->_key;
  v8 = v4->_key;
  if (key == v8)
  {
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  v6 = 0;
  if (key && v8)
    v6 = -[NSString isEqual:](key, "isEqual:");
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_key, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString description](self->_key, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSecureCoding description](self->_endowment, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| key:%@ endowment:%@>"), v4, v5, v6);

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *key;
  id v5;
  void *v6;
  id v7;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("_key"));
  RBSEndowmentEncode(self->_endowment);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  RBSXPCPackObject(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v6, CFSTR("_endowment"));

}

- (RBSSavedEndowment)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RBSSavedEndowment *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_endowment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    RBSXPCUnpackObject(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    RBSEndowmentDecode(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      self = (RBSSavedEndowment *)-[RBSSavedEndowment _initWithEndowment:andKey:](self, "_initWithEndowment:andKey:", v8, v5);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSecureCoding)endowment
{
  return self->_endowment;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_endowment, 0);
}

@end
