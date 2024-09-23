@implementation STTelephonyStatusDomainSIMInfoDiff

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
    v7.super_class = (Class)STTelephonyStatusDomainSIMInfoDiff;
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

- (void)applyToMutableInfo:(id)a3
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
  v12[2] = __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke;
  v12[3] = &unk_1E91E4D50;
  v7 = v4;
  v13 = v7;
  v8 = changes;
  -[BSSettings enumerateFlagsWithBlock:](v8, "enumerateFlagsWithBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke_2;
  v10[3] = &unk_1E91E4A88;
  v11 = v7;
  v9 = v7;
  -[BSSettings enumerateObjectsWithBlock:](v8, "enumerateObjectsWithBlock:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

+ (id)diffFromInfo:(id)a3 toInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  _QWORD *v33;
  uint64_t v35;
  void *v36;
  void *v37;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v8 = objc_msgSend(v6, "isSIMPresent");
  if (v8 != objc_msgSend(v5, "isSIMPresent"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 0);
  v9 = objc_msgSend(v6, "isBootstrap");
  if (v9 != objc_msgSend(v5, "isBootstrap"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
  objc_msgSend(v6, "label");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
  {
    if (v10)
    {
      objc_msgSend(v7, "setObject:forSetting:", v10, 2);
    }
    else if (v11)
    {
      objc_msgSend(v7, "setFlag:forSetting:", 0, 2);
    }
  }
  objc_msgSend(v6, "shortLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", v12) & 1) == 0)
  {
    if (v12)
    {
      objc_msgSend(v7, "setObject:forSetting:", v12, 3);
    }
    else if (v13)
    {
      objc_msgSend(v7, "setFlag:forSetting:", 0, 3);
    }
  }
  v37 = v11;
  v14 = objc_msgSend(v6, "signalStrengthBars");
  if (objc_msgSend(v5, "signalStrengthBars") != v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v15, 4);

  }
  v16 = objc_msgSend(v6, "maxSignalStrengthBars");
  if (objc_msgSend(v5, "maxSignalStrengthBars") != v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v17, 5);

  }
  v18 = objc_msgSend(v6, "serviceState");
  if (objc_msgSend(v5, "serviceState") != v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v19, 6);

  }
  v20 = objc_msgSend(v6, "cellularServiceState");
  if (objc_msgSend(v5, "cellularServiceState") != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v21, 7);

  }
  objc_msgSend(v6, "serviceDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqualToString:", v22) & 1) == 0)
  {
    if (v22)
    {
      objc_msgSend(v7, "setObject:forSetting:", v22, 8);
    }
    else if (v23)
    {
      objc_msgSend(v7, "setFlag:forSetting:", 0, 8);
    }
  }
  objc_msgSend(v6, "secondaryServiceDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryServiceDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", v24) & 1) == 0)
  {
    if (v24)
    {
      objc_msgSend(v7, "setObject:forSetting:", v24, 9);
    }
    else if (v25)
    {
      objc_msgSend(v7, "setFlag:forSetting:", 0, 9);
    }
  }
  v35 = v10;
  v26 = v13;
  v27 = objc_msgSend(v6, "dataNetworkType", v35);
  if (objc_msgSend(v5, "dataNetworkType") != v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v28, 10);

  }
  v29 = objc_msgSend(v6, "isProvidingDataConnection");
  if (v29 != objc_msgSend(v5, "isProvidingDataConnection"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 11);
  v30 = objc_msgSend(v6, "isPreferredForDataConnections");
  if (v30 != objc_msgSend(v5, "isPreferredForDataConnections"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 12);
  v31 = objc_msgSend(v6, "isRegisteredWithoutCellular");
  if (v31 != objc_msgSend(v5, "isRegisteredWithoutCellular"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 13);
  v32 = objc_msgSend(v6, "isCallForwardingEnabled");
  if (v32 != objc_msgSend(v5, "isCallForwardingEnabled"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 14);
  v33 = -[STTelephonyStatusDomainSIMInfoDiff initWithChanges:]([STTelephonyStatusDomainSIMInfoDiff alloc], v7);

  return v33;
}

- (STTelephonyStatusDomainSIMInfoDiff)init
{
  id v3;
  STTelephonyStatusDomainSIMInfoDiff *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = (STTelephonyStatusDomainSIMInfoDiff *)-[STTelephonyStatusDomainSIMInfoDiff initWithChanges:](self, v3);

  return v4;
}

- (id)infoByApplyingToInfo:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STTelephonyStatusDomainSIMInfoDiff applyToMutableInfo:](self, "applyToMutableInfo:", v4);
  return v4;
}

uint64_t __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  switch(a2)
  {
    case 0:
      result = objc_msgSend(*(id *)(result + 32), "setSIMPresent:", BSSettingFlagIsYes());
      break;
    case 1:
      result = objc_msgSend(*(id *)(result + 32), "setBootstrap:", BSSettingFlagIsYes());
      break;
    case 2:
      result = BSSettingFlagIsExplicitNo();
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(v2 + 32), "setLabel:", 0);
      break;
    case 3:
      result = BSSettingFlagIsExplicitNo();
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(v2 + 32), "setShortLabel:", 0);
      break;
    case 8:
      result = BSSettingFlagIsExplicitNo();
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(v2 + 32), "setServiceDescription:", 0);
      break;
    case 9:
      result = BSSettingFlagIsExplicitNo();
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(v2 + 32), "setSecondaryServiceDescription:", 0);
      break;
    case 11:
      result = objc_msgSend(*(id *)(result + 32), "setProvidingDataConnection:", BSSettingFlagIsYes());
      break;
    case 12:
      result = objc_msgSend(*(id *)(result + 32), "setPreferredForDataConnections:", BSSettingFlagIsYes());
      break;
    case 13:
      result = objc_msgSend(*(id *)(result + 32), "setRegisteredWithoutCellular:", BSSettingFlagIsYes());
      break;
    case 14:
      result = objc_msgSend(*(id *)(result + 32), "setCallForwardingEnabled:", BSSettingFlagIsYes());
      break;
    default:
      return result;
  }
  return result;
}

