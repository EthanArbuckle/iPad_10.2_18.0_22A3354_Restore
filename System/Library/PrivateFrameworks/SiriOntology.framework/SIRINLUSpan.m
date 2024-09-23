@implementation SIRINLUSpan

- (SIRINLUSpan)initWithLabel:(id)a3 input:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 usoGraph:(id)a7 score:(double)a8 matcherNames:(id)a9
{
  id v17;
  id v18;
  id v19;
  SIRINLUSpan *v20;
  SIRINLUSpan *v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)SIRINLUSpan;
  v20 = -[SIRINLUSpan init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_label, a3);
    objc_storeStrong((id *)&v21->_input, a4);
    v21->_startTokenIndex = a5;
    v21->_endTokenIndex = a6;
    objc_storeStrong((id *)&v21->_usoGraph, a7);
    v21->_score = a8;
    objc_storeStrong((id *)&v21->_matcherNames, a9);
  }

  return v21;
}

- (SIRINLUSpan)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSpan *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *input;
  void *v10;
  void *v11;
  uint64_t v12;
  USOSerializedGraph *usoGraph;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *matcherNames;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUSpan;
  v5 = -[SIRINLUSpan init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v8 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTokenIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startTokenIndex = objc_msgSend(v10, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTokenIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endTokenIndex = objc_msgSend(v11, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usoGraph"));
    v12 = objc_claimAutoreleasedReturnValue();
    usoGraph = v5->_usoGraph;
    v5->_usoGraph = (USOSerializedGraph *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_score = v15;
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("matcherNames"));
    v19 = objc_claimAutoreleasedReturnValue();
    matcherNames = v5->_matcherNames;
    v5->_matcherNames = (NSArray *)v19;

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
  id v11;

  v4 = a3;
  -[SIRINLUSpan label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("label"));

  -[SIRINLUSpan input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("input"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startTokenIndex);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("startTokenIndex"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endTokenIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endTokenIndex"));
  -[SIRINLUSpan usoGraph](self, "usoGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("usoGraph"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("score"));
  -[SIRINLUSpan matcherNames](self, "matcherNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("matcherNames"));

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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSpan label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUSpan input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SIRINLUSpan startTokenIndex](self, "startTokenIndex");
  v7 = -[SIRINLUSpan endTokenIndex](self, "endTokenIndex");
  -[SIRINLUSpan usoGraph](self, "usoGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "printedForm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v9, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUSpan score](self, "score");
  v12 = v11;
  -[SIRINLUSpan matcherNames](self, "matcherNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v13, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{Span\n  label: \n%@\n  input: \n%@\n  startTokenIndex: \n%u\n  endTokenIndex: \n%u\n  usoGraph:\n%@\n  score: %f\n  matcherNamees: \n%@\n}"), v4, v5, v6, v7, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (unsigned)startTokenIndex
{
  return self->_startTokenIndex;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  self->_startTokenIndex = a3;
}

- (unsigned)endTokenIndex
{
  return self->_endTokenIndex;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  self->_endTokenIndex = a3;
}

- (USOSerializedGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setUsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraph, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSArray)matcherNames
{
  return self->_matcherNames;
}

- (void)setMatcherNames:(id)a3
{
  objc_storeStrong((id *)&self->_matcherNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherNames, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
