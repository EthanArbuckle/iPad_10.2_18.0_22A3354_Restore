@implementation STStatusBarDataThermalEntry

+ (STStatusBarDataThermalEntry)entryWithColor:(int64_t)a3 isSunlightMode:(BOOL)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((_BYTE *)v6 + 9) = a4;
  return (STStatusBarDataThermalEntry *)v6;
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
  v5.super_class = (Class)STStatusBarDataThermalEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_sunlightMode, CFSTR("color"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("sunlightMode"));

}

- (STStatusBarDataThermalEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataThermalEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  *(_QWORD *)&v4->_sunlightMode = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("color"), v7.receiver, v7.super_class);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sunlightMode"));

  *(&v4->super._enabled + 1) = v5 != 0;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataThermalEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusBarDataThermalEntry color](self, "color");
  if (v4 > 5)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E91E59F0[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("color"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataThermalEntry sunlightMode](self, "sunlightMode"), CFSTR("sunlightMode"));
  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _BOOL8 v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStatusBarDataThermalEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v19, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataThermalEntry color](self, "color");
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke;
  v17[3] = &unk_1E91E58B0;
  v9 = v6;
  v18 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v17);
  v11 = -[STStatusBarDataThermalEntry sunlightMode](self, "sunlightMode");
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke_2;
  v15[3] = &unk_1E91E4B28;
  v16 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendBool:counterpart:", v11, v15);

  return v5;
}

uint64_t __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "color");
}

uint64_t __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sunlightMode");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  -[STStatusBarDataEntry _hashBuilder](&v7, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataThermalEntry color](self, "color"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataThermalEntry sunlightMode](self, "sunlightMode"));
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
  v5.super_class = (Class)STStatusBarDataThermalEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", *(_QWORD *)&self->_sunlightMode, CFSTR("color"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("sunlightMode"));

}

- (STStatusBarDataThermalEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataThermalEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    *(_QWORD *)&v5->_sunlightMode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("color"));
    *(&v5->super._enabled + 1) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sunlightMode")) != 0;
  }

  return v5;
}

- (int64_t)color
{
  return *(_QWORD *)&self->_sunlightMode;
}

- (BOOL)sunlightMode
{
  return *(&self->super._enabled + 1);
}

@end
