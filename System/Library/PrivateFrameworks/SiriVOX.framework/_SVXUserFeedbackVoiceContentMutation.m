@implementation _SVXUserFeedbackVoiceContentMutation

- (_SVXUserFeedbackVoiceContentMutation)init
{
  return -[_SVXUserFeedbackVoiceContentMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXUserFeedbackVoiceContentMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXUserFeedbackVoiceContentMutation *v6;
  _SVXUserFeedbackVoiceContentMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackVoiceContentMutation;
  v6 = -[_SVXUserFeedbackVoiceContentMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setIsPhonetic:(BOOL)a3
{
  self->_isPhonetic = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXUserFeedbackVoiceContent *baseModel;
  SVXUserFeedbackVoiceContent *v4;
  SVXUserFeedbackVoiceContent *v5;
  NSString *v6;
  NSString *v7;
  _BOOL8 isPhonetic;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXUserFeedbackVoiceContent initWithText:isPhonetic:]([SVXUserFeedbackVoiceContent alloc], "initWithText:isPhonetic:", self->_text, self->_isPhonetic);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXUserFeedbackVoiceContent *)-[SVXUserFeedbackVoiceContent copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_text;
  }
  else
  {
    -[SVXUserFeedbackVoiceContent text](baseModel, "text");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    isPhonetic = self->_isPhonetic;
  else
    isPhonetic = -[SVXUserFeedbackVoiceContent isPhonetic](self->_baseModel, "isPhonetic");
  v5 = -[SVXUserFeedbackVoiceContent initWithText:isPhonetic:]([SVXUserFeedbackVoiceContent alloc], "initWithText:isPhonetic:", v7, isPhonetic);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
