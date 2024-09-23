@implementation TITypologyLog

- (TITypologyLog)init
{
  char *v2;
  TITypologyLog *v3;
  NSDate *v4;
  NSDate *date;
  TIRollingLog *v6;
  TIRollingLog *records;
  TIRollingLog *v8;
  TIRollingLog *traceRecords;
  NSUUID *v10;
  NSUUID *uuid;
  uint64_t v12;
  NSString *systemVersion;
  uint64_t v14;
  NSString *buildVersion;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TITypologyLog;
  v2 = -[TITypologyLog init](&v17, sel_init);
  v3 = (TITypologyLog *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_18C5E77A0;
    v4 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    date = v3->_date;
    v3->_date = v4;

    v6 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
    records = v3->_records;
    v3->_records = v6;

    v8 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
    traceRecords = v3->_traceRecords;
    v3->_traceRecords = v8;

    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v3->_uuid;
    v3->_uuid = v10;

    v3->_partIndex = 0;
    v12 = MGCopyAnswer();
    systemVersion = v3->_systemVersion;
    v3->_systemVersion = (NSString *)v12;

    v14 = MGCopyAnswer();
    buildVersion = v3->_buildVersion;
    v3->_buildVersion = (NSString *)v14;

  }
  return v3;
}

- (TITypologyLog)initWithUUID:(id)a3 partIndex:(unint64_t)a4 date:(id)a5 systemVersion:(id)a6 buildVersion:(id)a7 clientIdentifier:(id)a8 config:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  TITypologyLog *v20;
  uint64_t v21;
  NSDate *date;
  TIRollingLog *v23;
  TIRollingLog *records;
  TIRollingLog *v25;
  TIRollingLog *traceRecords;
  uint64_t v27;
  NSUUID *uuid;
  uint64_t v29;
  NSString *systemVersion;
  uint64_t v31;
  NSString *buildVersion;
  uint64_t v33;
  NSDictionary *config;
  objc_super v36;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v36.receiver = self;
  v36.super_class = (Class)TITypologyLog;
  v19 = -[TITypologyLog init](&v36, sel_init);
  v20 = (TITypologyLog *)v19;
  if (v19)
  {
    *(_OWORD *)(v19 + 8) = xmmword_18C5E77A0;
    v21 = objc_msgSend(v15, "copy");
    date = v20->_date;
    v20->_date = (NSDate *)v21;

    v23 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
    records = v20->_records;
    v20->_records = v23;

    v25 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
    traceRecords = v20->_traceRecords;
    v20->_traceRecords = v25;

    v27 = objc_msgSend(v14, "copy");
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v27;

    v20->_partIndex = a4;
    v29 = objc_msgSend(v16, "copy");
    systemVersion = v20->_systemVersion;
    v20->_systemVersion = (NSString *)v29;

    v31 = objc_msgSend(v17, "copy");
    buildVersion = v20->_buildVersion;
    v20->_buildVersion = (NSString *)v31;

    v33 = objc_msgSend(v18, "copy");
    config = v20->_config;
    v20->_config = (NSDictionary *)v33;

  }
  return v20;
}

