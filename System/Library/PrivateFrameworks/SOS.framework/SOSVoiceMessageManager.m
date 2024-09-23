@implementation SOSVoiceMessageManager

- (SOSVoiceMessageManager)initWithMessageKey:(id)a3
{
  id v5;
  SOSVoiceMessageManager *v6;
  SOSVoiceMessageManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSVoiceMessageManager;
  v6 = -[SOSVoiceMessageManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageKey, a3);

  return v7;
}

- (SOSVoiceMessageManager)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SOSVoiceMessageManager stopMessagePlayback](self, "stopMessagePlayback");
  v3.receiver = self;
  v3.super_class = (Class)SOSVoiceMessageManager;
  -[SOSVoiceMessageManager dealloc](&v3, sel_dealloc);
}

- (SOSVoiceMessageManager)initWithMessageType:(int64_t)a3
{
  void *v4;
  SOSVoiceMessageManager *v5;

  objc_msgSend((id)objc_opt_class(), "_messageStringKeyForMessageType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SOSVoiceMessageManager initWithMessageKey:](self, "initWithMessageKey:", v4);

  return v5;
}

- (void)startMessagePlayback
{
  NSObject *v3;
  uint8_t v4[16];

  if (+[SOSUtilities shouldSilenceSOSFlow](SOSUtilities, "shouldSilenceSOSFlow"))
  {
    sos_voice_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOS flow silenced so not playing voice message", v4, 2u);
    }

  }
  else
  {
    -[SOSVoiceMessageManager playMessage](self, "playMessage");
  }
}

- (void)playMessage
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  sos_voice_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "playMessage", v5, 2u);
  }

  -[SOSVoiceMessageManager utterances](self, "utterances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceMessageManager _playUtterances:](self, "_playUtterances:", v4);

}

- (void)_playUtterances:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_voice_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Playing utterances: %@", (uint8_t *)&v7, 0xCu);
  }

  -[SOSVoiceMessageManager voiceUtterer](self, "voiceUtterer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "speakUtterances:", v4);

}

- (void)stopMessagePlayback
{
  NSObject *v3;
  uint8_t v4[16];

  sos_voice_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping voice message...", v4, 2u);
  }

  -[SOSVoiceUtterer stopSpeaking](self->_voiceUtterer, "stopSpeaking");
}

- (SOSVoiceUtterer)voiceUtterer
{
  SOSVoiceUtterer *voiceUtterer;
  SOSVoiceUtterer *v4;
  SOSVoiceUtterer *v5;

  voiceUtterer = self->_voiceUtterer;
  if (!voiceUtterer)
  {
    v4 = objc_alloc_init(SOSVoiceUtterer);
    v5 = self->_voiceUtterer;
    self->_voiceUtterer = v4;

    voiceUtterer = self->_voiceUtterer;
  }
  return voiceUtterer;
}

+ (id)_messageStringKeyForMessageType:(int64_t)a3
{
  NSObject *v5;

  if (a3 > 102)
  {
    if (a3 == 201)
      return CFSTR("SOS_CHECKIN_SPEECH_KAPPA");
    if (a3 == 103)
      return CFSTR("SOS_VOICEMESSAGE_SPEECH_RELEASE_TO_CALL");
  }
  else
  {
    if (a3 == 101)
      return CFSTR("SOS_VOICEMESSAGE_SPEECH_CALL_BUFFER");
    if (a3 == 102)
      return CFSTR("SOS_VOICEMESSAGE_SPEECH_RELEASE_TO_CALL_INITIAL");
  }
  sos_voice_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SOSVoiceMessageManager _messageStringKeyForMessageType:].cold.1(a3, v5);

  return 0;
}

- (id)utterances
{
  SOSVoiceUtterance *v3;
  void *v4;
  void *v5;
  SOSVoiceUtterance *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [SOSVoiceUtterance alloc];
  -[SOSVoiceMessageManager messageKey](self, "messageKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceMessageManager voiceLanguage](self, "voiceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SOSVoiceUtterance initWithMessageKey:voiceLanguage:](v3, "initWithMessageKey:voiceLanguage:", v4, v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)voiceLanguage
{
  return 0;
}

- (void)setVoiceUtterer:(id)a3
{
  objc_storeStrong((id *)&self->_voiceUtterer, a3);
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
  objc_storeStrong((id *)&self->_messageKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_voiceUtterer, 0);
}

+ (void)_messageStringKeyForMessageType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "_messageStringKeyForReason - Unexpected messageType: %ld", (uint8_t *)&v2, 0xCu);
}

@end
