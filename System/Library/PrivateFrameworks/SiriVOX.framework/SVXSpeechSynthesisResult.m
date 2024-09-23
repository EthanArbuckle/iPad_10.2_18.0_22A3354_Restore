@implementation SVXSpeechSynthesisResult

- (SVXSpeechSynthesisResult)initWithType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  SVXSpeechSynthesisResult *v10;
  SVXSpeechSynthesisResult *v11;
  uint64_t v12;
  SVXSpeechSynthesisUtteranceInfo *utteranceInfo;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SVXSpeechSynthesisResult;
  v10 = -[SVXSpeechSynthesisResult init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    utteranceInfo = v11->_utteranceInfo;
    v11->_utteranceInfo = (SVXSpeechSynthesisUtteranceInfo *)v12;

    v14 = objc_msgSend(v9, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v14;

  }
  return v11;
}

- (id)description
{
  return -[SVXSpeechSynthesisResult _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t type;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXSpeechSynthesisResult;
  -[SVXSpeechSynthesisResult description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 4)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24D308[type];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {type = %@, utteranceInfo = %@, error = %@}"), v5, v8, self->_utteranceInfo, self->_error);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SVXSpeechSynthesisUtteranceInfo hash](self->_utteranceInfo, "hash");
  v6 = v5 ^ -[NSError hash](self->_error, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisResult *v4;
  SVXSpeechSynthesisResult *v5;
  int64_t type;
  SVXSpeechSynthesisUtteranceInfo *v7;
  SVXSpeechSynthesisUtteranceInfo *utteranceInfo;
  NSError *v9;
  NSError *error;
  BOOL v11;

  v4 = (SVXSpeechSynthesisResult *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[SVXSpeechSynthesisResult type](v5, "type"))
      {
        -[SVXSpeechSynthesisResult utteranceInfo](v5, "utteranceInfo");
        v7 = (SVXSpeechSynthesisUtteranceInfo *)objc_claimAutoreleasedReturnValue();
        utteranceInfo = self->_utteranceInfo;
        if (utteranceInfo == v7 || -[SVXSpeechSynthesisUtteranceInfo isEqual:](utteranceInfo, "isEqual:", v7))
        {
          -[SVXSpeechSynthesisResult error](v5, "error");
          v9 = (NSError *)objc_claimAutoreleasedReturnValue();
          error = self->_error;
          v11 = error == v9 || -[NSError isEqual:](error, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (SVXSpeechSynthesisResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SVXSpeechSynthesisResult *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisResult::type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisResult::utteranceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisResult::error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:](self, "initWithType:utteranceInfo:error:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SVXSpeechSynthesisResult::type"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_utteranceInfo, CFSTR("SVXSpeechSynthesisResult::utteranceInfo"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_error, CFSTR("SVXSpeechSynthesisResult::error"));

}

- (int64_t)type
{
  return self->_type;
}

- (SVXSpeechSynthesisUtteranceInfo)utteranceInfo
{
  return self->_utteranceInfo;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_utteranceInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSpeechSynthesisResultMutation *);
  _SVXSpeechSynthesisResultMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSpeechSynthesisResultMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSpeechSynthesisResultMutation initWithBaseModel:]([_SVXSpeechSynthesisResultMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSpeechSynthesisResultMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSpeechSynthesisResult copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSpeechSynthesisResultMutation *);
  _SVXSpeechSynthesisResultMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSpeechSynthesisResultMutation *))a3;
  v4 = objc_alloc_init(_SVXSpeechSynthesisResultMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSpeechSynthesisResultMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
