@implementation SMTTRPDetected

- (SMTTRPDetected)initWithBuilder:(id)a3
{
  void (**v4)(id, _SMTTRPDetectedMutation *);
  SMTTRPDetected *v5;
  SMTTRPDetected *v6;
  _SMTTRPDetectedMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *lastTRPCandidateId;
  void *v11;
  uint64_t v12;
  NSString *requestId;
  double v14;
  objc_super v16;

  v4 = (void (**)(id, _SMTTRPDetectedMutation *))a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTTRPDetected;
  v5 = -[SMTTRPDetected init](&v16, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SMTTRPDetectedMutation initWithBase:]([_SMTTRPDetectedMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SMTTRPDetectedMutation isDirty](v7, "isDirty"))
    {
      v6->_generatedHostTime = -[_SMTTRPDetectedMutation getGeneratedHostTime](v7, "getGeneratedHostTime");
      -[_SMTTRPDetectedMutation getLastTRPCandidateId](v7, "getLastTRPCandidateId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v9;

      -[_SMTTRPDetectedMutation getRequestId](v7, "getRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      -[_SMTTRPDetectedMutation getTrpDetectedAudioTimeStamp](v7, "getTrpDetectedAudioTimeStamp");
      v6->_trpDetectedAudioTimeStamp = v14;
    }

  }
  return v6;
}

- (SMTTRPDetected)init
{
  return -[SMTTRPDetected initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5 requestId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SMTTRPDetected *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  double v20;

  v10 = a4;
  v11 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __99__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp_requestId___block_invoke;
  v16[3] = &unk_2517F97D8;
  v18 = v11;
  v19 = a3;
  v17 = v10;
  v20 = a5;
  v12 = v11;
  v13 = v10;
  v14 = -[SMTTRPDetected initWithBuilder:](self, "initWithBuilder:", v16);

  return v14;
}

- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5
{
  id v8;
  id v9;
  SMTTRPDetected *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  double v15;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp___block_invoke;
  v12[3] = &unk_2517F9800;
  v13 = v8;
  v14 = a3;
  v15 = a5;
  v9 = v8;
  v10 = -[SMTTRPDetected initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[SMTTRPDetected _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SMTTRPDetected;
  -[SMTTRPDetected description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {generatedHostTime = %llu, lastTRPCandidateId = %@, requestId = %@trpDetectedAudioTimeStamp = %f}"), v5, self->_generatedHostTime, self->_lastTRPCandidateId, self->_requestId, *(_QWORD *)&self->_trpDetectedAudioTimeStamp);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_generatedHostTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_lastTRPCandidateId, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_trpDetectedAudioTimeStamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SMTTRPDetected *v4;
  SMTTRPDetected *v5;
  unint64_t generatedHostTime;
  double trpDetectedAudioTimeStamp;
  double v8;
  BOOL v9;
  NSString *v11;
  NSString *lastTRPCandidateId;
  NSString *v13;
  NSString *requestId;

  v4 = (SMTTRPDetected *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      generatedHostTime = self->_generatedHostTime;
      if (generatedHostTime == -[SMTTRPDetected generatedHostTime](v5, "generatedHostTime")
        && (trpDetectedAudioTimeStamp = self->_trpDetectedAudioTimeStamp,
            -[SMTTRPDetected trpDetectedAudioTimeStamp](v5, "trpDetectedAudioTimeStamp"),
            trpDetectedAudioTimeStamp == v8))
      {
        -[SMTTRPDetected lastTRPCandidateId](v5, "lastTRPCandidateId");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        lastTRPCandidateId = self->_lastTRPCandidateId;
        if (lastTRPCandidateId == v11 || -[NSString isEqual:](lastTRPCandidateId, "isEqual:", v11))
        {
          -[SMTTRPDetected requestId](v5, "requestId");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          requestId = self->_requestId;
          v9 = requestId == v13 || -[NSString isEqual:](requestId, "isEqual:", v13);

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SMTTRPDetected)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  SMTTRPDetected *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTRPDetected::generatedHostTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTRPDetected::lastTRPCandidateId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTRPDetected::requestId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTTRPDetected::trpDetectedAudioTimeStamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = -[SMTTRPDetected initWithGeneratedHostTime:lastTRPCandidateId:trpDetectedAudioTimeStamp:requestId:](self, "initWithGeneratedHostTime:lastTRPCandidateId:trpDetectedAudioTimeStamp:requestId:", v6, v7, v8, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t generatedHostTime;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  generatedHostTime = self->_generatedHostTime;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", generatedHostTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SMTTRPDetected::generatedHostTime"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lastTRPCandidateId, CFSTR("SMTTRPDetected::lastTRPCandidateId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_requestId, CFSTR("SMTTRPDetected::requestId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_trpDetectedAudioTimeStamp);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SMTTRPDetected::trpDetectedAudioTimeStamp"));

}

- (unint64_t)generatedHostTime
{
  return self->_generatedHostTime;
}

- (NSString)lastTRPCandidateId
{
  return self->_lastTRPCandidateId;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (double)trpDetectedAudioTimeStamp
{
  return self->_trpDetectedAudioTimeStamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
}

void __89__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setGeneratedHostTime:", v3);
  objc_msgSend(v4, "setLastTRPCandidateId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setRequestId:", 0);
  objc_msgSend(v4, "setTrpDetectedAudioTimeStamp:", *(double *)(a1 + 48));

}

void __99__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp_requestId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setGeneratedHostTime:", v3);
  objc_msgSend(v4, "setLastTRPCandidateId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setRequestId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTrpDetectedAudioTimeStamp:", *(double *)(a1 + 56));

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
  void (**v4)(id, _SMTTRPDetectedMutation *);
  _SMTTRPDetectedMutation *v5;
  SMTTRPDetected *v6;
  void *v7;
  uint64_t v8;
  NSString *lastTRPCandidateId;
  void *v10;
  uint64_t v11;
  NSString *requestId;
  double v13;

  v4 = (void (**)(id, _SMTTRPDetectedMutation *))a3;
  if (v4)
  {
    v5 = -[_SMTTRPDetectedMutation initWithBase:]([_SMTTRPDetectedMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SMTTRPDetectedMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SMTTRPDetected);
      v6->_generatedHostTime = -[_SMTTRPDetectedMutation getGeneratedHostTime](v5, "getGeneratedHostTime");
      -[_SMTTRPDetectedMutation getLastTRPCandidateId](v5, "getLastTRPCandidateId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v8;

      -[_SMTTRPDetectedMutation getRequestId](v5, "getRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      -[_SMTTRPDetectedMutation getTrpDetectedAudioTimeStamp](v5, "getTrpDetectedAudioTimeStamp");
      v6->_trpDetectedAudioTimeStamp = v13;
    }
    else
    {
      v6 = (SMTTRPDetected *)-[SMTTRPDetected copy](self, "copy");
    }

  }
  else
  {
    v6 = (SMTTRPDetected *)-[SMTTRPDetected copy](self, "copy");
  }

  return v6;
}

@end
