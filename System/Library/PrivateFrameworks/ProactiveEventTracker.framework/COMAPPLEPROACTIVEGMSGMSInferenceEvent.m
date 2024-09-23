@implementation COMAPPLEPROACTIVEGMSGMSInferenceEvent

- (int)requestType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    return self->_requestType;
  else
    return 0;
}

- (void)setRequestType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRequestType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E2A41680 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_REQUEST_TYPE_ONE_SHOT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_REQUEST_TYPE_STREAMING")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setInputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_inputTokensCount = a3;
}

- (void)setHasInputTokensCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasInputTokensCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_outputTokensCount = a3;
}

- (void)setHasOutputTokensCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasOutputTokensCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalLatencyMillis = a3;
}

- (void)setHasTotalLatencyMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTimeToFirstTokenMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timeToFirstTokenMillis = a3;
}

- (void)setHasTimeToFirstTokenMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimeToFirstTokenMillis
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTokensPerSecond:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tokensPerSecond = a3;
}

- (void)setHasTokensPerSecond:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTokensPerSecond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setInferenceTimeMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_inferenceTimeMillis = a3;
}

- (void)setHasInferenceTimeMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasInferenceTimeMillis
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setExtendInferenceMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_extendInferenceMillis = a3;
}

- (void)setHasExtendInferenceMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasExtendInferenceMillis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAssetLoadAndTtftCombinedMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_assetLoadAndTtftCombinedMillis = a3;
}

- (void)setHasAssetLoadAndTtftCombinedMillis:(BOOL)a3
{
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssetLoadAndTtftCombinedMillis
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSdTinyModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sdTinyModelInferenceCallCount = a3;
}

- (void)setHasSdTinyModelInferenceCallCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSdTinyModelInferenceCallCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSdDraftModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_sdDraftModelInferenceCallCount = a3;
}

- (void)setHasSdDraftModelInferenceCallCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSdDraftModelInferenceCallCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSdTargetModelInferenceCallCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sdTargetModelInferenceCallCount = a3;
}

- (void)setHasSdTargetModelInferenceCallCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSdTargetModelInferenceCallCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSdDraftTokenAcceptanceRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_sdDraftTokenAcceptanceRate = a3;
}

- (void)setHasSdDraftTokenAcceptanceRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSdDraftTokenAcceptanceRate
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSdTinyTokenAcceptanceRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_sdTinyTokenAcceptanceRate = a3;
}

- (void)setHasSdTinyTokenAcceptanceRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSdTinyTokenAcceptanceRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSdSpeculationSuccessRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_sdSpeculationSuccessRate = a3;
}

- (void)setHasSdSpeculationSuccessRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSdSpeculationSuccessRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSdDraftOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sdDraftOutputTokensCount = a3;
}

- (void)setHasSdDraftOutputTokensCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSdDraftOutputTokensCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSdTotalOutputTokensCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sdTotalOutputTokensCount = a3;
}

- (void)setHasSdTotalOutputTokensCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSdTotalOutputTokensCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSdTinyModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sdTinyModelTotalLatencyMillis = a3;
}

- (void)setHasSdTinyModelTotalLatencyMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSdTinyModelTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSdDraftModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_sdDraftModelTotalLatencyMillis = a3;
}

- (void)setHasSdDraftModelTotalLatencyMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasSdDraftModelTotalLatencyMillis
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSdTargetModelTotalLatencyMillis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_sdTargetModelTotalLatencyMillis = a3;
}

