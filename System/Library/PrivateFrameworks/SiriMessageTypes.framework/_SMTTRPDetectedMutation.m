@implementation _SMTTRPDetectedMutation

- (_SMTTRPDetectedMutation)initWithBase:(id)a3
{
  id v5;
  _SMTTRPDetectedMutation *v6;
  _SMTTRPDetectedMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTRPDetectedMutation;
  v6 = -[_SMTTRPDetectedMutation init](&v9, sel_init);
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
    return -[SMTTRPDetected generatedHostTime](self->_base, "generatedHostTime");
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
    -[SMTTRPDetected lastTRPCandidateId](self->_base, "lastTRPCandidateId");
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
    -[SMTTRPDetected requestId](self->_base, "requestId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (double)getTrpDetectedAudioTimeStamp
{
  double result;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_trpDetectedAudioTimeStamp;
  -[SMTTRPDetected trpDetectedAudioTimeStamp](self->_base, "trpDetectedAudioTimeStamp");
  return result;
}

- (void)setTrpDetectedAudioTimeStamp:(double)a3
{
  self->_trpDetectedAudioTimeStamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
