@implementation STTelephonyStatusDomainData

- (STTelephonyStatusDomainSIMInfo)primarySIMInfo
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled"))
  {
    if (!self)
      goto LABEL_29;
    -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isSIMPresent")
      && objc_msgSend(v4, "isPreferredForDataConnections"))
    {
      v5 = v4;
    }
    else
    {
      -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isSIMPresent"))
        v5 = v7;
      else
        v5 = 0;

    }
    if (v5)
    {
      v8 = v5;
      v6 = v8;
LABEL_32:

      goto LABEL_33;
    }
    -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isSIMPresent"))
    {
      v10 = v9;
    }
    else
    {
      -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isSIMPresent"))
        v10 = v11;
      else
        v10 = 0;

    }
    if (v10)
    {
      v12 = v10;
      v6 = v12;
LABEL_31:

      v8 = 0;
      goto LABEL_32;
    }
    -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "serviceState") == 3)
    {
      v14 = v13;
    }
    else
    {
      -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v15, "serviceState") == 3 ? v15 : 0;

    }
    if (v14)
    {
      v16 = v14;
      v6 = v16;
    }
    else
    {
LABEL_29:
      v6 = v3;
      v16 = 0;
    }

    v12 = 0;
    goto LABEL_31;
  }
  v6 = v3;
LABEL_33:

  return (STTelephonyStatusDomainSIMInfo *)v6;
}

- (STTelephonyStatusDomainSIMInfo)SIMOneInfo
{
  return self->_SIMOneInfo;
}

- (BOOL)isCellularRadioCapabilityEnabled
{
  return self->_cellularRadioCapabilityEnabled;
}

- (STTelephonyStatusDomainSIMInfo)SIMTwoInfo
{
  return self->_SIMTwoInfo;
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isInactiveSOSEnabled");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUsingStewieForSOS");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isRadioModuleDead");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDualSIMEnabled");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCellularRadioCapabilityEnabled");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "SIMTwoInfo");
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "SIMOneInfo");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STTelephonyStatusDomainData initWithData:](+[STMutableTelephonyStatusDomainData allocWithZone:](STMutableTelephonyStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)isUsingStewieForSOS
{
  return self->_usingStewieForSOS;
}

- (BOOL)isRadioModuleDead
{
  return self->_radioModuleDead;
}

- (BOOL)isInactiveSOSEnabled
{
  return self->_inactiveSOSEnabled;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  _BOOL8 v19;
  id v20;
  id v21;
  _BOOL8 v22;
  id v23;
  id v24;
  _BOOL8 v25;
  id v26;
  id v27;
  _BOOL8 v28;
  id v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke;
  v49[3] = &unk_1E91E4EA8;
  v8 = v4;
  v50 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v49);

  -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_2;
  v47[3] = &unk_1E91E4EA8;
  v11 = v8;
  v48 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v47);

  v13 = -[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled");
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_3;
  v45[3] = &unk_1E91E4B28;
  v14 = v11;
  v46 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v45);
  v16 = -[STTelephonyStatusDomainData isDualSIMEnabled](self, "isDualSIMEnabled");
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_4;
  v43[3] = &unk_1E91E4B28;
  v17 = v14;
  v44 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", v16, v43);
  v19 = -[STTelephonyStatusDomainData isRadioModuleDead](self, "isRadioModuleDead");
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_5;
  v41[3] = &unk_1E91E4B28;
  v20 = v17;
  v42 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", v19, v41);
  v22 = -[STTelephonyStatusDomainData isUsingStewieForSOS](self, "isUsingStewieForSOS");
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_6;
  v39[3] = &unk_1E91E4B28;
  v23 = v20;
  v40 = v23;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", v22, v39);
  v25 = -[STTelephonyStatusDomainData isInactiveSOSEnabled](self, "isInactiveSOSEnabled");
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_7;
  v37[3] = &unk_1E91E4B28;
  v26 = v23;
  v38 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", v25, v37);
  v28 = -[STTelephonyStatusDomainData isUsingStewieConnection](self, "isUsingStewieConnection");
  v32 = v7;
  v33 = 3221225472;
  v34 = __39__STTelephonyStatusDomainData_isEqual___block_invoke_8;
  v35 = &unk_1E91E4B28;
  v36 = v26;
  v29 = v26;
  v30 = (id)objc_msgSend(v5, "appendBool:counterpart:", v28, &v32);
  LOBYTE(v26) = objc_msgSend(v5, "isEqual", v32, v33, v34, v35);

  return (char)v26;
}

- (BOOL)isDualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (id)initWithData:(void *)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "SIMOneInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SIMTwoInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isCellularRadioCapabilityEnabled");
    v7 = objc_msgSend(v3, "isDualSIMEnabled");
    v8 = objc_msgSend(v3, "isRadioModuleDead");
    v9 = objc_msgSend(v3, "isUsingStewieForSOS");
    v10 = objc_msgSend(v3, "isInactiveSOSEnabled");
    v11 = objc_msgSend(v3, "isUsingStewieConnection");

    v2 = -[STTelephonyStatusDomainData initWithSIMOneInfo:SIMTwoInfo:cellularRadioCapabilityEnabled:dualSIMEnabled:radioModuleDead:usingStewieForSOS:inactiveSOSEnabled:usingStewieConnection:](v2, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v2;
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STTelephonyStatusDomainDataDiff diffFromData:toData:](STTelephonyStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMTwoInfo, 0);
  objc_storeStrong((id *)&self->_SIMOneInfo, 0);
}

