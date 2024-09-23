@implementation TIConvertedCandidate

- (TIConvertedCandidate)initWithCandidate:(id)a3
{
  id v5;
  TIConvertedCandidate *v6;
  TIConvertedCandidate *v7;
  void *v8;
  uint64_t v9;
  NSString *convertedInput;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIConvertedCandidate;
  v6 = -[TIConvertedCandidate init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_candidate, a3);
    objc_msgSend(v5, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    convertedInput = v7->_convertedInput;
    v7->_convertedInput = (NSString *)v9;

  }
  return v7;
}

- (TIConvertedCandidate)initWithCandidate:(id)a3 replacedAmbiguousPinyinSyllables:(id)a4 replacementUnambiguousPinyinSyllables:(id)a5 convertedInput:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TIConvertedCandidate *v15;
  TIConvertedCandidate *v16;
  uint64_t v17;
  NSArray *replacedAmbiguousPinyinSyllables;
  uint64_t v19;
  NSArray *replacementUnambiguousPinyinSyllables;
  uint64_t v21;
  NSString *convertedInput;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIConvertedCandidate;
  v15 = -[TIConvertedCandidate init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_candidate, a3);
    v17 = objc_msgSend(v12, "copy");
    replacedAmbiguousPinyinSyllables = v16->_replacedAmbiguousPinyinSyllables;
    v16->_replacedAmbiguousPinyinSyllables = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    replacementUnambiguousPinyinSyllables = v16->_replacementUnambiguousPinyinSyllables;
    v16->_replacementUnambiguousPinyinSyllables = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    convertedInput = v16->_convertedInput;
    v16->_convertedInput = (NSString *)v21;

  }
  return v16;
}

- (NSString)revertedInput
{
  void *v2;
  void *v3;

  -[TIConvertedCandidate candidate](self, "candidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (NSString)convertedInput
{
  return self->_convertedInput;
}

- (void)setConvertedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)replacedAmbiguousPinyinSyllables
{
  return self->_replacedAmbiguousPinyinSyllables;
}

- (void)setReplacedAmbiguousPinyinSyllables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)replacementUnambiguousPinyinSyllables
{
  return self->_replacementUnambiguousPinyinSyllables;
}

- (void)setReplacementUnambiguousPinyinSyllables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)geometryData
{
  return self->_geometryData;
}

- (void)setGeometryData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)touchData
{
  return self->_touchData;
}

- (void)setTouchData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchData, 0);
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_replacementUnambiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_replacedAmbiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_convertedInput, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
