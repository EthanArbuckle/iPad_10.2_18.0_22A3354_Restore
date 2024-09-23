@implementation TIWordEntryAligned

- (TIWordEntryAligned)initWithCoder:(id)a3
{
  id v4;
  TIWordEntryAligned *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *alignedTouches;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *alignedKeyboardInputs;
  uint64_t v16;
  NSString *expectedString;
  uint64_t v18;
  TIWordEntry *originalWord;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TIWordEntryAligned;
  v5 = -[TIWordEntryAligned init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("alignedTouches"));
    v9 = objc_claimAutoreleasedReturnValue();
    alignedTouches = v5->_alignedTouches;
    v5->_alignedTouches = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("alignedKeyboardInputs"));
    v14 = objc_claimAutoreleasedReturnValue();
    alignedKeyboardInputs = v5->_alignedKeyboardInputs;
    v5->_alignedKeyboardInputs = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedString"));
    v16 = objc_claimAutoreleasedReturnValue();
    expectedString = v5->_expectedString;
    v5->_expectedString = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalWord"));
    v18 = objc_claimAutoreleasedReturnValue();
    originalWord = v5->_originalWord;
    v5->_originalWord = (TIWordEntry *)v18;

    v5->_isContinuousPathConversion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContinuousPathConversion"));
    v5->_inSessionAlignmentConfidence = objc_msgSend(v4, "decodeIntForKey:", CFSTR("inSessionAlignmentConfidence"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *alignedTouches;
  id v5;

  alignedTouches = self->_alignedTouches;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alignedTouches, CFSTR("alignedTouches"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alignedKeyboardInputs, CFSTR("alignedKeyboardInputs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedString, CFSTR("expectedString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalWord, CFSTR("originalWord"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContinuousPathConversion, CFSTR("isContinuousPathConversion"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_inSessionAlignmentConfidence, CFSTR("inSessionAlignmentConfidence"));

}

- (TIWordEntryAligned)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordEntryAligned;
  return -[TIWordEntryAligned init](&v3, sel_init);
}

- (NSArray)alignedTouches
{
  NSArray *alignedTouches;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  alignedTouches = self->_alignedTouches;
  if (!alignedTouches)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[TIWordEntryAligned alignedKeyboardInputs](self, "alignedKeyboardInputs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "touchEvent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = self->_alignedTouches;
    self->_alignedTouches = v4;

    alignedTouches = self->_alignedTouches;
  }
  return alignedTouches;
}

- (void)setAlignedTouches:(id)a3
{
  objc_storeStrong((id *)&self->_alignedTouches, a3);
}

- (NSArray)alignedKeyboardInputs
{
  return self->_alignedKeyboardInputs;
}

- (void)setAlignedKeyboardInputs:(id)a3
{
  objc_storeStrong((id *)&self->_alignedKeyboardInputs, a3);
}

- (NSString)expectedString
{
  return self->_expectedString;
}

- (void)setExpectedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TIWordEntry)originalWord
{
  return self->_originalWord;
}

- (void)setOriginalWord:(id)a3
{
  objc_storeStrong((id *)&self->_originalWord, a3);
}

- (BOOL)isContinuousPathConversion
{
  return self->_isContinuousPathConversion;
}

- (void)setIsContinuousPathConversion:(BOOL)a3
{
  self->_isContinuousPathConversion = a3;
}

- (int)inSessionAlignmentConfidence
{
  return self->_inSessionAlignmentConfidence;
}

- (void)setInSessionAlignmentConfidence:(int)a3
{
  self->_inSessionAlignmentConfidence = a3;
}

- (NSString)completeString
{
  return self->_completeString;
}

- (void)setCompleteString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeString, 0);
  objc_storeStrong((id *)&self->_originalWord, 0);
  objc_storeStrong((id *)&self->_expectedString, 0);
  objc_storeStrong((id *)&self->_alignedKeyboardInputs, 0);
  objc_storeStrong((id *)&self->_alignedTouches, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
