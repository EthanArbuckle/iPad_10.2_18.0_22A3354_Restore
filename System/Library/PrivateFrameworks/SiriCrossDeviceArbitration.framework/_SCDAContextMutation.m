@implementation _SCDAContextMutation

- (_SCDAContextMutation)initWithBase:(id)a3
{
  id v5;
  _SCDAContextMutation *v6;
  _SCDAContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCDAContextMutation;
  v6 = -[_SCDAContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_timestamp;
  else
    return -[SCDAContext timestamp](self->_base, "timestamp");
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getPerceptualAudioHash
{
  SCDAPerceptualAudioHash *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_perceptualAudioHash;
  }
  else
  {
    -[SCDAContext perceptualAudioHash](self->_base, "perceptualAudioHash");
    v2 = (SCDAPerceptualAudioHash *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPerceptualAudioHash:(id)a3
{
  objc_storeStrong((id *)&self->_perceptualAudioHash, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getOverrideState
{
  SCDAGoodnessScoreOverrideState *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_overrideState;
  }
  else
  {
    -[SCDAContext overrideState](self->_base, "overrideState");
    v2 = (SCDAGoodnessScoreOverrideState *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOverrideState:(id)a3
{
  objc_storeStrong((id *)&self->_overrideState, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getActivationSource
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_activationSource;
  else
    return -[SCDAContext activationSource](self->_base, "activationSource");
}

- (void)setActivationSource:(int64_t)a3
{
  self->_activationSource = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getActivationExpirationTime
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_activationExpirationTime;
  else
    return -[SCDAContext activationExpirationTime](self->_base, "activationExpirationTime");
}

- (void)setActivationExpirationTime:(unint64_t)a3
{
  self->_activationExpirationTime = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
