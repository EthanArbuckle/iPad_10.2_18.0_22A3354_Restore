@implementation SCDASession

- (SCDASession)initWithBuilder:(id)a3
{
  void (**v4)(id, _SCDASessionMutation *);
  SCDASession *v5;
  SCDASession *v6;
  _SCDASessionMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *sessionId;
  void *v11;
  uint64_t v12;
  NSUUID *currentElectionAdvertisementId;
  void *v14;
  uint64_t v15;
  NSData *currentElectionAdvertisementData;
  void *v17;
  uint64_t v18;
  NSDictionary *electionAdvertisementDataByIds;
  objc_super v21;

  v4 = (void (**)(id, _SCDASessionMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SCDASession;
  v5 = -[SCDASession init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SCDASessionMutation initWithBase:]([_SCDASessionMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SCDASessionMutation isDirty](v7, "isDirty"))
    {
      v6->_generation = -[_SCDASessionMutation getGeneration](v7, "getGeneration");
      -[_SCDASessionMutation getSessionId](v7, "getSessionId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      sessionId = v6->_sessionId;
      v6->_sessionId = (NSUUID *)v9;

      -[_SCDASessionMutation getCurrentElectionAdvertisementId](v7, "getCurrentElectionAdvertisementId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      currentElectionAdvertisementId = v6->_currentElectionAdvertisementId;
      v6->_currentElectionAdvertisementId = (NSUUID *)v12;

      -[_SCDASessionMutation getCurrentElectionAdvertisementData](v7, "getCurrentElectionAdvertisementData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      currentElectionAdvertisementData = v6->_currentElectionAdvertisementData;
      v6->_currentElectionAdvertisementData = (NSData *)v15;

      -[_SCDASessionMutation getElectionAdvertisementDataByIds](v7, "getElectionAdvertisementDataByIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      electionAdvertisementDataByIds = v6->_electionAdvertisementDataByIds;
      v6->_electionAdvertisementDataByIds = (NSDictionary *)v18;

    }
  }

  return v6;
}

- (SCDASession)init
{
  return -[SCDASession initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SCDASession)initWithGeneration:(unint64_t)a3 sessionId:(id)a4 currentElectionAdvertisementId:(id)a5 currentElectionAdvertisementData:(id)a6 electionAdvertisementDataByIds:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SCDASession *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __139__SCDASession_initWithGeneration_sessionId_currentElectionAdvertisementId_currentElectionAdvertisementData_electionAdvertisementDataByIds___block_invoke;
  v22[3] = &unk_251749EB0;
  v26 = v15;
  v27 = a3;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = -[SCDASession initWithBuilder:](self, "initWithBuilder:", v22);

  return v20;
}

- (id)description
{
  return -[SCDASession _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SCDASession;
  -[SCDASession description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {generation = %llu, sessionId = %@, currentElectionAdvertisementId = %@, currentElectionAdvertisementData = (%llu bytes), electionAdvertisementDataByIds = %@}"), v5, self->_generation, self->_sessionId, self->_currentElectionAdvertisementId, -[NSData length](self->_currentElectionAdvertisementData, "length"), self->_electionAdvertisementDataByIds);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_generation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSUUID hash](self->_sessionId, "hash");
  v6 = v5 ^ -[NSUUID hash](self->_currentElectionAdvertisementId, "hash");
  v7 = v6 ^ -[NSData hash](self->_currentElectionAdvertisementData, "hash") ^ v4;
  v8 = v7 ^ -[NSDictionary hash](self->_electionAdvertisementDataByIds, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SCDASession *v4;
  SCDASession *v5;
  unint64_t generation;
  NSUUID *v7;
  NSUUID *sessionId;
  NSUUID *v9;
  NSUUID *currentElectionAdvertisementId;
  NSData *v11;
  NSData *currentElectionAdvertisementData;
  NSDictionary *v13;
  NSDictionary *electionAdvertisementDataByIds;
  BOOL v15;

  v4 = (SCDASession *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      generation = self->_generation;
      if (generation == -[SCDASession generation](v5, "generation"))
      {
        -[SCDASession sessionId](v5, "sessionId");
        v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        sessionId = self->_sessionId;
        if (sessionId == v7 || -[NSUUID isEqual:](sessionId, "isEqual:", v7))
        {
          -[SCDASession currentElectionAdvertisementId](v5, "currentElectionAdvertisementId");
          v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          currentElectionAdvertisementId = self->_currentElectionAdvertisementId;
          if (currentElectionAdvertisementId == v9
            || -[NSUUID isEqual:](currentElectionAdvertisementId, "isEqual:", v9))
          {
            -[SCDASession currentElectionAdvertisementData](v5, "currentElectionAdvertisementData");
            v11 = (NSData *)objc_claimAutoreleasedReturnValue();
            currentElectionAdvertisementData = self->_currentElectionAdvertisementData;
            if (currentElectionAdvertisementData == v11
              || -[NSData isEqual:](currentElectionAdvertisementData, "isEqual:", v11))
            {
              -[SCDASession electionAdvertisementDataByIds](v5, "electionAdvertisementDataByIds");
              v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              electionAdvertisementDataByIds = self->_electionAdvertisementDataByIds;
              v15 = electionAdvertisementDataByIds == v13
                 || -[NSDictionary isEqual:](electionAdvertisementDataByIds, "isEqual:", v13);

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (SCDASession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SCDASession *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDASession::generation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDASession::sessionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDASession::currentElectionAdvertisementId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDASession::currentElectionAdvertisementData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SCDASession::electionAdvertisementDataByIds"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SCDASession initWithGeneration:sessionId:currentElectionAdvertisementId:currentElectionAdvertisementData:electionAdvertisementDataByIds:](self, "initWithGeneration:sessionId:currentElectionAdvertisementId:currentElectionAdvertisementData:electionAdvertisementDataByIds:", v6, v7, v8, v9, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t generation;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  generation = self->_generation;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", generation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SCDASession::generation"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionId, CFSTR("SCDASession::sessionId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currentElectionAdvertisementId, CFSTR("SCDASession::currentElectionAdvertisementId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currentElectionAdvertisementData, CFSTR("SCDASession::currentElectionAdvertisementData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_electionAdvertisementDataByIds, CFSTR("SCDASession::electionAdvertisementDataByIds"));

}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (NSUUID)currentElectionAdvertisementId
{
  return self->_currentElectionAdvertisementId;
}

- (NSData)currentElectionAdvertisementData
{
  return self->_currentElectionAdvertisementData;
}

- (NSDictionary)electionAdvertisementDataByIds
{
  return self->_electionAdvertisementDataByIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionAdvertisementDataByIds, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementData, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

void __139__SCDASession_initWithGeneration_sessionId_currentElectionAdvertisementId_currentElectionAdvertisementData_electionAdvertisementDataByIds___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[8];
  v4 = a2;
  objc_msgSend(v4, "setGeneration:", v3);
  objc_msgSend(v4, "setSessionId:", a1[4]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementId:", a1[5]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementData:", a1[6]);
  objc_msgSend(v4, "setElectionAdvertisementDataByIds:", a1[7]);

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
  void (**v4)(id, _SCDASessionMutation *);
  _SCDASessionMutation *v5;
  SCDASession *v6;
  void *v7;
  uint64_t v8;
  NSUUID *sessionId;
  void *v10;
  uint64_t v11;
  NSUUID *currentElectionAdvertisementId;
  void *v13;
  uint64_t v14;
  NSData *currentElectionAdvertisementData;
  void *v16;
  uint64_t v17;
  NSDictionary *electionAdvertisementDataByIds;

  v4 = (void (**)(id, _SCDASessionMutation *))a3;
  if (v4)
  {
    v5 = -[_SCDASessionMutation initWithBase:]([_SCDASessionMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SCDASessionMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SCDASession);
      v6->_generation = -[_SCDASessionMutation getGeneration](v5, "getGeneration");
      -[_SCDASessionMutation getSessionId](v5, "getSessionId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      sessionId = v6->_sessionId;
      v6->_sessionId = (NSUUID *)v8;

      -[_SCDASessionMutation getCurrentElectionAdvertisementId](v5, "getCurrentElectionAdvertisementId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      currentElectionAdvertisementId = v6->_currentElectionAdvertisementId;
      v6->_currentElectionAdvertisementId = (NSUUID *)v11;

      -[_SCDASessionMutation getCurrentElectionAdvertisementData](v5, "getCurrentElectionAdvertisementData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      currentElectionAdvertisementData = v6->_currentElectionAdvertisementData;
      v6->_currentElectionAdvertisementData = (NSData *)v14;

      -[_SCDASessionMutation getElectionAdvertisementDataByIds](v5, "getElectionAdvertisementDataByIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      electionAdvertisementDataByIds = v6->_electionAdvertisementDataByIds;
      v6->_electionAdvertisementDataByIds = (NSDictionary *)v17;

    }
    else
    {
      v6 = (SCDASession *)-[SCDASession copy](self, "copy");
    }

  }
  else
  {
    v6 = (SCDASession *)-[SCDASession copy](self, "copy");
  }

  return v6;
}

@end
