@implementation SVXSpeechSynthesisUtteranceInfo

- (SVXSpeechSynthesisUtteranceInfo)initWithUtterance:(id)a3 wordTimings:(id)a4
{
  id v6;
  id v7;
  SVXSpeechSynthesisUtteranceInfo *v8;
  uint64_t v9;
  NSString *utterance;
  uint64_t v11;
  NSArray *wordTimings;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXSpeechSynthesisUtteranceInfo;
  v8 = -[SVXSpeechSynthesisUtteranceInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    utterance = v8->_utterance;
    v8->_utterance = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    wordTimings = v8->_wordTimings;
    v8->_wordTimings = (NSArray *)v11;

  }
  return v8;
}

- (id)description
{
  return -[SVXSpeechSynthesisUtteranceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisUtteranceInfo;
  -[SVXSpeechSynthesisUtteranceInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {utterance = %@, wordTimings = %@}"), v5, self->_utterance, self->_wordTimings);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_utterance, "hash");
  return -[NSArray hash](self->_wordTimings, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisUtteranceInfo *v4;
  SVXSpeechSynthesisUtteranceInfo *v5;
  NSString *v6;
  NSString *utterance;
  NSArray *v8;
  NSArray *wordTimings;
  BOOL v10;

  v4 = (SVXSpeechSynthesisUtteranceInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SVXSpeechSynthesisUtteranceInfo utterance](v5, "utterance");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      utterance = self->_utterance;
      if (utterance == v6 || -[NSString isEqual:](utterance, "isEqual:", v6))
      {
        -[SVXSpeechSynthesisUtteranceInfo wordTimings](v5, "wordTimings");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        wordTimings = self->_wordTimings;
        v10 = wordTimings == v8 || -[NSArray isEqual:](wordTimings, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (SVXSpeechSynthesisUtteranceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SVXSpeechSynthesisUtteranceInfo *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisUtteranceInfo::utterance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SVXSpeechSynthesisUtteranceInfo::wordTimings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SVXSpeechSynthesisUtteranceInfo initWithUtterance:wordTimings:](self, "initWithUtterance:wordTimings:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *utterance;
  id v5;

  utterance = self->_utterance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", utterance, CFSTR("SVXSpeechSynthesisUtteranceInfo::utterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wordTimings, CFSTR("SVXSpeechSynthesisUtteranceInfo::wordTimings"));

}

- (NSString)utterance
{
  return self->_utterance;
}

- (NSArray)wordTimings
{
  return self->_wordTimings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSpeechSynthesisUtteranceInfoMutation *);
  _SVXSpeechSynthesisUtteranceInfoMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSpeechSynthesisUtteranceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSpeechSynthesisUtteranceInfoMutation initWithBaseModel:]([_SVXSpeechSynthesisUtteranceInfoMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSpeechSynthesisUtteranceInfoMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSpeechSynthesisUtteranceInfo copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSpeechSynthesisUtteranceInfoMutation *);
  _SVXSpeechSynthesisUtteranceInfoMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSpeechSynthesisUtteranceInfoMutation *))a3;
  v4 = objc_alloc_init(_SVXSpeechSynthesisUtteranceInfoMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSpeechSynthesisUtteranceInfoMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
