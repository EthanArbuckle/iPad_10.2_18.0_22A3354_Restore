@implementation SRSVTPreferences

- (SRSVTPreferences)init
{
  SRSVTPreferences *v2;
  uint64_t v3;
  VTPreferences *preferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSVTPreferences;
  v2 = -[SRSVTPreferences init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v3 = objc_claimAutoreleasedReturnValue();
    preferences = v2->_preferences;
    v2->_preferences = (VTPreferences *)v3;

  }
  return v2;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  -[VTPreferences setVoiceTriggerEnabled:](self->_preferences, "setVoiceTriggerEnabled:", a3);
}

- (BOOL)voiceTriggerEnabled
{
  return -[VTPreferences voiceTriggerEnabled](self->_preferences, "voiceTriggerEnabled");
}

- (id)localizedTriggerPhraseForLanguageCode:(id)a3
{
  return (id)-[VTPreferences localizedTriggerPhraseForLanguageCode:](self->_preferences, "localizedTriggerPhraseForLanguageCode:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
