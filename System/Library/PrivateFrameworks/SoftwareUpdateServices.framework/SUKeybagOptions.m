@implementation SUKeybagOptions

- (SUKeybagOptions)init
{
  SUKeybagOptions *v2;
  SUKeybagOptions *v3;
  NSString *passcode;
  LAContext *laContext;
  SUDescriptor *descriptor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUKeybagOptions;
  v2 = -[SUKeybagOptions init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    passcode = v2->_passcode;
    v2->_passcode = 0;

    laContext = v3->_laContext;
    v3->_laContext = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    v3->_keybagType = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUKeybagOptions)initWithCoder:(id)a3
{
  id v4;
  SUKeybagOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUKeybagOptions;
  v5 = -[SUKeybagOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUKeybagOptions setPasscode:](v5, "setPasscode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("laContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUKeybagOptions setLaContext:](v5, "setLaContext:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUKeybagOptions setDescriptor:](v5, "setDescriptor:", v8);

    -[SUKeybagOptions setKeybagType:](v5, "setKeybagType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("keybagType")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passcode;
  id v5;

  passcode = self->_passcode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passcode, CFSTR("passcode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_laContext, CFSTR("laContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_keybagType, CFSTR("keybagType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setPasscode:", self->_passcode);
  objc_msgSend(v4, "setLaContext:", self->_laContext);
  objc_msgSend(v4, "setDescriptor:", self->_descriptor);
  objc_msgSend(v4, "setKeybagType:", self->_keybagType);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUKeybagOptions descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUKeybagOptions keybagType](self, "keybagType");
  -[SUKeybagOptions passcode](self, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("<PRESENT>");
  else
    v7 = CFSTR("<NULL>");
  -[SUKeybagOptions laContext](self, "laContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("<PRESENT>");
  else
    v9 = CFSTR("<NULL>");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            descriptor: %@\n            keybagType: %d\n            passcode: %@\n            LAContext:%@"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
  objc_storeStrong((id *)&self->_laContext, a3);
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (int)keybagType
{
  return self->_keybagType;
}

- (void)setKeybagType:(int)a3
{
  self->_keybagType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
