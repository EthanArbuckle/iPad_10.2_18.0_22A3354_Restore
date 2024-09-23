@implementation SVXSpeechSynthesisConfigurer

- (SVXSpeechSynthesisConfigurer)initWithVoiceConfigurer:(id)a3
{
  id v5;
  SVXSpeechSynthesisConfigurer *v6;
  SVXSpeechSynthesisConfigurer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXSpeechSynthesisConfigurer;
  v6 = -[SVXSpeechSynthesisConfigurer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_voiceConfigurer, a3);

  return v7;
}

- (id)synthesisRequestForText:(id)a3 voice:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BEA7A48];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithText:voice:", v7, v6);

  return v8;
}

- (id)synthesisRequestForContext:(id)a3 preferences:(id)a4
{
  SVXSynthesisVoiceConfigurer *voiceConfigurer;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  voiceConfigurer = self->_voiceConfigurer;
  v6 = a3;
  -[SVXSynthesisVoiceConfigurer voiceForContext:preferences:](voiceConfigurer, "voiceForContext:preferences:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A48]), "initWithText:voice:", &stru_24D24F378, v7);
  objc_msgSend(v8, "speakableContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContextInfo:", v10);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceConfigurer, 0);
}

@end
