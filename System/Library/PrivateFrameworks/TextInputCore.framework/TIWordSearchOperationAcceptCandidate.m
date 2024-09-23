@implementation TIWordSearchOperationAcceptCandidate

- (TIWordSearchOperationAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5
{
  id v8;
  TIWordSearchOperationAcceptCandidate *v9;
  uint64_t v10;
  TIMecabraWrapper *mecabraWrapper;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIWordSearchOperationAcceptCandidate;
  v9 = -[TIWordSearchOperationAcceptCandidate init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "mecabraWrapper");
    v10 = objc_claimAutoreleasedReturnValue();
    mecabraWrapper = v9->_mecabraWrapper;
    v9->_mecabraWrapper = (TIMecabraWrapper *)v10;

    if (a4)
      v12 = a4;
    else
      v12 = 0;
    v9->_mecabraCandidate = v12;
    v9->_partialCandidate = a5;
  }

  return v9;
}

- (void)dealloc
{
  void *mecabraCandidate;
  objc_super v4;

  mecabraCandidate = self->_mecabraCandidate;
  if (mecabraCandidate)

  v4.receiver = self;
  v4.super_class = (Class)TIWordSearchOperationAcceptCandidate;
  -[TIWordSearchOperationAcceptCandidate dealloc](&v4, sel_dealloc);
}

- (void)perform
{
  void *v3;
  uint64_t v4;

  -[TIWordSearchOperationAcceptCandidate mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mecabraRef");

  if (v4)
  {
    if (self->_mecabraCandidate)
      -[TIWordSearchOperationAcceptCandidate isPartialCandidate](self, "isPartialCandidate");
    MecabraAcceptCandidate();
  }
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraWrapper, a3);
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