- (void)setHasSdTargetModelTotalLatencyMillis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($8B3226069B0D9AEB47C44336741E4A83)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSdTargetModelTotalLatencyMillis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSInferenceEvent;
  -[COMAPPLEPROACTIVEGMSGMSInferenceEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPROACTIVEGMSGMSInferenceEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $8B3226069B0D9AEB47C44336741E4A83 has;
  uint64_t requestType;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    requestType = self->_requestType;
    if (requestType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E2A41680 + requestType);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("requestType"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_inputTokensCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("inputTokensCount"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_9;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_outputTokensCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("outputTokensCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalLatencyMillis);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("totalLatencyMillis"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeToFirstTokenMillis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timeToFirstTokenMillis"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tokensPerSecond);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("tokensPerSecond"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("version"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inferenceTimeMillis);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("inferenceTimeMillis"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_extendInferenceMillis);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("extendInferenceMillis"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assetLoadAndTtftCombinedMillis);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("assetLoadAndTtftCombinedMillis"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sdTinyModelInferenceCallCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sdTinyModelInferenceCallCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sdDraftModelInferenceCallCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sdDraftModelInferenceCallCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sdTargetModelInferenceCallCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sdTargetModelInferenceCallCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdDraftTokenAcceptanceRate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sdDraftTokenAcceptanceRate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdTinyTokenAcceptanceRate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sdTinyTokenAcceptanceRate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdSpeculationSuccessRate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("sdSpeculationSuccessRate"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sdDraftOutputTokensCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("sdDraftOutputTokensCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sdTotalOutputTokensCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sdTotalOutputTokensCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_25;
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdDraftModelTotalLatencyMillis);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("sdDraftModelTotalLatencyMillis"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_26;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdTinyModelTotalLatencyMillis);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("sdTinyModelTotalLatencyMillis"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
    goto LABEL_46;
LABEL_25:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sdTargetModelTotalLatencyMillis);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sdTargetModelTotalLatencyMillis"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $8B3226069B0D9AEB47C44336741E4A83 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
LABEL_43:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_WORD *)&has & 0x800) != 0)
LABEL_22:
    PBDataWriterWriteDoubleField();
LABEL_23:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $8B3226069B0D9AEB47C44336741E4A83 has;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v4[42] = self->_requestType;
    v4[43] |= 0x100000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 4) = self->_inputTokensCount;
  v4[43] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v4 + 5) = self->_outputTokensCount;
  v4[43] |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v4 + 19) = *(_QWORD *)&self->_totalLatencyMillis;
  v4[43] |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_timeToFirstTokenMillis;
  v4[43] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)v4 + 18) = *(_QWORD *)&self->_tokensPerSecond;
  v4[43] |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 20) = self->_version;
  v4[43] |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_inferenceTimeMillis;
  v4[43] |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_extendInferenceMillis;
  v4[43] |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_assetLoadAndTtftCombinedMillis;
  v4[43] |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v4 + 13) = self->_sdTinyModelInferenceCallCount;
  v4[43] |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)v4 + 6) = self->_sdDraftModelInferenceCallCount;
  v4[43] |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)v4 + 11) = self->_sdTargetModelInferenceCallCount;
  v4[43] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_sdDraftTokenAcceptanceRate;
  v4[43] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_sdTinyTokenAcceptanceRate;
  v4[43] |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_sdSpeculationSuccessRate;
  v4[43] |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)v4 + 8) = self->_sdDraftOutputTokensCount;
  v4[43] |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)v4 + 16) = self->_sdTotalOutputTokensCount;
  v4[43] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
LABEL_43:
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_sdDraftModelTotalLatencyMillis;
    v4[43] |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_sdTinyModelTotalLatencyMillis;
  v4[43] |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_sdTargetModelTotalLatencyMillis;
    v4[43] |= 0x800u;
  }
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $8B3226069B0D9AEB47C44336741E4A83 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)result + 42) = self->_requestType;
    *((_DWORD *)result + 43) |= 0x100000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_inputTokensCount;
  *((_DWORD *)result + 43) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 5) = self->_outputTokensCount;
  *((_DWORD *)result + 43) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 19) = *(_QWORD *)&self->_totalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 17) = *(_QWORD *)&self->_timeToFirstTokenMillis;
  *((_DWORD *)result + 43) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 18) = *(_QWORD *)&self->_tokensPerSecond;
  *((_DWORD *)result + 43) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 20) = self->_version;
  *((_DWORD *)result + 43) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_inferenceTimeMillis;
  *((_DWORD *)result + 43) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_extendInferenceMillis;
  *((_DWORD *)result + 43) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_assetLoadAndTtftCombinedMillis;
  *((_DWORD *)result + 43) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 13) = self->_sdTinyModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 6) = self->_sdDraftModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 11) = self->_sdTargetModelInferenceCallCount;
  *((_DWORD *)result + 43) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_sdDraftTokenAcceptanceRate;
  *((_DWORD *)result + 43) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_sdTinyTokenAcceptanceRate;
  *((_DWORD *)result + 43) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_sdSpeculationSuccessRate;
  *((_DWORD *)result + 43) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 8) = self->_sdDraftOutputTokensCount;
  *((_DWORD *)result + 43) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 16) = self->_sdTotalOutputTokensCount;
  *((_DWORD *)result + 43) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 14) = *(_QWORD *)&self->_sdTinyModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      return result;
    goto LABEL_22;
  }
