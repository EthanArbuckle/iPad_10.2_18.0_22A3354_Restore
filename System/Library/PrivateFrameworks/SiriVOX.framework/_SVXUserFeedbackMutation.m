@implementation _SVXUserFeedbackMutation

- (_SVXUserFeedbackMutation)init
{
  return -[_SVXUserFeedbackMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXUserFeedbackMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXUserFeedbackMutation *v6;
  _SVXUserFeedbackMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackMutation;
  v6 = -[_SVXUserFeedbackMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setAudioContent:(id)a3
{
  objc_storeStrong((id *)&self->_audioContent, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setVoiceContent:(id)a3
{
  objc_storeStrong((id *)&self->_voiceContent, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXUserFeedback *baseModel;
  SVXUserFeedback *v4;
  SVXUserFeedback *v5;
  NSString *v6;
  NSString *v7;
  int64_t contentType;
  SVXUserFeedbackAudioContent *v9;
  SVXUserFeedbackAudioContent *v10;
  SVXUserFeedbackVoiceContent *v11;
  SVXUserFeedbackVoiceContent *v12;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXUserFeedback initWithIdentifier:contentType:audioContent:voiceContent:]([SVXUserFeedback alloc], "initWithIdentifier:contentType:audioContent:voiceContent:", self->_identifier, self->_contentType, self->_audioContent, self->_voiceContent);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXUserFeedback *)-[SVXUserFeedback copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_identifier;
  }
  else
  {
    -[SVXUserFeedback identifier](baseModel, "identifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    contentType = self->_contentType;
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_11;
LABEL_13:
    -[SVXUserFeedback audioContent](self->_baseModel, "audioContent");
    v9 = (SVXUserFeedbackAudioContent *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  contentType = -[SVXUserFeedback contentType](self->_baseModel, "contentType");
  if ((*(_BYTE *)&self->_mutationFlags & 8) == 0)
    goto LABEL_13;
LABEL_11:
  v9 = self->_audioContent;
LABEL_14:
  v10 = v9;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v11 = self->_voiceContent;
  }
  else
  {
    -[SVXUserFeedback voiceContent](self->_baseModel, "voiceContent");
    v11 = (SVXUserFeedbackVoiceContent *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v5 = -[SVXUserFeedback initWithIdentifier:contentType:audioContent:voiceContent:]([SVXUserFeedback alloc], "initWithIdentifier:contentType:audioContent:voiceContent:", v7, contentType, v10, v11);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceContent, 0);
  objc_storeStrong((id *)&self->_audioContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
