@implementation TITypologyRecordTextAccepted

- (TITypologyRecordTextAccepted)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordTextAccepted *v5;
  uint64_t v6;
  TIKeyboardCandidate *candidate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyRecordTextAccepted;
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
  v5.super_class = (Class)TITypologyRecordTextAccepted;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, CFSTR("candidate"), v5.receiver, v5.super_class);

}

- (id)textSummary
{
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;

  -[TITypologyRecordTextAccepted candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAutocorrection");

  if (v4)
  {
    -[TITypologyRecordTextAccepted candidate](self, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecord textSummaryForAutocorrection:](self, "textSummaryForAutocorrection:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E243B990;
  }
  return v6;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordTextAccepted candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyRecordTextAccepted candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TEXT ACCEPTED: \"%@\" for \"%@\"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)changedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[TITypologyRecordTextAccepted candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[TITypologyRecordTextAccepted candidate](self, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordTextAccepted candidate](self, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@->%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TITypologyRecordTextAccepted candidate](self, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v11 = 0;
      return v11;
    }
    -[TITypologyRecordTextAccepted candidate](self, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
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
  objc_msgSend(a3, "visitRecordTextAccepted:", self);
}

@end
