@implementation STBatteryStatusDomainData

- (STBatteryStatusDomainData)init
{
  return (STBatteryStatusDomainData *)-[STBatteryStatusDomainData initWithData:](self, 0);
}

- (_QWORD)initWithData:(_QWORD *)a1
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "chargingState");
    v5 = objc_msgSend(v3, "percentCharge");
    v6 = objc_msgSend(v3, "isBatterySaverModeActive");
    objc_msgSend(v3, "chargingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "chargingDescriptionType");

    v2 = -[STBatteryStatusDomainData initWithChargingState:percentCharge:batterySaverModeActive:chargingDescription:chargingDescriptionType:](v2, v4, v5, v6, v7, v8);
  }
  return v2;
}

- (_QWORD)initWithChargingState:(uint64_t)a3 percentCharge:(char)a4 batterySaverModeActive:(void *)a5 chargingDescription:(uint64_t)a6 chargingDescriptionType:
{
  id v12;
  id v13;
  objc_super v15;

  v12 = a5;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)STBatteryStatusDomainData;
    v13 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v13;
    if (v13)
    {
      *((_QWORD *)v13 + 1) = a2;
      *((_QWORD *)v13 + 2) = a3;
      *((_BYTE *)v13 + 24) = a4;
      objc_storeStrong((id *)v13 + 4, a5);
      a1[5] = a6;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STBatteryStatusDomainData chargingState](self, "chargingState");
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke;
  v31[3] = &unk_1E91E5108;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v31);
  v10 = -[STBatteryStatusDomainData percentCharge](self, "percentCharge");
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_2;
  v29[3] = &unk_1E91E5108;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, v29);
  v13 = -[STBatteryStatusDomainData isBatterySaverModeActive](self, "isBatterySaverModeActive");
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_3;
  v27[3] = &unk_1E91E4B28;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v27);
  -[STBatteryStatusDomainData chargingDescription](self, "chargingDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_4;
  v25[3] = &unk_1E91E4B00;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v25);

  v19 = -[STBatteryStatusDomainData chargingDescriptionType](self, "chargingDescriptionType");
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_5;
  v23[3] = &unk_1E91E5108;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v19, v23);
  LOBYTE(v19) = objc_msgSend(v5, "isEqual");

  return v19;
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chargingState");
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "percentCharge");
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBatterySaverModeActive");
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chargingDescription");
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chargingDescriptionType");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData chargingState](self, "chargingState"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData percentCharge](self, "percentCharge"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[STBatteryStatusDomainData isBatterySaverModeActive](self, "isBatterySaverModeActive"));
  -[STBatteryStatusDomainData chargingDescription](self, "chargingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendString:", v7);

  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData chargingDescriptionType](self, "chargingDescriptionType"));
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (NSString)description
{
  return (NSString *)-[STBatteryStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STBatteryStatusDomainData initWithData:]((_QWORD *)+[STMutableBatteryStatusDomainData allocWithZone:](STMutableBatteryStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBatteryStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STBatteryStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBatteryStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__STBatteryStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBatteryStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

uint64_t __77__STBatteryStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "chargingState");
  if (v3 > 2)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E91E5FE0[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("chargingState"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "percentCharge"), CFSTR("percentCharge"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBatterySaverModeActive"), CFSTR("batterySaverModeActive"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "chargingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("chargingDescription"));

  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(*(id *)(a1 + 40), "chargingDescriptionType");
  if (v10 > 2)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E91E5FF8[v10];
  return objc_msgSend(v9, "appendString:withName:", v11, CFSTR("chargingDescriptionType"));
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STBatteryStatusDomainDataDiff diffFromData:toData:](STBatteryStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STBatteryStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STBatteryStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData chargingState](self, "chargingState"), CFSTR("chargingState"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData percentCharge](self, "percentCharge"), CFSTR("percentCharge"));
  objc_msgSend(v5, "encodeBool:forKey:", -[STBatteryStatusDomainData isBatterySaverModeActive](self, "isBatterySaverModeActive"), CFSTR("batterySaverModeActive"));
  -[STBatteryStatusDomainData chargingDescription](self, "chargingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("chargingDescription"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData chargingDescriptionType](self, "chargingDescriptionType"), CFSTR("chargingDescriptionType"));
}

- (STBatteryStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  STBatteryStatusDomainData *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("chargingState"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("percentCharge"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("batterySaverModeActive"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chargingDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("chargingDescriptionType"));

  v10 = (STBatteryStatusDomainData *)-[STBatteryStatusDomainData initWithChargingState:percentCharge:batterySaverModeActive:chargingDescription:chargingDescriptionType:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (unint64_t)chargingState
{
  return self->_chargingState;
}

- (unint64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isBatterySaverModeActive
{
  return self->_batterySaverModeActive;
}

- (NSString)chargingDescription
{
  return self->_chargingDescription;
}

- (unint64_t)chargingDescriptionType
{
  return self->_chargingDescriptionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingDescription, 0);
}

@end
