@implementation _SVXSpeechSynthesisUtteranceInfoMutation

- (_SVXSpeechSynthesisUtteranceInfoMutation)init
{
  return -[_SVXSpeechSynthesisUtteranceInfoMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSpeechSynthesisUtteranceInfoMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSpeechSynthesisUtteranceInfoMutation *v6;
  _SVXSpeechSynthesisUtteranceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisUtteranceInfoMutation;
  v6 = -[_SVXSpeechSynthesisUtteranceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setWordTimings:(id)a3
{
  objc_storeStrong((id *)&self->_wordTimings, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXSpeechSynthesisUtteranceInfo *baseModel;
  SVXSpeechSynthesisUtteranceInfo *v4;
  SVXSpeechSynthesisUtteranceInfo *v5;
  NSString *v6;
  NSString *v7;
  NSArray *v8;
  NSArray *v9;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXSpeechSynthesisUtteranceInfo initWithUtterance:wordTimings:]([SVXSpeechSynthesisUtteranceInfo alloc], "initWithUtterance:wordTimings:", self->_utterance, self->_wordTimings);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXSpeechSynthesisUtteranceInfo *)-[SVXSpeechSynthesisUtteranceInfo copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_utterance;
  }
  else
  {
    -[SVXSpeechSynthesisUtteranceInfo utterance](baseModel, "utterance");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v8 = self->_wordTimings;
  }
  else
  {
    -[SVXSpeechSynthesisUtteranceInfo wordTimings](self->_baseModel, "wordTimings");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v5 = -[SVXSpeechSynthesisUtteranceInfo initWithUtterance:wordTimings:]([SVXSpeechSynthesisUtteranceInfo alloc], "initWithUtterance:wordTimings:", v7, v8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
