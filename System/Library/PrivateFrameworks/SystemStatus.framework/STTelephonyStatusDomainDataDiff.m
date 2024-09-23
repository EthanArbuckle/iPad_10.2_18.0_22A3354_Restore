@implementation STTelephonyStatusDomainDataDiff

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableInfo:", a2);
}

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableInfo:", a2);
}

- (_QWORD)initWithSIMOneInfoDiff:(void *)a3 SIMTwoInfoDiff:(void *)a4 changes:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STTelephonyStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      v10 = objc_msgSend(v7, "copy");
      v11 = (void *)a1[1];
      a1[1] = v10;

      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)a1[2];
      a1[2] = v12;

      v14 = objc_msgSend(v9, "copy");
      v15 = (void *)a1[3];
      a1[3] = v14;

    }
  }

  return a1;
}

- (void)applyToMutableData:(id)a3
{
  id v4;
  uint64_t v5;
  STTelephonyStatusDomainSIMInfoDiff *v6;
  STTelephonyStatusDomainSIMInfoDiff *v7;
  STTelephonyStatusDomainSIMInfoDiff *v8;
  STTelephonyStatusDomainSIMInfoDiff *v9;
  STTelephonyStatusDomainDataDiff *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  STTelephonyStatusDomainSIMInfoDiff *v15;
  _QWORD v16[4];
  STTelephonyStatusDomainSIMInfoDiff *v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (self)
  {
    v6 = self->_SIMOneInfoDiff;
    v7 = v6;
    if (v6)
    {
      v16[0] = v5;
      v16[1] = 3221225472;
      v16[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke;
      v16[3] = &unk_1E91E5D08;
      v17 = v6;
      objc_msgSend(v4, "updateSIMOneInfoWithBlock:", v16);

    }
    v8 = self->_SIMTwoInfoDiff;
    v9 = v8;
    if (v8)
    {
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_2;
      v14[3] = &unk_1E91E5D08;
      v15 = v8;
      objc_msgSend(v4, "updateSIMTwoInfoWithBlock:", v14);

    }
    self = (STTelephonyStatusDomainDataDiff *)self->_changes;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_3;
  v12[3] = &unk_1E91E4D50;
  v13 = v4;
  v11 = v4;
  v10 = self;
  -[STTelephonyStatusDomainDataDiff enumerateFlagsWithBlock:](v10, "enumerateFlagsWithBlock:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_SIMTwoInfoDiff, 0);
  objc_storeStrong((id *)&self->_SIMOneInfoDiff, 0);
}

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _QWORD *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "SIMOneInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SIMOneInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:toInfo:](STTelephonyStatusDomainSIMInfoDiff, "diffFromInfo:toInfo:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "SIMTwoInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SIMTwoInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:toInfo:](STTelephonyStatusDomainSIMInfoDiff, "diffFromInfo:toInfo:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  LODWORD(v11) = objc_msgSend(v6, "isCellularRadioCapabilityEnabled");
  if ((_DWORD)v11 != objc_msgSend(v5, "isCellularRadioCapabilityEnabled"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 0);
  v14 = objc_msgSend(v6, "isDualSIMEnabled");
  if (v14 != objc_msgSend(v5, "isDualSIMEnabled"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
  v15 = objc_msgSend(v6, "isRadioModuleDead");
  if (v15 != objc_msgSend(v5, "isRadioModuleDead"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 2);
  v16 = objc_msgSend(v6, "isUsingStewieForSOS");
  if (v16 != objc_msgSend(v5, "isUsingStewieForSOS"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  v17 = objc_msgSend(v6, "isInactiveSOSEnabled");
  if (v17 != objc_msgSend(v5, "isInactiveSOSEnabled"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 4);
  v18 = objc_msgSend(v6, "isUsingStewieConnection");
  if (v18 != objc_msgSend(v5, "isUsingStewieConnection"))
    objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 5);
  v19 = -[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:]([STTelephonyStatusDomainDataDiff alloc], v9, v12, v13);

  return v19;
}

- (STTelephonyStatusDomainDataDiff)init
{
  STTelephonyStatusDomainSIMInfoDiff *v3;
  id v4;
  STTelephonyStatusDomainDataDiff *v5;

  v3 = objc_alloc_init(STTelephonyStatusDomainSIMInfoDiff);
  v4 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v5 = (STTelephonyStatusDomainDataDiff *)-[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:](self, v3, v3, v4);

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STTelephonyStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_3(uint64_t result, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      result = objc_msgSend(*(id *)(result + 32), "setCellularRadioCapabilityEnabled:", BSSettingFlagIsYes());
      break;
    case 1:
      result = objc_msgSend(*(id *)(result + 32), "setDualSIMEnabled:", BSSettingFlagIsYes());
      break;
    case 2:
      result = objc_msgSend(*(id *)(result + 32), "setRadioModuleDead:", BSSettingFlagIsYes());
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 32), "setUsingStewieForSOS:", BSSettingFlagIsYes());
      break;
    case 4:
      result = objc_msgSend(*(id *)(result + 32), "setInactiveSOSEnabled:", BSSettingFlagIsYes());
      break;
    case 5:
      result = objc_msgSend(*(id *)(result + 32), "setUsingStewieConnection:", BSSettingFlagIsYes());
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isEmpty
{
  STTelephonyStatusDomainSIMInfoDiff *SIMOneInfoDiff;
  STTelephonyStatusDomainSIMInfoDiff *v4;
  STTelephonyStatusDomainSIMInfoDiff *SIMTwoInfoDiff;
  STTelephonyStatusDomainSIMInfoDiff *v6;
  BSSettings *changes;
  char v8;

  if (self)
    SIMOneInfoDiff = self->_SIMOneInfoDiff;
  else
    SIMOneInfoDiff = 0;
  v4 = SIMOneInfoDiff;
  if (-[STTelephonyStatusDomainSIMInfoDiff isEmpty](v4, "isEmpty"))
  {
    if (self)
      SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
    else
      SIMTwoInfoDiff = 0;
    v6 = SIMTwoInfoDiff;
    if (-[STTelephonyStatusDomainSIMInfoDiff isEmpty](v6, "isEmpty"))
    {
      if (self)
        changes = self->_changes;
      else
        changes = 0;
      v8 = -[BSSettings isEmpty](changes, "isEmpty");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  STTelephonyStatusDomainSIMInfoDiff *SIMOneInfoDiff;
  uint64_t v8;
  STTelephonyStatusDomainSIMInfoDiff *v9;
  void *v10;
  STTelephonyStatusDomainSIMInfoDiff *SIMTwoInfoDiff;
  uint64_t v12;
  STTelephonyStatusDomainSIMInfoDiff *v13;
  void *v14;
  BSSettings *changes;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = v5;
  if (self)
  {
    SIMOneInfoDiff = self->_SIMOneInfoDiff;
    if (v5)
    {
LABEL_4:
      v8 = v5[1];
      goto LABEL_5;
    }
  }
  else
  {
    SIMOneInfoDiff = 0;
    if (v5)
      goto LABEL_4;
  }
  v8 = 0;
LABEL_5:
  v9 = SIMOneInfoDiff;
  -[STTelephonyStatusDomainSIMInfoDiff diffByApplyingDiff:](v9, "diffByApplyingDiff:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self)
  {
    SIMTwoInfoDiff = 0;
    if (v6)
      goto LABEL_7;
LABEL_18:
    v12 = 0;
    goto LABEL_8;
  }
  SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
  if (!v6)
    goto LABEL_18;
LABEL_7:
  v12 = v6[2];
LABEL_8:
  v13 = SIMTwoInfoDiff;
  -[STTelephonyStatusDomainSIMInfoDiff diffByApplyingDiff:](v13, "diffByApplyingDiff:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v16 = (void *)-[BSSettings mutableCopy](changes, "mutableCopy");
  v17 = v16;
  if (v6)
    v18 = v6[3];
  else
    v18 = 0;
  objc_msgSend(v16, "applySettings:", v18);
  v19 = -[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:]([STTelephonyStatusDomainDataDiff alloc], v10, v14, v17);

LABEL_14:
  return v19;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STTelephonyStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  STTelephonyStatusDomainSIMInfoDiff *SIMOneInfoDiff;
  uint64_t v7;
  id v8;
  id v9;
  STTelephonyStatusDomainSIMInfoDiff *SIMTwoInfoDiff;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    SIMOneInfoDiff = self->_SIMOneInfoDiff;
  else
    SIMOneInfoDiff = 0;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke;
  v21[3] = &unk_1E91E4AB0;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", SIMOneInfoDiff, v21);
  if (self)
    SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
  else
    SIMTwoInfoDiff = 0;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E4AB0;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", SIMTwoInfoDiff, v19);
  if (self)
    self = (STTelephonyStatusDomainDataDiff *)self->_changes;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E4AB0;
  v18 = v11;
  v13 = v11;
  v14 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v17);
  v15 = objc_msgSend(v5, "isEqual");

  return v15;
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 24);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STTelephonyStatusDomainSIMInfoDiff *SIMTwoInfoDiff;
  id v7;
  BSSettings *changes;
  id v9;
  unint64_t v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_SIMOneInfoDiff);
    SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
  }
  else
  {
    v12 = (id)objc_msgSend(v3, "appendObject:", 0);
    SIMTwoInfoDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", SIMTwoInfoDiff);
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v9 = (id)objc_msgSend(v4, "appendObject:", changes);
  v10 = objc_msgSend(v4, "hash");

  return v10;
}

- (NSString)description
{
  return (NSString *)-[STTelephonyStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BSSettings *changes;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_SIMOneInfoDiff, CFSTR("SIMOneInfoDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_SIMTwoInfoDiff, CFSTR("SIMTwoInfoDiff"));
    changes = self->_changes;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("SIMOneInfoDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("SIMTwoInfoDiff"));
    changes = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", changes, CFSTR("changes"));

}

- (STTelephonyStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STTelephonyStatusDomainDataDiff *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SIMOneInfoDiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SIMTwoInfoDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (STTelephonyStatusDomainDataDiff *)-[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:](self, v5, v6, v7);
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STTelephonyStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __83__STTelephonyStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STTelephonyStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __83__STTelephonyStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 8);
  else
    v4 = 0;
  v5 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v4, CFSTR("simOne"), 1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    v7 = *(_QWORD *)(v6 + 16);
  else
    v7 = 0;
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", v7, CFSTR("simTwo"), 1);
  v9 = *(_QWORD **)(a1 + 40);
  if (v9)
    v9 = (_QWORD *)v9[3];
  v16 = v9;
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 0), CFSTR("cellularRadioCapabilityEnabled"), 1);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 1), CFSTR("dualSIMEnabled"), 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 2), CFSTR("radioModuleDead"), 1);
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 3), CFSTR("usingStewieForSOS"), 1);
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 4), CFSTR("inactiveSOSEnabled"), 1);
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 5), CFSTR("usingStewieConnection"), 1);

}

@end
