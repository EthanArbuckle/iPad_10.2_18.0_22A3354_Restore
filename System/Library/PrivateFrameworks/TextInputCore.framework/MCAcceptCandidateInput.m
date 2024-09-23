@implementation MCAcceptCandidateInput

- (MCAcceptCandidateInput)initWithCandidateText:(id)a3 convertedInput:(id)a4
{
  id v6;
  id v7;
  MCAcceptCandidateInput *v8;
  uint64_t v9;
  NSString *candidateText;
  uint64_t v11;
  NSString *convertedInput;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCAcceptCandidateInput;
  v8 = -[MCKeyboardInput init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    candidateText = v8->_candidateText;
    v8->_candidateText = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    convertedInput = v8->_convertedInput;
    v8->_convertedInput = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCAcceptCandidateInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_candidateText, "copyWithZone:", a3);
    v7 = (void *)v5[4];
    v5[4] = v6;

    v8 = -[NSString copyWithZone:](self->_convertedInput, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = -[NSArray copyWithZone:](self->_remainingMecabraInputs, "copyWithZone:", a3);
    v11 = (void *)v5[6];
    v5[6] = v10;

    v12 = -[NSString copyWithZone:](self->_remainingInputString, "copyWithZone:", a3);
    v13 = (void *)v5[7];
    v5[7] = v12;

  }
  return v5;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MCAcceptCandidateInput candidateText](self, "candidateText", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAcceptCandidateInput convertedInput](self, "convertedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAcceptCandidateInput remainingInputString](self, "remainingInputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("MCAcceptCandidateInput: candidate=%@, input=%@, remaining=%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (NSString)candidateText
{
  return self->_candidateText;
}

- (NSString)convertedInput
{
  return self->_convertedInput;
}

- (NSArray)remainingMecabraInputs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRemainingMecabraInputs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)remainingInputString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemainingInputString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingInputString, 0);
  objc_storeStrong((id *)&self->_remainingMecabraInputs, 0);
  objc_storeStrong((id *)&self->_convertedInput, 0);
  objc_storeStrong((id *)&self->_candidateText, 0);
}

@end
