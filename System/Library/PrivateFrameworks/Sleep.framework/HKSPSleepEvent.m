@implementation HKSPSleepEvent

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4
{
  return (id)objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:context:", a3, a4, 0);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 900.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:context:type:expirationDate:isUserVisible:", v10, v9, v8, 0, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:type:isUserVisible:", a3, a4, a5, 1);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 isUserVisible:(BOOL)a5
{
  return (id)objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:type:isUserVisible:", a3, a4, 0, a5);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 isUserVisible:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "dateByAddingTimeInterval:", 900.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:type:expirationDate:isUserVisible:", v11, v10, a5, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 expirationDate:(id)a5 isUserVisible:(BOOL)a6
{
  return (id)objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:type:expirationDate:isUserVisible:", a3, a4, 0, a5, a6);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 expirationDate:(id)a6 isUserVisible:(BOOL)a7
{
  return (id)objc_msgSend(a1, "sleepEventWithIdentifier:dueDate:context:type:expirationDate:isUserVisible:", a3, a4, 0, a5, a6, a7);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v8 = a8;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:dueDate:context:type:expirationDate:isUserVisible:", v16, v15, v14, a6, v13, v8);

  return v17;
}

- (HKSPSleepEvent)initWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKSPSleepEvent *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSDictionary *context;
  HKSPSleepEvent *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HKSPSleepEvent;
  v18 = -[HKSPSleepEvent init](&v25, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_dueDate, a4);
    v21 = objc_msgSend(v16, "copy");
    context = v18->_context;
    v18->_context = (NSDictionary *)v21;

    objc_storeStrong((id *)&v18->_expirationDate, a7);
    v18->_isUserVisible = a8;
    v18->_type = a6;
    v23 = v18;
  }

  return v18;
}

- (BOOL)isExpired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HKSPSleepEvent expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKSPSleepEvent expirationDate](self, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4;
  HKSPSleepEvent *v5;
  uint64_t v6;
  HKSPSyncAnchor *syncAnchor;

  v4 = a3;
  v5 = -[HKSPSleepEvent initWithIdentifier:dueDate:context:type:expirationDate:isUserVisible:]([HKSPSleepEvent alloc], "initWithIdentifier:dueDate:context:type:expirationDate:isUserVisible:", self->_identifier, self->_dueDate, self->_context, self->_type, self->_expirationDate, self->_isUserVisible);
  v6 = objc_msgSend(v4, "copyWithZone:", 0);

  syncAnchor = v5->_syncAnchor;
  v5->_syncAnchor = (HKSPSyncAnchor *)v6;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[HKSPSleepEvent dueDate](self, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  HKSPSleepEvent *v4;
  HKSPSleepEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPSleepEvent *v9;
  id v10;
  void *v11;
  HKSPSleepEvent *v12;
  id v13;
  void *v14;
  HKSPSleepEvent *v15;
  id v16;
  void *v17;
  HKSPSleepEvent *v18;
  id v19;
  _BOOL8 v20;
  HKSPSleepEvent *v21;
  id v22;
  unint64_t v23;
  HKSPSleepEvent *v24;
  id v25;
  char v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  HKSPSleepEvent *v32;
  _QWORD v33[4];
  HKSPSleepEvent *v34;
  _QWORD v35[4];
  HKSPSleepEvent *v36;
  _QWORD v37[4];
  HKSPSleepEvent *v38;
  _QWORD v39[4];
  HKSPSleepEvent *v40;
  _QWORD v41[4];
  HKSPSleepEvent *v42;

  v4 = (HKSPSleepEvent *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEvent identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __26__HKSPSleepEvent_isEqual___block_invoke;
      v41[3] = &unk_1E4E3B360;
      v9 = v5;
      v42 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", v7, v41);

      -[HKSPSleepEvent dueDate](self, "dueDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v8;
      v39[1] = 3221225472;
      v39[2] = __26__HKSPSleepEvent_isEqual___block_invoke_2;
      v39[3] = &unk_1E4E3B388;
      v12 = v9;
      v40 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", v11, v39);

      -[HKSPSleepEvent context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v8;
      v37[1] = 3221225472;
      v37[2] = __26__HKSPSleepEvent_isEqual___block_invoke_3;
      v37[3] = &unk_1E4E3B0F8;
      v15 = v12;
      v38 = v15;
      v16 = (id)objc_msgSend(v6, "appendObject:counterpart:", v14, v37);

      -[HKSPSleepEvent expirationDate](self, "expirationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v8;
      v35[1] = 3221225472;
      v35[2] = __26__HKSPSleepEvent_isEqual___block_invoke_4;
      v35[3] = &unk_1E4E3B388;
      v18 = v15;
      v36 = v18;
      v19 = (id)objc_msgSend(v6, "appendObject:counterpart:", v17, v35);

      v20 = -[HKSPSleepEvent isUserVisible](self, "isUserVisible");
      v33[0] = v8;
      v33[1] = 3221225472;
      v33[2] = __26__HKSPSleepEvent_isEqual___block_invoke_5;
      v33[3] = &unk_1E4E3B3B0;
      v21 = v18;
      v34 = v21;
      v22 = (id)objc_msgSend(v6, "appendBool:counterpart:", v20, v33);
      v23 = -[HKSPSleepEvent type](self, "type");
      v28 = v8;
      v29 = 3221225472;
      v30 = __26__HKSPSleepEvent_isEqual___block_invoke_6;
      v31 = &unk_1E4E3B3D8;
      v32 = v21;
      v24 = v21;
      v25 = (id)objc_msgSend(v6, "appendUnsignedInteger:counterpart:", v23, &v28);
      v26 = objc_msgSend(v6, "isEqual", v28, v29, v30, v31);

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier");
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dueDate");
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "context");
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "expirationDate");
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUserVisible");
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUserVisible, CFSTR("isUserVisible"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncAnchor, CFSTR("syncAnchor"));

}

- (HKSPSleepEvent)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *dueDate;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *context;
  uint64_t v15;
  NSDate *expirationDate;
  uint64_t v17;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepEvent *v19;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKSPSleepEvent;
  v5 = -[HKSPSleepEvent init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("context"));
    v13 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    v5->_isUserVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUserVisible"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKSPSyncAnchorClass(), CFSTR("syncAnchor"));
    v17 = objc_claimAutoreleasedReturnValue();
    syncAnchor = v5->_syncAnchor;
    v5->_syncAnchor = (HKSPSyncAnchor *)v17;

    v19 = v5;
  }

  return v5;
}

+ (id)standardEventIdentifiers
{
  if (qword_1ED05F1F0 != -1)
    dispatch_once(&qword_1ED05F1F0, &__block_literal_global_229);
  return (id)_MergedGlobals_9;
}

void __42__HKSPSleepEvent_standardEventIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("HKSPSleepEventIdentifierWakeUp");
  v4[1] = CFSTR("HKSPSleepEventIdentifierBedtime");
  v4[2] = CFSTR("HKSPSleepEventIdentifierWindDown");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v2;

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[HKSPSleepEvent dueDate](self, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[HKSPSleepEvent context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[HKSPSleepEvent expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = (id)objc_msgSend(v3, "appendBool:", -[HKSPSleepEvent isUserVisible](self, "isUserVisible"));
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[HKSPSleepEvent type](self, "type"));
  v14 = objc_msgSend(v3, "hash");

  return v14;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  -[HKSPSleepEvent dueDate](self, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hkspDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("dueDate"));

  -[HKSPSleepEvent context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("context"), 1);

  -[HKSPSleepEvent expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hkspDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v11, CFSTR("expirationDate"), 1);

  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepEvent isUserVisible](self, "isUserVisible"), CFSTR("isUserVisible"));
  if (-[HKSPSleepEvent type](self, "type"))
    v14 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HKSPSleepEvent type](self, "type"), CFSTR("type"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (NSDictionary)context
{
  return self->_context;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
}

@end
