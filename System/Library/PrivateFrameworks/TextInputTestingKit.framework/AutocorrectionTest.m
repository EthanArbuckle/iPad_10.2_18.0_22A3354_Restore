@implementation AutocorrectionTest

- (id)description
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("input: %@\n"), self->_input);
  if (self->_touches)
    objc_msgSend(v3, "appendFormat:", CFSTR("touch: %@"), self->_touches);
  -[NSArray componentsJoinedByString:](self->_expectedOutput, "componentsJoinedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_input);

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "appendFormat:", CFSTR("; expected: %@"), self->_expectedOutput);
  return v3;
}

- (AutocorrectionTest)initWithCoder:(id)a3
{
  id v4;
  AutocorrectionTest *v5;
  uint64_t v6;
  NSString *input;
  uint64_t v8;
  NSArray *expectedOutput;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AutocorrectionTest;
  v5 = -[AutocorrectionTest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ATInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ATExpectedOutput"));
    v8 = objc_claimAutoreleasedReturnValue();
    expectedOutput = v5->_expectedOutput;
    v5->_expectedOutput = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *input;
  id v5;

  input = self->_input;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", input, CFSTR("ATInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedOutput, CFSTR("ATExpectedOutput"));

}

- (NSString)input
{
  return self->_input;
}

- (NSArray)expectedOutput
{
  return self->_expectedOutput;
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (NSArray)touches
{
  return self->_touches;
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corpusId, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_expectedOutput, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4 sourceMetadata:(id)a5 withTouches:(id)a6 andCorpusId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AutocorrectionTest *v17;
  AutocorrectionTest *v18;
  uint64_t v19;
  NSArray *expectedOutput;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(AutocorrectionTest);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input, a3);
    v19 = objc_msgSend(v13, "copy");
    expectedOutput = v18->_expectedOutput;
    v18->_expectedOutput = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_sourceMetadata, a5);
    objc_storeStrong((id *)&v18->_touches, a6);
    objc_storeStrong((id *)&v18->_corpusId, a7);
  }

  return v18;
}

+ (id)testWithTouches:(id)a3 expectedOutput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:", v8, v6, 0, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4
{
  return (id)objc_msgSend(a1, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:", a3, a4, 0, 0, 0);
}

+ (id)testWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  TITestTyperTokensForString(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "testWithInput:expectedOutput:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)testWithInput:(id)a3 andCorpusId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  TITestTyperTokensForString(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:", v7, v8, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
