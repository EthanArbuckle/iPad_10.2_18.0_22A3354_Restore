@implementation TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger

- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCandidateAcceptedTrigger:(id)a3
{
  id v5;
  TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *v6;
  TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger;
  v6 = -[TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_candidateAcceptedTrigger, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_candidateAcceptedTrigger, CFSTR("candidateAcceptedTrigger"));
}

- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *v5;
  uint64_t v6;
  NSString *candidateAcceptedTrigger;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger;
  v5 = -[TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateAcceptedTrigger"));
    v6 = objc_claimAutoreleasedReturnValue();
    candidateAcceptedTrigger = v5->_candidateAcceptedTrigger;
    v5->_candidateAcceptedTrigger = (NSString *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  objc_msgSend(a3, "acceptingCandidateWithTrigger:", self->_candidateAcceptedTrigger);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Accepting Candidate With Trigger: %@>"), self->_candidateAcceptedTrigger);
}

- (NSString)candidateAcceptedTrigger
{
  return self->_candidateAcceptedTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateAcceptedTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
