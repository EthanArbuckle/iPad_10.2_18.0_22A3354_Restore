@implementation _SMTTCUPackageMutation

- (_SMTTCUPackageMutation)initWithBase:(id)a3
{
  id v5;
  _SMTTCUPackageMutation *v6;
  _SMTTCUPackageMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTCUPackageMutation;
  v6 = -[_SMTTCUPackageMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getTcuId
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_tcuId;
  }
  else
  {
    -[SMTTCUPackage tcuId](self->_base, "tcuId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTcuId:(id)a3
{
  objc_storeStrong((id *)&self->_tcuId, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getRequestId
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    -[SMTTCUPackage requestId](self->_base, "requestId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getTcuState
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_tcuState;
  else
    return -[SMTTCUPackage tcuState](self->_base, "tcuState");
}

- (void)setTcuState:(int64_t)a3
{
  self->_tcuState = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getSpeechEvent
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_speechEvent;
  else
    return -[SMTTCUPackage speechEvent](self->_base, "speechEvent");
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_speechEvent = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getVoiceTriggerPhraseType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_voiceTriggerPhraseType;
  else
    return -[SMTTCUPackage voiceTriggerPhraseType](self->_base, "voiceTriggerPhraseType");
}

- (void)setVoiceTriggerPhraseType:(int64_t)a3
{
  self->_voiceTriggerPhraseType = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSiriIntendedInfo
{
  SMTSiriIntendedInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_siriIntendedInfo;
  }
  else
  {
    -[SMTTCUPackage siriIntendedInfo](self->_base, "siriIntendedInfo");
    v2 = (SMTSiriIntendedInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSiriIntendedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_siriIntendedInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getPrevTCUIds
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_prevTCUIds;
  }
  else
  {
    -[SMTTCUPackage prevTCUIds](self->_base, "prevTCUIds");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPrevTCUIds:(id)a3
{
  objc_storeStrong((id *)&self->_prevTCUIds, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (double)getStartAudioTimeStampInMs
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_startAudioTimeStampInMs;
  -[SMTTCUPackage startAudioTimeStampInMs](self->_base, "startAudioTimeStampInMs");
  return result;
}

- (void)setStartAudioTimeStampInMs:(double)a3
{
  self->_startAudioTimeStampInMs = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (double)getEndAudioTimeStampInMs
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
    return self->_endAudioTimeStampInMs;
  -[SMTTCUPackage endAudioTimeStampInMs](self->_base, "endAudioTimeStampInMs");
  return result;
}

- (void)setEndAudioTimeStampInMs:(double)a3
{
  self->_endAudioTimeStampInMs = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getSpeechPackage
{
  AFSpeechPackage *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_speechPackage;
  }
  else
  {
    -[SMTTCUPackage speechPackage](self->_base, "speechPackage");
    v2 = (AFSpeechPackage *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeechPackage:(id)a3
{
  objc_storeStrong((id *)&self->_speechPackage, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechPackage, 0);
  objc_storeStrong((id *)&self->_prevTCUIds, 0);
  objc_storeStrong((id *)&self->_siriIntendedInfo, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