- (STTelephonyStatusDomainData)init
{
  return (STTelephonyStatusDomainData *)-[STTelephonyStatusDomainData initWithData:](self, 0);
}

- (id)initWithSIMOneInfo:(void *)a3 SIMTwoInfo:(char)a4 cellularRadioCapabilityEnabled:(char)a5 dualSIMEnabled:(char)a6 radioModuleDead:(char)a7 usingStewieForSOS:(char)a8 inactiveSOSEnabled:(char)a9 usingStewieConnection:
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  STTelephonyStatusDomainSIMInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  STTelephonyStatusDomainSIMInfo *v24;
  void *v25;
  objc_super v27;

  v16 = a2;
  v17 = a3;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)STTelephonyStatusDomainData;
    a1 = objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      v18 = (void *)objc_msgSend(v16, "copy");
      v19 = v18;
      if (v18)
        v20 = v18;
      else
        v20 = objc_alloc_init(STTelephonyStatusDomainSIMInfo);
      v21 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v20;

      v22 = (void *)objc_msgSend(v17, "copy");
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = objc_alloc_init(STTelephonyStatusDomainSIMInfo);
      v25 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v24;

      *((_BYTE *)a1 + 24) = a4;
      *((_BYTE *)a1 + 25) = a5;
      *((_BYTE *)a1 + 26) = a6;
      *((_BYTE *)a1 + 27) = a7;
      *((_BYTE *)a1 + 28) = a8;
      *((_BYTE *)a1 + 29) = a9;
    }
  }

  return a1;
}

- (STTelephonyStatusDomainSIMInfo)secondarySIMInfo
{
  STTelephonyStatusDomainData *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  STTelephonyStatusDomainData *v7;
  STTelephonyStatusDomainData *v9;

  v2 = self;
  if (!-[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled")
    || !-[STTelephonyStatusDomainData isDualSIMEnabled](v2, "isDualSIMEnabled"))
  {
    return (STTelephonyStatusDomainSIMInfo *)0;
  }
  -[STTelephonyStatusDomainData primarySIMInfo](v2, "primarySIMInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = v3;
    -[STTelephonyStatusDomainData SIMOneInfo](v2, "SIMOneInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v5)
    {
      -[STTelephonyStatusDomainData SIMTwoInfo](v2, "SIMTwoInfo");
      v7 = (STTelephonyStatusDomainData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (STTelephonyStatusDomainData *)v6;
    }
    v2 = v7;

  }
  if ((-[STTelephonyStatusDomainData isSIMPresent](v2, "isSIMPresent") & 1) != 0
    || -[STTelephonyStatusDomainData serviceState](v2, "serviceState") == 3)
  {
    v9 = v2;
  }
  else
  {
    v9 = 0;
  }

  return (STTelephonyStatusDomainSIMInfo *)v9;
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUsingStewieConnection");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled"));
  v9 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isDualSIMEnabled](self, "isDualSIMEnabled"));
  v10 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isRadioModuleDead](self, "isRadioModuleDead"));
  v11 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isUsingStewieForSOS](self, "isUsingStewieForSOS"));
  v12 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isInactiveSOSEnabled](self, "isInactiveSOSEnabled"));
  v13 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isUsingStewieConnection](self, "isUsingStewieConnection"));
  v14 = objc_msgSend(v3, "hash");

  return v14;
}

- (NSString)description
{
  return (NSString *)-[STTelephonyStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STTelephonyStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __79__STTelephonyStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STTelephonyStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __79__STTelephonyStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SIMOneInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("SIMOneInfo"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SIMTwoInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("SIMTwoInfo"));

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCellularRadioCapabilityEnabled"), CFSTR("cellularRadioCapabilityEnabled"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDualSIMEnabled"), CFSTR("dualSIMEnabled"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRadioModuleDead"), CFSTR("radioModuleDead"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieForSOS"), CFSTR("usingStewieForSOS"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInactiveSOSEnabled"), CFSTR("inactiveSOSEnabled"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieConnection"), CFSTR("usingStewieConnection"));
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
      v5 = (void *)-[STTelephonyStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STTelephonyStatusDomainData mutableCopy](self, "mutableCopy");
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
  void *v5;
  id v6;

  v6 = a3;
  -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("SIMOneInfo"));

  -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SIMTwoInfo"));

  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled"), CFSTR("cellularRadioCapabilityEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isDualSIMEnabled](self, "isDualSIMEnabled"), CFSTR("dualSIMEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isRadioModuleDead](self, "isRadioModuleDead"), CFSTR("radioModuleDead"));
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isUsingStewieForSOS](self, "isUsingStewieForSOS"), CFSTR("usingStewieForSOS"));
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isInactiveSOSEnabled](self, "isInactiveSOSEnabled"), CFSTR("inactiveSOSEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isUsingStewieConnection](self, "isUsingStewieConnection"), CFSTR("usingStewieConnection"));

}

- (STTelephonyStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  STTelephonyStatusDomainData *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SIMOneInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SIMTwoInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellularRadioCapabilityEnabled"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dualSIMEnabled"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("radioModuleDead"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usingStewieForSOS"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inactiveSOSEnabled"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usingStewieConnection"));

  v13 = (STTelephonyStatusDomainData *)-[STTelephonyStatusDomainData initWithSIMOneInfo:SIMTwoInfo:cellularRadioCapabilityEnabled:dualSIMEnabled:radioModuleDead:usingStewieForSOS:inactiveSOSEnabled:usingStewieConnection:](self, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (BOOL)isUsingStewieConnection
{
  return self->_usingStewieConnection;
}

@end
