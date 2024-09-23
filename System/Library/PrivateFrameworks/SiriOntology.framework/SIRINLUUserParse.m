@implementation SIRINLUUserParse

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7 comparableProbability:(double)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  SIRINLUUserParse *v20;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  objc_msgSend(v14, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", v18, v19, v17, v16, v15, a4, a8);

  return v20;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SIRINLUUserParse *v18;

  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  objc_msgSend(v12, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", v16, v17, v15, v14, v13, a4, 0.0);

  return v18;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SIRINLUUserParse *v15;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", v13, v14, v12, v11, 0, a4, 0.0);

  return v15;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  SIRINLUUserParse *v12;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:](self, "initWithUserDialogActs:probability:nsUUID:parserId:", v10, v11, v9, a4);

  return v12;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6
{
  id v10;
  id v11;
  id v12;
  SIRINLURepetitionResult *v13;
  SIRINLUUserParse *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[SIRINLURepetitionResult initWithAsrHypothesisIndex:repetitionType:]([SIRINLURepetitionResult alloc], "initWithAsrHypothesisIndex:repetitionType:", 0, 0);
  v14 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", v12, v11, v10, v13, 0, a4, 0.0);

  return v14;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7
{
  return -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", a3, a5, a6, a7, 0, a4, 0.0);
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 comparableProbability:(double)a8
{
  return -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", a3, a5, a6, a7, 0, a4, a8);
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 parser:(id)a8 comparableProbability:(double)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  SIRINLUUserParse *v21;
  SIRINLUUserParse *v22;
  id v24;
  objc_super v25;

  v24 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SIRINLUUserParse;
  v21 = -[SIRINLUUserParse init](&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_userDialogActs, a3);
    v22->_probability = a4;
    objc_storeStrong((id *)&v22->_nsUUID, a5);
    objc_storeStrong((id *)&v22->_parserId, a6);
    objc_storeStrong((id *)&v22->_repetitionResult, a7);
    objc_storeStrong((id *)&v22->_parser, a8);
    v22->_comparableProbability = a9;
  }

  return v22;
}

- (SIRINLUUserParse)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  SIRINLUUserParse *v24;
  void *v26;

  v26 = (void *)MEMORY[0x1E0C99E60];
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("userDialogActs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("probability"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nsUUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parserId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v19 = v18;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("repetitionResult"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parser"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("comparableProbability"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "doubleValue");
  v24 = -[SIRINLUUserParse initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:](self, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:parser:comparableProbability:", v14, v16, v17, v20, v21, v19, v23);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double probability;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  probability = self->_probability;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", probability);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_comparableProbability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUUserParse userDialogActs](self, "userDialogActs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("userDialogActs"));

  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("probability"));
  -[SIRINLUUserParse nsUUID](self, "nsUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("nsUUID"));

  -[SIRINLUUserParse parserId](self, "parserId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("parserId"));

  -[SIRINLUUserParse repetitionResult](self, "repetitionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("repetitionResult"));

  -[SIRINLUUserParse parser](self, "parser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("parser"));

  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("comparableProbability"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  -[SIRINLUUserParse userDialogActs](self, "userDialogActs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUUserParse probability](self, "probability");
  v7 = v6;
  -[SIRINLUUserParse nsUUID](self, "nsUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUUserParse parserId](self, "parserId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUUserParse repetitionResult](self, "repetitionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUUserParse parser](self, "parser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUUserParse comparableProbability](self, "comparableProbability");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{UserParse\n  userDialogActs:\n%@\n  probability: %f\n  nsUUID: %@\n  parserId: %@\n  repetitionResult: %@\n  parser: %@\n  comparableProbability: %f\n}"), v4, v7, v9, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSArray)userDialogActs
{
  return self->_userDialogActs;
}

- (void)setUserDialogActs:(id)a3
{
  objc_storeStrong((id *)&self->_userDialogActs, a3);
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (NSUUID)nsUUID
{
  return self->_nsUUID;
}

- (void)setNsUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nsUUID, a3);
}

- (NSString)parserId
{
  return self->_parserId;
}

- (void)setParserId:(id)a3
{
  objc_storeStrong((id *)&self->_parserId, a3);
}

- (SIRINLURepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (void)setRepetitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionResult, a3);
}

- (SIRINLUParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (double)comparableProbability
{
  return self->_comparableProbability;
}

- (void)setComparableProbability:(double)a3
{
  self->_comparableProbability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_parserId, 0);
  objc_storeStrong((id *)&self->_nsUUID, 0);
  objc_storeStrong((id *)&self->_userDialogActs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
