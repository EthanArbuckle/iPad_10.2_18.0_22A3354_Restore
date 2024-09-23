@implementation SMTMultiUserTRPCandidateBuilder

- (SMTMultiUserTRPCandidateBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  return -[SMTMultiUserTRPCandidateBuilder init](&v3, sel_init);
}

- (id)initBuilderWithTrpCandidateId:(id)a3 requestId:(id)a4 trpCandidateList:(id)a5
{
  id v9;
  id v10;
  id v11;
  SMTMultiUserTRPCandidateBuilder *v12;
  SMTMultiUserTRPCandidateBuilder *v13;
  uint64_t v14;
  NSArray *trpCandidateList;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  v12 = -[SMTMultiUserTRPCandidateBuilder init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_multiUserTrpCandidateId, a3);
    objc_storeStrong((id *)&v13->_requestId, a4);
    v14 = objc_msgSend(v11, "copy");
    trpCandidateList = v13->_trpCandidateList;
    v13->_trpCandidateList = (NSArray *)v14;

  }
  return v13;
}

- (id)initBuilderWithTrpCandidateId:(id)a3 trpCandidateList:(id)a4
{
  id v7;
  id v8;
  SMTMultiUserTRPCandidateBuilder *v9;
  SMTMultiUserTRPCandidateBuilder *v10;
  uint64_t v11;
  NSArray *trpCandidateList;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  v9 = -[SMTMultiUserTRPCandidateBuilder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiUserTrpCandidateId, a3);
    v11 = objc_msgSend(v8, "copy");
    trpCandidateList = v10->_trpCandidateList;
    v10->_trpCandidateList = (NSArray *)v11;

  }
  return v10;
}

- (NSString)multiUserTrpCandidateId
{
  return self->_multiUserTrpCandidateId;
}

- (void)setMultiUserTrpCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)trpCandidateList
{
  return self->_trpCandidateList;
}

- (void)setTrpCandidateList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpCandidateList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_multiUserTrpCandidateId, 0);
}

@end
