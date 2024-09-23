@implementation SFRepairResultMetrics

- (NSDictionary)dict
{
  __CFString *v3;
  SFRepairResultMetrics *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *peerModel;
  NSString *peerBuild;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t peerProblemFlags;
  uint64_t v33;
  void *v34;
  SFRepairResultMetrics *v35;
  __CFString *v36;
  __CFString *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  _QWORD v48[10];
  _QWORD v49[12];

  v49[10] = *MEMORY[0x1E0C80C00];
  v44 = 0;
  NSAppendPrintF();
  v3 = (__CFString *)0;
  v43 = 0;
  peerProblemFlags = self->_peerProblemFlags;
  v4 = self;
  NSAppendPrintF();
  v5 = (__CFString *)0;
  v48[0] = CFSTR("resultType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFRepairResultMetrics resultType](self, "resultType", peerProblemFlags, &unk_1A2AF8AF8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v6;
  v48[1] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_error == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v7;
  v48[2] = CFSTR("forceWiFi");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceWiFi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v8;
  v48[3] = CFSTR("hasView");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasView);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v9;
  v48[4] = CFSTR("totalMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalMs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v10;
  v48[5] = CFSTR("triggerMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_triggerMs);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v3)
    v13 = v3;
  else
    v13 = &stru_1E483B8E8;
  v49[5] = v11;
  v49[6] = v13;
  v48[6] = CFSTR("problemFlags");
  v48[7] = CFSTR("triggerFlags");
  if (v5)
    v14 = v5;
  else
    v14 = &stru_1E483B8E8;
  peerModel = (const __CFString *)self->_peerModel;
  peerBuild = self->_peerBuild;
  if (!peerModel)
    peerModel = &stru_1E483B8E8;
  v49[7] = v14;
  v49[8] = peerModel;
  v48[8] = CFSTR("peerModel");
  v48[9] = CFSTR("peerBuild");
  if (peerBuild)
    v17 = (const __CFString *)peerBuild;
  else
    v17 = &stru_1E483B8E8;
  v49[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v18, "mutableCopy");

  if (v4->_error)
  {
    v19 = (id)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v35 = v4;
    -[NSError underlyingErrors](v4->_error, "underlyingErrors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    v36 = v5;
    v37 = v3;
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        v24 = 0;
        v25 = v19;
        do
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v24);
          if (objc_msgSend(v25, "length", v33, v34))
            objc_msgSend(v25, "appendString:", CFSTR(","));
          v27 = objc_msgSend(v26, "code");
          objc_msgSend(v26, "domain");
          v33 = v27;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          v19 = v25;

          ++v24;
          v25 = v19;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16, v27, v34);
      }
      while (v22);
    }

    v45[0] = CFSTR("errCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSError code](v35->_error, "code"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v28;
    v45[1] = CFSTR("errDomain");
    -[NSError domain](v35->_error, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = CFSTR("underErr");
    v46[1] = v29;
    v46[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addEntriesFromDictionary:", v30);

    v5 = v36;
    v3 = v37;
  }

  return (NSDictionary *)v38;
}

- (int64_t)resultType
{
  if (self->_error)
    return 2 * self->_isPreflightError;
  else
    return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isPreflightError
{
  return self->_isPreflightError;
}

- (void)setIsPreflightError:(BOOL)a3
{
  self->_isPreflightError = a3;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(unint64_t)a3
{
  self->_problemFlags = a3;
}

- (unint64_t)peerProblemFlags
{
  return self->_peerProblemFlags;
}

- (void)setPeerProblemFlags:(unint64_t)a3
{
  self->_peerProblemFlags = a3;
}

- (NSString)peerModel
{
  return self->_peerModel;
}

- (void)setPeerModel:(id)a3
{
  objc_storeStrong((id *)&self->_peerModel, a3);
}

- (NSString)peerBuild
{
  return self->_peerBuild;
}

- (void)setPeerBuild:(id)a3
{
  objc_storeStrong((id *)&self->_peerBuild, a3);
}

- (BOOL)forceWiFi
{
  return self->_forceWiFi;
}

- (void)setForceWiFi:(BOOL)a3
{
  self->_forceWiFi = a3;
}

- (BOOL)hasView
{
  return self->_hasView;
}

- (void)setHasView:(BOOL)a3
{
  self->_hasView = a3;
}

- (double)totalMs
{
  return self->_totalMs;
}

- (void)setTotalMs:(double)a3
{
  self->_totalMs = a3;
}

- (double)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(double)a3
{
  self->_triggerMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerBuild, 0);
  objc_storeStrong((id *)&self->_peerModel, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
