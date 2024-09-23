@implementation STMediaStatusDomainData

- (STMediaStatusDomainData)init
{
  STListData *v3;
  STListData *v4;
  STListData *v5;
  STListData *v6;
  STMediaStatusDomainData *v7;

  v3 = objc_alloc_init(STListData);
  v4 = objc_alloc_init(STListData);
  v5 = objc_alloc_init(STListData);
  v6 = objc_alloc_init(STListData);
  v7 = -[STMediaStatusDomainData initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:](self, "initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:", v3, v4, v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STMediaStatusDomainData initWithData:](+[STMutableMediaStatusDomainData allocWithZone:](STMutableMediaStatusDomainData, "allocWithZone:", a3), self);
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STMediaStatusDomainDataDiff diffFromData:toData:](STMediaStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (STMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  STMediaStatusDomainData *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a3, "copy");
  v14 = (void *)objc_msgSend(v12, "copy");

  v15 = (void *)objc_msgSend(v11, "copy");
  v16 = (void *)objc_msgSend(v10, "copy");

  v17 = -[STMediaStatusDomainData _initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:](self, "_initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:", v13, v14, v15, v16);
  return v17;
}

- (id)_initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  STMediaStatusDomainData *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STMediaStatusDomainData;
  v15 = -[STMediaStatusDomainData init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_microphoneAttributionListData, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)initWithData:(void *)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "microphoneAttributionListData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mutedMicrophoneRecordingAttributionListData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemAudioRecordingAttributionListData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraAttributionListData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = (id)objc_msgSend(v2, "initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:", v4, v5, v6, v7);
  }
  return v2;
}

- (STListData)systemAudioRecordingAttributionListData
{
  return self->_systemAudioRecordingAttributionListData;
}

- (NSArray)microphoneAttributions
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (STListData)microphoneAttributionListData
{
  return self->_microphoneAttributionListData;
}

- (NSArray)mutedMicrophoneRecordingAttributions
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (STListData)mutedMicrophoneRecordingAttributionListData
{
  return self->_mutedMicrophoneRecordingAttributionListData;
}

- (NSArray)cameraAttributions
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (STListData)cameraAttributionListData
{
  return self->_cameraAttributionListData;
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
      v5 = (void *)-[STMediaStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STMediaStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraAttributionListData, 0);
  objc_storeStrong((id *)&self->_systemAudioRecordingAttributionListData, 0);
  objc_storeStrong((id *)&self->_mutedMicrophoneRecordingAttributionListData, 0);
  objc_storeStrong((id *)&self->_microphoneAttributionListData, 0);
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "microphoneAttributionListData");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[STMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("microphoneAttributions"));

  -[STMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mutedMicrophoneRecordingAttributions"));

  -[STMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("systemAudioRecordingAttributions"));

  -[STMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cameraAttributions"));

}

- (STMediaStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  STMediaStatusDomainData *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("microphoneAttributions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mutedMicrophoneRecordingAttributions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemAudioRecordingAttributions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraAttributions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  __41__STMediaStatusDomainData_initWithCoder___block_invoke(v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  __41__STMediaStatusDomainData_initWithCoder___block_invoke(v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  __41__STMediaStatusDomainData_initWithCoder___block_invoke(v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  __41__STMediaStatusDomainData_initWithCoder___block_invoke(v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v10 && v12 && v14 && v16)
  {
    self = -[STMediaStatusDomainData initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:](self, "initWithMicrophoneAttributionListData:mutedMicrophoneRecordingAttributionListData:systemAudioRecordingAttributionListData:cameraAttributionListData:", v10, v12, v14, v16);
    v17 = self;
  }

  return v17;
}

id __41__STMediaStatusDomainData_initWithCoder___block_invoke(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__STMediaStatusDomainData_initWithCoder___block_invoke_2;
  v6[3] = &unk_1E91E6328;
  v6[4] = &v7;
  v6[5] = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  if (*((_BYTE *)v8 + 24))
    v4 = 0;
  else
    v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSArray)systemAudioRecordingAttributions
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraAttributionListData");
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemAudioRecordingAttributionListData");
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mutedMicrophoneRecordingAttributionListData");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __35__STMediaStatusDomainData_isEqual___block_invoke;
  v30[3] = &unk_1E91E5E38;
  v9 = v6;
  v31 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v30);

  -[STMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_2;
  v28[3] = &unk_1E91E5E38;
  v12 = v9;
  v29 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v11, v28);

  -[STMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_3;
  v26[3] = &unk_1E91E4AB0;
  v15 = v12;
  v27 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", v14, v26);

  -[STMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  v22 = 3221225472;
  v23 = __35__STMediaStatusDomainData_isEqual___block_invoke_4;
  v24 = &unk_1E91E5E38;
  v25 = v15;
  v18 = v15;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", v17, &v21);

  LOBYTE(v17) = objc_msgSend(v5, "isEqual", v21, v22, v23, v24);
  return (char)v17;
}

- (id)microphoneRecordingAttributions
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData microphoneAttributions](self, "microphoneAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __58__STMediaStatusDomainData_microphoneRecordingAttributions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activityAttribution");
}

- (id)cameraCaptureAttributionList
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData cameraAttributions](self, "cameraAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __55__STMediaStatusDomainData_cameraCaptureAttributionList__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activityAttribution");
}

- (id)audioRecordingAttributions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STMediaStatusDomainData audioRecordingAttributionList](self, "audioRecordingAttributionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mutedAudioRecordingAttributions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STMediaStatusDomainData mutedAudioRecordingAttributionList](self, "mutedAudioRecordingAttributionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cameraCaptureAttributions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STMediaStatusDomainData cameraCaptureAttributionList](self, "cameraCaptureAttributionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)camerasInUseMatchingAttribution:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[STMediaStatusDomainData cameraAttributions](self, "cameraAttributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke;
  v12[3] = &unk_1E91E6300;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_filter:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_map:", &__block_literal_global_12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "activityAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cameraDescriptor");
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
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMediaStatusDomainData microphoneAttributionListData](self, "microphoneAttributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STMediaStatusDomainData mutedMicrophoneRecordingAttributionListData](self, "mutedMicrophoneRecordingAttributionListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[STMediaStatusDomainData systemAudioRecordingAttributionListData](self, "systemAudioRecordingAttributionListData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[STMediaStatusDomainData cameraAttributionListData](self, "cameraAttributionListData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = objc_msgSend(v3, "hash");
  return v12;
}

- (NSString)description
{
  return (NSString *)-[STMediaStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STMediaStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STMediaStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __75__STMediaStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STMediaStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __75__STMediaStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "microphoneAttributionListData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("microphoneAttributions"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mutedMicrophoneRecordingAttributionListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("mutedMicrophoneRecordingAttributions"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "systemAudioRecordingAttributionListData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("systemAudioRecordingAttributions"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cameraAttributionListData");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("cameraAttributions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __41__STMediaStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
