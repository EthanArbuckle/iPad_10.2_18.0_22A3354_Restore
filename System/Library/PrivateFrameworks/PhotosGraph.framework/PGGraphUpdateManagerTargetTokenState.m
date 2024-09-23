@implementation PGGraphUpdateManagerTargetTokenState

- (PGGraphUpdateManagerTargetTokenState)initWithPersistentChangeToken:(id)a3
{
  id v4;
  PGGraphUpdateManagerTargetTokenState *v5;
  uint64_t v6;
  PHPersistentChangeToken *changeToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdateManagerTargetTokenState;
  v5 = -[PGGraphUpdateManagerTargetTokenState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changeToken = v5->_changeToken;
    v5->_changeToken = (PHPersistentChangeToken *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PGGraphUpdateManagerTargetTokenState encounteredTargetToken](self, "encounteredTargetToken"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphUpdateManagerTargetTokenState changeToken](self, "changeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Encountered token state: %@, target token: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (BOOL)encounteredTargetToken
{
  return self->_encounteredTargetToken;
}

- (void)setEncounteredTargetToken:(BOOL)a3
{
  self->_encounteredTargetToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
}

@end