void __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  switch(a2)
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "setLabel:", v5);
      goto LABEL_11;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "setShortLabel:", v5);
      goto LABEL_11;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "setSignalStrengthBars:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "setMaxSignalStrengthBars:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "setServiceState:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "setCellularServiceState:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "setServiceDescription:", v5);
      goto LABEL_11;
    case 9:
      objc_msgSend(*(id *)(a1 + 32), "setSecondaryServiceDescription:", v5);
      goto LABEL_11;
    case 10:
      objc_msgSend(*(id *)(a1 + 32), "setDataNetworkType:", objc_msgSend(v5, "unsignedIntegerValue"));
LABEL_11:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (BOOL)isEmpty
{
  if (self)
    self = (STTelephonyStatusDomainSIMInfoDiff *)self->_changes;
  return -[STTelephonyStatusDomainSIMInfoDiff isEmpty](self, "isEmpty");
}

- (id)diffByApplyingDiff:(id)a3
{
  _QWORD *v4;
  BSSettings *changes;
  BSSettings *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      changes = self->_changes;
    else
      changes = 0;
    v6 = changes;
    v7 = (void *)-[BSSettings mutableCopy](v6, "mutableCopy");
    if (v4)
      v8 = (void *)v4[1];
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v7, "applySettings:", v9);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 2, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 3, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 8, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 9, v6);

    v10 = -[STTelephonyStatusDomainSIMInfoDiff initWithChanges:]([STTelephonyStatusDomainSIMInfoDiff alloc], v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_resolveCombinedChanges:(uint64_t)a3 forObjectEntry:(void *)a4 baseChanges:
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a4;
  objc_opt_self();
  if (!objc_msgSend(v8, "flagForSetting:", a3))
  {
    objc_msgSend(v8, "objectForSetting:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v6, "flagForSetting:", a3))
        objc_msgSend(v8, "setObject:forSetting:", 0, a3);
      else
        objc_msgSend(v8, "setFlag:forSetting:", 0x7FFFFFFFFFFFFFFFLL, a3);
    }
  }

}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STTelephonyStatusDomainSIMInfoDiff isEmpty](self, "isEmpty"))
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
    self = (STTelephonyStatusDomainSIMInfoDiff *)self->_changes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__STTelephonyStatusDomainSIMInfoDiff_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v10);
  v8 = objc_msgSend(v5, "isEqual");

  return v8;
}

