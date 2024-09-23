@implementation TLTransliteratorCandidateContext

- (TLTransliteratorCandidateContext)initWithCandidates:(id)a3
{
  id v4;
  TLTransliteratorCandidateContext *v5;
  uint64_t v6;
  NSArray *candidates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTransliteratorCandidateContext;
  v5 = -[TLTransliteratorCandidateContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v6;

  }
  return v5;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TLTransliteratorCandidateContext candidates](self, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
