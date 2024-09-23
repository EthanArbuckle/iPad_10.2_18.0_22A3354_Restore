@implementation SMTTCUPackage

- (SMTTCUPackage)initWithBuilder:(id)a3
{
  void (**v4)(id, _SMTTCUPackageMutation *);
  SMTTCUPackage *v5;
  SMTTCUPackage *v6;
  _SMTTCUPackageMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *tcuId;
  void *v11;
  uint64_t v12;
  NSString *requestId;
  void *v14;
  uint64_t v15;
  SMTSiriIntendedInfo *siriIntendedInfo;
  void *v17;
  uint64_t v18;
  NSArray *prevTCUIds;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  AFSpeechPackage *speechPackage;
  objc_super v26;

  v4 = (void (**)(id, _SMTTCUPackageMutation *))a3;
  v26.receiver = self;
  v26.super_class = (Class)SMTTCUPackage;
  v5 = -[SMTTCUPackage init](&v26, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SMTTCUPackageMutation initWithBase:]([_SMTTCUPackageMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SMTTCUPackageMutation isDirty](v7, "isDirty"))
    {
      -[_SMTTCUPackageMutation getTcuId](v7, "getTcuId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      tcuId = v6->_tcuId;
      v6->_tcuId = (NSString *)v9;

      -[_SMTTCUPackageMutation getRequestId](v7, "getRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      v6->_tcuState = -[_SMTTCUPackageMutation getTcuState](v7, "getTcuState");
      v6->_speechEvent = -[_SMTTCUPackageMutation getSpeechEvent](v7, "getSpeechEvent");
      v6->_voiceTriggerPhraseType = -[_SMTTCUPackageMutation getVoiceTriggerPhraseType](v7, "getVoiceTriggerPhraseType");
      -[_SMTTCUPackageMutation getSiriIntendedInfo](v7, "getSiriIntendedInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      siriIntendedInfo = v6->_siriIntendedInfo;
      v6->_siriIntendedInfo = (SMTSiriIntendedInfo *)v15;

      -[_SMTTCUPackageMutation getPrevTCUIds](v7, "getPrevTCUIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      prevTCUIds = v6->_prevTCUIds;
      v6->_prevTCUIds = (NSArray *)v18;

      -[_SMTTCUPackageMutation getStartAudioTimeStampInMs](v7, "getStartAudioTimeStampInMs");
      v6->_startAudioTimeStampInMs = v20;
      -[_SMTTCUPackageMutation getEndAudioTimeStampInMs](v7, "getEndAudioTimeStampInMs");
      v6->_endAudioTimeStampInMs = v21;
      -[_SMTTCUPackageMutation getSpeechPackage](v7, "getSpeechPackage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      speechPackage = v6->_speechPackage;
      v6->_speechPackage = (AFSpeechPackage *)v23;

    }
  }

  return v6;
}

- (SMTTCUPackage)init
{
  return -[SMTTCUPackage initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SMTTCUPackage)initWithTcuId:(id)a3 requestId:(id)a4 tcuState:(int64_t)a5 speechEvent:(int64_t)a6 voiceTriggerPhraseType:(int64_t)a7 siriIntendedInfo:(id)a8 prevTCUIds:(id)a9 startAudioTimeStampInMs:(double)a10 endAudioTimeStampInMs:(double)a11 speechPackage:(id)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  SMTTCUPackage *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  double v41;
  double v42;

  v20 = a3;
  v21 = a4;
  v22 = a8;
  v23 = a9;
  v24 = a12;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __173__SMTTCUPackage_initWithTcuId_requestId_tcuState_speechEvent_voiceTriggerPhraseType_siriIntendedInfo_prevTCUIds_startAudioTimeStampInMs_endAudioTimeStampInMs_speechPackage___block_invoke;
  v32[3] = &unk_2517F9680;
  v33 = v20;
  v34 = v21;
  v39 = a6;
  v40 = a7;
  v35 = v22;
  v36 = v23;
  v41 = a10;
  v42 = a11;
  v37 = v24;
  v38 = a5;
  v25 = v24;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = v20;
  v30 = -[SMTTCUPackage initWithBuilder:](self, "initWithBuilder:", v32);

  return v30;
}

- (id)description
{
  return -[SMTTCUPackage _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t tcuState;
  __CFString *v7;
  NSString *tcuId;
  NSString *requestId;
  __CFString *v10;
  unint64_t voiceTriggerPhraseType;
  int64_t speechEvent;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  objc_super v17;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v17.receiver = self;
  v17.super_class = (Class)SMTTCUPackage;
  -[SMTTCUPackage description](&v17, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tcuState = self->_tcuState;
  if (tcuState > 4)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_2517F96C0[tcuState];
  tcuId = self->_tcuId;
  requestId = self->_requestId;
  v10 = v7;
  speechEvent = self->_speechEvent;
  voiceTriggerPhraseType = self->_voiceTriggerPhraseType;
  if (voiceTriggerPhraseType > 2)
    v13 = CFSTR("(unknown)");
  else
    v13 = *(&off_2517F9860 + voiceTriggerPhraseType);
  v14 = v13;
  v15 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {tcuId = %@, requestId = %@, tcuState = %@, speechEvent = %lld, voiceTriggerPhraseType = %@, siriIntendedInfo = %@, prevTCUIds = %@, startAudioTimeStampInMs = %f, endAudioTimeStampInMs = %f, speechPackage = %@}"), v5, tcuId, requestId, v10, speechEvent, v14, self->_siriIntendedInfo, self->_prevTCUIds, *(_QWORD *)&self->_startAudioTimeStampInMs, *(_QWORD *)&self->_endAudioTimeStampInMs, self->_speechPackage);

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  v3 = -[NSString hash](self->_tcuId, "hash");
  v4 = -[NSString hash](self->_requestId, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_tcuState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_speechEvent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_voiceTriggerPhraseType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[SMTSiriIntendedInfo hash](self->_siriIntendedInfo, "hash");
  v12 = v11 ^ -[NSArray hash](self->_prevTCUIds, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startAudioTimeStampInMs);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_endAudioTimeStampInMs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = v16 ^ -[AFSpeechPackage hash](self->_speechPackage, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  SMTTCUPackage *v4;
  SMTTCUPackage *v5;
  int64_t tcuState;
  int64_t speechEvent;
  int64_t voiceTriggerPhraseType;
  double startAudioTimeStampInMs;
  double v10;
  double endAudioTimeStampInMs;
  double v12;
  BOOL v13;
  NSString *v15;
  NSString *tcuId;
  NSString *v17;
  NSString *requestId;
  SMTSiriIntendedInfo *v19;
  SMTSiriIntendedInfo *siriIntendedInfo;
  NSArray *v21;
  NSArray *prevTCUIds;
  AFSpeechPackage *v23;
  AFSpeechPackage *speechPackage;

  v4 = (SMTTCUPackage *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      tcuState = self->_tcuState;
      if (tcuState == -[SMTTCUPackage tcuState](v5, "tcuState")
        && (speechEvent = self->_speechEvent, speechEvent == -[SMTTCUPackage speechEvent](v5, "speechEvent"))
        && (voiceTriggerPhraseType = self->_voiceTriggerPhraseType,
            voiceTriggerPhraseType == -[SMTTCUPackage voiceTriggerPhraseType](v5, "voiceTriggerPhraseType"))
        && (startAudioTimeStampInMs = self->_startAudioTimeStampInMs,
            -[SMTTCUPackage startAudioTimeStampInMs](v5, "startAudioTimeStampInMs"),
            startAudioTimeStampInMs == v10)
        && (endAudioTimeStampInMs = self->_endAudioTimeStampInMs,
            -[SMTTCUPackage endAudioTimeStampInMs](v5, "endAudioTimeStampInMs"),
            endAudioTimeStampInMs == v12))
      {
        -[SMTTCUPackage tcuId](v5, "tcuId");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        tcuId = self->_tcuId;
        if (tcuId == v15 || -[NSString isEqual:](tcuId, "isEqual:", v15))
        {
          -[SMTTCUPackage requestId](v5, "requestId");
          v17 = (NSString *)objc_claimAutoreleasedReturnValue();
          requestId = self->_requestId;
          if (requestId == v17 || -[NSString isEqual:](requestId, "isEqual:", v17))
          {
            -[SMTTCUPackage siriIntendedInfo](v5, "siriIntendedInfo");
            v19 = (SMTSiriIntendedInfo *)objc_claimAutoreleasedReturnValue();
            siriIntendedInfo = self->_siriIntendedInfo;
            if (siriIntendedInfo == v19 || -[SMTSiriIntendedInfo isEqual:](siriIntendedInfo, "isEqual:", v19))
            {
              -[SMTTCUPackage prevTCUIds](v5, "prevTCUIds");
              v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
              prevTCUIds = self->_prevTCUIds;
              if (prevTCUIds == v21 || -[NSArray isEqual:](prevTCUIds, "isEqual:", v21))
              {
                -[SMTTCUPackage speechPackage](v5, "speechPackage");
                v23 = (AFSpeechPackage *)objc_claimAutoreleasedReturnValue();
                speechPackage = self->_speechPackage;
                v13 = speechPackage == v23 || -[AFSpeechPackage isEqual:](speechPackage, "isEqual:", v23);

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (SMTTCUPackage)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  SMTTCUPackage *v23;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::tcuId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::requestId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::tcuState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::speechEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::voiceTriggerPhraseType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::siriIntendedInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("SMTTCUPackage::prevTCUIds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::startAudioTimeStampInMs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::endAudioTimeStampInMs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTCUPackage::speechPackage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SMTTCUPackage initWithTcuId:requestId:tcuState:speechEvent:voiceTriggerPhraseType:siriIntendedInfo:prevTCUIds:startAudioTimeStampInMs:endAudioTimeStampInMs:speechPackage:](self, "initWithTcuId:requestId:tcuState:speechEvent:voiceTriggerPhraseType:siriIntendedInfo:prevTCUIds:startAudioTimeStampInMs:endAudioTimeStampInMs:speechPackage:", v4, v5, v25, v8, v10, v11, v18, v21, v15, v22);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *tcuId;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  tcuId = self->_tcuId;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", tcuId, CFSTR("SMTTCUPackage::tcuId"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_requestId, CFSTR("SMTTCUPackage::requestId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_tcuState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("SMTTCUPackage::tcuState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_speechEvent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("SMTTCUPackage::speechEvent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_voiceTriggerPhraseType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("SMTTCUPackage::voiceTriggerPhraseType"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_siriIntendedInfo, CFSTR("SMTTCUPackage::siriIntendedInfo"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_prevTCUIds, CFSTR("SMTTCUPackage::prevTCUIds"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startAudioTimeStampInMs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("SMTTCUPackage::startAudioTimeStampInMs"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_endAudioTimeStampInMs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("SMTTCUPackage::endAudioTimeStampInMs"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_speechPackage, CFSTR("SMTTCUPackage::speechPackage"));
}

- (NSString)tcuId
{
  return self->_tcuId;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (int64_t)tcuState
{
  return self->_tcuState;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (int64_t)voiceTriggerPhraseType
{
  return self->_voiceTriggerPhraseType;
}

- (SMTSiriIntendedInfo)siriIntendedInfo
{
  return self->_siriIntendedInfo;
}

- (NSArray)prevTCUIds
{
  return self->_prevTCUIds;
}

- (double)startAudioTimeStampInMs
{
  return self->_startAudioTimeStampInMs;
}

- (double)endAudioTimeStampInMs
{
  return self->_endAudioTimeStampInMs;
}

- (AFSpeechPackage)speechPackage
{
  return self->_speechPackage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechPackage, 0);
  objc_storeStrong((id *)&self->_prevTCUIds, 0);
  objc_storeStrong((id *)&self->_siriIntendedInfo, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
}

void __173__SMTTCUPackage_initWithTcuId_requestId_tcuState_speechEvent_voiceTriggerPhraseType_siriIntendedInfo_prevTCUIds_startAudioTimeStampInMs_endAudioTimeStampInMs_speechPackage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTcuId:", v3);
  objc_msgSend(v4, "setRequestId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTcuState:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setSpeechEvent:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setVoiceTriggerPhraseType:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setSiriIntendedInfo:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setPrevTCUIds:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setStartAudioTimeStampInMs:", *(double *)(a1 + 96));
  objc_msgSend(v4, "setEndAudioTimeStampInMs:", *(double *)(a1 + 104));
  objc_msgSend(v4, "setSpeechPackage:", *(_QWORD *)(a1 + 64));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SMTTCUPackageMutation *);
  _SMTTCUPackageMutation *v5;
  SMTTCUPackage *v6;
  void *v7;
  uint64_t v8;
  NSString *tcuId;
  void *v10;
  uint64_t v11;
  NSString *requestId;
  void *v13;
  uint64_t v14;
  SMTSiriIntendedInfo *siriIntendedInfo;
  void *v16;
  uint64_t v17;
  NSArray *prevTCUIds;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  AFSpeechPackage *speechPackage;

  v4 = (void (**)(id, _SMTTCUPackageMutation *))a3;
  if (v4)
  {
    v5 = -[_SMTTCUPackageMutation initWithBase:]([_SMTTCUPackageMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SMTTCUPackageMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SMTTCUPackage);
      -[_SMTTCUPackageMutation getTcuId](v5, "getTcuId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      tcuId = v6->_tcuId;
      v6->_tcuId = (NSString *)v8;

      -[_SMTTCUPackageMutation getRequestId](v5, "getRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      v6->_tcuState = -[_SMTTCUPackageMutation getTcuState](v5, "getTcuState");
      v6->_speechEvent = -[_SMTTCUPackageMutation getSpeechEvent](v5, "getSpeechEvent");
      v6->_voiceTriggerPhraseType = -[_SMTTCUPackageMutation getVoiceTriggerPhraseType](v5, "getVoiceTriggerPhraseType");
      -[_SMTTCUPackageMutation getSiriIntendedInfo](v5, "getSiriIntendedInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      siriIntendedInfo = v6->_siriIntendedInfo;
      v6->_siriIntendedInfo = (SMTSiriIntendedInfo *)v14;

      -[_SMTTCUPackageMutation getPrevTCUIds](v5, "getPrevTCUIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      prevTCUIds = v6->_prevTCUIds;
      v6->_prevTCUIds = (NSArray *)v17;

      -[_SMTTCUPackageMutation getStartAudioTimeStampInMs](v5, "getStartAudioTimeStampInMs");
      v6->_startAudioTimeStampInMs = v19;
      -[_SMTTCUPackageMutation getEndAudioTimeStampInMs](v5, "getEndAudioTimeStampInMs");
      v6->_endAudioTimeStampInMs = v20;
      -[_SMTTCUPackageMutation getSpeechPackage](v5, "getSpeechPackage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      speechPackage = v6->_speechPackage;
      v6->_speechPackage = (AFSpeechPackage *)v22;

    }
    else
    {
      v6 = (SMTTCUPackage *)-[SMTTCUPackage copy](self, "copy");
    }

  }
  else
  {
    v6 = (SMTTCUPackage *)-[SMTTCUPackage copy](self, "copy");
  }

  return v6;
}

@end
