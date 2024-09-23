@implementation TIWordSearchOperationContextAcceptCandidate

- (TIWordSearchOperationContextAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5 isPrediction:(BOOL)a6
{
  id v10;
  TIWordSearchOperationContextAcceptCandidate *v11;
  uint64_t v12;
  TIMecabraEnvironment *mecabraEnvironment;
  void *v14;
  objc_super v16;

  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIWordSearchOperationContextAcceptCandidate;
  v11 = -[TIWordSearchOperationContextAcceptCandidate init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "mecabraEnvironment");
    v12 = objc_claimAutoreleasedReturnValue();
    mecabraEnvironment = v11->_mecabraEnvironment;
    v11->_mecabraEnvironment = (TIMecabraEnvironment *)v12;

    if (a4)
      v14 = a4;
    else
      v14 = 0;
    v11->_mecabraCandidate = v14;
    v11->_partialCandidate = a5;
    v11->_prediction = a6;
  }

  return v11;
}

- (void)dealloc
{
  void *mecabraCandidate;
  objc_super v4;

  mecabraCandidate = self->_mecabraCandidate;
  if (mecabraCandidate)

  v4.receiver = self;
  v4.super_class = (Class)TIWordSearchOperationContextAcceptCandidate;
  -[TIWordSearchOperationContextAcceptCandidate dealloc](&v4, sel_dealloc);
}

- (void)perform
{
  _BOOL4 v3;
  void *v4;
  void *mecabraCandidate;
  id v6;

  if (self->_mecabraCandidate)
  {
    if (-[TIWordSearchOperationContextAcceptCandidate isPrediction](self, "isPrediction"))
    {
      -[TIWordSearchOperationContextAcceptCandidate mecabraEnvironment](self, "mecabraEnvironment");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "commitPredictionCandidate:", self->_mecabraCandidate);
    }
    else
    {
      v3 = -[TIWordSearchOperationContextAcceptCandidate isPartialCandidate](self, "isPartialCandidate");
      -[TIWordSearchOperationContextAcceptCandidate mecabraEnvironment](self, "mecabraEnvironment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      mecabraCandidate = self->_mecabraCandidate;
      v6 = v4;
      if (v3)
        objc_msgSend(v4, "partiallyCommitInlineCandidate:", mecabraCandidate);
      else
        objc_msgSend(v4, "completelyCommitInlineCandidate:", mecabraCandidate);
    }

  }
}

- (TIMecabraEnvironment)mecabraEnvironment
{
  return self->_mecabraEnvironment;
}

- (void)setMecabraEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraEnvironment, a3);
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (BOOL)isPrediction
{
  return self->_prediction;
}

- (void)setPrediction:(BOOL)a3
{
  self->_prediction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mecabraEnvironment, 0);
}

@end
