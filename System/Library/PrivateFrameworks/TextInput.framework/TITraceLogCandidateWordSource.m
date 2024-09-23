@implementation TITraceLogCandidateWordSource

- (TITraceLogCandidateWordSource)initWithWordSource:(id)a3 probability:(double)a4 linguisticContextProbability:(double)a5
{
  id v9;
  TITraceLogCandidateWordSource *v10;
  TITraceLogCandidateWordSource *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITraceLogCandidateWordSource;
  v10 = -[TITraceLogCandidateWordSource init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wordSource, a3);
    v11->_probability = a4;
    v11->_linguisticContextProbability = a5;
  }

  return v11;
}

- (NSString)wordSource
{
  return self->_wordSource;
}

- (void)setWordSource:(id)a3
{
  objc_storeStrong((id *)&self->_wordSource, a3);
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)linguisticContextProbability
{
  return self->_linguisticContextProbability;
}

- (void)setLinguisticContextProbability:(double)a3
{
  self->_linguisticContextProbability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordSource, 0);
}

@end
