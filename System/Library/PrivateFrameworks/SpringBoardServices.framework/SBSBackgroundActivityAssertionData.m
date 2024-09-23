@implementation SBSBackgroundActivityAssertionData

- (SBSBackgroundActivityAssertionData)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSBackgroundActivityAssertionData.m"), 55, CFSTR("use initWithBackgroundActivityIdentifiers:…"));

  return 0;
}

- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  SBSBackgroundActivityAssertionData *v14;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a3;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBSBackgroundActivityAssertionData initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:uniqueIdentifier:](self, "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:uniqueIdentifier:", v11, v8, v7, v6, v13);

  return v14;
}

- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6 uniqueIdentifier:(id)a7
{
  id v12;
  id v13;
  SBSBackgroundActivityAssertionData *v14;
  uint64_t v15;
  NSSet *backgroundActivityIdentifiers;
  uint64_t v17;
  NSString *uniqueIdentifier;
  objc_super v20;

  v12 = a3;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBSBackgroundActivityAssertionData;
  v14 = -[SBSBackgroundActivityAssertionData init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    backgroundActivityIdentifiers = v14->_backgroundActivityIdentifiers;
    v14->_backgroundActivityIdentifiers = (NSSet *)v15;

    v14->_pid = a4;
    v14->_exclusive = a5;
    v14->_showsWhenForeground = a6;
    v17 = objc_msgSend(v13, "copy");
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSString *)v17;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *backgroundActivityIdentifiers;
  void *v5;
  id v6;

  backgroundActivityIdentifiers = self->_backgroundActivityIdentifiers;
  v6 = a3;
  -[NSSet allObjects](backgroundActivityIdentifiers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("backgroundActivityIdentifiers"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_pid, CFSTR("pid"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_exclusive, CFSTR("exclusive"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_showsWhenForeground, CFSTR("showsWhenForeground"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_statusString, CFSTR("statusString"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));

}

- (SBSBackgroundActivityAssertionData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SBSBackgroundActivityAssertionData *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *uniqueIdentifier;
  void *v15;
  uint64_t v16;
  NSString *statusString;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("backgroundActivityIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pid"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("exclusive"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsWhenForeground"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBSBackgroundActivityAssertionData initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:uniqueIdentifier:](self, "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:uniqueIdentifier:", v9, v6, v7, v8, 0);

  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "copy");
      uniqueIdentifier = v10->_uniqueIdentifier;
      v10->_uniqueIdentifier = (NSString *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      statusString = v10->_statusString;
      v10->_statusString = (NSString *)v16;

    }
    else
    {
      v15 = v10;
      v10 = 0;
    }

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)-[SBSBackgroundActivityAssertionData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSBackgroundActivityAssertionData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSBackgroundActivityAssertionData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBSBackgroundActivityAssertionData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__SBSBackgroundActivityAssertionData_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E288D940;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __76__SBSBackgroundActivityAssertionData_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  soft_STBackgroundActivityIdentifiersDescription(objc_msgSend(*(id *)(a1 + 32), "backgroundActivityIdentifiers"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v7, CFSTR("backgroundActivityIdentifiers"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInt:withName:", objc_msgSend(*(id *)(a1 + 32), "pid"), CFSTR("pid"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "isExclusive"), CFSTR("exclusive"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "showsWhenForeground"), CFSTR("showsWhenForeground"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("identifier"));

}

- (NSSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)showsWhenForeground
{
  return self->_showsWhenForeground;
}

- (void)setShowsWhenForeground:(BOOL)a3
{
  self->_showsWhenForeground = a3;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
}

@end
