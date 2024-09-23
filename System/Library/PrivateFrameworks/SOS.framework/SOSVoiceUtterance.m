@implementation SOSVoiceUtterance

- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6
{
  id v11;
  id v12;
  SOSVoiceUtterance *v13;
  SOSVoiceUtterance *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SOSVoiceUtterance;
  v13 = -[SOSVoiceUtterance init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageKey, a3);
    objc_storeStrong((id *)&v14->_voiceLanguage, a4);
    v14->_volume = a5;
    v14->_rateMultiplier = a6;
  }

  return v14;
}

- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4
{
  double v4;
  double v5;

  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  return -[SOSVoiceUtterance initWithMessageKey:voiceLanguage:volume:rateMultiplier:](self, "initWithMessageKey:voiceLanguage:volume:rateMultiplier:", a3, a4, v4, v5);
}

- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6
{
  id v11;
  double v12;
  double v13;
  SOSVoiceUtterance *v14;
  SOSVoiceUtterance *v15;

  v11 = a3;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  v14 = -[SOSVoiceUtterance initWithMessageKey:voiceLanguage:volume:rateMultiplier:](self, "initWithMessageKey:voiceLanguage:volume:rateMultiplier:", &stru_1E5F76FF8, a4, v12, v13);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_precomposedLocalizedMessageString, a3);

  return v15;
}

- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4
{
  double v4;
  double v5;

  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  return -[SOSVoiceUtterance initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:](self, "initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:", a3, a4, v4, v5);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SOSVoiceUtterance messageKey](self, "messageKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceUtterance voiceLanguage](self, "voiceLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceUtterance volume](self, "volume");
  v8 = v7;
  -[SOSVoiceUtterance rateMultiplier](self, "rateMultiplier");
  v10 = v9;
  -[SOSVoiceUtterance precomposedLocalizedMessageString](self, "precomposedLocalizedMessageString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p messageKey=%@ voiceLanguage=%@ volume=%0.3f rateMultiplier=%0.3f precomposedLMS=\"%@\">"), v4, self, v5, v6, *(_QWORD *)&v8, *(_QWORD *)&v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)silentUtterance
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalizedMessageString:voiceLanguage:", &stru_1E5F76FF8, &stru_1E5F76FF8);
}

- (NSString)localizedMessageInVoiceLanguage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[SOSVoiceUtterance precomposedLocalizedMessageString](self, "precomposedLocalizedMessageString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SOSVoiceUtterance messageKey](self, "messageKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_opt_class();
      -[SOSVoiceUtterance voiceLanguage](self, "voiceLanguage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:forLocalization:", v6, v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return (NSString *)v5;
}

+ (id)localizedStringForKey:(id)a3 forLocalization:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "containsString:", CFSTR("KAPPA")))
    v8 = CFSTR("Localizable-kappa");
  else
    v8 = 0;
  objc_msgSend(a1, "_localizedStringForKey:forLocalization:tableName:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_localizedStringForKey:(id)a3 forLocalization:(id)a4 tableName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cfBundle");
  v11 = (void *)CFBundleCopyLocalizedStringForLocalization();

  sos_voice_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138544130;
    v15 = v7;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_INFO, "stringToLocalize: %{public}@ localizedString: %{public}@ localization: %{public}@ table: %{public}@", (uint8_t *)&v14, 0x2Au);
  }

  return v11;
}

- (id)attributedSpeechString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  SOSVoiceUtterance *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SOSVoiceUtterance localizedMessageInVoiceLanguage](self, "localizedMessageInVoiceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceUtterance _voiceOverAttributes](self, "_voiceOverAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:attributes:", v4, v5);

  sos_voice_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_INFO, "attributedSpeechString: %@, from %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)_voiceOverAttributes
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SOSVoiceUtterance voiceLanguage](self, "voiceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceUtterance rateMultiplier](self, "rateMultiplier");
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("AXSpeakTypingPayloadKeyLanguage"));
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceUtterance volume](self, "volume");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("AXSpeakTypingPayloadKeyVolume"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("AXSpeakTypingPayloadKeyRate"));

  return v7;
}

- (id)avSpeechUtterance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  SOSVoiceUtterance *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C89BA8];
  -[SOSVoiceUtterance localizedMessageInVoiceLanguage](self, "localizedMessageInVoiceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechUtteranceWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOSVoiceUtterance voice](self, "voice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoice:", v6);

  -[SOSVoiceUtterance volume](self, "volume");
  objc_msgSend(v5, "setVolume:");
  -[SOSVoiceUtterance rateMultiplier](self, "rateMultiplier");
  *(float *)&v8 = v7 * 0.5;
  objc_msgSend(v5, "setRate:", v8);
  sos_voice_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "avSpeechUtterance: %@, from %@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (id)voice
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C89B88];
  -[SOSVoiceUtterance voiceLanguage](self, "voiceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceWithLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  sos_voice_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSVoiceUtterance voiceLanguage](self, "voiceLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Voice retrieved: %{public}@ for voiceLanguage: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  return v5;
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (NSString)precomposedLocalizedMessageString
{
  return self->_precomposedLocalizedMessageString;
}

- (void)setPrecomposedLocalizedMessageString:(id)a3
{
  objc_storeStrong((id *)&self->_precomposedLocalizedMessageString, a3);
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)rateMultiplier
{
  return self->_rateMultiplier;
}

- (void)setRateMultiplier:(float)a3
{
  self->_rateMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomposedLocalizedMessageString, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
}

@end
