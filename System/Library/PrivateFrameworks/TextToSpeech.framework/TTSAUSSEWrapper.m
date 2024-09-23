@implementation TTSAUSSEWrapper

+ (id)makeAU:(id)a3
{
  return a3;
}

- (TTSAUSSEWrapper)initWithAudioUnit:(id)a3
{
  id v5;
  TTSAUSSEWrapper *v6;
  TTSAUSSEWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTSAUSSEWrapper;
  v6 = -[TTSAUSSEWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioUnit, a3);

  return v7;
}

- (void)cancelSpeechRequest
{
  ((void (*)(AUAudioUnit *, char *))MEMORY[0x1E0DE7D20])(self->_audioUnit, sel_cancelSpeechRequest);
}

- (void)synthesizeSpeechRequest:(id)a3
{
  ((void (*)(AUAudioUnit *, char *, id))MEMORY[0x1E0DE7D20])(self->_audioUnit, sel_synthesizeSpeechRequest_, a3);
}

- (AUAudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (void)setAudioUnit:(id)a3
{
  objc_storeStrong((id *)&self->_audioUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioUnit, 0);
}

@end