LABEL_43:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_sdDraftModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return result;
LABEL_22:
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_sdTargetModelTotalLatencyMillis;
  *((_DWORD *)result + 43) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $8B3226069B0D9AEB47C44336741E4A83 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_107;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_requestType != *((_DWORD *)v4 + 42))
      goto LABEL_107;
  }
  else if ((v6 & 0x100000) != 0)
  {
LABEL_107:
    v7 = 0;
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_inputTokensCount != *((_QWORD *)v4 + 4))
      goto LABEL_107;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_outputTokensCount != *((_QWORD *)v4 + 5))
      goto LABEL_107;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_totalLatencyMillis != *((double *)v4 + 19))
      goto LABEL_107;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_timeToFirstTokenMillis != *((double *)v4 + 17))
      goto LABEL_107;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_tokensPerSecond != *((double *)v4 + 18))
      goto LABEL_107;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_version != *((_QWORD *)v4 + 20))
      goto LABEL_107;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_inferenceTimeMillis != *((double *)v4 + 3))
      goto LABEL_107;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_extendInferenceMillis != *((double *)v4 + 2))
      goto LABEL_107;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_assetLoadAndTtftCombinedMillis != *((double *)v4 + 1))
      goto LABEL_107;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_sdTinyModelInferenceCallCount != *((_QWORD *)v4 + 13))
      goto LABEL_107;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_sdDraftModelInferenceCallCount != *((_QWORD *)v4 + 6))
      goto LABEL_107;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_sdTargetModelInferenceCallCount != *((_QWORD *)v4 + 11))
      goto LABEL_107;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_sdDraftTokenAcceptanceRate != *((double *)v4 + 9))
      goto LABEL_107;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_sdTinyTokenAcceptanceRate != *((double *)v4 + 15))
      goto LABEL_107;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_sdSpeculationSuccessRate != *((double *)v4 + 10))
      goto LABEL_107;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sdDraftOutputTokensCount != *((_QWORD *)v4 + 8))
      goto LABEL_107;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_sdTotalOutputTokensCount != *((_QWORD *)v4 + 16))
      goto LABEL_107;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sdTinyModelTotalLatencyMillis != *((double *)v4 + 14))
      goto LABEL_107;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_sdDraftModelTotalLatencyMillis != *((double *)v4 + 7))
      goto LABEL_107;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_sdTargetModelTotalLatencyMillis != *((double *)v4 + 12))
      goto LABEL_107;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 43) & 0x800) == 0;
  }
LABEL_108:

  return v7;
}

- (unint64_t)hash
{
  $8B3226069B0D9AEB47C44336741E4A83 has;
  double totalLatencyMillis;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double timeToFirstTokenMillis;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double tokensPerSecond;
  double v16;
  long double v17;
  double v18;
  double inferenceTimeMillis;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  double extendInferenceMillis;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double assetLoadAndTtftCombinedMillis;
  double v31;
  long double v32;
  double v33;
  double sdDraftTokenAcceptanceRate;
  double v35;
  long double v36;
  double v37;
  unint64_t v38;
  double sdTinyTokenAcceptanceRate;
  double v40;
  long double v41;
  double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  double sdSpeculationSuccessRate;
  double v47;
  long double v48;
  double v49;
  double sdTinyModelTotalLatencyMillis;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  double sdDraftModelTotalLatencyMillis;
  double v59;
  long double v60;
  double v61;
  unint64_t v62;
  double sdTargetModelTotalLatencyMillis;
  double v64;
  long double v65;
  double v66;
  unint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v79 = 2654435761 * self->_requestType;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v78 = 2654435761 * self->_inputTokensCount;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_4;
LABEL_11:
      v77 = 0;
      if ((*(_DWORD *)&has & 0x40000) != 0)
        goto LABEL_5;
LABEL_12:
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v79 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v78 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_11;
LABEL_4:
  v77 = 2654435761 * self->_outputTokensCount;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_12;
LABEL_5:
  totalLatencyMillis = self->_totalLatencyMillis;
  v5 = -totalLatencyMillis;
  if (totalLatencyMillis >= 0.0)
    v5 = self->_totalLatencyMillis;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_15:
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    timeToFirstTokenMillis = self->_timeToFirstTokenMillis;
    v11 = -timeToFirstTokenMillis;
    if (timeToFirstTokenMillis >= 0.0)
      v11 = self->_timeToFirstTokenMillis;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    tokensPerSecond = self->_tokensPerSecond;
    v16 = -tokensPerSecond;
    if (tokensPerSecond >= 0.0)
      v16 = self->_tokensPerSecond;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v76 = 2654435761 * self->_version;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_33;
LABEL_38:
    v23 = 0;
    goto LABEL_41;
  }
  v76 = 0;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_38;