id __46__STTelephonyStatusDomainSIMInfoDiff_isEqual___block_invoke(uint64_t a1)
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
  return (NSString *)-[STTelephonyStatusDomainSIMInfoDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
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

- (STTelephonyStatusDomainSIMInfoDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STTelephonyStatusDomainSIMInfoDiff *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (STTelephonyStatusDomainSIMInfoDiff *)-[STTelephonyStatusDomainSIMInfoDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyStatusDomainSIMInfoDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STTelephonyStatusDomainSIMInfoDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStatusDomainSIMInfoDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
  void *v8;
  _QWORD v10[5];
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E91E4AD8;
    v10[4] = v3;
    v7 = v6;
    v11 = v7;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

    v8 = v11;
    v3 = v7;

  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STTelephonyStatusDomainSIMInfoDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 8);
  else
    v3 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
  v8[3] = &unk_1E91E4D50;
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v5, "enumerateFlagsWithBlock:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_3;
  v6[3] = &unk_1E91E4A88;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsWithBlock:", v6);

}

id *__86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(id *result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 <= 0xE && ((0x7803u >> a2) & 1) != 0)
    return (id *)(id)objc_msgSend(result[4], "appendFlag:withName:", a3, off_1E91E4D70[a2], v3, v4);
  return result;
}

void __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  id v17;

  v5 = a3;
  v6 = v5;
  v17 = v5;
  switch(a2)
  {
    case 2:
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v5, CFSTR("label"));
      goto LABEL_13;
    case 4:
      v8 = *(void **)(a1 + 32);
      v9 = objc_msgSend(v5, "unsignedIntegerValue");
      v10 = CFSTR("signalStrengthBars");
      goto LABEL_5;
    case 5:
      v8 = *(void **)(a1 + 32);
      v9 = objc_msgSend(v5, "unsignedIntegerValue");
      v10 = CFSTR("maxignalStrengthBars");
LABEL_5:
      v11 = (id)objc_msgSend(v8, "appendUnsignedInteger:withName:", v9, v10);
      goto LABEL_13;
    case 6:
      v12 = *(void **)(a1 + 32);
      STDescriptionForServiceState(objc_msgSend(v5, "unsignedIntegerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("serviceState");
      goto LABEL_12;
    case 7:
      v12 = *(void **)(a1 + 32);
      STDescriptionForServiceState(objc_msgSend(v5, "unsignedIntegerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("cellServiceState");
      goto LABEL_12;
    case 8:
      v15 = *(void **)(a1 + 32);
      v16 = CFSTR("serviceDescription");
      goto LABEL_10;
    case 9:
      v15 = *(void **)(a1 + 32);
      v16 = CFSTR("secondaryServiceDescription");
LABEL_10:
      objc_msgSend(v15, "appendString:withName:", v17, v16);
      goto LABEL_13;
    case 10:
      v12 = *(void **)(a1 + 32);
      STDescriptionForDataNetworkType(objc_msgSend(v5, "unsignedIntegerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("dataNetworkType");
LABEL_12:
      objc_msgSend(v12, "appendString:withName:", v13, v14);

LABEL_13:
      v6 = v17;
      break;
    default:
      break;
  }

}

@end