- (TITypologyLog)initWithTypologyLog:(id)a3
{
  id v4;
  char *v5;
  TITypologyLog *v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  void *v10;
  uint64_t v11;
  NSDate *date;
  void *v13;
  uint64_t v14;
  NSString *systemVersion;
  void *v16;
  uint64_t v17;
  NSString *buildVersion;
  void *v19;
  uint64_t v20;
  NSString *clientIdentifier;
  void *v22;
  uint64_t v23;
  TIRollingLog *records;
  void *v25;
  uint64_t v26;
  TIRollingLog *traceRecords;
  void *v28;
  uint64_t v29;
  NSDictionary *config;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TITypologyLog;
  v5 = -[TITypologyLog init](&v32, sel_init);
  v6 = (TITypologyLog *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_18C5E77A0;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

    v6->_partIndex = objc_msgSend(v4, "partIndex");
    objc_msgSend(v4, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    date = v6->_date;
    v6->_date = (NSDate *)v11;

    objc_msgSend(v4, "systemVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    systemVersion = v6->_systemVersion;
    v6->_systemVersion = (NSString *)v14;

    objc_msgSend(v4, "buildVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v17;

    objc_msgSend(v4, "clientIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v20;

    objc_msgSend(v4, "records");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    records = v6->_records;
    v6->_records = (TIRollingLog *)v23;

    objc_msgSend(v4, "traceRecords");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    traceRecords = v6->_traceRecords;
    v6->_traceRecords = (TIRollingLog *)v26;

    objc_msgSend(v4, "config");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    config = v6->_config;
    v6->_config = (NSDictionary *)v29;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTypologyLog:", self);
}

- (TITypologyLog)initWithPropertyList:(id)a3
{
  id v4;
  TITypologyLog *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char isKindOfClass;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v43;
  NSUUID *uuid;
  uint64_t v45;
  NSDate *date;
  uint64_t v47;
  NSString *systemVersion;
  uint64_t v49;
  NSString *buildVersion;
  uint64_t v51;
  NSString *clientIdentifier;
  TIRollingLog *v53;
  TIRollingLog *records;
  TIRollingLog *v55;
  TIRollingLog *traceRecords;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)TITypologyLog;
  v5 = -[TITypologyLog init](&v66, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "objectForKey:", CFSTR("version"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E24C04D8;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    objc_opt_class();
    v57 = v11;
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v7, "objectForKey:", CFSTR("uuid"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("partIndex"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &unk_1E24C04F0;
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

    v62 = v17;
    if ((v13 & 1) != 0)
    {
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();
      objc_msgSend(v7, "objectForKey:", CFSTR("date"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 & 1) != 0)
      {
        objc_opt_class();
        v19 = objc_opt_isKindOfClass();
        objc_msgSend(v7, "objectForKey:", CFSTR("systemVersion"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 & 1) != 0)
        {
          objc_opt_class();
          v20 = objc_opt_isKindOfClass();
          objc_msgSend(v7, "objectForKey:", CFSTR("buildVersion"));
          v21 = objc_claimAutoreleasedReturnValue();
          if ((v20 & 1) != 0)
          {
            objc_opt_class();
            v22 = objc_opt_isKindOfClass();
            objc_msgSend(v7, "objectForKey:", CFSTR("clientIdentifier"));
            v23 = objc_claimAutoreleasedReturnValue();
            if ((v22 & 1) != 0)
            {
              objc_opt_class();
              v24 = objc_opt_isKindOfClass();
              objc_msgSend(v7, "objectForKey:", CFSTR("records"));
              v58 = (void *)v23;
              v59 = (void *)v21;
              v64 = objc_claimAutoreleasedReturnValue();
              if ((v24 & 1) != 0)
              {
                objc_opt_class();
                v25 = objc_opt_isKindOfClass();
LABEL_25:
                v26 = (void *)MEMORY[0x1E0C99E20];
                v27 = objc_opt_class();
                v28 = objc_opt_class();
                v29 = objc_opt_class();
                v30 = objc_opt_class();
                objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                +[TITypologyRecord recordClasses](TITypologyRecord, "recordClasses");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObjectsFromArray:", v32);

                v33 = 0;
                v34 = 0;
                v35 = (void *)v64;
                if ((v25 & 1) != 0
                  && (v65 = 0,
                      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v31, v64, &v65),
                      v33 = (void *)objc_claimAutoreleasedReturnValue(),
                      v34 = v65,
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v36 = objc_msgSend(v33, "indexOfObjectPassingTest:", &__block_literal_global_6097);
                  objc_msgSend(v7, "objectForKey:", CFSTR("traceLogs"));
                  v37 = objc_claimAutoreleasedReturnValue();
                  v38 = (void *)v37;
                  v39 = v57;
                  if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (v37)
                    {
                      objc_opt_class();
                      v40 = objc_opt_isKindOfClass();
                      objc_msgSend(v7, "objectForKey:", CFSTR("config"));
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v40 & 1) == 0)
                      {
LABEL_42:
                        v35 = (void *)v64;
                        goto LABEL_33;
                      }
                    }
                    else
                    {
                      objc_msgSend(v7, "objectForKey:", CFSTR("config"));
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v5->_typologyLogVersion = objc_msgSend(v57, "unsignedIntegerValue");
                      v5->_traceLogVersion = 3;
                      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v63);
                      uuid = v5->_uuid;
                      v5->_uuid = (NSUUID *)v43;

                      v5->_partIndex = objc_msgSend(v62, "unsignedIntegerValue");
                      v45 = objc_msgSend(v61, "copy");
                      date = v5->_date;
                      v5->_date = (NSDate *)v45;

                      v47 = objc_msgSend(v60, "copy");
                      systemVersion = v5->_systemVersion;
                      v5->_systemVersion = (NSString *)v47;

                      v49 = objc_msgSend(v59, "copy");
                      buildVersion = v5->_buildVersion;
                      v5->_buildVersion = (NSString *)v49;

                      v51 = objc_msgSend(v58, "copy");
                      clientIdentifier = v5->_clientIdentifier;
                      v5->_clientIdentifier = (NSString *)v51;

                      v53 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
                      records = v5->_records;
                      v5->_records = v53;

                      -[TIRollingLog addEntries:](v5->_records, "addEntries:", v33);
                      v55 = -[TIRollingLog initWithMaxCount:]([TIRollingLog alloc], "initWithMaxCount:", 750);
                      traceRecords = v5->_traceRecords;
                      v5->_traceRecords = v55;

                      if (v38)
                        -[TITypologyLog parseTraceLogContent:](v5, "parseTraceLogContent:", v38);
                      objc_storeStrong((id *)&v5->_config, v41);
                      v35 = (void *)v64;
                      goto LABEL_34;
                    }
                    goto LABEL_42;
                  }
                  v35 = (void *)v64;
                }
                else
                {
                  objc_msgSend(v7, "objectForKey:", CFSTR("traceLogs"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v57;
                }
                objc_msgSend(v7, "objectForKey:", CFSTR("config"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

                v5 = 0;
LABEL_34:

                goto LABEL_35;
              }
LABEL_24:
              v25 = 0;
              goto LABEL_25;
            }
LABEL_23:
            v58 = (void *)v23;
            v59 = (void *)v21;
            objc_msgSend(v7, "objectForKey:", CFSTR("records"));
            v64 = objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
LABEL_22:
          objc_msgSend(v7, "objectForKey:", CFSTR("clientIdentifier"));
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_21:
        objc_msgSend(v7, "objectForKey:", CFSTR("buildVersion"));
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("date"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("systemVersion"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_35:

  return v5;
}

- (unint64_t)numTypologyRecords
{
  return -[TIRollingLog count](self->_records, "count");
}

- (unint64_t)numTraceRecords
{
  return -[TIRollingLog count](self->_traceRecords, "count");
}

- (unint64_t)maxNumRecords
{
  return -[TIRollingLog maxCount](self->_records, "maxCount");
}

- (id)propertyList
{
  TITypologyLogArchiverDelegate *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  TITypologyLogArchiverDelegate *v36;
  _QWORD v37[10];
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(TITypologyLogArchiverDelegate);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v36 = v3;
  objc_msgSend(v4, "setDelegate:", v3);
  -[TITypologyLog records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("versionNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TITypologyLog typologyLogVersion](self, "typologyLogVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  v37[1] = CFSTR("uuid");
  -[TITypologyLog uuid](self, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v9;
  if (v9)
    v10 = (const __CFString *)v9;
  else
    v10 = &stru_1E243B990;
  v38[1] = v10;
  v37[2] = CFSTR("partIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TITypologyLog partIndex](self, "partIndex"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v32;
  v37[3] = CFSTR("date");
  -[TITypologyLog date](self, "date");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v38[3] = v11;
  v37[4] = CFSTR("systemVersion");
  -[TITypologyLog systemVersion](self, "systemVersion", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E243B990;
  v38[4] = v15;
  v37[5] = CFSTR("buildVersion");
  -[TITypologyLog buildVersion](self, "buildVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E243B990;
  v38[5] = v18;
  v37[6] = CFSTR("clientIdentifier");
  -[TITypologyLog clientIdentifier](self, "clientIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1E243B990;
  v38[6] = v21;
  v37[7] = CFSTR("records");
  v22 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[7] = v22;
  v37[8] = CFSTR("config");
  -[TITypologyLog config](self, "config");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = MEMORY[0x1E0C9AA70];
  if (v23)
    v25 = v23;
  v38[8] = v25;
  v37[9] = CFSTR("textSummary");
  -[TITypologyLog textSummary](self, "textSummary");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = &stru_1E243B990;
  v38[9] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v12)

  return v29;
}

- (id)propertyListWithTrace
{
  void *v3;
  void *v4;
  void *v5;

  -[TITypologyLog propertyList](self, "propertyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TITypologyLog trace](self, "trace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("traceLogs"));

  return v4;
}

- (id)trace
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6046;
  v12 = __Block_byref_object_dispose__6047;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)v9[5];
  -[TITypologyLog traceLogHeader](self, "traceLogHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__TITypologyLog_trace__block_invoke;
  v7[3] = &unk_1E243A418;
  v7[4] = &v8;
  -[TITypologyLog enumerateTraceRecordsWithBlock:](self, "enumerateTraceRecordsWithBlock:", v7);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)traceLogHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Version: %lu\n"), 3);
  -[TITypologyLog date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Date: %@\n"), v6);

  -[TITypologyLog systemVersion](self, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyLog buildVersion](self, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("iOS version: %@ (%@)\n"), v7, v8);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return v3;
}

- (id)timestamp
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setLocale:", v3);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss"));
  -[TITypologyLog date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)parseTraceLogContent:(id)a3
{
  id v4;
  TITraceLogParser *v5;

  v4 = a3;
  v5 = objc_alloc_init(TITraceLogParser);
  -[TITraceLogParser setDelegate:](v5, "setDelegate:", self);
  -[TITraceLogParser parseTraceLogContent:](v5, "parseTraceLogContent:", v4);

  -[TITraceLogParser setDelegate:](v5, "setDelegate:", 0);
}

- (BOOL)writeToTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 withAccessibilityInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  BOOL v18;
  id v19;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v22 = 0;
    v13 = -[TITypologyLog _writeToTypologyLogFile:withAccessibilityInfo:includeTraceLogContent:error:](self, "_writeToTypologyLogFile:withAccessibilityInfo:includeTraceLogContent:error:", v10, v12, v11 == 0, &v22);
    v14 = v22;
    v15 = v14;
    if (v13)
    {
      if (v11)
      {
        v21 = v14;
        v16 = -[TITypologyLog _writeToTraceLogFile:error:](self, "_writeToTraceLogFile:error:", v11, &v21);
        v17 = v21;

        if (v16)
        {
          v18 = 1;
LABEL_18:
          v15 = v17;
          goto LABEL_19;
        }
        if (!a6)
        {
          v18 = 0;
          goto LABEL_18;
        }
        v14 = v17;
        goto LABEL_15;
      }
      v18 = 1;
    }
    else
    {
      if (a6)
      {
LABEL_15:
        v19 = objc_retainAutorelease(v14);
        v15 = v19;
        goto LABEL_16;
      }
      v18 = 0;
    }
  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], *__error(), &unk_1E24B4348);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
LABEL_16:
      v18 = 0;
      *a6 = v19;
      goto LABEL_19;
    }
    v18 = 0;
    v15 = 0;
  }
LABEL_19:

  return v18;
}

- (id)fileCreationOptions
{
  void *v2;
  char v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[TITypologyLog delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalDeviceWithForcedTypologyLoggingForTesting");

  if ((v3 & 1) != 0)
    return 0;
  v5 = *MEMORY[0x1E0CB2AD8];
  v6[0] = *MEMORY[0x1E0CB2AB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_writeToTypologyLogFile:(id)a3 withAccessibilityInfo:(id)a4 includeTraceLogContent:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a5)
    -[TITypologyLog propertyListWithTrace](self, "propertyListWithTrace");
  else
    -[TITypologyLog propertyList](self, "propertyList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v11)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("config"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "addEntriesFromDictionary:", v11);
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("config"));

  }
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v41);
  v19 = v41;

  if (!v18 || v19)
  {
    v27 = 0;
    if (a6 && v19)
    {
      v19 = objc_retainAutorelease(v19);
      v27 = 0;
      *a6 = v19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyLog fileCreationOptions](self, "fileCreationOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "createFileAtPath:contents:attributes:", v21, v22, v23);

    if ((v24 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v10, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "open");
      objc_msgSend(v25, "streamError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v19 = v26;
        if (a6)
        {
          v19 = objc_retainAutorelease(v26);
          v27 = 0;
          *a6 = v19;
        }
        else
        {
          v27 = 0;
        }
      }
      else
      {
        v40 = 0;
        v35 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v13, v25, 100, 0, &v40);
        v36 = v40;
        v19 = v36;
        if (!v35 && !v36)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, &unk_1E24B4370);
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "close");
        objc_msgSend(v25, "streamError");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37 && !v19)
          v19 = v37;
        if (a6 && v19)
          *a6 = objc_retainAutorelease(v19);
        v27 = v19 == 0;

      }
    }
    else
    {
      if (a6)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB28A8];
        v30 = *__error();
        v42 = CFSTR("Error");
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = __error();
        objc_msgSend(v31, "stringWithCString:encoding:", strerror(*v32), 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30, v34);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
      v27 = 0;
    }
  }

  return v27;
}

- (BOOL)_writeToTraceLogFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v51);
  v10 = v51;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyLog traceLogHeader](self, "traceLogHeader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyLog fileCreationOptions](self, "fileCreationOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "createFileAtPath:contents:attributes:", v14, v16, v17);

    if ((v18 & 1) != 0)
    {
      v50 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v6, &v50);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v50;
      v10 = v20;
      if (!v19 || v20)
      {
        v12 = 0;
        if (a4 && v20)
        {
          v10 = objc_retainAutorelease(v20);
          v12 = 0;
          *a4 = v10;
        }
      }
      else
      {
        v48 = 0;
        v49 = 0;
        objc_msgSend(v19, "seekToEndReturningOffset:error:", &v49, &v48);
        v10 = v48;
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v10)
        {
          v42 = 0;
          v43 = &v42;
          v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__6046;
          v46 = __Block_byref_object_dispose__6047;
          v47 = 0;
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __44__TITypologyLog__writeToTraceLogFile_error___block_invoke;
          v38[3] = &unk_1E243A440;
          v23 = v21;
          v39 = v23;
          v24 = v19;
          v40 = v24;
          v41 = &v42;
          -[TITypologyLog enumerateTraceRecordsWithBlockIncludingStop:](self, "enumerateTraceRecordsWithBlockIncludingStop:", v38);
          v10 = (id)v43[5];

          _Block_object_dispose(&v42, 8);
          if (!v10)
          {
            objc_msgSend(v23, "dataUsingEncoding:", 4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0;
            objc_msgSend(v24, "writeData:error:", v25, &v37);
            v10 = v37;

          }
        }
        v36 = 0;
        objc_msgSend(v19, "closeAndReturnError:", &v36);
        v26 = v36;
        v27 = v26;
        if (v26 && !v10)
          v10 = v26;
        if (a4 && v10)
          *a4 = objc_retainAutorelease(v10);
        v12 = v10 == 0;

      }
    }
    else
    {
      if (a4)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB28A8];
        v30 = *__error();
        v52 = CFSTR("Error");
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = __error();
        objc_msgSend(v31, "stringWithCString:encoding:", strerror(*v32), 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30, v34);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    if (a4 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      v12 = 0;
      *a4 = v10;
    }
  }

  return v12;
}

- (NSString)recommendedTypologyLogFilename
{
  return (NSString *)-[TITypologyLog _recommendedFilenameWithPrefix:andSuffix:](self, "_recommendedFilenameWithPrefix:andSuffix:", CFSTR("typology"), CFSTR("plist"));
}

- (NSString)recommendedTraceLogFilename
{
  return (NSString *)-[TITypologyLog _recommendedFilenameWithPrefix:andSuffix:](self, "_recommendedFilenameWithPrefix:andSuffix:", CFSTR("typologyTrace"), CFSTR("log"));
}

- (id)_recommendedFilenameWithPrefix:(id)a3 andSuffix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[TITypologyLog uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyLog timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TITypologyLog partIndex](self, "partIndex"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@.%lu.%@"), v6, v10, v9, -[TITypologyLog partIndex](self, "partIndex"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@.%@"), v6, v10, v9, v7, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)textSummary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TITypologyRecordGroupMarker *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[TITypologyLog records](self, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[TITypologyLog lastKeyboardState](self, "lastKeyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(TITypologyRecordGroupMarker);
      -[TITypologyLog lastKeyboardState](self, "lastKeyboardState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypologyRecordGroupMarker setKeyboardState:](v8, "setKeyboardState:", v9);

      -[TITypologyLog logRecord:](self, "logRecord:", v8);
    }
  }
  -[TITypologyLog records](self, "records");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__TITypologyLog_textSummary__block_invoke;
  v14[3] = &unk_1E243A468;
  v12 = v3;
  v15 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  return v12;
}

- (id)recordSummary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("TYPOLOGY LOG\n"));
  objc_msgSend(v3, "appendString:", CFSTR("------------\n"));
  -[TITypologyLog uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("uuid = %@\n"), v7);

  -[TITypologyLog date](self, "date");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("date = %@\n"), v10);

  -[TITypologyLog systemVersion](self, "systemVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("systemVersion = %@\n"), v13);

  -[TITypologyLog clientIdentifier](self, "clientIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("clientIdentifier = %@\n"), v16);

  -[TITypologyLog textSummary](self, "textSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("textSummary = %@\n"), v17);

  objc_msgSend(v3, "appendString:", CFSTR("------------\n"));
  -[TITypologyLog records](self, "records");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentEntries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return v3;
}

- (void)_logRecord:(id)a3 trace:(id)a4
{
  id v6;
  TITypologyRecord *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TITraceLogRecord *v12;
  void *v13;
  TITraceLogRecord *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  TITypologyRecord *v23;
  TITypologyRecord *v24;

  v23 = (TITypologyRecord *)a3;
  v6 = a4;
  v7 = v23;
  if (!v23)
    v7 = objc_alloc_init(TITypologyRecord);
  v24 = v7;
  -[TITypologyLog clientIdentifier](self, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    -[TITypologyRecord keyboardState](v24, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyLog setClientIdentifier:](self, "setClientIdentifier:", v9);

  }
LABEL_7:
  -[TITypologyRecord currentKeyboardState](v24, "currentKeyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TITypologyRecord removeContextFromKeyboardState](v24, "removeContextFromKeyboardState");
    -[TITypologyRecord currentKeyboardState](v24, "currentKeyboardState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyLog setLastKeyboardState:](self, "setLastKeyboardState:", v11);

  }
  v12 = [TITraceLogRecord alloc];
  -[TITypologyRecord recordID](v24, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TITraceLogRecord initWithRecordUUID:logText:logVersion:](v12, "initWithRecordUUID:logText:logVersion:", v13, v6, 3);

  -[TITypologyLog records](self, "records");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntry:", v24);

  -[TITypologyLog traceRecords](self, "traceRecords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntry:", v14);

  -[TITypologyLog loggedRecordClasses](self, "loggedRecordClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", objc_opt_class());

  -[TITypologyLog records](self, "records");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  -[TITypologyLog records](self, "records");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "maxCount");

  if (v19 == v21)
  {
    -[TITypologyLog delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didReachMaximumEntries:", self);

  }
}

- (void)logRecord:(id)a3
{
  -[TITypologyLog logRecord:trace:](self, "logRecord:trace:", a3, 0);
}

- (void)logRecord:(id)a3 trace:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", 54);

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TITypologyLog _logRecord:trace:](self, "_logRecord:trace:", v9, v6);

}

- (void)traceHeaderParsed:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("Version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    self->_traceLogVersion = objc_msgSend(v4, "unsignedIntegerValue");
    v4 = v5;
  }

}

