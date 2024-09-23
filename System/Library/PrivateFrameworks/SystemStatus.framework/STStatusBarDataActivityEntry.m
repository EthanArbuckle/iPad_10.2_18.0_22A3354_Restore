@implementation STStatusBarDataActivityEntry

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
  v19.super_class = (Class)STStatusBarDataActivityEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v19, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataActivityEntry type](self, "type");
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke;
  v17[3] = &unk_1E91E58B0;
  v9 = v6;
  v18 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v17);
  -[STStatusBarDataActivityEntry displayId](self, "displayId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke_2;
  v15[3] = &unk_1E91E4B00;
  v16 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendString:counterpart:", v11, v15);

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)displayId
{
  return self->_displayId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayId, 0);
}

+ (STStatusBarDataActivityEntry)entryWithType:(int64_t)a3 displayID:(id)a4
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

  return (STStatusBarDataActivityEntry *)v7;
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
  v5.super_class = (Class)STStatusBarDataActivityEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayId, CFSTR("displayId"));

}

- (STStatusBarDataActivityEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataActivityEntry *v4;
  uint64_t v5;
  NSString *displayId;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  v4->_type = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v8.receiver, v8.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayId"));
  v5 = objc_claimAutoreleasedReturnValue();

  displayId = v4->_displayId;
  v4->_displayId = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusBarDataActivityEntry type](self, "type");
  if (v4 > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E91E5A20[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  -[STStatusBarDataActivityEntry displayId](self, "displayId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v6, CFSTR("displayId"), 1);

  return v3;
}

uint64_t __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayId");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  -[STStatusBarDataEntry _hashBuilder](&v8, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataActivityEntry type](self, "type"));
  -[STStatusBarDataActivityEntry displayId](self, "displayId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendString:", v5);

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
  v5.super_class = (Class)STStatusBarDataActivityEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayId, CFSTR("displayId"));

}

- (STStatusBarDataActivityEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataActivityEntry *v5;
  uint64_t v6;
  NSString *displayId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataActivityEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("displayId"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayId = v5->_displayId;
    v5->_displayId = (NSString *)v6;

  }
  return v5;
}

@end
