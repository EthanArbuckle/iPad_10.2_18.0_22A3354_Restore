@implementation STStatusBarDataCellularEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)entryWithType:(int64_t)a3 stringValue:(id)a4 crossfadeStringValue:(id)a5 badgeStringValue:(id)a6 wifiCalling:(BOOL)a7 callForwarding:(BOOL)a8 showsSOSWhenDisabled:(BOOL)a9 sosAvailable:(BOOL)a10 isBootstrapCellular:(BOOL)a11 status:(int64_t)a12 lowDataMode:(BOOL)a13 rawValue:(int64_t)a14 displayValue:(int64_t)a15 displayRawValue:(BOOL)a16
{
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a1, "entryWithStatus:lowDataMode:rawValue:displayValue:displayRawValue:", a12, a13, a14, a15, a16);
  v22 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v22 + 56) = a3;
  v23 = objc_msgSend(v21, "copy");

  v24 = *(void **)(v22 + 64);
  *(_QWORD *)(v22 + 64) = v23;

  v25 = objc_msgSend(v20, "copy");
  v26 = *(void **)(v22 + 72);
  *(_QWORD *)(v22 + 72) = v25;

  v27 = objc_msgSend(v19, "copy");
  v28 = *(void **)(v22 + 80);
  *(_QWORD *)(v22 + 80) = v27;

  *(_BYTE *)(v22 + 48) = a7;
  *(_BYTE *)(v22 + 49) = a8;
  *(_BYTE *)(v22 + 50) = a9;
  *(_BYTE *)(v22 + 51) = a10;
  *(_BYTE *)(v22 + 52) = a11;
  return (id)v22;
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
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _BOOL8 v20;
  id v21;
  id v22;
  _BOOL8 v23;
  id v24;
  id v25;
  _BOOL8 v26;
  id v27;
  id v28;
  _BOOL8 v29;
  id v30;
  id v31;
  _BOOL8 v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)STStatusBarDataCellularEntry;
  -[STStatusBarDataNetworkEntry _equalsBuilderWithObject:](&v54, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataCellularEntry type](self, "type");
  v8 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke;
  v52[3] = &unk_1E91E58B0;
  v9 = v6;
  v53 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v52);
  -[STStatusBarDataCellularEntry string](self, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v8;
  v50[1] = 3221225472;
  v50[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_2;
  v50[3] = &unk_1E91E4B00;
  v12 = v9;
  v51 = v12;
  v13 = (id)objc_msgSend(v5, "appendString:counterpart:", v11, v50);

  -[STStatusBarDataCellularEntry crossfadeString](self, "crossfadeString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v8;
  v48[1] = 3221225472;
  v48[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_3;
  v48[3] = &unk_1E91E4B00;
  v15 = v12;
  v49 = v15;
  v16 = (id)objc_msgSend(v5, "appendString:counterpart:", v14, v48);

  -[STStatusBarDataCellularEntry badgeString](self, "badgeString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v8;
  v46[1] = 3221225472;
  v46[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_4;
  v46[3] = &unk_1E91E4B00;
  v18 = v15;
  v47 = v18;
  v19 = (id)objc_msgSend(v5, "appendString:counterpart:", v17, v46);

  v20 = -[STStatusBarDataCellularEntry wifiCallingEnabled](self, "wifiCallingEnabled");
  v44[0] = v8;
  v44[1] = 3221225472;
  v44[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_5;
  v44[3] = &unk_1E91E4B28;
  v21 = v18;
  v45 = v21;
  v22 = (id)objc_msgSend(v5, "appendBool:counterpart:", v20, v44);
  v23 = -[STStatusBarDataCellularEntry callForwardingEnabled](self, "callForwardingEnabled");
  v42[0] = v8;
  v42[1] = 3221225472;
  v42[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_6;
  v42[3] = &unk_1E91E4B28;
  v24 = v21;
  v43 = v24;
  v25 = (id)objc_msgSend(v5, "appendBool:counterpart:", v23, v42);
  v26 = -[STStatusBarDataCellularEntry showsSOSWhenDisabled](self, "showsSOSWhenDisabled");
  v40[0] = v8;
  v40[1] = 3221225472;
  v40[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_7;
  v40[3] = &unk_1E91E4B28;
  v27 = v24;
  v41 = v27;
  v28 = (id)objc_msgSend(v5, "appendBool:counterpart:", v26, v40);
  v29 = -[STStatusBarDataCellularEntry sosAvailable](self, "sosAvailable");
  v38[0] = v8;
  v38[1] = 3221225472;
  v38[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_8;
  v38[3] = &unk_1E91E4B28;
  v30 = v27;
  v39 = v30;
  v31 = (id)objc_msgSend(v5, "appendBool:counterpart:", v29, v38);
  v32 = -[STStatusBarDataCellularEntry isBootstrapCellular](self, "isBootstrapCellular");
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_9;
  v36[3] = &unk_1E91E4B28;
  v37 = v30;
  v33 = v30;
  v34 = (id)objc_msgSend(v5, "appendBool:counterpart:", v32, v36);

  return v5;
}

- (BOOL)isBootstrapCellular
{
  return BYTE4(self->super._status);
}

- (int64_t)type
{
  return *(_QWORD *)&self->_wifiCallingEnabled;
}

- (BOOL)wifiCallingEnabled
{
  return self->super._status;
}

- (BOOL)sosAvailable
{
  return BYTE3(self->super._status);
}

- (BOOL)showsSOSWhenDisabled
{
  return BYTE2(self->super._status);
}

- (NSString)string
{
  return (NSString *)self->_type;
}

- (NSString)crossfadeString
{
  return self->_string;
}

- (BOOL)callForwardingEnabled
{
  return BYTE1(self->super._status);
}

- (NSString)badgeString
{
  return self->_crossfadeString;
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBootstrapCellular");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sosAvailable");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showsSOSWhenDisabled");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callForwardingEnabled");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wifiCallingEnabled");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "badgeString");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "crossfadeString");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "string");
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)STStatusBarDataCellularEntry;
  v4 = a3;
  -[STStatusBarDataNetworkEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_wifiCallingEnabled, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("string"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_string, CFSTR("crossfadeString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_crossfadeString, CFSTR("badgeString"));
  objc_msgSend(v4, "encodeBool:forKey:", LOBYTE(self->super._status), CFSTR("wifiCallingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE1(self->super._status), CFSTR("callForwardingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE2(self->super._status), CFSTR("showsSOSWhenDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE3(self->super._status), CFSTR("sosAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE4(self->super._status), CFSTR("isBootstrapCellular"));

}

- (STStatusBarDataCellularEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataCellularEntry *v4;
  uint64_t v5;
  void *type;
  uint64_t v7;
  NSString *string;
  uint64_t v9;
  NSString *crossfadeString;
  char v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataCellularEntry;
  v3 = a3;
  v4 = -[STStatusBarDataNetworkEntry initWithCoder:](&v13, sel_initWithCoder_, v3);
  *(_QWORD *)&v4->_wifiCallingEnabled = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v13.receiver, v13.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v5 = objc_claimAutoreleasedReturnValue();
  type = (void *)v4->_type;
  v4->_type = v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crossfadeString"));
  v7 = objc_claimAutoreleasedReturnValue();
  string = v4->_string;
  v4->_string = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeString"));
  v9 = objc_claimAutoreleasedReturnValue();
  crossfadeString = v4->_crossfadeString;
  v4->_crossfadeString = (NSString *)v9;

  LOBYTE(v4->super._status) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("wifiCallingEnabled"));
  BYTE1(v4->super._status) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("callForwardingEnabled"));
  BYTE2(v4->super._status) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showsSOSWhenDisabled"));
  BYTE3(v4->super._status) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sosAvailable"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isBootstrapCellular"));

  BYTE4(v4->super._status) = v11;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STStatusBarDataCellularEntry;
  -[STStatusBarDataNetworkEntry succinctDescriptionBuilder](&v14, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _STStatusBarDataCellularTypeDescription(-[STStatusBarDataCellularEntry type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("type"));

  -[STStatusBarDataCellularEntry string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v5, CFSTR("string"), 1);

  -[STStatusBarDataCellularEntry crossfadeString](self, "crossfadeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v6, CFSTR("crossfadeString"), 1);

  -[STStatusBarDataCellularEntry badgeString](self, "badgeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v7, CFSTR("badgeString"), 1);

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry wifiCallingEnabled](self, "wifiCallingEnabled"), CFSTR("wifiCallingEnabled"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry callForwardingEnabled](self, "callForwardingEnabled"), CFSTR("callForwardingEnabled"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry showsSOSWhenDisabled](self, "showsSOSWhenDisabled"), CFSTR("showsSOSWhenDisabled"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry sosAvailable](self, "sosAvailable"), CFSTR("sosAvailable"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry isBootstrapCellular](self, "isBootstrapCellular"), CFSTR("isBootstrapCellular"));
  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)STStatusBarDataCellularEntry;
  -[STStatusBarDataNetworkEntry _hashBuilder](&v17, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataCellularEntry type](self, "type"));
  -[STStatusBarDataCellularEntry string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendString:", v5);

  -[STStatusBarDataCellularEntry crossfadeString](self, "crossfadeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendString:", v7);

  -[STStatusBarDataCellularEntry badgeString](self, "badgeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendString:", v9);

  v11 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry wifiCallingEnabled](self, "wifiCallingEnabled"));
  v12 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry callForwardingEnabled](self, "callForwardingEnabled"));
  v13 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry showsSOSWhenDisabled](self, "showsSOSWhenDisabled"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry sosAvailable](self, "sosAvailable"));
  v15 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry isBootstrapCellular](self, "isBootstrapCellular"));
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
  v5.super_class = (Class)STStatusBarDataCellularEntry;
  v4 = a3;
  -[STStatusBarDataNetworkEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", *(_QWORD *)&self->_wifiCallingEnabled, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("string"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_string, CFSTR("crossfadeString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_crossfadeString, CFSTR("badgeString"));
  objc_msgSend(v4, "encodeBool:forKey:", LOBYTE(self->super._status), CFSTR("wifiCallingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE1(self->super._status), CFSTR("callForwardingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE2(self->super._status), CFSTR("showsSOSWhenDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE3(self->super._status), CFSTR("sosAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE4(self->super._status), CFSTR("isBootstrapCellular"));

}

- (STStatusBarDataCellularEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataCellularEntry *v5;
  uint64_t v6;
  void *type;
  uint64_t v8;
  NSString *string;
  uint64_t v10;
  NSString *crossfadeString;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataCellularEntry;
  v5 = -[STStatusBarDataNetworkEntry initWithBSXPCCoder:](&v13, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    *(_QWORD *)&v5->_wifiCallingEnabled = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("string"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = (void *)v5->_type;
    v5->_type = v6;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("crossfadeString"));
    v8 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v8;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("badgeString"));
    v10 = objc_claimAutoreleasedReturnValue();
    crossfadeString = v5->_crossfadeString;
    v5->_crossfadeString = (NSString *)v10;

    LOBYTE(v5->super._status) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wifiCallingEnabled"));
    BYTE1(v5->super._status) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("callForwardingEnabled"));
    BYTE2(v5->super._status) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsSOSWhenDisabled"));
    BYTE3(v5->super._status) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sosAvailable"));
    BYTE4(v5->super._status) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBootstrapCellular"));
  }

  return v5;
}

@end
