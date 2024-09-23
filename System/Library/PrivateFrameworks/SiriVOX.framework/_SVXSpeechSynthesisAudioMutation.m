@implementation _SVXSpeechSynthesisAudioMutation

- (_SVXSpeechSynthesisAudioMutation)init
{
  return -[_SVXSpeechSynthesisAudioMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSpeechSynthesisAudioMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSpeechSynthesisAudioMutation *v6;
  _SVXSpeechSynthesisAudioMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisAudioMutation;
  v6 = -[_SVXSpeechSynthesisAudioMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setDecoderASBD:(id)a3
{
  objc_storeStrong((id *)&self->_decoderASBD, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setPlayerASBD:(id)a3
{
  objc_storeStrong((id *)&self->_playerASBD, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SVXSpeechSynthesisAudio *baseModel;
  SVXSpeechSynthesisAudio *v4;
  SVXSpeechSynthesisAudio *v5;
  NSData *v6;
  NSData *v7;
  SVXAudioStreamBasicDescription *v8;
  SVXAudioStreamBasicDescription *v9;
  SVXAudioStreamBasicDescription *v10;
  SVXAudioStreamBasicDescription *v11;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXSpeechSynthesisAudio initWithData:decoderASBD:playerASBD:]([SVXSpeechSynthesisAudio alloc], "initWithData:decoderASBD:playerASBD:", self->_data, self->_decoderASBD, self->_playerASBD);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXSpeechSynthesisAudio *)-[SVXSpeechSynthesisAudio copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_data;
  }
  else
  {
    -[SVXSpeechSynthesisAudio data](baseModel, "data");
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v8 = self->_decoderASBD;
  }
  else
  {
    -[SVXSpeechSynthesisAudio decoderASBD](self->_baseModel, "decoderASBD");
    v8 = (SVXAudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v10 = self->_playerASBD;
  }
  else
  {
    -[SVXSpeechSynthesisAudio playerASBD](self->_baseModel, "playerASBD");
    v10 = (SVXAudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v5 = -[SVXSpeechSynthesisAudio initWithData:decoderASBD:playerASBD:]([SVXSpeechSynthesisAudio alloc], "initWithData:decoderASBD:playerASBD:", v7, v9, v10);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerASBD, 0);
  objc_storeStrong((id *)&self->_decoderASBD, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