- (void)traceRecordParsed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyLog traceRecords](self, "traceRecords");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntry:", v4);

}

- (void)enumerateTypologyRecordsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[TITypologyLog records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)enumerateTypologyRecordsWithBlockIncludingStop:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v16 = 0;
  -[TITypologyLog records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      if (v16)
        break;
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), &v16);
      if (v9 == v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateTraceRecordsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[TITypologyLog traceRecords](self, "traceRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)enumerateTraceRecordsWithBlockIncludingStop:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v16 = 0;
  -[TITypologyLog traceRecords](self, "traceRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      if (v16)
        break;
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), &v16);
      if (v9 == v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateParsedTraceRecordsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TITypologyLog_enumerateParsedTraceRecordsWithBlock___block_invoke;
  v6[3] = &unk_1E243A490;
  v7 = v4;
  v5 = v4;
  -[TITypologyLog enumerateTraceRecordsWithBlock:](self, "enumerateTraceRecordsWithBlock:", v6);

}

- (void)enumerateParsedTraceRecordsWithBlockIncludingStop:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__TITypologyLog_enumerateParsedTraceRecordsWithBlockIncludingStop___block_invoke;
  v6[3] = &unk_1E243A4B8;
  v7 = v4;
  v5 = v4;
  -[TITypologyLog enumerateTraceRecordsWithBlockIncludingStop:](self, "enumerateTraceRecordsWithBlockIncludingStop:", v6);

}

