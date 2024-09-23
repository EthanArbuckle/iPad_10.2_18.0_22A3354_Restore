@implementation STStatusBarDataBatteryEntry

+ (id)entryWithCapacity:(int64_t)a3 state:(int64_t)a4 saverMode:(BOOL)a5 prominentlyShowsDetailString:(BOOL)a6 detailString:(id)a7
{
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;

  v12 = a7;
  v13 = objc_alloc_init((Class)a1);
  v13[2] = a3;
  v13[3] = a4;
  *((_BYTE *)v13 + 9) = a5;
  *((_BYTE *)v13 + 10) = a6;
  v14 = objc_msgSend(v12, "copy");

  v15 = (void *)v13[4];
  v13[4] = v14;

  return v13;
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
  int64_t v11;
  id v12;
  id v13;
  _BOOL8 v14;
  id v15;
  id v16;
  _BOOL8 v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STStatusBarDataBatteryEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v34, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataBatteryEntry capacity](self, "capacity");
  v8 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke;
  v32[3] = &unk_1E91E58B0;
  v9 = v6;
  v33 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v32);
  v11 = -[STStatusBarDataBatteryEntry state](self, "state");
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_2;
  v30[3] = &unk_1E91E58B0;
  v12 = v9;
  v31 = v12;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v11, v30);
  v14 = -[STStatusBarDataBatteryEntry saverModeActive](self, "saverModeActive");
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_3;
  v28[3] = &unk_1E91E4B28;
  v15 = v12;
  v29 = v15;
  v16 = (id)objc_msgSend(v5, "appendBool:counterpart:", v14, v28);
  v17 = -[STStatusBarDataBatteryEntry prominentlyShowsDetailString](self, "prominentlyShowsDetailString");
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_4;
  v26[3] = &unk_1E91E4B28;
  v18 = v15;
  v27 = v18;
  v19 = (id)objc_msgSend(v5, "appendBool:counterpart:", v17, v26);
  -[STStatusBarDataBatteryEntry detailString](self, "detailString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_5;
  v24[3] = &unk_1E91E4B00;
  v25 = v18;
  v21 = v18;
  v22 = (id)objc_msgSend(v5, "appendString:counterpart:", v20, v24);

  return v5;
}

- (int64_t)capacity
{
  return *(_QWORD *)&self->_saverModeActive;
}

- (int64_t)state
{
  return self->_capacity;
}

- (BOOL)saverModeActive
{
  return *(&self->super._enabled + 1);
}

- (BOOL)prominentlyShowsDetailString
{
  return *(&self->super._enabled + 2);
}

- (NSString)detailString
{
  return (NSString *)self->_state;
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "detailString");
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prominentlyShowsDetailString");
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saverModeActive");
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "state");
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "capacity");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
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
  v5.super_class = (Class)STStatusBarDataBatteryEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_saverModeActive, CFSTR("capacity"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_capacity, CFSTR("state"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("saverModeActive"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 2), CFSTR("prominentlyShowsDetailString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_state, CFSTR("detailString"));

}

- (STStatusBarDataBatteryEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataBatteryEntry *v4;
  uint64_t v5;
  void *state;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBatteryEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  *(_QWORD *)&v4->_saverModeActive = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("capacity"), v8.receiver, v8.super_class);
  v4->_capacity = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("state"));
  *(&v4->super._enabled + 1) = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("saverModeActive")) != 0;
  *(&v4->super._enabled + 2) = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("prominentlyShowsDetailString")) != 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailString"));
  v5 = objc_claimAutoreleasedReturnValue();

  state = (void *)v4->_state;
  v4->_state = v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  unint64_t v5;
  const __CFString *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBatteryEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v11, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataBatteryEntry capacity](self, "capacity"), CFSTR("capacity"));
  v5 = -[STStatusBarDataBatteryEntry state](self, "state");
  if (v5 > 3)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E91E59B8[v5];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("state"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBatteryEntry saverModeActive](self, "saverModeActive"), CFSTR("saverModeActive"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBatteryEntry prominentlyShowsDetailString](self, "prominentlyShowsDetailString"), CFSTR("prominentlyShowsDetailString"));
  -[STStatusBarDataBatteryEntry detailString](self, "detailString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v9, CFSTR("detailString"), 1);

  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBatteryEntry;
  -[STStatusBarDataEntry _hashBuilder](&v11, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBatteryEntry capacity](self, "capacity"));
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBatteryEntry state](self, "state"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBatteryEntry saverModeActive](self, "saverModeActive"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBatteryEntry prominentlyShowsDetailString](self, "prominentlyShowsDetailString"));
  -[STStatusBarDataBatteryEntry detailString](self, "detailString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

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
  v5.super_class = (Class)STStatusBarDataBatteryEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", *(_QWORD *)&self->_saverModeActive, CFSTR("capacity"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_capacity, CFSTR("state"));
  objc_msgSend(v4, "encodeInt64:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("saverModeActive"));
  objc_msgSend(v4, "encodeInt64:forKey:", *((unsigned __int8 *)&self->super._enabled + 2), CFSTR("prominentlyShowsDetailString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_state, CFSTR("detailString"));

}

- (STStatusBarDataBatteryEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataBatteryEntry *v5;
  uint64_t v6;
  void *state;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBatteryEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    *(_QWORD *)&v5->_saverModeActive = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("capacity"));
    v5->_capacity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("state"));
    *(&v5->super._enabled + 1) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("saverModeActive")) != 0;
    *(&v5->super._enabled + 2) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("prominentlyShowsDetailString")) != 0;
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("detailString"));
    v6 = objc_claimAutoreleasedReturnValue();
    state = (void *)v5->_state;
    v5->_state = v6;

  }
  return v5;
}

@end
