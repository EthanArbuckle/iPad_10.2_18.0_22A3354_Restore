@implementation _SCDAAdvertisementContextMutation

- (_SCDAAdvertisementContextMutation)initWithBase:(id)a3
{
  id v5;
  _SCDAAdvertisementContextMutation *v6;
  _SCDAAdvertisementContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCDAAdvertisementContextMutation;
  v6 = -[_SCDAAdvertisementContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getGeneration
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_generation;
  else
    return -[SCDAAdvertisementContext generation](self->_base, "generation");
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getContextData
{
  NSData *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_contextData;
  }
  else
  {
    -[SCDAAdvertisementContext contextData](self->_base, "contextData");
    v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (double)getContextFetchDelay
{
  double result;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_contextFetchDelay;
  -[SCDAAdvertisementContext contextFetchDelay](self->_base, "contextFetchDelay");
  return result;
}

- (void)setContextFetchDelay:(double)a3
{
  self->_contextFetchDelay = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
