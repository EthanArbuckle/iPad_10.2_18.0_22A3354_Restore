@implementation TIConversionHistory

- (TIConversionHistory)init
{
  TIConversionHistory *v2;
  NSMutableArray *v3;
  NSMutableArray *convertedCandidates;
  NSMutableArray *v5;
  NSMutableArray *mutableConvertedCandidateRefs;
  NSMutableString *v7;
  NSMutableString *mutableConvertedCandidateText;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIConversionHistory;
  v2 = -[TIConversionHistory init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    convertedCandidates = v2->_convertedCandidates;
    v2->_convertedCandidates = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableConvertedCandidateRefs = v2->_mutableConvertedCandidateRefs;
    v2->_mutableConvertedCandidateRefs = v5;

    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mutableConvertedCandidateText = v2->_mutableConvertedCandidateText;
    v2->_mutableConvertedCandidateText = v7;

  }
  return v2;
}

- (void)clear
{
  void *v3;
  void *v4;
  void *v5;

  -[TIConversionHistory convertedCandidates](self, "convertedCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIConversionHistory mutableConvertedCandidateRefs](self, "mutableConvertedCandidateRefs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", &stru_251980880);

  *(_WORD *)&self->_inputChangedSinceLastConversion = 0;
  -[TIConversionHistory setRevertCount:](self, "setRevertCount:", 0);
}

- (unint64_t)convertedLength
{
  void *v2;
  unint64_t v3;

  -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSString)convertedCandidateText
{
  void *v2;
  void *v3;

  -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)invalidate
{
  -[TIConversionHistory clear](self, "clear");
  self->_invalid = 1;
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void)addCandidate:(id)a3 candidateRef:(id)a4 replacedAmbiguousPinyinSyllables:(id)a5 replacementUnambiguousPinyinSyllables:(id)a6 convertedInput:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TIConvertedCandidate *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!-[TIConversionHistory invalid](self, "invalid"))
  {
    v16 = -[TIConvertedCandidate initWithCandidate:replacedAmbiguousPinyinSyllables:replacementUnambiguousPinyinSyllables:convertedInput:]([TIConvertedCandidate alloc], "initWithCandidate:replacedAmbiguousPinyinSyllables:replacementUnambiguousPinyinSyllables:convertedInput:", v21, v13, v14, v15);
    -[TIConversionHistory convertedCandidates](self, "convertedCandidates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v16);

    -[TIConversionHistory mutableConvertedCandidateRefs](self, "mutableConvertedCandidateRefs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v12);

    -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", v20);

    -[TIConversionHistory setInputChangedSinceLastConversion:](self, "setInputChangedSinceLastConversion:", 0);
    -[TIConversionHistory setRevertCount:](self, "setRevertCount:", 0);

  }
}

- (void)didRevertLastConvertedCandidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[TIConversionHistory invalid](self, "invalid"))
  {
    -[TIConversionHistory lastConvertedCandidate](self, "lastConvertedCandidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[TIConversionHistory convertedCandidates](self, "convertedCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");

    -[TIConversionHistory mutableConvertedCandidateRefs](self, "mutableConvertedCandidateRefs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");

    -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v8, "length") - objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));

    -[TIConversionHistory setInputChangedSinceLastConversion:](self, "setInputChangedSinceLastConversion:", 0);
    -[TIConversionHistory setRevertCount:](self, "setRevertCount:", -[TIConversionHistory revertCount](self, "revertCount") + 1);

  }
}

- (BOOL)shouldRevertConvertedCandidateOnDeletionFromMarkedText:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  _BOOL4 v8;

  v4 = a3;
  if (-[TIConversionHistory invalid](self, "invalid")
    || !objc_msgSend(v4, "length")
    || -[TIConversionHistory revertCount](self, "revertCount")
    || (-[TIConversionHistory mutableConvertedCandidateText](self, "mutableConvertedCandidateText"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "hasPrefix:", v5),
        v5,
        !v6))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "length");
    if (v7 == -[TIConversionHistory convertedLength](self, "convertedLength"))
      LOBYTE(v8) = 1;
    else
      v8 = !-[TIConversionHistory inputChangedSinceLastConversion](self, "inputChangedSinceLastConversion");
  }

  return v8;
}

- (TIConvertedCandidate)lastConvertedCandidate
{
  void *v2;
  void *v3;

  -[TIConversionHistory convertedCandidates](self, "convertedCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIConvertedCandidate *)v3;
}

- (BOOL)inputChangedSinceLastConversion
{
  return self->_inputChangedSinceLastConversion;
}

- (void)setInputChangedSinceLastConversion:(BOOL)a3
{
  self->_inputChangedSinceLastConversion = a3;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMutableArray)convertedCandidates
{
  return self->_convertedCandidates;
}

- (void)setConvertedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_convertedCandidates, a3);
}

- (NSMutableArray)mutableConvertedCandidateRefs
{
  return self->_mutableConvertedCandidateRefs;
}

- (void)setMutableConvertedCandidateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_mutableConvertedCandidateRefs, a3);
}

- (NSMutableString)mutableConvertedCandidateText
{
  return self->_mutableConvertedCandidateText;
}

- (void)setMutableConvertedCandidateText:(id)a3
{
  objc_storeStrong((id *)&self->_mutableConvertedCandidateText, a3);
}

- (unint64_t)revertCount
{
  return self->_revertCount;
}

- (void)setRevertCount:(unint64_t)a3
{
  self->_revertCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableConvertedCandidateText, 0);
  objc_storeStrong((id *)&self->_mutableConvertedCandidateRefs, 0);
  objc_storeStrong((id *)&self->_convertedCandidates, 0);
}

@end
