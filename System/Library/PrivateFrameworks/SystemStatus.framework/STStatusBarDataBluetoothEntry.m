@implementation STStatusBarDataBluetoothEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryEntry, 0);
}

+ (STStatusBarDataBluetoothEntry)entryWithState:(int64_t)a3 batteryEntry:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  v7[2] = a3;
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[3];
  v7[3] = v8;

  return (STStatusBarDataBluetoothEntry *)v7;
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
  v5.super_class = (Class)STStatusBarDataBluetoothEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("state"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryEntry, CFSTR("batteryEntry"));

}

- (STStatusBarDataBluetoothEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataBluetoothEntry *v4;
  uint64_t v5;
  STStatusBarDataBatteryEntry *batteryEntry;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBluetoothEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  v4->_state = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("state"), v8.receiver, v8.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryEntry"));
  v5 = objc_claimAutoreleasedReturnValue();

  batteryEntry = v4->_batteryEntry;
  v4->_batteryEntry = (STStatusBarDataBatteryEntry *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBluetoothEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v9, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusBarDataBluetoothEntry state](self, "state");
  if (v4 > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E91E59D8[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("state"));
  -[STStatusBarDataBluetoothEntry batteryEntry](self, "batteryEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("batteryState"), 1);

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
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStatusBarDataBluetoothEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v19, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataBluetoothEntry state](self, "state");
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke;
  v17[3] = &unk_1E91E58B0;
  v9 = v6;
  v18 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v17);
  -[STStatusBarDataBluetoothEntry batteryEntry](self, "batteryEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke_2;
  v15[3] = &unk_1E91E4AB0;
  v16 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v11, v15);

  return v5;
}

uint64_t __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "state");
}

uint64_t __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batteryEntry");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBluetoothEntry;
  -[STStatusBarDataEntry _hashBuilder](&v8, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBluetoothEntry state](self, "state"));
  -[STStatusBarDataBluetoothEntry batteryEntry](self, "batteryEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

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
  v5.super_class = (Class)STStatusBarDataBluetoothEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_state, CFSTR("state"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryEntry, CFSTR("batteryEntry"));

}

- (STStatusBarDataBluetoothEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataBluetoothEntry *v5;
  uint64_t v6;
  STStatusBarDataBatteryEntry *batteryEntry;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBluetoothEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryEntry"));
    v6 = objc_claimAutoreleasedReturnValue();
    batteryEntry = v5->_batteryEntry;
    v5->_batteryEntry = (STStatusBarDataBatteryEntry *)v6;

  }
  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (STStatusBarDataBatteryEntry)batteryEntry
{
  return self->_batteryEntry;
}

@end
