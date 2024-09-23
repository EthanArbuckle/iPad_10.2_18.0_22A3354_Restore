@implementation TPSDeliveryPrecondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (TPSDeliveryPrecondition)initWithDictionary:(id)a3
{
  id v4;
  TPSDeliveryPrecondition *v5;
  TPSDeliveryPrecondition *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSArray *conditions;
  uint64_t v18;
  NSString *label;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TPSDeliveryPrecondition;
  v5 = -[TPSSerializableObject initWithDictionary:](&v25, sel_initWithDictionary_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_statusType = 0;
    if (objc_msgSend(v4, "TPSSafeIntegerForKey:", CFSTR("statusType")) == 1)
      v6->_statusType = 1;
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("joinType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_joinType = 0;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("OR")))
      v6->_joinType = 1;
    objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("conditions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          +[TPSCondition conditionFromDictionary:](TPSCondition, "conditionFromDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(v9, "copy");
    conditions = v6->_conditions;
    v6->_conditions = (NSArray *)v16;

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("label"));
    v18 = objc_claimAutoreleasedReturnValue();
    label = v6->_label;
    v6->_label = (NSString *)v18;

  }
  return v6;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (id)registrableEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSDeliveryPrecondition conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[TPSDeliveryPrecondition conditions](self, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__TPSDeliveryPrecondition_registrableEvents__block_invoke;
  v8[3] = &unk_1EA1E0848;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  if (objc_msgSend((id)v10[5], "count"))
    v6 = (void *)objc_msgSend((id)v10[5], "copy");
  else
    v6 = 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__TPSDeliveryPrecondition_registrableEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = a2;
  if (objc_msgSend(v4, "type") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "values");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __44__TPSDeliveryPrecondition_registrableEvents__block_invoke_2;
      v5[3] = &unk_1EA1E0820;
      v5[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

    }
  }

}

void __44__TPSDeliveryPrecondition_registrableEvents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "type") == 2
    && (objc_msgSend(v10, "key"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ContextualEvent")),
        v3,
        v4))
  {
    +[TPSCustomCapabilityValidationBuilder targetValidationForCapability:](TPSCustomCapabilityValidationBuilder, "targetValidationForCapability:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "isRegistrable"))
  {
    objc_msgSend(v10, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSContextualEventValidation contextualEventFromEventDictionary:](TPSContextualEventValidation, "contextualEventFromEventDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v9);

    }
  }

}

- (id)conditionsForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (a3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    v5 = (void *)MEMORY[0x1E0C99DE8];
    -[TPSDeliveryPrecondition conditions](self, "conditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[TPSDeliveryPrecondition conditions](self, "conditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__TPSDeliveryPrecondition_conditionsForType___block_invoke;
    v10[3] = &unk_1EA1E0870;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    if (objc_msgSend((id)v12[5], "count"))
      v8 = (void *)objc_msgSend((id)v12[5], "copy");
    else
      v8 = 0;
    _Block_object_dispose(&v11, 8);

    return v8;
  }
  else
  {
    -[TPSDeliveryPrecondition conditions](self, "conditions");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __45__TPSDeliveryPrecondition_conditionsForType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "targetingValidationsForType:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setStatusType:", self->_statusType);
  objc_msgSend(v4, "setJoinType:", self->_joinType);
  v5 = (void *)-[NSArray copy](self->_conditions, "copy");
  objc_msgSend(v4, "setConditions:", v5);

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSDeliveryPrecondition;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ = %zd\n"), CFSTR("statusType"), -[TPSDeliveryPrecondition statusType](self, "statusType"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %zd\n"), CFSTR("joinType"), -[TPSDeliveryPrecondition joinType](self, "joinType"));
  -[TPSDeliveryPrecondition conditions](self, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("conditions"), v7);

  return v5;
}

- (void)setStatusType:(int64_t)a3
{
  self->_statusType = a3;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (void)setConditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
