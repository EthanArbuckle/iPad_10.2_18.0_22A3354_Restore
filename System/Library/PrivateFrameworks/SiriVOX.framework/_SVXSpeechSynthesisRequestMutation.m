@implementation _SVXSpeechSynthesisRequestMutation

- (_SVXSpeechSynthesisRequestMutation)init
{
  return -[_SVXSpeechSynthesisRequestMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSpeechSynthesisRequestMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSpeechSynthesisRequestMutation *v6;
  _SVXSpeechSynthesisRequestMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisRequestMutation;
  v6 = -[_SVXSpeechSynthesisRequestMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setSpeakableText:(id)a3
{
  objc_storeStrong((id *)&self->_speakableText, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setSpeakableContext:(id)a3
{
  objc_storeStrong((id *)&self->_speakableContext, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_localizationKey, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void)setPresynthesizedAudio:(id)a3
{
  objc_storeStrong((id *)&self->_presynthesizedAudio, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void)setStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_streamID, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (id)generate
{
  SVXSpeechSynthesisRequest *baseModel;
  char mutationFlags;
  SVXSpeechSynthesisRequest *v5;
  SVXSpeechSynthesisRequest *v6;
  int64_t priority;
  unint64_t options;
  NSString *v9;
  NSString *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSString *v13;
  NSString *v14;
  SVXSpeechSynthesisAudio *v15;
  SVXSpeechSynthesisAudio *v16;
  NSString *v17;
  NSString *v18;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", self->_priority, self->_options, self->_speakableText, self->_speakableContext, self->_localizationKey, self->_presynthesizedAudio, self->_streamID);
    goto LABEL_5;
  }
  mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = (SVXSpeechSynthesisRequest *)-[SVXSpeechSynthesisRequest copy](baseModel, "copy");
LABEL_5:
    v6 = v5;
    return v6;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) == 0)
  {
    priority = -[SVXSpeechSynthesisRequest priority](baseModel, "priority");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_11:
    options = -[SVXSpeechSynthesisRequest options](self->_baseModel, "options");
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_9;
LABEL_12:
    -[SVXSpeechSynthesisRequest speakableText](self->_baseModel, "speakableText");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  priority = self->_priority;
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_11;
LABEL_8:
  options = self->_options;
  if ((mutationFlags & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = self->_speakableText;
LABEL_13:
  v10 = v9;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v11 = self->_speakableContext;
  }
  else
  {
    -[SVXSpeechSynthesisRequest speakableContext](self->_baseModel, "speakableContext");
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v13 = self->_localizationKey;
  }
  else
  {
    -[SVXSpeechSynthesisRequest localizationKey](self->_baseModel, "localizationKey");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v15 = self->_presynthesizedAudio;
  }
  else
  {
    -[SVXSpeechSynthesisRequest presynthesizedAudio](self->_baseModel, "presynthesizedAudio");
    v15 = (SVXSpeechSynthesisAudio *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  if ((*(_BYTE *)&self->_mutationFlags & 0x80000000) != 0)
  {
    v17 = self->_streamID;
  }
  else
  {
    -[SVXSpeechSynthesisRequest streamID](self->_baseModel, "streamID");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  v6 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", priority, options, v10, v12, v14, v16, v17);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_presynthesizedAudio, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);
  objc_storeStrong((id *)&self->_speakableContext, 0);
  objc_storeStrong((id *)&self->_speakableText, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
