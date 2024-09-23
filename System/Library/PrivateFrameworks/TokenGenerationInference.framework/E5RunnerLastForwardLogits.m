@implementation E5RunnerLastForwardLogits

- (E5RunnerLastForwardLogits)initWithLogits:(Logits)a3
{
  unint64_t numTokens;
  E5RunnerLastForwardLogits *result;
  Logits v8;
  __int128 v9;
  objc_super v10;

  numTokens = a3.numTokens;
  v10.receiver = self;
  v10.super_class = (Class)E5RunnerLastForwardLogits;
  result = -[E5RunnerLastForwardLogits init](&v10, sel_init, a3.numTokens, a3.m_size.m_size, a4, a5, a6);
  if (result)
  {
    v8 = *(Logits *)numTokens;
    v9 = *(_OWORD *)(numTokens + 16);
    *(_OWORD *)&result[1]._logits.m_size.m_size = *(_OWORD *)(numTokens + 32);
    *(_OWORD *)&result[1].super.isa = v9;
    result->_logits = v8;
  }
  return result;
}

- (int64_t)numTokens
{
  return self->_logits.numTokens;
}

- (uint64_t)logitData
{
  return *(_QWORD *)(a1 + 16);
}

- (int64_t)stridePerLogit
{
  return self[1]._logits.numTokens;
}

- (int64_t)stridePerToken
{
  return self[1]._logits.m_size.m_size;
}

- (int64_t)numLogitsPerToken
{
  return (int64_t)self[2].super.isa;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
