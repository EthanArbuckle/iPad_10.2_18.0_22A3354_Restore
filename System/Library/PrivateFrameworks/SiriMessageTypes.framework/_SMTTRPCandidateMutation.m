@implementation _SMTTRPCandidateMutation

- (_SMTTRPCandidateMutation)initWithBase:(id)a3
{
  id v5;
  _SMTTRPCandidateMutation *v6;
  _SMTTRPCandidateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTRPCandidateMutation;
  v6 = -[_SMTTRPCandidateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getTrpCandidateId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_trpCandidateId;
  }
  else
  {
    -[SMTTRPCandidate trpCandidateId](self->_base, "trpCandidateId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTrpCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_trpCandidateId, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getRequestId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    -[SMTTRPCandidate requestId](self->_base, "requestId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getTcuList
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_tcuList;
  }
  else
  {
    -[SMTTRPCandidate tcuList](self->_base, "tcuList");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTcuList:(id)a3
{
  objc_storeStrong((id *)&self->_tcuList, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_userId;
  }
  else
  {
    -[SMTTRPCandidate userId](self->_base, "userId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getIsContinuous
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_isContinuous;
  else
    return -[SMTTRPCandidate isContinuous](self->_base, "isContinuous");
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_tcuList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
