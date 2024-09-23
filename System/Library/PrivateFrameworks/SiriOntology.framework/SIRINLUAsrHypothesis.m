@implementation SIRINLUAsrHypothesis

- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 uuid:(id)a5
{
  id v9;
  id v10;
  SIRINLUAsrHypothesis *v11;
  SIRINLUAsrHypothesis *v12;
  NSArray *asrTokens;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUAsrHypothesis;
  v11 = -[SIRINLUAsrHypothesis init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_utterance, a3);
    v12->_probability = a4;
    objc_storeStrong((id *)&v12->_uuid, a5);
    asrTokens = v12->_asrTokens;
    v12->_asrTokens = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v12;
}

- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 asrTokens:(id)a5 uuid:(id)a6
{
  id v11;
  id v12;
  id v13;
  SIRINLUAsrHypothesis *v14;
  SIRINLUAsrHypothesis *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SIRINLUAsrHypothesis;
  v14 = -[SIRINLUAsrHypothesis init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_utterance, a3);
    v15->_probability = a4;
    objc_storeStrong((id *)&v15->_uuid, a6);
    objc_storeStrong((id *)&v15->_asrTokens, a5);
  }

  return v15;
}

- (SIRINLUAsrHypothesis)initWithCoder:(id)a3
{
  id v4;
  SIRINLUAsrHypothesis *v5;
  uint64_t v6;
  NSString *utterance;
  void *v8;
  uint64_t v9;
  NSUUID *uuid;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *asrTokens;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SIRINLUAsrHypothesis;
  v5 = -[SIRINLUAsrHypothesis init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("utterance"));
    v6 = objc_claimAutoreleasedReturnValue();
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("probability"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    objc_msgSend(v8, "doubleValue");
    v5->_probability = v11;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("asrTokens"));
    v15 = objc_claimAutoreleasedReturnValue();
    asrTokens = v5->_asrTokens;
    v5->_asrTokens = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double probability;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  probability = self->_probability;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", probability);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SIRINLUAsrHypothesis utterance](self, "utterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("utterance"));

  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("probability"));
  -[SIRINLUAsrHypothesis uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("uuid"));

  -[SIRINLUAsrHypothesis asrTokens](self, "asrTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("asrTokens"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[SIRINLUAsrHypothesis asrTokens](self, "asrTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUAsrHypothesis utterance](self, "utterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUAsrHypothesis probability](self, "probability");
  v8 = v7;
  -[SIRINLUAsrHypothesis uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{AsrHypothesis:\n  utterance: %@\n  probability: %f\n  asrTokens: %@\n  uuid: %@\n}"), v6, v8, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (NSArray)asrTokens
{
  return self->_asrTokens;
}

- (void)setAsrTokens:(id)a3
{
  objc_storeStrong((id *)&self->_asrTokens, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_asrTokens, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
