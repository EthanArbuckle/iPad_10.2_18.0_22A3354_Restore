@implementation _SVXSpeechSynthesisResultMutation

- (_SVXSpeechSynthesisResultMutation)init
{
  return -[_SVXSpeechSynthesisResultMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSpeechSynthesisResultMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSpeechSynthesisResultMutation *v6;
  _SVXSpeechSynthesisResultMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisResultMutation;
  v6 = -[_SVXSpeechSynthesisResultMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setUtteranceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SVXSpeechSynthesisResult *baseModel;
  SVXSpeechSynthesisResult *v4;
  SVXSpeechSynthesisResult *v5;
  int64_t type;
  SVXSpeechSynthesisUtteranceInfo *v7;
  SVXSpeechSynthesisUtteranceInfo *v8;
  NSError *v9;
  NSError *v10;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", self->_type, self->_utteranceInfo, self->_error);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXSpeechSynthesisResult *)-[SVXSpeechSynthesisResult copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    type = self->_type;
    if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_10:
    -[SVXSpeechSynthesisResult utteranceInfo](self->_baseModel, "utteranceInfo");
    v7 = (SVXSpeechSynthesisUtteranceInfo *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  type = -[SVXSpeechSynthesisResult type](baseModel, "type");
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = self->_utteranceInfo;
LABEL_11:
  v8 = v7;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v9 = self->_error;
  }
  else
  {
    -[SVXSpeechSynthesisResult error](self->_baseModel, "error");
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v5 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", type, v8, v9);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_utteranceInfo, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
