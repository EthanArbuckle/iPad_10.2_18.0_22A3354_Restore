@implementation PGMeaningfulEventMatchingResult

- (PGMeaningfulEventMatchingResult)initWithIsMatching:(BOOL)a3 score:(double)a4 isReliable:(BOOL)a5 requiredCriteria:(id)a6
{
  id v11;
  PGMeaningfulEventMatchingResult *v12;
  PGMeaningfulEventMatchingResult *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventMatchingResult;
  v12 = -[PGMeaningfulEventMatchingResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_isMatching = a3;
    v12->_score = a4;
    v12->_isReliable = a5;
    objc_storeStrong((id *)&v12->_requiredCriteria, a6);
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGMeaningfulEventMatchingResult;
  -[PGMeaningfulEventMatchingResult description](&v10, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("YES");
  if (self->_isMatching)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_isReliable)
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ isMatching %@, score %.2f, isReliable %@, criteria %@"), v4, v7, *(_QWORD *)&self->_score, v6, self->_requiredCriteria);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isMatching
{
  return self->_isMatching;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isReliable
{
  return self->_isReliable;
}

- (PGMeaningfulEventRequiredCriteria)requiredCriteria
{
  return self->_requiredCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredCriteria, 0);
}

@end