- (id)typologyRecordMatchingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TITypologyLog records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "recordID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)traceRecordMatchingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TITypologyLog traceRecords](self, "traceRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "recordUUID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)parsedTraceRecordMatchingUUID:(id)a3
{
  void *v3;

  -[TITypologyLog traceRecordMatchingUUID:](self, "traceRecordMatchingUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parse");
  return v3;
}

- (id)typologyRecordsMatchingUUIDRange:(id)a3 endUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TITypologyLog records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
      objc_msgSend(v15, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v6);

      v12 |= v17;
      if ((v12 & 1) != 0)
        objc_msgSend(v22, "addObject:", v15);
      objc_msgSend(v15, "recordID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v7);

      if ((v19 & 1) != 0)
        break;
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v20 = (void *)objc_msgSend(v22, "copy");
  return v20;
}

- (id)typologyRecordUUIDsIncludedInRange:(id)a3 endUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[TITypologyLog records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      objc_msgSend(v15, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v6);

      v12 |= v17;
      if ((v12 & 1) != 0)
      {
        objc_msgSend(v15, "recordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v18);

      }
      objc_msgSend(v15, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v7);

      if ((v20 & 1) != 0)
        break;
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSMutableSet)loggedRecordClasses
{
  NSMutableSet *loggedRecordClasses;
  NSMutableSet *v4;
  NSMutableSet *v5;

  loggedRecordClasses = self->_loggedRecordClasses;
  if (!loggedRecordClasses)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_loggedRecordClasses;
    self->_loggedRecordClasses = v4;

    loggedRecordClasses = self->_loggedRecordClasses;
  }
  return loggedRecordClasses;
}

