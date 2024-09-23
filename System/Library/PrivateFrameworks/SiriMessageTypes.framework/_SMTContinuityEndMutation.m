@implementation _SMTContinuityEndMutation

- (_SMTContinuityEndMutation)initWithBase:(id)a3
{
  id v5;
  _SMTContinuityEndMutation *v6;
  _SMTContinuityEndMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTContinuityEndMutation;
  v6 = -[_SMTContinuityEndMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getGeneratedHostTime
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_generatedHostTime;
  else
    return -[SMTContinuityEnd generatedHostTime](self->_base, "generatedHostTime");
}

- (void)setGeneratedHostTime:(unint64_t)a3
{
  self->_generatedHostTime = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getLastTRPCandidateId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_lastTRPCandidateId;
  }
  else
  {
    -[SMTContinuityEnd lastTRPCandidateId](self->_base, "lastTRPCandidateId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLastTRPCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_lastTRPCandidateId, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getRequestId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    -[SMTContinuityEnd requestId](self->_base, "requestId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
