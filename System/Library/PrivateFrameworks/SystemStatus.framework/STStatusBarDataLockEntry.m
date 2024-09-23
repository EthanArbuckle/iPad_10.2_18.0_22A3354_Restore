@implementation STStatusBarDataLockEntry

+ (STStatusBarDataLockEntry)entryWithUnlockFailureCount:(int64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return (STStatusBarDataLockEntry *)v4;
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
  v5.super_class = (Class)STStatusBarDataLockEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_unlockFailureCount, CFSTR("unlockFailureCount"), v5.receiver, v5.super_class);

}

- (STStatusBarDataLockEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataLockEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataLockEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("unlockFailureCount"), v7.receiver, v7.super_class);

  v4->_unlockFailureCount = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataLockEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataLockEntry unlockFailureCount](self, "unlockFailureCount"), CFSTR("unlockFailureCount"));
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
  v13.super_class = (Class)STStatusBarDataLockEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v13, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STStatusBarDataLockEntry unlockFailureCount](self, "unlockFailureCount");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__STStatusBarDataLockEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E91E58B0;
  v12 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v11);

  return v5;
}

uint64_t __53__STStatusBarDataLockEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockFailureCount");
}

- (id)_hashBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataLockEntry;
  -[STStatusBarDataEntry _hashBuilder](&v6, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataLockEntry unlockFailureCount](self, "unlockFailureCount"));
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
  v5.super_class = (Class)STStatusBarDataLockEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_unlockFailureCount, CFSTR("unlockFailureCount"), v5.receiver, v5.super_class);

}

- (STStatusBarDataLockEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataLockEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataLockEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
    v5->_unlockFailureCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("unlockFailureCount"));

  return v5;
}

- (int64_t)unlockFailureCount
{
  return self->_unlockFailureCount;
}

@end
