@implementation STMediaStatusDomainDataDiff

- (BOOL)isEmpty
{
  STListDataDiff *microphoneAttributionListDataDiff;
  STListDataDiff *v4;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  STListDataDiff *v6;
  STListDataDiff *systemAudioRecordingAttributionListDataDiff;
  STListDataDiff *v8;
  STListDataDiff *cameraAttributionListDataDiff;
  BOOL v10;

  if (self)
    microphoneAttributionListDataDiff = self->_microphoneAttributionListDataDiff;
  else
    microphoneAttributionListDataDiff = 0;
  v4 = microphoneAttributionListDataDiff;
  if (-[STListDataDiff isEmpty](v4, "isEmpty"))
  {
    if (self)
      mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
    else
      mutedMicrophoneRecordingAttributionListDataDiff = 0;
    v6 = mutedMicrophoneRecordingAttributionListDataDiff;
    if (-[STListDataDiff isEmpty](v6, "isEmpty"))
    {
      if (self)
        systemAudioRecordingAttributionListDataDiff = self->_systemAudioRecordingAttributionListDataDiff;
      else
        systemAudioRecordingAttributionListDataDiff = 0;
      v8 = systemAudioRecordingAttributionListDataDiff;
      if (-[STListDataDiff isEmpty](v8, "isEmpty"))
      {
        if (self)
          cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
        else
          cameraAttributionListDataDiff = 0;
        v10 = -[STListDataDiff isEmpty](cameraAttributionListDataDiff, "isEmpty");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)applyToMutableData:(id)a3
{
  STListDataDiff *v4;
  void *v5;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  STListDataDiff *v7;
  void *v8;
  STListDataDiff *v9;
  void *v10;
  STListDataDiff *cameraAttributionListDataDiff;
  STListDataDiff *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (self)
  {
    v4 = self->_microphoneAttributionListDataDiff;
    objc_msgSend(v16, "microphoneAttributionListData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListDataDiff applyToMutableListData:](v4, "applyToMutableListData:", v5);

    mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
  }
  else
  {
    objc_msgSend(v16, "microphoneAttributionListData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "applyToMutableListData:", v14);

    mutedMicrophoneRecordingAttributionListDataDiff = 0;
  }
  v7 = mutedMicrophoneRecordingAttributionListDataDiff;
  objc_msgSend(v16, "mutedMicrophoneRecordingAttributionListData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListDataDiff applyToMutableListData:](v7, "applyToMutableListData:", v8);

  if (self)
  {
    v9 = self->_systemAudioRecordingAttributionListDataDiff;
    objc_msgSend(v16, "systemAudioRecordingAttributionListData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListDataDiff applyToMutableListData:](v9, "applyToMutableListData:", v10);

    cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
  }
  else
  {
    objc_msgSend(v16, "systemAudioRecordingAttributionListData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "applyToMutableListData:", v15);

    cameraAttributionListDataDiff = 0;
  }
  v12 = cameraAttributionListDataDiff;
  objc_msgSend(v16, "cameraAttributionListData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListDataDiff applyToMutableListData:](v12, "applyToMutableListData:", v13);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  STMediaStatusDomainDataDiff *v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "microphoneAttributionListData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "microphoneAttributionListData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mutedMicrophoneRecordingAttributionListData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutedMicrophoneRecordingAttributionListData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "systemAudioRecordingAttributionListData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemAudioRecordingAttributionListData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cameraAttributionListData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cameraAttributionListData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[STMediaStatusDomainDataDiff initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:]([STMediaStatusDomainDataDiff alloc], "initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:", v9, v12, v15, v18);
  return v19;
}

- (STMediaStatusDomainDataDiff)initWithMicrophoneAttributionListDataDiff:(id)a3 mutedMicrophoneRecordingAttributionListDataDiff:(id)a4 systemAudioRecordingAttributionListDataDiff:(id)a5 cameraAttributionListDataDiff:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  STMediaStatusDomainDataDiff *v14;
  uint64_t v15;
  STListDataDiff *microphoneAttributionListDataDiff;
  uint64_t v17;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  uint64_t v19;
  STListDataDiff *systemAudioRecordingAttributionListDataDiff;
  uint64_t v21;
  STListDataDiff *cameraAttributionListDataDiff;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STMediaStatusDomainDataDiff;
  v14 = -[STMediaStatusDomainDataDiff init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    microphoneAttributionListDataDiff = v14->_microphoneAttributionListDataDiff;
    v14->_microphoneAttributionListDataDiff = (STListDataDiff *)v15;

    v17 = objc_msgSend(v11, "copy");
    mutedMicrophoneRecordingAttributionListDataDiff = v14->_mutedMicrophoneRecordingAttributionListDataDiff;
    v14->_mutedMicrophoneRecordingAttributionListDataDiff = (STListDataDiff *)v17;

    v19 = objc_msgSend(v12, "copy");
    systemAudioRecordingAttributionListDataDiff = v14->_systemAudioRecordingAttributionListDataDiff;
    v14->_systemAudioRecordingAttributionListDataDiff = (STListDataDiff *)v19;

    v21 = objc_msgSend(v13, "copy");
    cameraAttributionListDataDiff = v14->_cameraAttributionListDataDiff;
    v14->_cameraAttributionListDataDiff = (STListDataDiff *)v21;

  }
  return v14;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  STListDataDiff *microphoneAttributionListDataDiff;
  uint64_t v8;
  STListDataDiff *v9;
  void *v10;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  uint64_t v12;
  STListDataDiff *v13;
  void *v14;
  STListDataDiff *systemAudioRecordingAttributionListDataDiff;
  uint64_t v16;
  STListDataDiff *v17;
  void *v18;
  STListDataDiff *cameraAttributionListDataDiff;
  uint64_t v20;
  STListDataDiff *v21;
  void *v22;
  STMediaStatusDomainDataDiff *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  v6 = v5;
  if (self)
  {
    microphoneAttributionListDataDiff = self->_microphoneAttributionListDataDiff;
    if (v5)
    {
LABEL_4:
      v8 = v5[1];
      goto LABEL_5;
    }
  }
  else
  {
    microphoneAttributionListDataDiff = 0;
    if (v5)
      goto LABEL_4;
  }
  v8 = 0;
LABEL_5:
  v9 = microphoneAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v9, "diffByApplyingDiff:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
    if (v6)
    {
LABEL_7:
      v12 = v6[2];
      goto LABEL_8;
    }
  }
  else
  {
    mutedMicrophoneRecordingAttributionListDataDiff = 0;
    if (v6)
      goto LABEL_7;
  }
  v12 = 0;
LABEL_8:
  v13 = mutedMicrophoneRecordingAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v13, "diffByApplyingDiff:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    systemAudioRecordingAttributionListDataDiff = self->_systemAudioRecordingAttributionListDataDiff;
    if (v6)
    {
LABEL_10:
      v16 = v6[3];
      goto LABEL_11;
    }
  }
  else
  {
    systemAudioRecordingAttributionListDataDiff = 0;
    if (v6)
      goto LABEL_10;
  }
  v16 = 0;
LABEL_11:
  v17 = systemAudioRecordingAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v17, "diffByApplyingDiff:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self)
  {
    cameraAttributionListDataDiff = 0;
    if (v6)
      goto LABEL_13;
LABEL_24:
    v20 = 0;
    goto LABEL_14;
  }
  cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
  if (!v6)
    goto LABEL_24;
LABEL_13:
  v20 = v6[4];
LABEL_14:
  v21 = cameraAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v21, "diffByApplyingDiff:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[STMediaStatusDomainDataDiff initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:]([STMediaStatusDomainDataDiff alloc], "initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:", v10, v14, v18, v22);
LABEL_16:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  STListDataDiff *cameraAttributionListDataDiff;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_microphoneAttributionListDataDiff, CFSTR("microphoneAttributionListDataDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_mutedMicrophoneRecordingAttributionListDataDiff, CFSTR("mutedMicrophoneRecordingAttributionListDataDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_systemAudioRecordingAttributionListDataDiff, CFSTR("systemAudioRecordingAttributionListDataDiff"));
    cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("microphoneAttributionListDataDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("mutedMicrophoneRecordingAttributionListDataDiff"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("systemAudioRecordingAttributionListDataDiff"));
    cameraAttributionListDataDiff = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", cameraAttributionListDataDiff, CFSTR("cameraAttributionListDataDiff"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraAttributionListDataDiff, 0);
  objc_storeStrong((id *)&self->_systemAudioRecordingAttributionListDataDiff, 0);
  objc_storeStrong((id *)&self->_mutedMicrophoneRecordingAttributionListDataDiff, 0);
  objc_storeStrong((id *)&self->_microphoneAttributionListDataDiff, 0);
}

- (STMediaStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  STMediaStatusDomainDataDiff *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("microphoneAttributionListDataDiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mutedMicrophoneRecordingAttributionListDataDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemAudioRecordingAttributionListDataDiff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraAttributionListDataDiff"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    self = -[STMediaStatusDomainDataDiff initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:](self, "initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:", v5, v6, v7, v8);
    v12 = self;
  }

  return v12;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;
  _QWORD *v7;
  STListDataDiff *microphoneAttributionListDataDiff;
  STListDataDiff *v9;
  int v10;
  void *v11;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  STListDataDiff *v13;
  int v14;
  void *v15;
  STListDataDiff *systemAudioRecordingAttributionListDataDiff;
  STListDataDiff *v17;
  char v18;
  void *v19;
  STListDataDiff *cameraAttributionListDataDiff;
  STListDataDiff *v21;
  char v22;
  void *v23;

  v4 = a3;
  if (-[STMediaStatusDomainDataDiff isEmpty](self, "isEmpty") || (objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      if (self)
        microphoneAttributionListDataDiff = self->_microphoneAttributionListDataDiff;
      else
        microphoneAttributionListDataDiff = 0;
      v9 = microphoneAttributionListDataDiff;
      if (-[STListDataDiff isEmpty](v9, "isEmpty"))
      {
        LOBYTE(v10) = 0;
      }
      else
      {
        if (v7)
          v11 = (void *)v7[1];
        else
          v11 = 0;
        v10 = objc_msgSend(v11, "isEmpty") ^ 1;
      }

      if (self)
        mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
      else
        mutedMicrophoneRecordingAttributionListDataDiff = 0;
      v13 = mutedMicrophoneRecordingAttributionListDataDiff;
      if (-[STListDataDiff isEmpty](v13, "isEmpty"))
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        if (v7)
          v15 = (void *)v7[2];
        else
          v15 = 0;
        v14 = objc_msgSend(v15, "isEmpty") ^ 1;
      }

      if (self)
        systemAudioRecordingAttributionListDataDiff = self->_systemAudioRecordingAttributionListDataDiff;
      else
        systemAudioRecordingAttributionListDataDiff = 0;
      v17 = systemAudioRecordingAttributionListDataDiff;
      if (-[STListDataDiff isEmpty](v17, "isEmpty"))
      {
        v18 = 1;
      }
      else
      {
        if (v7)
          v19 = (void *)v7[3];
        else
          v19 = 0;
        v18 = objc_msgSend(v19, "isEmpty");
      }

      if (self)
        cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
      else
        cameraAttributionListDataDiff = 0;
      v21 = cameraAttributionListDataDiff;
      if (-[STListDataDiff isEmpty](v21, "isEmpty"))
      {
        v22 = 1;
      }
      else
      {
        if (v7)
          v23 = (void *)v7[4];
        else
          v23 = 0;
        v22 = objc_msgSend(v23, "isEmpty");
      }

      v5 = v18 & ~(v10 | v14) & v22;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (STMediaStatusDomainDataDiff)init
{
  STListDataDiff *v3;
  STListDataDiff *v4;
  STListDataDiff *v5;
  STListDataDiff *v6;
  STMediaStatusDomainDataDiff *v7;

  v3 = objc_alloc_init(STListDataDiff);
  v4 = objc_alloc_init(STListDataDiff);
  v5 = objc_alloc_init(STListDataDiff);
  v6 = objc_alloc_init(STListDataDiff);
  v7 = -[STMediaStatusDomainDataDiff initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:](self, "initWithMicrophoneAttributionListDataDiff:mutedMicrophoneRecordingAttributionListDataDiff:systemAudioRecordingAttributionListDataDiff:cameraAttributionListDataDiff:", v3, v4, v5, v6);

  return v7;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STMediaStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  STListDataDiff *microphoneAttributionListDataDiff;
  uint64_t v8;
  id v9;
  id v10;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  id v12;
  id v13;
  STListDataDiff *systemAudioRecordingAttributionListDataDiff;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
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
  if (self)
    microphoneAttributionListDataDiff = self->_microphoneAttributionListDataDiff;
  else
    microphoneAttributionListDataDiff = 0;
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __39__STMediaStatusDomainDataDiff_isEqual___block_invoke;
  v30[3] = &unk_1E91E5C50;
  v9 = v6;
  v31 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", microphoneAttributionListDataDiff, v30);
  if (self)
    mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
  else
    mutedMicrophoneRecordingAttributionListDataDiff = 0;
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_2;
  v28[3] = &unk_1E91E5C50;
  v12 = v9;
  v29 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", mutedMicrophoneRecordingAttributionListDataDiff, v28);
  if (self)
    systemAudioRecordingAttributionListDataDiff = self->_systemAudioRecordingAttributionListDataDiff;
  else
    systemAudioRecordingAttributionListDataDiff = 0;
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_3;
  v26[3] = &unk_1E91E5C50;
  v15 = v12;
  v27 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", systemAudioRecordingAttributionListDataDiff, v26);
  if (self)
    self = (STMediaStatusDomainDataDiff *)self->_cameraAttributionListDataDiff;
  v21 = v8;
  v22 = 3221225472;
  v23 = __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_4;
  v24 = &unk_1E91E5C50;
  v25 = v15;
  v17 = v15;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v21);
  v19 = objc_msgSend(v5, "isEqual", v21, v22, v23, v24);

  return v19;
}

id __39__STMediaStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

id __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 24);
  else
    return 0;
}

id __39__STMediaStatusDomainDataDiff_isEqual___block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 32);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STListDataDiff *mutedMicrophoneRecordingAttributionListDataDiff;
  id v7;
  id v8;
  STListDataDiff *cameraAttributionListDataDiff;
  id v10;
  unint64_t v11;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_microphoneAttributionListDataDiff);
    mutedMicrophoneRecordingAttributionListDataDiff = self->_mutedMicrophoneRecordingAttributionListDataDiff;
  }
  else
  {
    v13 = (id)objc_msgSend(v3, "appendObject:", 0);
    mutedMicrophoneRecordingAttributionListDataDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", mutedMicrophoneRecordingAttributionListDataDiff);
  if (self)
  {
    v8 = (id)objc_msgSend(v4, "appendObject:", self->_systemAudioRecordingAttributionListDataDiff);
    cameraAttributionListDataDiff = self->_cameraAttributionListDataDiff;
  }
  else
  {
    v14 = (id)objc_msgSend(v4, "appendObject:", 0);
    cameraAttributionListDataDiff = 0;
  }
  v10 = (id)objc_msgSend(v4, "appendObject:", cameraAttributionListDataDiff);
  v11 = objc_msgSend(v4, "hash");

  return v11;
}

- (NSString)description
{
  return (NSString *)-[STMediaStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STMediaStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STMediaStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    objc_msgSend(v6, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__STMediaStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E91E4AD8;
    v8 = v6;
    v11 = v8;
    v12 = v3;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v10);

    v3 = v8;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STMediaStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __79__STMediaStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("microphoneAttributionListDataDiff"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("mutedMicrophoneRecordingAttributionListDataDiff"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("systemAudioRecordingAttributionListDataDiff"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("cameraAttributionListDiff"), 1);
}

@end
