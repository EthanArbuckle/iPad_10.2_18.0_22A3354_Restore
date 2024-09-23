@implementation STStatusBarDataVoiceControlEntry

+ (id)entryWithType:(int64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return v4;
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
  v5.super_class = (Class)STStatusBarDataVoiceControlEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (STStatusBarDataVoiceControlEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataVoiceControlEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v7.receiver, v7.super_class);

  v4->_type = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusBarDataVoiceControlEntry type](self, "type");
  if (v4 > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E91E5A50[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataVoiceControlEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v13, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataVoiceControlEntry type](self, "type");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__STStatusBarDataVoiceControlEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E91E58B0;
  v12 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v11);

  return v5;
}

uint64_t __61__STStatusBarDataVoiceControlEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataVoiceControlEntry;
  -[STStatusBarDataEntry _hashBuilder](&v6, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataVoiceControlEntry type](self, "type"));
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
  v5.super_class = (Class)STStatusBarDataVoiceControlEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (STStatusBarDataVoiceControlEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataVoiceControlEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end
