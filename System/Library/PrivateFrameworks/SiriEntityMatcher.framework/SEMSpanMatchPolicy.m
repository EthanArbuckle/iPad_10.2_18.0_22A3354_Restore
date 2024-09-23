@implementation SEMSpanMatchPolicy

- (SEMSpanMatchPolicy)initWithOptions:(unsigned int)a3
{
  SEMSpanMatchPolicy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SEMSpanMatchPolicy;
  result = -[SEMSpanMatchPolicy init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (SEMSpanMatchPolicy)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMSpanMatchPolicy;
  -[SEMSpanMatchPolicy description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR("%X"), self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)enableRankingWithPriors
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)useTopFive
{
  return 1;
}

- (float)matchScoreWeight
{
  return 0.8;
}

- (float)priorScoreWeight
{
  return 0.2;
}

- (float)regionalRelativeThreshold
{
  return 0.25;
}

- (float)globalRelativeThreshold
{
  return 0.33;
}

- (float)absoluteThreshold
{
  return -1.0;
}

- (BOOL)allowPartialMatch
{
  return self->_options & 1;
}

- (BOOL)allowApproxMatch
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)prioritizeExactMatch
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)allowAliasMatch
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

@end
