@implementation STCallingStatusDomainData

- (STCallingStatusDomainData)init
{
  STListData *v3;
  STCallingStatusDomainData *v4;

  v3 = objc_alloc_init(STListData);
  v4 = -[STCallingStatusDomainData initWithCallDescriptorListData:](self, "initWithCallDescriptorListData:", v3);

  return v4;
}

- (STCallingStatusDomainData)initWithData:(id)a3
{
  void *v4;
  STCallingStatusDomainData *v5;

  objc_msgSend(a3, "callDescriptorListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STCallingStatusDomainData initWithCallDescriptorListData:](self, "initWithCallDescriptorListData:", v4);

  return v5;
}

- (STCallingStatusDomainData)initWithCallDescriptorListData:(id)a3
{
  void *v4;
  STCallingStatusDomainData *v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[STCallingStatusDomainData _initWithCallDescriptorListData:](self, "_initWithCallDescriptorListData:", v4);

  return v5;
}

- (id)_initWithCallDescriptorListData:(id)a3
{
  id v5;
  STCallingStatusDomainData *v6;
  STCallingStatusDomainData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCallingStatusDomainData;
  v6 = -[STCallingStatusDomainData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_callDescriptorListData, a3);

  return v7;
}

- (NSArray)callDescriptors
{
  void *v2;
  void *v3;

  -[STCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSSet)activeCallAttributions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[3];
  int v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  -[STCallingStatusDomainData _activeAudioCallDescriptors](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__STCallingStatusDomainData_activeCallAttributions__block_invoke;
  v6[3] = &unk_1E91E5AD8;
  v6[4] = v7;
  objc_msgSend(v2, "bs_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v7, 8);
  return (NSSet *)v4;
}

- (id)_activeAudioCallDescriptors
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "callDescriptors");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bs_filter:", &__block_literal_global_17_0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

STActivityAttribution *__51__STCallingStatusDomainData_activeCallAttributions__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)ringingCallAttributions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[3];
  int v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  -[STCallingStatusDomainData _ringingAudioCallDescriptors](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__STCallingStatusDomainData_ringingCallAttributions__block_invoke;
  v6[3] = &unk_1E91E5AD8;
  v6[4] = v7;
  objc_msgSend(v2, "bs_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v7, 8);
  return (NSSet *)v4;
}

- (id)_ringingAudioCallDescriptors
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "callDescriptors");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bs_filter:", &__block_literal_global_18);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

STActivityAttribution *__52__STCallingStatusDomainData_ringingCallAttributions__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)activeVideoConferenceAttributions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[3];
  int v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  -[STCallingStatusDomainData _videoOrCopresenceCallDescriptorsWithCallState:](self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__STCallingStatusDomainData_activeVideoConferenceAttributions__block_invoke;
  v6[3] = &unk_1E91E5AD8;
  v6[4] = v7;
  objc_msgSend(v2, "bs_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v7, 8);
  return (NSSet *)v4;
}

- (id)_videoOrCopresenceCallDescriptorsWithCallState:(void *)a1
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!a1)
    return 0;
  objc_msgSend(a1, "callDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__STCallingStatusDomainData__videoOrCopresenceCallDescriptorsWithCallState___block_invoke;
  v6[3] = &__block_descriptor_40_e45_B16__0__STCallingStatusDomainCallDescriptor_8l;
  v6[4] = a2;
  objc_msgSend(v3, "bs_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

STActivityAttribution *__62__STCallingStatusDomainData_activeVideoConferenceAttributions__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)ringingVideoConferenceAttributions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[3];
  int v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  -[STCallingStatusDomainData _videoOrCopresenceCallDescriptorsWithCallState:](self, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__STCallingStatusDomainData_ringingVideoConferenceAttributions__block_invoke;
  v6[3] = &unk_1E91E5AD8;
  v6[4] = v7;
  objc_msgSend(v2, "bs_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v7, 8);
  return (NSSet *)v4;
}

STActivityAttribution *__63__STCallingStatusDomainData_ringingVideoConferenceAttributions__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__STCallingStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  LOBYTE(v6) = objc_msgSend(v5, "isEqual");
  return (char)v6;
}

uint64_t __37__STCallingStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callDescriptorListData");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (NSString)description
{
  return (NSString *)-[STCallingStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STCallingStatusDomainData initWithData:](+[STMutableCallingStatusDomainData allocWithZone:](STMutableCallingStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STCallingStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STCallingStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STCallingStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    objc_msgSend(a1, "callDescriptorListData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("callDescriptors"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STCallingStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STCallingStatusDomainDataDiff diffFromData:toData:](STCallingStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STCallingStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STCallingStatusDomainData mutableCopy](self, "mutableCopy");
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
  id v4;
  id v5;

  v4 = a3;
  -[STCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("callDescriptorListData"));

}

- (STCallingStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STCallingStatusDomainData *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callDescriptorListData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__STCallingStatusDomainData_initWithCoder___block_invoke_2;
  v10[3] = &unk_1E91E5B00;
  v10[4] = &v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  if (*((_BYTE *)v12 + 24))
    v7 = 0;
  else
    v7 = v6;
  _Block_object_dispose(&v11, 8);

  if (v7)
  {
    self = -[STCallingStatusDomainData initWithCallDescriptorListData:](self, "initWithCallDescriptorListData:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __43__STCallingStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

BOOL __56__STCallingStatusDomainData__activeAudioCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "callType"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "callState") == 0;

  return v3;
}

BOOL __57__STCallingStatusDomainData__ringingAudioCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "callType"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "callState") == 1;

  return v3;
}

BOOL __56__STCallingStatusDomainData__activeVideoCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "callType") == 1 && objc_msgSend(v2, "callState") == 0;

  return v3;
}

BOOL __76__STCallingStatusDomainData__videoOrCopresenceCallDescriptorsWithCallState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_msgSend(v3, "callType") == 1 || objc_msgSend(v3, "callType") == 2)
    && objc_msgSend(v3, "callState") == *(_QWORD *)(a1 + 32);

  return v4;
}

BOOL __57__STCallingStatusDomainData__ringingVideoCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "callType") == 1 && objc_msgSend(v2, "callState") == 1;

  return v3;
}

- (STListData)callDescriptorListData
{
  return self->_callDescriptorListData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDescriptorListData, 0);
}

@end