LABEL_33:
  inferenceTimeMillis = self->_inferenceTimeMillis;
  v20 = -inferenceTimeMillis;
  if (inferenceTimeMillis >= 0.0)
    v20 = self->_inferenceTimeMillis;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0)
      v23 += (unint64_t)v22;
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_41:
  if ((*(_BYTE *)&has & 2) != 0)
  {
    extendInferenceMillis = self->_extendInferenceMillis;
    v26 = -extendInferenceMillis;
    if (extendInferenceMillis >= 0.0)
      v26 = self->_extendInferenceMillis;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    assetLoadAndTtftCombinedMillis = self->_assetLoadAndTtftCombinedMillis;
    v31 = -assetLoadAndTtftCombinedMillis;
    if (assetLoadAndTtftCombinedMillis >= 0.0)
      v31 = self->_assetLoadAndTtftCombinedMillis;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v73 = 2654435761 * self->_sdTinyModelInferenceCallCount;
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
LABEL_59:
      v72 = 2654435761 * self->_sdDraftModelInferenceCallCount;
      if ((*(_WORD *)&has & 0x400) != 0)
        goto LABEL_60;
LABEL_67:
      v71 = 0;
      if ((*(_WORD *)&has & 0x100) != 0)
        goto LABEL_61;
LABEL_68:
      v38 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    v73 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_59;
  }
  v72 = 0;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_67;
LABEL_60:
  v71 = 2654435761 * self->_sdTargetModelInferenceCallCount;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_68;
LABEL_61:
  sdDraftTokenAcceptanceRate = self->_sdDraftTokenAcceptanceRate;
  v35 = -sdDraftTokenAcceptanceRate;
  if (sdDraftTokenAcceptanceRate >= 0.0)
    v35 = self->_sdDraftTokenAcceptanceRate;
  v36 = floor(v35 + 0.5);
  v37 = (v35 - v36) * 1.84467441e19;
  v38 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
  if (v37 >= 0.0)
  {
    if (v37 > 0.0)
      v38 += (unint64_t)v37;
  }
  else
  {
    v38 -= (unint64_t)fabs(v37);
  }
LABEL_71:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    v80 = 0;
    goto LABEL_80;
  }
  sdTinyTokenAcceptanceRate = self->_sdTinyTokenAcceptanceRate;
  v40 = -sdTinyTokenAcceptanceRate;
  if (sdTinyTokenAcceptanceRate >= 0.0)
    v40 = self->_sdTinyTokenAcceptanceRate;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    v80 = 2654435761u * (unint64_t)v43;
    if (v42 <= 0.0)
      goto LABEL_80;
    v44 = v80 + (unint64_t)v42;
  }
  else
  {
    v44 = 2654435761u * (unint64_t)v43 - (unint64_t)fabs(v42);
  }
  v80 = v44;
LABEL_80:
  v75 = v23;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    sdSpeculationSuccessRate = self->_sdSpeculationSuccessRate;
    v47 = -sdSpeculationSuccessRate;
    if (sdSpeculationSuccessRate >= 0.0)
      v47 = self->_sdSpeculationSuccessRate;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v74 = v8;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
    v70 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_90;
LABEL_96:
    v69 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_91;
LABEL_97:
    v55 = v38;
    v54 = 0;
    goto LABEL_100;
  }
  v70 = 2654435761 * self->_sdDraftOutputTokensCount;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_96;
LABEL_90:
  v69 = 2654435761 * self->_sdTotalOutputTokensCount;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_97;
LABEL_91:
  sdTinyModelTotalLatencyMillis = self->_sdTinyModelTotalLatencyMillis;
  v51 = -sdTinyModelTotalLatencyMillis;
  if (sdTinyModelTotalLatencyMillis >= 0.0)
    v51 = self->_sdTinyModelTotalLatencyMillis;
  v52 = floor(v51 + 0.5);
  v53 = (v51 - v52) * 1.84467441e19;
  v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  v55 = v38;
  if (v53 >= 0.0)
  {
    if (v53 > 0.0)
      v54 += (unint64_t)v53;
  }
  else
  {
    v54 -= (unint64_t)fabs(v53);
  }
LABEL_100:
  v56 = v14;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    sdDraftModelTotalLatencyMillis = self->_sdDraftModelTotalLatencyMillis;
    v59 = -sdDraftModelTotalLatencyMillis;
    if (sdDraftModelTotalLatencyMillis >= 0.0)
      v59 = self->_sdDraftModelTotalLatencyMillis;
    v60 = floor(v59 + 0.5);
    v61 = (v59 - v60) * 1.84467441e19;
    v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    v62 = 0;
