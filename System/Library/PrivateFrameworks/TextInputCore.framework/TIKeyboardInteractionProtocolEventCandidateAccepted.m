@implementation TIKeyboardInteractionProtocolEventCandidateAccepted

- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCandidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  id v17;
  id v18;
  id v19;
  TIKeyboardInteractionProtocolEventCandidateAccepted *v20;
  TIKeyboardInteractionProtocolEventCandidateAccepted *v21;
  id v24;
  id v25;
  objc_super v26;

  v17 = a3;
  v25 = a4;
  v24 = a5;
  v18 = a6;
  v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  v20 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v26, sel_initWithKeyboardState_, a11);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_candWord, a3);
    objc_storeStrong((id *)&v21->_input, a4);
    objc_storeStrong((id *)&v21->_documentState, a5);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_inputStem, a7);
    v21->_predictionBarHit = a8;
    v21->_useCandidateSelection = a9;
    v21->_candidateIndex = a10;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candWord, CFSTR("candWord"), v8.receiver, v8.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, CFSTR("input"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentState, CFSTR("documentState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputStem, CFSTR("inputStem"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_predictionBarHit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predictionBarHit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useCandidateSelection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("useCandidateSelection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_candidateIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("candidateIndex"));

}

- (TIKeyboardInteractionProtocolEventCandidateAccepted)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventCandidateAccepted *v5;
  uint64_t v6;
  TIKeyboardCandidate *candWord;
  uint64_t v8;
  TIKeyboardInput *input;
  uint64_t v10;
  TIDocumentState *documentState;
  uint64_t v12;
  NSString *context;
  uint64_t v14;
  NSString *inputStem;
  void *v16;
  void *v17;
  void *v18;
  TIKeyboardCandidate *v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInteractionProtocolEventCandidateAccepted;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candWord"));
    v6 = objc_claimAutoreleasedReturnValue();
    candWord = v5->_candWord;
    v5->_candWord = (TIKeyboardCandidate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v8 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (TIKeyboardInput *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v12 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputStem"));
    v14 = objc_claimAutoreleasedReturnValue();
    inputStem = v5->_inputStem;
    v5->_inputStem = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionBarHit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_predictionBarHit = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCandidateSelection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useCandidateSelection = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_candidateIndex = objc_msgSend(v18, "integerValue");

  }
  v19 = v5->_candWord;
  if (v19)
  {
    v20 = -[TIKeyboardCandidate usageTrackingMask](v19, "usageTrackingMask");
    v21 = -[TIKeyboardCandidate sourceMask](v5->_candWord, "sourceMask");
    if ((v20 & 0x40000) != 0)
      v22 = 0x20000;
    else
      v22 = 0x8000;
    v23 = v21 & 0xFFFFFFFE | v22;
    if ((v20 & 0x40000) != 0)
      v24 = 0x40000;
    else
      v24 = 0x10000;
    if ((v21 & 1) == 0)
      v23 = v21;
    v25 = v23 & 0xFFFFFFFD | v24;
    if ((v23 & 2) != 0)
      v26 = v25;
    else
      v26 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26 | 4;
    else
      v27 = v26;
    if (-[TIKeyboardCandidate isResponseKitCandidate](v5->_candWord, "isResponseKitCandidate"))
      v28 = v27 | 0x2000;
    else
      v28 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardCandidate proactiveTrigger](v5->_candWord, "proactiveTrigger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        v28 |= 0x40u;
    }
    -[TIKeyboardCandidate candidate](v5->_candWord, "candidate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "_containsEmoji");

    if (v31)
      v32 = v28 | 0x4000;
    else
      v32 = v28;
    -[TIKeyboardCandidate setSourceMask:](v5->_candWord, "setSourceMask:", v32);
  }

  return v5;
}

- (void)sendTo:(id)a3
{
  TIKeyboardCandidate *candWord;
  TIKeyboardInput *input;
  TIDocumentState *documentState;
  NSString *context;
  NSString *inputStem;
  _BOOL8 predictionBarHit;
  BOOL useCandidateSelection;
  int64_t candidateIndex;
  id v12;
  uint64_t v13;
  id v14;

  candWord = self->_candWord;
  input = self->_input;
  documentState = self->_documentState;
  context = self->_context;
  inputStem = self->_inputStem;
  predictionBarHit = self->_predictionBarHit;
  useCandidateSelection = self->_useCandidateSelection;
  candidateIndex = self->_candidateIndex;
  v12 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = useCandidateSelection;
  objc_msgSend(v12, "candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:", candWord, input, documentState, context, inputStem, predictionBarHit, v13, candidateIndex, v14);

}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardCandidate candidate](self->_candWord, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<Candidates accepted: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (TIKeyboardCandidate)candWord
{
  return self->_candWord;
}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)inputStem
{
  return self->_inputStem;
}

- (BOOL)predictionBarHit
{
  return self->_predictionBarHit;
}

- (BOOL)useCandidateSelection
{
  return self->_useCandidateSelection;
}

- (int64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStem, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_candWord, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
