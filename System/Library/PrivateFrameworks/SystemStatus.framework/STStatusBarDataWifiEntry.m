@implementation STStatusBarDataWifiEntry

+ (id)entryWithType:(int64_t)a3 status:(int64_t)a4 lowDataMode:(BOOL)a5 rawValue:(int64_t)a6 displayValue:(int64_t)a7 displayRawValue:(BOOL)a8
{
  id result;

  result = (id)objc_msgSend(a1, "entryWithStatus:lowDataMode:rawValue:displayValue:displayRawValue:", a4, a5, a6, a7, a8);
  *((_QWORD *)result + 6) = a3;
  return result;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataWifiEntry;
  -[STStatusBarDataNetworkEntry _equalsBuilderWithObject:](&v12, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STStatusBarDataWifiEntry type](self, "type");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__STStatusBarDataWifiEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E91E58B0;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v6, v10);

  return v5;
}

- (int64_t)type
{
  return self->super._status;
}

uint64_t __53__STStatusBarDataWifiEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
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
  v5.super_class = (Class)STStatusBarDataWifiEntry;
  v4 = a3;
  -[STStatusBarDataNetworkEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->super._status, CFSTR("type"), v5.receiver, v5.super_class);

}

- (STStatusBarDataWifiEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataWifiEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataWifiEntry;
  v3 = a3;
  v4 = -[STStatusBarDataNetworkEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v7.receiver, v7.super_class);

  v4->super._status = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataWifiEntry;
  -[STStatusBarDataNetworkEntry succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusBarDataWifiEntry type](self, "type");
  v5 = CFSTR("(unknown)");
  if (v4 == 1)
    v5 = CFSTR("hotspot");
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("regular");
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("type"));
  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataWifiEntry;
  -[STStatusBarDataNetworkEntry _hashBuilder](&v6, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataWifiEntry type](self, "type"));
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
  v5.super_class = (Class)STStatusBarDataWifiEntry;
  v4 = a3;
  -[STStatusBarDataNetworkEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->super._status, CFSTR("type"), v5.receiver, v5.super_class);

}

- (STStatusBarDataWifiEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataWifiEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataWifiEntry;
  v5 = -[STStatusBarDataNetworkEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
    v5->super._status = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));

  return v5;
}

@end
