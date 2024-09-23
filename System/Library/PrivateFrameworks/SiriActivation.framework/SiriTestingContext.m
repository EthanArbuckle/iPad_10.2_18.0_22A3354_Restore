@implementation SiriTestingContext

- (SiriTestingContext)initWithPPTContext:(id)a3
{
  return -[SiriTestingContext initWithPPTContext:siriContextOverride:](self, "initWithPPTContext:siriContextOverride:", a3, 0);
}

- (SiriTestingContext)initWithPPTContext:(id)a3 siriContextOverride:(id)a4
{
  id v7;
  SiriTestingContext *v8;
  SiriTestingContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  v8 = -[SiriContext initWithContextOverride:](&v11, sel_initWithContextOverride_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_testingContext, a3);

  return v9;
}

- (SiriTestingContext)initWithRecognitionStrings:(id)a3
{
  return -[SiriTestingContext initWithRecognitionStrings:siriContextOverride:](self, "initWithRecognitionStrings:siriContextOverride:", a3, 0);
}

- (SiriTestingContext)initWithRecognitionStrings:(id)a3 siriContextOverride:(id)a4
{
  id v6;
  SiriTestingContext *v7;
  uint64_t v8;
  NSDictionary *testingContext;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  v7 = -[SiriContext initWithContextOverride:](&v11, sel_initWithContextOverride_, a4);
  if (v7)
  {
    v12 = CFSTR("SiriTestingContextRecognitionStringKey");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    testingContext = v7->_testingContext;
    v7->_testingContext = (NSDictionary *)v8;

  }
  return v7;
}

- (SiriTestingContext)initWithAudioInput:(id)a3
{
  return -[SiriTestingContext initWithAudioInput:siriContextOverride:](self, "initWithAudioInput:siriContextOverride:", a3, 0);
}

- (SiriTestingContext)initWithAudioInput:(id)a3 siriContextOverride:(id)a4
{
  id v6;
  SiriTestingContext *v7;
  uint64_t v8;
  NSDictionary *testingContext;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  v7 = -[SiriContext initWithContextOverride:](&v11, sel_initWithContextOverride_, a4);
  if (v7)
  {
    v12 = CFSTR("SiriTestingContextAudioInputKey");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    testingContext = v7->_testingContext;
    v7->_testingContext = (NSDictionary *)v8;

  }
  return v7;
}

- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4
{
  return -[SiriTestingContext initWithRequestInfo:recognitionStrings:siriContextOverride:](self, "initWithRequestInfo:recognitionStrings:siriContextOverride:", a3, a4, 0);
}

- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4 siriContextOverride:(id)a5
{
  AFRequestInfo *v8;
  SiriTestingContext *v9;
  AFRequestInfo *testingRequestInfo;

  v8 = (AFRequestInfo *)a3;
  v9 = -[SiriTestingContext initWithRecognitionStrings:siriContextOverride:](self, "initWithRecognitionStrings:siriContextOverride:", a4, a5);
  testingRequestInfo = v9->_testingRequestInfo;
  v9->_testingRequestInfo = v8;

  return v9;
}

- (BOOL)containsRecognitionStrings
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKeyedSubscript:](self->_testingContext, "objectForKeyedSubscript:", CFSTR("SiriTestingContextRecognitionStringKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)containsAudioInput
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKeyedSubscript:](self->_testingContext, "objectForKeyedSubscript:", CFSTR("SiriTestingContextAudioInputKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriTestingContext testingContext](self, "testingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriTestingContext contextOverride:%@, testingContext:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriTestingContext)initWithCoder:(id)a3
{
  id v4;
  SiriTestingContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriTestingContext;
  v5 = -[SiriContext initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("testingContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v5->_testingContext, v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriTestingContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SiriTestingContext testingContext](self, "testingContext", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("testingContext"));

}

- (NSDictionary)testingContext
{
  return self->_testingContext;
}

- (AFRequestInfo)testingRequestInfo
{
  return self->_testingRequestInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingRequestInfo, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
}

@end
