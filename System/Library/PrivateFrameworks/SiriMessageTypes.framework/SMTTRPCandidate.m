@implementation SMTTRPCandidate

- (SMTTRPCandidate)initWithBuilder:(id)a3
{
  void (**v4)(id, _SMTTRPCandidateMutation *);
  SMTTRPCandidate *v5;
  SMTTRPCandidate *v6;
  _SMTTRPCandidateMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *trpCandidateId;
  void *v11;
  uint64_t v12;
  NSString *requestId;
  void *v14;
  uint64_t v15;
  NSArray *tcuList;
  void *v17;
  uint64_t v18;
  NSString *userId;
  objc_super v21;

  v4 = (void (**)(id, _SMTTRPCandidateMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SMTTRPCandidate;
  v5 = -[SMTTRPCandidate init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SMTTRPCandidateMutation initWithBase:]([_SMTTRPCandidateMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SMTTRPCandidateMutation isDirty](v7, "isDirty"))
    {
      -[_SMTTRPCandidateMutation getTrpCandidateId](v7, "getTrpCandidateId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      trpCandidateId = v6->_trpCandidateId;
      v6->_trpCandidateId = (NSString *)v9;

      -[_SMTTRPCandidateMutation getRequestId](v7, "getRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      -[_SMTTRPCandidateMutation getTcuList](v7, "getTcuList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      tcuList = v6->_tcuList;
      v6->_tcuList = (NSArray *)v15;

      -[_SMTTRPCandidateMutation getUserId](v7, "getUserId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      userId = v6->_userId;
      v6->_userId = (NSString *)v18;

      v6->_isContinuous = -[_SMTTRPCandidateMutation getIsContinuous](v7, "getIsContinuous");
    }

  }
  return v6;
}

- (SMTTRPCandidate)init
{
  return -[SMTTRPCandidate initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SMTTRPCandidate *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList___block_invoke;
  v16[3] = &unk_2517F9718;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = -[SMTTRPCandidate initWithBuilder:](self, "initWithBuilder:", v16);

  return v14;
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 tcuList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  SMTTRPCandidate *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__SMTTRPCandidate_initWithTrpCandidateId_tcuList___block_invoke;
  v12[3] = &unk_2517F9740;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[SMTTRPCandidate initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5 userId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SMTTRPCandidate *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList_userId___block_invoke;
  v20[3] = &unk_2517F9768;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = -[SMTTRPCandidate initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (id)description
{
  return -[SMTTRPCandidate _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SMTTRPCandidate;
  -[SMTTRPCandidate description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {trpCandidateId = %@, requestId = %@, tcuList = %@, userId = %@,                         isContinuous = %u}"), v5, self->_trpCandidateId, self->_requestId, self->_tcuList, self->_userId, self->_isContinuous);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_trpCandidateId, "hash");
  v4 = -[NSArray hash](self->_tcuList, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_userId, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isContinuous);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SMTTRPCandidate *v4;
  SMTTRPCandidate *v5;
  NSString *v6;
  NSString *trpCandidateId;
  NSString *v8;
  NSString *requestId;
  NSArray *v10;
  NSArray *tcuList;
  NSString *v12;
  NSString *userId;
  BOOL v14;

  v4 = (SMTTRPCandidate *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMTTRPCandidate trpCandidateId](v5, "trpCandidateId");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      trpCandidateId = self->_trpCandidateId;
      if (trpCandidateId == v6 || -[NSString isEqual:](trpCandidateId, "isEqual:", v6))
      {
        -[SMTTRPCandidate requestId](v5, "requestId");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        requestId = self->_requestId;
        if (requestId == v8 || -[NSString isEqual:](requestId, "isEqual:", v8))
        {
          -[SMTTRPCandidate tcuList](v5, "tcuList");
          v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
          tcuList = self->_tcuList;
          if (tcuList == v10 || -[NSArray isEqual:](tcuList, "isEqual:", v10))
          {
            -[SMTTRPCandidate userId](v5, "userId");
            v12 = (NSString *)objc_claimAutoreleasedReturnValue();
            userId = self->_userId;
            v14 = (userId == v12 || -[NSString isEqual:](userId, "isEqual:", v12))
               && self->_isContinuous == -[SMTTRPCandidate isContinuous](v5, "isContinuous");

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (SMTTRPCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SMTTRPCandidate *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trpCandidateId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("tcuList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContinuous"));

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SMTTRPCandidate_initWithCoder___block_invoke;
  v19[3] = &unk_2517F9790;
  v20 = v5;
  v21 = v6;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v6;
  v16 = v5;
  v17 = -[SMTTRPCandidate initWithBuilder:](self, "initWithBuilder:", v19);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *trpCandidateId;
  id v5;
  id v6;

  trpCandidateId = self->_trpCandidateId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", trpCandidateId, CFSTR("trpCandidateId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestId, CFSTR("requestId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tcuList, CFSTR("tcuList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userId, CFSTR("userId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isContinuous);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isContinuous"));

}

- (NSString)trpCandidateId
{
  return self->_trpCandidateId;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSArray)tcuList
{
  return self->_tcuList;
}

- (NSString)userId
{
  return self->_userId;
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_tcuList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
}

void __33__SMTTRPCandidate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTrpCandidateId:", v3);
  objc_msgSend(v4, "setRequestId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTcuList:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setUserId:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setIsContinuous:", *(unsigned __int8 *)(a1 + 64));

}

void __67__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList_userId___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTrpCandidateId:", v3);
  objc_msgSend(v4, "setRequestId:", a1[5]);
  objc_msgSend(v4, "setTcuList:", a1[6]);
  objc_msgSend(v4, "setUserId:", a1[7]);

}

void __50__SMTTRPCandidate_initWithTrpCandidateId_tcuList___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTrpCandidateId:", v3);
  objc_msgSend(v4, "setRequestId:", 0);
  objc_msgSend(v4, "setTcuList:", *(_QWORD *)(a1 + 40));

}

void __60__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTrpCandidateId:", v3);
  objc_msgSend(v4, "setRequestId:", a1[5]);
  objc_msgSend(v4, "setTcuList:", a1[6]);

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
  void (**v4)(id, _SMTTRPCandidateMutation *);
  _SMTTRPCandidateMutation *v5;
  SMTTRPCandidate *v6;
  void *v7;
  uint64_t v8;
  NSString *trpCandidateId;
  void *v10;
  uint64_t v11;
  NSString *requestId;
  void *v13;
  uint64_t v14;
  NSArray *tcuList;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  NSString *userId;

  v4 = (void (**)(id, _SMTTRPCandidateMutation *))a3;
  if (v4)
  {
    v5 = -[_SMTTRPCandidateMutation initWithBase:]([_SMTTRPCandidateMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SMTTRPCandidateMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SMTTRPCandidate);
      -[_SMTTRPCandidateMutation getTrpCandidateId](v5, "getTrpCandidateId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      trpCandidateId = v6->_trpCandidateId;
      v6->_trpCandidateId = (NSString *)v8;

      -[_SMTTRPCandidateMutation getRequestId](v5, "getRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      -[_SMTTRPCandidateMutation getTcuList](v5, "getTcuList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      tcuList = v6->_tcuList;
      v6->_tcuList = (NSArray *)v14;

      -[_SMTTRPCandidateMutation getRequestId](v5, "getRequestId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      v18 = v6->_requestId;
      v6->_requestId = (NSString *)v17;

      -[_SMTTRPCandidateMutation getUserId](v5, "getUserId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      userId = v6->_userId;
      v6->_userId = (NSString *)v20;

      v6->_isContinuous = -[_SMTTRPCandidateMutation getIsContinuous](v5, "getIsContinuous");
    }
    else
    {
      v6 = (SMTTRPCandidate *)-[SMTTRPCandidate copy](self, "copy");
    }

  }
  else
  {
    v6 = (SMTTRPCandidate *)-[SMTTRPCandidate copy](self, "copy");
  }

  return v6;
}

@end
