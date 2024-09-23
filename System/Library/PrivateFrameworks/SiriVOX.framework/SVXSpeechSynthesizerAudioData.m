@implementation SVXSpeechSynthesizerAudioData

- (SVXSpeechSynthesizerAudioData)initWithAudioChunkData:(id)a3 audioChunkIndex:(unint64_t)a4
{
  id v7;
  SVXSpeechSynthesizerAudioData *v8;
  SVXSpeechSynthesizerAudioData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVXSpeechSynthesizerAudioData;
  v8 = -[SVXSpeechSynthesizerAudioData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioChunkData, a3);
    v9->_audioChunkIndex = a4;
  }

  return v9;
}

- (SiriTTSAudioData)audioChunkData
{
  return self->_audioChunkData;
}

- (unint64_t)audioChunkIndex
{
  return self->_audioChunkIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioChunkData, 0);
}

@end