- (BOOL)loggedRecordOfClass:(Class)a3
{
  void *v4;

  -[TITypologyLog loggedRecordClasses](self, "loggedRecordClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsObject:", a3);

  return (char)a3;
}

- (unint64_t)typologyLogVersion
{
  return self->_typologyLogVersion;
}

- (unint64_t)traceLogVersion
{
  return self->_traceLogVersion;
}

- (TITypologyLogDelegate)delegate
{
  return (TITypologyLogDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)partIndex
{
  return self->_partIndex;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (TIRollingLog)records
{
  return self->_records;
}

- (TIRollingLog)traceRecords
{
  return self->_traceRecords;
}

- (void)setLoggedRecordClasses:(id)a3
{
  objc_storeStrong((id *)&self->_loggedRecordClasses, a3);
}

- (TIKeyboardState)lastKeyboardState
{
  return self->_lastKeyboardState;
}

- (void)setLastKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_lastKeyboardState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKeyboardState, 0);
  objc_storeStrong((id *)&self->_loggedRecordClasses, 0);
  objc_storeStrong((id *)&self->_traceRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __67__TITypologyLog_enumerateParsedTraceRecordsWithBlockIncludingStop___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "parse");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__TITypologyLog_enumerateParsedTraceRecordsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "parse");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __28__TITypologyLog_textSummary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "textSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
}

