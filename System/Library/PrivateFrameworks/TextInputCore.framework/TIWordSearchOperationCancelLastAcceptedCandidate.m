@implementation TIWordSearchOperationCancelLastAcceptedCandidate

- (TIWordSearchOperationCancelLastAcceptedCandidate)initWithWordSearch:(id)a3
{
  id v4;
  TIWordSearchOperationCancelLastAcceptedCandidate *v5;
  uint64_t v6;
  TIMecabraWrapper *mecabraWrapper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationCancelLastAcceptedCandidate;
  v5 = -[TIWordSearchOperationCancelLastAcceptedCandidate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mecabraWrapper");
    v6 = objc_claimAutoreleasedReturnValue();
    mecabraWrapper = v5->_mecabraWrapper;
    v5->_mecabraWrapper = (TIMecabraWrapper *)v6;

  }
  return v5;
}

- (void)perform
{
  void *v2;
  uint64_t v3;

  -[TIWordSearchOperationCancelLastAcceptedCandidate mecabraWrapper](self, "mecabraWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mecabraRef");

  if (v3)
    MecabraCancelLastAcceptedCandidate();
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