LABEL_114:
    v67 = v80;
    return v78 ^ v79 ^ v77 ^ v74 ^ v9 ^ v56 ^ v76 ^ v75 ^ v24 ^ v29 ^ v73 ^ v72 ^ v71 ^ v55 ^ v67 ^ v45 ^ v70 ^ v69 ^ v54 ^ v57 ^ v62;
  }
  sdTargetModelTotalLatencyMillis = self->_sdTargetModelTotalLatencyMillis;
  v64 = -sdTargetModelTotalLatencyMillis;
  if (sdTargetModelTotalLatencyMillis >= 0.0)
    v64 = self->_sdTargetModelTotalLatencyMillis;
  v65 = floor(v64 + 0.5);
  v66 = (v64 - v65) * 1.84467441e19;
  v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
  if (v66 < 0.0)
  {
    v62 -= (unint64_t)fabs(v66);
    goto LABEL_114;
  }
  v67 = v80;
  if (v66 > 0.0)
    v62 += (unint64_t)v66;
  return v78 ^ v79 ^ v77 ^ v74 ^ v9 ^ v56 ^ v76 ^ v75 ^ v24 ^ v29 ^ v73 ^ v72 ^ v71 ^ v55 ^ v67 ^ v45 ^ v70 ^ v69 ^ v54 ^ v57 ^ v62;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x100000) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_has |= 0x100000u;
    v5 = *((_DWORD *)v4 + 43);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_inputTokensCount = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_outputTokensCount = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_totalLatencyMillis = *((double *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x10000) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_timeToFirstTokenMillis = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x20000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_tokensPerSecond = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x80000) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_version = *((_QWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_inferenceTimeMillis = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_extendInferenceMillis = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_assetLoadAndTtftCombinedMillis = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_sdTinyModelInferenceCallCount = *((_QWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_sdDraftModelInferenceCallCount = *((_QWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  self->_sdTargetModelInferenceCallCount = *((_QWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  self->_sdDraftTokenAcceptanceRate = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  self->_sdTinyTokenAcceptanceRate = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  self->_sdSpeculationSuccessRate = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x80) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  self->_sdDraftOutputTokensCount = *((_QWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x8000) == 0)
  {
LABEL_19:
    if ((v5 & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  self->_sdTotalOutputTokensCount = *((_QWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x2000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40) == 0)
      goto LABEL_21;
LABEL_43:
    self->_sdDraftModelTotalLatencyMillis = *((double *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    if ((*((_DWORD *)v4 + 43) & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  self->_sdTinyModelTotalLatencyMillis = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40) != 0)
    goto LABEL_43;
LABEL_21:
  if ((v5 & 0x800) != 0)
  {
LABEL_22:
    self->_sdTargetModelTotalLatencyMillis = *((double *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_23:

}

- (int64_t)inputTokensCount
{
  return self->_inputTokensCount;
}

- (int64_t)outputTokensCount
{
  return self->_outputTokensCount;
}

- (double)totalLatencyMillis
{
  return self->_totalLatencyMillis;
}

- (double)timeToFirstTokenMillis
{
  return self->_timeToFirstTokenMillis;
}

- (double)tokensPerSecond
{
  return self->_tokensPerSecond;
}

- (int64_t)version
{
  return self->_version;
}

- (double)inferenceTimeMillis
{
  return self->_inferenceTimeMillis;
}

- (double)extendInferenceMillis
{
  return self->_extendInferenceMillis;
}

- (double)assetLoadAndTtftCombinedMillis
{
  return self->_assetLoadAndTtftCombinedMillis;
}

- (int64_t)sdTinyModelInferenceCallCount
{
  return self->_sdTinyModelInferenceCallCount;
}

- (int64_t)sdDraftModelInferenceCallCount
{
  return self->_sdDraftModelInferenceCallCount;
}

- (int64_t)sdTargetModelInferenceCallCount
{
  return self->_sdTargetModelInferenceCallCount;
}

- (double)sdDraftTokenAcceptanceRate
{
  return self->_sdDraftTokenAcceptanceRate;
}

- (double)sdTinyTokenAcceptanceRate
{
  return self->_sdTinyTokenAcceptanceRate;
}

- (double)sdSpeculationSuccessRate
{
  return self->_sdSpeculationSuccessRate;
}

- (int64_t)sdDraftOutputTokensCount
{
  return self->_sdDraftOutputTokensCount;
}

- (int64_t)sdTotalOutputTokensCount
{
  return self->_sdTotalOutputTokensCount;
}

- (double)sdTinyModelTotalLatencyMillis
{
  return self->_sdTinyModelTotalLatencyMillis;
}

- (double)sdDraftModelTotalLatencyMillis
{
  return self->_sdDraftModelTotalLatencyMillis;
}

- (double)sdTargetModelTotalLatencyMillis
{
  return self->_sdTargetModelTotalLatencyMillis;
}

@end