void __44__TITypologyLog__writeToTraceLogFile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id obj;

  v3 = a2;
  v4 = (void *)MEMORY[0x18D7835DC]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "logTextWithHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >= 0x7D1)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    obj = 0;
    objc_msgSend(v7, "writeData:error:", v8, &obj);
    objc_storeStrong(v9, obj);

    objc_msgSend(*(id *)(a1 + 32), "setString:", &stru_1E243B990);
  }
  objc_autoreleasePoolPop(v4);

}

void __22__TITypologyLog_trace__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "logTextWithHeader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

BOOL __38__TITypologyLog_initWithPropertyList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (id)typologyLogFromTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  TITypologyLog *v13;
  TITypologyLog *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v24 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v8, &v24);
    v11 = v24;
    if (v11)
    {
      v12 = v11;
      if (a5)
      {
        v12 = objc_retainAutorelease(v11);
        v13 = 0;
        *a5 = v12;
      }
      else
      {
        v13 = 0;
      }
      goto LABEL_29;
    }
    v14 = -[TITypologyLog initWithPropertyList:]([TITypologyLog alloc], "initWithPropertyList:", v10);
    objc_msgSend(v10, "objectForKey:", CFSTR("traceLogs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v15)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], *__error(), &unk_1E24B4320);
        v12 = 0;
        v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v12 = 0;
LABEL_20:
      v13 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("traceLogs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_14;
    if (!v9)
    {
      objc_msgSend(a1, "traceLogURLFromTypologyLogURL:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

      if (!v21)
      {
        v12 = 0;
        v17 = v9;
        v9 = 0;
LABEL_26:

        goto LABEL_27;
      }
      if (!v9)
      {
LABEL_14:
        v12 = 0;
LABEL_27:
        v13 = v14;
        goto LABEL_28;
      }
    }
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v9, 4, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
    v12 = v18;
    if (a5 && v18)
    {
      v12 = objc_retainAutorelease(v18);
      *a5 = v12;

      goto LABEL_20;
    }
    -[TITypologyLog parseTraceLogContent:](v14, "parseTraceLogContent:", v17);
    goto LABEL_26;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], *__error(), &unk_1E24B42F8);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_30:

  return v13;
}

+ (BOOL)isTypologyLogFilename:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("typology")))
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".plist"));
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isTraceLogFilename:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("typologyTrace")))
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".log"));
  else
    v4 = 0;

  return v4;
}

+ (id)traceLogFilenameFromTypologyLogFilename:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isTypologyLogFilename:", v4))
  {
    objc_msgSend(a1, "_adjustFilename:oldPrefix:newPrefix:oldSuffix:newSuffix:", v4, CFSTR("typology-"), CFSTR("typologyTrace-"), CFSTR(".plist"), CFSTR(".log"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)typologyLogFilenameFromTraceLogFilename:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isTraceLogFilename:", v4))
  {
    objc_msgSend(a1, "_adjustFilename:oldPrefix:newPrefix:oldSuffix:newSuffix:", v4, CFSTR("typologyTrace-"), CFSTR("typology-"), CFSTR(".log"), CFSTR(".plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_adjustFilename:(id)a3 oldPrefix:(id)a4 newPrefix:(id)a5 oldSuffix:(id)a6 newSuffix:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:options:range:", v14, v13, 8, 0, objc_msgSend(v15, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:options:range:", v12, v11, 12, 0, objc_msgSend(v16, "length"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)traceLogURLFromTypologyLogURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "traceLogFilenameFromTypologyLogFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)typologyLogURLFromTraceLogURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typologyLogFilenameFromTraceLogFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
