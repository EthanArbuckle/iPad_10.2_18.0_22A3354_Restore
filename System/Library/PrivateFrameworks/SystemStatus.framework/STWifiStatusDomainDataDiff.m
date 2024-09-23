@implementation STWifiStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  _QWORD *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v8 = objc_msgSend(v6, "isWifiActive");
  if (v8 != objc_msgSend(v5, "isWifiActive"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 0);
  v9 = objc_msgSend(v6, "signalStrengthBars");
  if (objc_msgSend(v5, "signalStrengthBars") != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v10, 1);

  }
  v11 = objc_msgSend(v6, "isAssociatedToIOSHotspot");
  if (v11 != objc_msgSend(v5, "isAssociatedToIOSHotspot"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 2);
  v12 = -[STWifiStatusDomainDataDiff initWithChanges:]([STWifiStatusDomainDataDiff alloc], v7);

  return v12;
}

- (_QWORD)initWithChanges:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STWifiStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (void)applyToMutableData:(id)a3
{
  id v4;
  BSSettings *changes;
  uint64_t v6;
  id v7;
  BSSettings *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__STWifiStatusDomainDataDiff_applyToMutableData___block_invoke;
  v12[3] = &unk_1E91E4D50;
  v7 = v4;
  v13 = v7;
  v8 = changes;
  -[BSSettings enumerateFlagsWithBlock:](v8, "enumerateFlagsWithBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__STWifiStatusDomainDataDiff_applyToMutableData___block_invoke_2;
  v10[3] = &unk_1E91E4A88;
  v11 = v7;
  v9 = v7;
  -[BSSettings enumerateObjectsWithBlock:](v8, "enumerateObjectsWithBlock:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

- (STWifiStatusDomainDataDiff)init
{
  id v3;
  STWifiStatusDomainDataDiff *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = (STWifiStatusDomainDataDiff *)-[STWifiStatusDomainDataDiff initWithChanges:](self, v3);

  return v4;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STWifiStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

uint64_t __49__STWifiStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "setAssociatedToIOSHotspot:", BSSettingFlagIsYes());
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setWifiActive:", BSSettingFlagIsYes());
  return result;
}

uint64_t __49__STWifiStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "setSignalStrengthBars:", objc_msgSend(a3, "unsignedIntegerValue"));
  return result;
}

- (BOOL)isEmpty
{
  if (self)
    self = (STWifiStatusDomainDataDiff *)self->_changes;
  return -[STWifiStatusDomainDataDiff isEmpty](self, "isEmpty");
}

- (id)diffByApplyingDiff:(id)a3
{
  _QWORD *v4;
  BSSettings *changes;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      changes = self->_changes;
    else
      changes = 0;
    v6 = (void *)-[BSSettings mutableCopy](changes, "mutableCopy");
    v7 = v6;
    if (v4)
      v8 = v4[1];
    else
      v8 = 0;
    objc_msgSend(v6, "applySettings:", v8);
    v9 = -[STWifiStatusDomainDataDiff initWithChanges:]([STWifiStatusDomainDataDiff alloc], v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STWifiStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (STWifiStatusDomainDataDiff *)self->_changes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__STWifiStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v10);
  v8 = objc_msgSend(v5, "isEqual");

  return v8;
}

id __38__STWifiStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  BSSettings *changes;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v6 = (id)objc_msgSend(v3, "appendObject:", changes);
  v7 = objc_msgSend(v4, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STWifiStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BSSettings *changes;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  objc_msgSend(a3, "encodeObject:forKey:", changes, CFSTR("changes"));
}

- (STWifiStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STWifiStatusDomainDataDiff *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (STWifiStatusDomainDataDiff *)-[STWifiStatusDomainDataDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STWifiStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STWifiStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STWifiStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(a1, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", a3);
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v7 = a1[1];
  if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v6, "activeMultilinePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__STWifiStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E91E4AD8;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v10);

  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STWifiStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

void __78__STWifiStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(*(id *)(a1 + 40), "flagForSetting:", 0), CFSTR("wifiActive"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(*(id *)(a1 + 40), "flagForSetting:", 2), CFSTR("associatedToIOSHotspot"), 1);
  objc_msgSend(*(id *)(a1 + 40), "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(v4, "unsignedIntegerValue"), CFSTR("signalStrengthBars"));
    v4 = v6;
  }

}

@end
