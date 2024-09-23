@implementation SIRINLURepetitionResult

- (SIRINLURepetitionResult)initWithAsrHypothesisIndex:(unsigned int)a3 repetitionType:(unsigned int)a4
{
  SIRINLURepetitionResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIRINLURepetitionResult;
  result = -[SIRINLURepetitionResult init](&v7, sel_init);
  if (result)
  {
    result->_asrHypothesisIndex = a3;
    result->_repetitionType = a4;
  }
  return result;
}

- (SIRINLURepetitionResult)initWithCoder:(id)a3
{
  id v4;
  SIRINLURepetitionResult *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLURepetitionResult;
  v5 = -[SIRINLURepetitionResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asrHypothesisIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_asrHypothesisIndex = objc_msgSend(v6, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("repetitionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_repetitionType = objc_msgSend(v7, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t asrHypothesisIndex;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  asrHypothesisIndex = self->_asrHypothesisIndex;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", asrHypothesisIndex);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("asrHypothesisIndex"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repetitionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("repetitionType"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{RepetitionResult:\n  asrHypothesisIndex: %d\n  repetitionType: %d\n}"), -[SIRINLURepetitionResult asrHypothesisIndex](self, "asrHypothesisIndex"), -[SIRINLURepetitionResult repetitionType](self, "repetitionType"));
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (unsigned)repetitionType
{
  return self->_repetitionType;
}

- (void)setRepetitionType:(unsigned int)a3
{
  self->_repetitionType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
