@implementation SLODLDProcessorResult

- (SLODLDProcessorResult)initWithScore:(float)a3 withVersion:(id)a4 tokens:(id)a5 features:(id)a6 outputEmb:(id)a7 outputAnchor:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SLODLDProcessorResult *v18;
  SLODLDProcessorResult *v19;
  uint64_t v20;
  NSString *configVersion;
  uint64_t v22;
  NSArray *tokens;
  uint64_t v24;
  NSDictionary *features;
  uint64_t v26;
  NSData *outputEmb;
  objc_super v29;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SLODLDProcessorResult;
  v18 = -[SLODLDProcessorResult init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_odldScore = a3;
    v20 = objc_msgSend(v14, "copy");
    configVersion = v19->_configVersion;
    v19->_configVersion = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    tokens = v19->_tokens;
    v19->_tokens = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    features = v19->_features;
    v19->_features = (NSDictionary *)v24;

    v26 = objc_msgSend(v17, "copy");
    outputEmb = v19->_outputEmb;
    v19->_outputEmb = (NSData *)v26;

    v19->_outputAnchor = a8;
  }

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ODLD Score: %f Social Score: %f Tokens: %@, Embeddings: %@"), self->_odldScore, self->_outputAnchor, self->_tokens, self->_outputEmb);
}

- (float)odldScore
{
  return self->_odldScore;
}

- (NSData)outputEmb
{
  return self->_outputEmb;
}

- (float)outputAnchor
{
  return self->_outputAnchor;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSDictionary)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_outputEmb, 0);
}

@end
