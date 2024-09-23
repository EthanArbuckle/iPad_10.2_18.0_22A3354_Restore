@implementation VoiceDialVoicemailRecognitionAction

- (VoiceDialVoicemailRecognitionAction)init
{
  VoiceDialVoicemailRecognitionAction *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VoiceDialVoicemailRecognitionAction;
  v2 = -[VoiceDialVoicemailRecognitionAction init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("tel:"));
    -[VSRecognitionURLAction setURL:](v2, "setURL:", v3);
    VoiceDialBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VOICEMAIL"), &stru_24E19F250, CFSTR("Feedback"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSRecognitionAction setResultDisplayString:](v2, "setResultDisplayString:", v5);

    VoiceDialBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONFIRMED_DISPLAY_STRING"), &stru_24E19F250, CFSTR("Feedback"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSRecognitionAction setStatusDisplayString:](v2, "setStatusDisplayString:", v7);

    VoiceDialSpokenLocalizedString(CFSTR("CONFIRMED_SPOKEN_VOICEMAIL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSRecognitionAction setSpokenFeedbackString:](v2, "setSpokenFeedbackString:", v8);

  }
  return v2;
}

@end
