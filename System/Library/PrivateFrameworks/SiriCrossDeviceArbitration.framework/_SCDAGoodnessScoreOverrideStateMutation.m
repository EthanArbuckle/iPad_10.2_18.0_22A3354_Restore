@implementation _SCDAGoodnessScoreOverrideStateMutation

- (_SCDAGoodnessScoreOverrideStateMutation)initWithBase:(id)a3
{
  id v5;
  _SCDAGoodnessScoreOverrideStateMutation *v6;
  _SCDAGoodnessScoreOverrideStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCDAGoodnessScoreOverrideStateMutation;
  v6 = -[_SCDAGoodnessScoreOverrideStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getOverrideOption
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_overrideOption;
  else
    return -[SCDAGoodnessScoreOverrideState overrideOption](self->_base, "overrideOption");
}

- (void)setOverrideOption:(int64_t)a3
{
  self->_overrideOption = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getReason
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_reason;
  }
  else
  {
    -[SCDAGoodnessScoreOverrideState reason](self->_base, "reason");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
