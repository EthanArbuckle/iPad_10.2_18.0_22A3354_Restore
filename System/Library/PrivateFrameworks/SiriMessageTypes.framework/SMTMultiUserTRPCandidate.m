@implementation SMTMultiUserTRPCandidate

- (SMTMultiUserTRPCandidate)initWithBuilder:(id)a3
{
  void (**v4)(id, SMTMultiUserTRPCandidateBuilder *);
  SMTMultiUserTRPCandidate *v5;
  SMTMultiUserTRPCandidate *v6;
  SMTMultiUserTRPCandidateBuilder *v7;
  uint64_t v8;
  NSString *multiUserTrpCandidateId;
  uint64_t v10;
  NSString *requestId;
  void *v12;
  uint64_t v13;
  NSArray *trpCandidateList;
  objc_super v16;

  v4 = (void (**)(id, SMTMultiUserTRPCandidateBuilder *))a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTMultiUserTRPCandidate;
  v5 = -[SMTMultiUserTRPCandidate init](&v16, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SMTMultiUserTRPCandidateBuilder);
    v4[2](v4, v7);
    -[SMTMultiUserTRPCandidateBuilder multiUserTrpCandidateId](v7, "multiUserTrpCandidateId");
    v8 = objc_claimAutoreleasedReturnValue();
    multiUserTrpCandidateId = v6->_multiUserTrpCandidateId;
    v6->_multiUserTrpCandidateId = (NSString *)v8;

    -[SMTMultiUserTRPCandidateBuilder requestId](v7, "requestId");
    v10 = objc_claimAutoreleasedReturnValue();
    requestId = v6->_requestId;
    v6->_requestId = (NSString *)v10;

    -[SMTMultiUserTRPCandidateBuilder trpCandidateList](v7, "trpCandidateList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    trpCandidateList = v6->_trpCandidateList;
    v6->_trpCandidateList = (NSArray *)v13;

  }
  return v6;
}

- (id)description
{
  return -[SMTMultiUserTRPCandidate _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SMTMultiUserTRPCandidate;
  -[SMTMultiUserTRPCandidate description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {multiUserTrpCandidateId = %@, requestId = %@, trpCandidateList = %@}"), v5, self->_multiUserTrpCandidateId, self->_requestId, self->_trpCandidateList);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_multiUserTrpCandidateId, "hash");
  v4 = -[NSArray hash](self->_trpCandidateList, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_requestId, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SMTMultiUserTRPCandidate *v4;
  SMTMultiUserTRPCandidate *v5;
  NSString *v6;
  NSString *multiUserTrpCandidateId;
  NSString *v8;
  NSString *requestId;
  NSArray *v10;
  NSArray *trpCandidateList;
  BOOL v12;

  v4 = (SMTMultiUserTRPCandidate *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMTMultiUserTRPCandidate multiUserTrpCandidateId](v5, "multiUserTrpCandidateId");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      multiUserTrpCandidateId = self->_multiUserTrpCandidateId;
      if (multiUserTrpCandidateId == v6 || -[NSString isEqual:](multiUserTrpCandidateId, "isEqual:", v6))
      {
        -[SMTMultiUserTRPCandidate requestId](v5, "requestId");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        requestId = self->_requestId;
        if (requestId == v8 || -[NSString isEqual:](requestId, "isEqual:", v8))
        {
          -[SMTMultiUserTRPCandidate trpCandidateList](v5, "trpCandidateList");
          v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
          trpCandidateList = self->_trpCandidateList;
          v12 = trpCandidateList == v10 || -[NSArray isEqual:](trpCandidateList, "isEqual:", v10);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (SMTMultiUserTRPCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  SMTMultiUserTRPCandidate *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiUserTrpCandidateId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trpCandidateList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__SMTMultiUserTRPCandidate_initWithCoder___block_invoke;
  v16[3] = &unk_2517F9498;
  v17 = v5;
  v18 = v10;
  v19 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v5;
  v14 = -[SMTMultiUserTRPCandidate initWithBuilder:](self, "initWithBuilder:", v16);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *multiUserTrpCandidateId;
  id v5;

  multiUserTrpCandidateId = self->_multiUserTrpCandidateId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", multiUserTrpCandidateId, CFSTR("multiUserTrpCandidateId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestId, CFSTR("requestId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trpCandidateList, CFSTR("trpCandidateList"));

}

- (NSString)multiUserTrpCandidateId
{
  return self->_multiUserTrpCandidateId;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSArray)trpCandidateList
{
  return self->_trpCandidateList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpCandidateList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_multiUserTrpCandidateId, 0);
}

void __42__SMTMultiUserTRPCandidate_initWithCoder___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setMultiUserTrpCandidateId:", v3);
  objc_msgSend(v4, "setRequestId:", a1[5]);
  objc_msgSend(v4, "setTrpCandidateList:", a1[6]);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
