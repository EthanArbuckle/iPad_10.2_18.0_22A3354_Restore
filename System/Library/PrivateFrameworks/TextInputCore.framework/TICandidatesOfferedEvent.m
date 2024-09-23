@implementation TICandidatesOfferedEvent

- (TICandidatesOfferedEvent)initWithCandidates:(id)a3 keyboardState:(id)a4
{
  id v7;
  TICandidatesOfferedEvent *v8;
  TICandidatesOfferedEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TICandidatesOfferedEvent;
  v8 = -[TIUserAction initWithTIKeyboardState:](&v11, sel_initWithTIKeyboardState_, a4);
  v9 = v8;
  if (v8)
  {
    -[TIUserAction setActionType:](v8, "setActionType:", 5);
    objc_storeStrong((id *)&v9->_candidates, a3);
  }

  return v9;
}

- (TICandidatesOfferedEvent)initWithCoder:(id)a3
{
  id v4;
  TICandidatesOfferedEvent *v5;
  uint64_t v6;
  TIAutocorrectionList *candidates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TICandidatesOfferedEvent;
  v5 = -[TIUserAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidates"));
    v6 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (TIAutocorrectionList *)v6;

    -[TIUserAction setActionType:](v5, "setActionType:", 5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TICandidatesOfferedEvent;
  v4 = a3;
  -[TIUserAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidates, CFSTR("candidates"), v5.receiver, v5.super_class);

}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
