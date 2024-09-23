@implementation STStatusBarDataIntegerEntry

+ (id)entryWithRawValue:(int64_t)a3 displayValue:(int64_t)a4 displayRawValue:(BOOL)a5
{
  _QWORD *v8;

  v8 = objc_alloc_init((Class)a1);
  v8[2] = a3;
  v8[3] = a4;
  *((_BYTE *)v8 + 9) = a5;
  return v8;
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
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STStatusBarDataIntegerEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v24, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataIntegerEntry rawValue](self, "rawValue");
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke;
  v22[3] = &unk_1E91E58B0;
  v9 = v6;
  v23 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v22);
  v11 = -[STStatusBarDataIntegerEntry displayValue](self, "displayValue");
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_2;
  v20[3] = &unk_1E91E58B0;
  v12 = v9;
  v21 = v12;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v11, v20);
  v14 = -[STStatusBarDataIntegerEntry displayRawValue](self, "displayRawValue");
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_3;
  v18[3] = &unk_1E91E4B28;
  v19 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v5, "appendBool:counterpart:", v14, v18);

  return v5;
}

- (int64_t)displayValue
{
  return self->_rawValue;
}

- (int64_t)rawValue
{
  return *(_QWORD *)&self->_displayRawValue;
}

- (BOOL)displayRawValue
{
  return *(&self->super._enabled + 1);
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayRawValue");
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayValue");
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rawValue");
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
  v5.super_class = (Class)STStatusBarDataIntegerEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_displayRawValue, CFSTR("rawValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rawValue, CFSTR("displayValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("displayRawValue"));

}

- (STStatusBarDataIntegerEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataIntegerEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataIntegerEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  *(_QWORD *)&v4->_displayRawValue = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("rawValue"), v7.receiver, v7.super_class);
  v4->_rawValue = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("displayValue"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("displayRawValue"));

  *(&v4->super._enabled + 1) = v5 != 0;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataIntegerEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataIntegerEntry rawValue](self, "rawValue"), CFSTR("rawValue"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataIntegerEntry displayValue](self, "displayValue"), CFSTR("displayValue"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataIntegerEntry displayRawValue](self, "displayRawValue"), CFSTR("displayRawValue"));
  return v3;
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataIntegerEntry;
  -[STStatusBarDataEntry _hashBuilder](&v8, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataIntegerEntry rawValue](self, "rawValue"));
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataIntegerEntry displayValue](self, "displayValue"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataIntegerEntry displayRawValue](self, "displayRawValue"));
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
  v5.super_class = (Class)STStatusBarDataIntegerEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", *(_QWORD *)&self->_displayRawValue, CFSTR("rawValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_rawValue, CFSTR("displayValue"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("displayRawValue"));

}

- (STStatusBarDataIntegerEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataIntegerEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataIntegerEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    *(_QWORD *)&v5->_displayRawValue = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rawValue"));
    v5->_rawValue = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("displayValue"));
    *(&v5->super._enabled + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayRawValue"));
  }

  return v5;
}

@end
