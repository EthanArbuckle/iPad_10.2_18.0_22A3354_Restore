@implementation SMTContinuityEnd

- (SMTContinuityEnd)initWithBuilder:(id)a3
{
  void (**v4)(id, _SMTContinuityEndMutation *);
  SMTContinuityEnd *v5;
  SMTContinuityEnd *v6;
  _SMTContinuityEndMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *lastTRPCandidateId;
  void *v11;
  uint64_t v12;
  NSString *requestId;
  objc_super v15;

  v4 = (void (**)(id, _SMTContinuityEndMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SMTContinuityEnd;
  v5 = -[SMTContinuityEnd init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SMTContinuityEndMutation initWithBase:]([_SMTContinuityEndMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SMTContinuityEndMutation isDirty](v7, "isDirty"))
    {
      v6->_generatedHostTime = -[_SMTContinuityEndMutation getGeneratedHostTime](v7, "getGeneratedHostTime");
      -[_SMTContinuityEndMutation getLastTRPCandidateId](v7, "getLastTRPCandidateId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v9;

      -[_SMTContinuityEndMutation getRequestId](v7, "getRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

    }
  }

  return v6;
}

- (SMTContinuityEnd)init
{
  return -[SMTContinuityEnd initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 requestId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  SMTContinuityEnd *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId_requestId___block_invoke;
  v14[3] = &unk_2517F9430;
  v16 = v9;
  v17 = a3;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  v12 = -[SMTContinuityEnd initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4
{
  id v6;
  id v7;
  SMTContinuityEnd *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId___block_invoke;
  v10[3] = &unk_2517F9458;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = -[SMTContinuityEnd initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[SMTContinuityEnd _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SMTContinuityEnd;
  -[SMTContinuityEnd description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {generatedHostTime = %llu, lastTRPCandidateId = %@, requestId = %@}"), v5, self->_generatedHostTime, self->_lastTRPCandidateId, self->_requestId);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_generatedHostTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_lastTRPCandidateId, "hash");
  v6 = v5 ^ -[NSString hash](self->_requestId, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SMTContinuityEnd *v4;
  SMTContinuityEnd *v5;
  unint64_t generatedHostTime;
  NSString *v7;
  NSString *lastTRPCandidateId;
  NSString *v9;
  NSString *requestId;
  BOOL v11;

  v4 = (SMTContinuityEnd *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      generatedHostTime = self->_generatedHostTime;
      if (generatedHostTime == -[SMTContinuityEnd generatedHostTime](v5, "generatedHostTime"))
      {
        -[SMTContinuityEnd lastTRPCandidateId](v5, "lastTRPCandidateId");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        lastTRPCandidateId = self->_lastTRPCandidateId;
        if (lastTRPCandidateId == v7 || -[NSString isEqual:](lastTRPCandidateId, "isEqual:", v7))
        {
          -[SMTContinuityEnd requestId](v5, "requestId");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          requestId = self->_requestId;
          v11 = requestId == v9 || -[NSString isEqual:](requestId, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (SMTContinuityEnd)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SMTContinuityEnd *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTContinuityEnd::generatedHostTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTContinuityEnd::lastTRPCandidateId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTContinuityEnd::requestId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SMTContinuityEnd initWithGeneratedHostTime:lastTRPCandidateId:requestId:](self, "initWithGeneratedHostTime:lastTRPCandidateId:requestId:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t generatedHostTime;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  generatedHostTime = self->_generatedHostTime;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", generatedHostTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SMTContinuityEnd::generatedHostTime"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_lastTRPCandidateId, CFSTR("SMTContinuityEnd::lastTRPCandidateId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_requestId, CFSTR("SMTContinuityEnd::requestId"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
}

void __65__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setGeneratedHostTime:", v3);
  objc_msgSend(v4, "setLastTRPCandidateId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setRequestId:", 0);

}

void __75__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId_requestId___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setGeneratedHostTime:", v3);
  objc_msgSend(v4, "setLastTRPCandidateId:", a1[4]);
  objc_msgSend(v4, "setRequestId:", a1[5]);

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
  void (**v4)(id, _SMTContinuityEndMutation *);
  _SMTContinuityEndMutation *v5;
  SMTContinuityEnd *v6;
  void *v7;
  uint64_t v8;
  NSString *lastTRPCandidateId;
  void *v10;
  uint64_t v11;
  NSString *requestId;

  v4 = (void (**)(id, _SMTContinuityEndMutation *))a3;
  if (v4)
  {
    v5 = -[_SMTContinuityEndMutation initWithBase:]([_SMTContinuityEndMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SMTContinuityEndMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SMTContinuityEnd);
      v6->_generatedHostTime = -[_SMTContinuityEndMutation getGeneratedHostTime](v5, "getGeneratedHostTime");
      -[_SMTContinuityEndMutation getLastTRPCandidateId](v5, "getLastTRPCandidateId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v8;

      -[_SMTContinuityEndMutation getRequestId](v5, "getRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

    }
    else
    {
      v6 = (SMTContinuityEnd *)-[SMTContinuityEnd copy](self, "copy");
    }

  }
  else
  {
    v6 = (SMTContinuityEnd *)-[SMTContinuityEnd copy](self, "copy");
  }

  return v6;
}

@end
