@implementation TITypologyRecordCandidateRejected

- (TITypologyRecordCandidateRejected)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordCandidateRejected *v5;
  uint64_t v6;
  TIKeyboardCandidate *candidate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyRecordCandidateRejected;
  v5 = -[TITypologyRecord initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
    v6 = objc_claimAutoreleasedReturnValue();
    candidate = v5->_candidate;
    v5->_candidate = (TIKeyboardCandidate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordCandidateRejected;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, CFSTR("candidate"), v5.receiver, v5.super_class);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordCandidateRejected candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CANDIDATE REJECTED: \"%@\"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordCandidateRejected:", self);
}

@end
