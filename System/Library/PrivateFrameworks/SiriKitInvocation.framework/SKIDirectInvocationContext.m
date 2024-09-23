@implementation SKIDirectInvocationContext

- (SKIDirectInvocationContext)init
{
  SKIDirectInvocationContext *v2;
  SKIDirectInvocationContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKIDirectInvocationContext;
  v2 = -[SKIDirectInvocationContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKIDirectInvocationContext setVoiceTriggerEnabled:](v2, "setVoiceTriggerEnabled:", 1);
    -[SKIDirectInvocationContext setTextToSpeechEnabled:](v3, "setTextToSpeechEnabled:", 1);
    -[SKIDirectInvocationContext setEyesFree:](v3, "setEyesFree:", 1);
    -[SKIDirectInvocationContext setInputOrigin:](v3, "setInputOrigin:", *MEMORY[0x24BE821B8]);
    -[SKIDirectInvocationContext setInteractionType:](v3, "setInteractionType:", *MEMORY[0x24BE82228]);
    -[SKIDirectInvocationContext setResponseMode:](v3, "setResponseMode:", 0);
  }
  return v3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_textToSpeechEnabled;
}

- (void)setTextToSpeechEnabled:(BOOL)a3
{
  self->_textToSpeechEnabled = a3;
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (void)setEyesFree:(BOOL)a3
{
  self->_eyesFree = a3;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setInputOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setResponseMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_interactionType, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
}

+ (id)contextForCarPlayDirectAction
{
  SKIDirectInvocationContext *v2;

  v2 = objc_alloc_init(SKIDirectInvocationContext);
  -[SKIDirectInvocationContext setVoiceTriggerEnabled:](v2, "setVoiceTriggerEnabled:", 1);
  -[SKIDirectInvocationContext setTextToSpeechEnabled:](v2, "setTextToSpeechEnabled:", 1);
  -[SKIDirectInvocationContext setEyesFree:](v2, "setEyesFree:", 1);
  -[SKIDirectInvocationContext setInputOrigin:](v2, "setInputOrigin:", *MEMORY[0x24BE821C0]);
  -[SKIDirectInvocationContext setInteractionType:](v2, "setInteractionType:", *MEMORY[0x24BE82228]);
  return v2;
}

+ (id)contextForAnnounceNotifications
{
  SKIDirectInvocationContext *v2;

  v2 = objc_alloc_init(SKIDirectInvocationContext);
  -[SKIDirectInvocationContext setVoiceTriggerEnabled:](v2, "setVoiceTriggerEnabled:", 1);
  -[SKIDirectInvocationContext setTextToSpeechEnabled:](v2, "setTextToSpeechEnabled:", 1);
  -[SKIDirectInvocationContext setEyesFree:](v2, "setEyesFree:", 1);
  -[SKIDirectInvocationContext setInputOrigin:](v2, "setInputOrigin:", *MEMORY[0x24BE821B8]);
  -[SKIDirectInvocationContext setInteractionType:](v2, "setInteractionType:", *MEMORY[0x24BE82228]);
  -[SKIDirectInvocationContext setResponseMode:](v2, "setResponseMode:", *MEMORY[0x24BE827D8]);
  return v2;
}

@end
