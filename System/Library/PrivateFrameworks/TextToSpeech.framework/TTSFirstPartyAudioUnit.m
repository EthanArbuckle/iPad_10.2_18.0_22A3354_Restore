@implementation TTSFirstPartyAudioUnit

- (TTSAUMessagingAU)channel
{
  TTSAUMessagingAU *channel;
  TTSAUMessagingAU *v4;
  TTSAUMessagingAU *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  channel = self->_channel;
  if (!channel)
  {
    v4 = objc_alloc_init(TTSAUMessagingAU);
    v5 = self->_channel;
    self->_channel = v4;

    objc_msgSend_setOwningAudioUnit_(self->_channel, v6, (uint64_t)self, v7, v8);
    channel = self->_channel;
  }
  return channel;
}

- (id)echo:(id)a3
{
  return a3;
}

- (id)defaultSettingsForVoice:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)requireFirstUnlockForVoiceLoad
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (id)voicesExternallyManaged
{
  return (id)MEMORY[0x1E0C9AAB0];
}

+ (BOOL)shouldLogSensitiveSpeech
{
  return _AXSSpeechSynthesisOptions() & 1;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
