@implementation _UIFeedbackAudioFilePattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("wav");
}

+ (id)feedbackPatternFromFile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:", v4);

  return v5;
}

- (_UIFeedbackAudioFilePattern)initWithFileURL:(id)a3
{
  id v5;
  _UIFeedbackAudioFilePattern *v6;
  _UIFeedbackAudioFilePattern *v7;
  _UIFeedbackAudioFilePattern *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackAudioFilePattern;
  v6 = -[_UIFeedback init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  int canReuseCoreHapticsPlayer;
  int disableEventUseVolumeEnvelope;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackAudioFilePattern;
  if (-[_UIFeedback isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    if (-[NSURL isEqual:](self->_fileURL, "isEqual:", v5[17])
      && (canReuseCoreHapticsPlayer = self->_canReuseCoreHapticsPlayer,
          canReuseCoreHapticsPlayer == objc_msgSend(v5, "canReuseCoreHapticsPlayer")))
    {
      disableEventUseVolumeEnvelope = self->_disableEventUseVolumeEnvelope;
      v8 = disableEventUseVolumeEnvelope == objc_msgSend(v5, "disableEventUseVolumeEnvelope");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_UIFeedbackAudioFilePattern)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedbackAudioFilePattern *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *fileURL;
  void *v10;
  void *v11;
  _UIFeedbackAudioFilePattern *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIFeedbackAudioFilePattern;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v14, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:encodingInvalidCharacters:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canReuseCoreHapticsPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canReuseCoreHapticsPlayer = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disableEventUseVolumeEnvelope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disableEventUseVolumeEnvelope = objc_msgSend(v11, "BOOLValue");

    v12 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackAudioFilePattern;
  -[_UIFeedback dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSURL absoluteString](self->_fileURL, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("fileURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canReuseCoreHapticsPlayer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("canReuseCoreHapticsPlayer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableEventUseVolumeEnvelope);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("disableEventUseVolumeEnvelope"));

  return v4;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 1;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  return self->_canReuseCoreHapticsPlayer;
}

- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3
{
  self->_canReuseCoreHapticsPlayer = a3;
}

- (BOOL)disableEventUseVolumeEnvelope
{
  return self->_disableEventUseVolumeEnvelope;
}

- (void)setDisableEventUseVolumeEnvelope:(BOOL)a3
{
  self->_disableEventUseVolumeEnvelope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
