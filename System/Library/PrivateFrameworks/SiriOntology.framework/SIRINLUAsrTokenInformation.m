@implementation SIRINLUAsrTokenInformation

- (SIRINLUAsrTokenInformation)initWithPostITNText:(id)a3 phoneSequence:(id)a4 ipaPhoneSequence:(id)a5 addSpaceAfter:(BOOL)a6 removeSpaceAfter:(BOOL)a7 removeSpaceBefore:(BOOL)a8 confidenceScore:(double)a9 beginIndex:(unsigned int)a10 endIndex:(unsigned int)a11 startMilliSeconds:(int)a12 endMilliSeconds:(int)a13
{
  id v21;
  id v22;
  id v23;
  SIRINLUAsrTokenInformation *v24;
  SIRINLUAsrTokenInformation *v25;
  objc_super v27;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SIRINLUAsrTokenInformation;
  v24 = -[SIRINLUAsrTokenInformation init](&v27, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_postITNText, a3);
    objc_storeStrong((id *)&v25->_phoneSequence, a4);
    objc_storeStrong((id *)&v25->_ipaPhoneSequence, a5);
    v25->_addSpaceAfter = a6;
    v25->_removeSpaceAfter = a7;
    v25->_removeSpaceBefore = a8;
    v25->_confidenceScore = a9;
    v25->_beginIndex = a10;
    v25->_endIndex = a11;
    v25->_startMilliSeconds = a12;
    v25->_endMilliSeconds = a13;
  }

  return v25;
}

- (SIRINLUAsrTokenInformation)initWithPostITNText:(id)a3 phoneSequence:(id)a4 ipaPhoneSequence:(id)a5 addSpaceAfter:(BOOL)a6 removeSpaceAfter:(BOOL)a7 removeSpaceBefore:(BOOL)a8 confidenceScore:(double)a9 beginIndex:(unsigned int)a10 endIndex:(unsigned int)a11
{
  id v19;
  id v20;
  id v21;
  SIRINLUAsrTokenInformation *v22;
  SIRINLUAsrTokenInformation *v23;
  objc_super v25;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SIRINLUAsrTokenInformation;
  v22 = -[SIRINLUAsrTokenInformation init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_postITNText, a3);
    objc_storeStrong((id *)&v23->_phoneSequence, a4);
    objc_storeStrong((id *)&v23->_ipaPhoneSequence, a5);
    v23->_addSpaceAfter = a6;
    v23->_removeSpaceAfter = a7;
    v23->_removeSpaceBefore = a8;
    v23->_confidenceScore = a9;
    v23->_beginIndex = a10;
    v23->_endIndex = a11;
  }

  return v23;
}

- (SIRINLUAsrTokenInformation)initWithCoder:(id)a3
{
  id v4;
  SIRINLUAsrTokenInformation *v5;
  uint64_t v6;
  NSString *postITNText;
  uint64_t v8;
  NSString *phoneSequence;
  uint64_t v10;
  NSString *ipaPhoneSequence;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUAsrTokenInformation;
  v5 = -[SIRINLUAsrTokenInformation init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postITNText"));
    v6 = objc_claimAutoreleasedReturnValue();
    postITNText = v5->_postITNText;
    v5->_postITNText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneSequence"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipaPhoneSequence"));
    v10 = objc_claimAutoreleasedReturnValue();
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addSpaceAfter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_addSpaceAfter = objc_msgSend(v12, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removeSpaceAfter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_removeSpaceAfter = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removeSpaceBefore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_removeSpaceBefore = objc_msgSend(v14, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidenceScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v5->_confidenceScore = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beginIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_beginIndex = objc_msgSend(v17, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endIndex = objc_msgSend(v18, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startMilliSeconds"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startMilliSeconds = objc_msgSend(v19, "intValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endMilliSeconds"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endMilliSeconds = objc_msgSend(v20, "intValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[SIRINLUAsrTokenInformation postITNText](self, "postITNText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("postITNText"));

  -[SIRINLUAsrTokenInformation phoneSequence](self, "phoneSequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phoneSequence"));

  -[SIRINLUAsrTokenInformation ipaPhoneSequence](self, "ipaPhoneSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ipaPhoneSequence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addSpaceAfter);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("addSpaceAfter"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceAfter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("removeSpaceAfter"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceBefore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("removeSpaceBefore"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidenceScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("confidenceScore"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_beginIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("beginIndex"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("endIndex"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_startMilliSeconds);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("startMilliSeconds"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endMilliSeconds);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("endMilliSeconds"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLUAsrTokenInformation addSpaceAfter](self, "addSpaceAfter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLUAsrTokenInformation removeSpaceAfter](self, "removeSpaceAfter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLUAsrTokenInformation removeSpaceBefore](self, "removeSpaceBefore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUAsrTokenInformation confidenceScore](self, "confidenceScore");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), -[SIRINLUAsrTokenInformation beginIndex](self, "beginIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), -[SIRINLUAsrTokenInformation endIndex](self, "endIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), -[SIRINLUAsrTokenInformation startMilliSeconds](self, "startMilliSeconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), -[SIRINLUAsrTokenInformation endMilliSeconds](self, "endMilliSeconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUAsrTokenInformation postITNText](self, "postITNText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUAsrTokenInformation phoneSequence](self, "phoneSequence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUAsrTokenInformation ipaPhoneSequence](self, "ipaPhoneSequence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("{AsrTokenInformation:\n  postITNText: %@\n  phoneSequence: %@\n  ipaPhoneSequence: %@\n  addSpaceAfter: %@\n  removeSpaceAfter: %@\n  removeSpaceBefore: %@\n  confidenceScore: %@\n  beginIndex: %@\n  endIndex: %@\n  startMilliSeconds: %@\n  endMilliSeconds: %@\n}"), v10, v11, v12, v18, v17, v16, v15, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)postITNText
{
  return self->_postITNText;
}

- (void)setPostITNText:(id)a3
{
  objc_storeStrong((id *)&self->_postITNText, a3);
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSequence, a3);
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setIpaPhoneSequence:(id)a3
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, a3);
}

- (BOOL)addSpaceAfter
{
  return self->_addSpaceAfter;
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  self->_addSpaceAfter = a3;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  self->_removeSpaceAfter = a3;
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  self->_removeSpaceBefore = a3;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  self->_confidenceScore = a3;
}

- (unsigned)beginIndex
{
  return self->_beginIndex;
}

- (void)setBeginIndex:(unsigned int)a3
{
  self->_beginIndex = a3;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(unsigned int)a3
{
  self->_endIndex = a3;
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (void)setStartMilliSeconds:(int)a3
{
  self->_startMilliSeconds = a3;
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (void)setEndMilliSeconds:(int)a3
{
  self->_endMilliSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_postITNText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
