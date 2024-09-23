@implementation TLSystemTone

- (TLSystemTone)initWithSoundFileURL:(id)a3 actualSoundID:(unsigned int)a4 previewSoundID:(unsigned int)a5 requiresLongFormPlayback:(BOOL)a6
{
  id v10;
  TLSystemTone *v11;
  uint64_t v12;
  NSURL *soundFileURL;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLSystemTone;
  v11 = -[TLSystemTone init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    soundFileURL = v11->_soundFileURL;
    v11->_soundFileURL = (NSURL *)v12;

    v11->_actualSoundID = a4;
    v11->_previewSoundID = a5;
    v11->_requiresLongFormPlayback = a6;
  }

  return v11;
}

- (TLSystemSound)actualSound
{
  TLSystemSound *actualSound;
  TLSystemSound *v4;
  TLSystemSound *v5;

  actualSound = self->_actualSound;
  if (!actualSound)
  {
    v4 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:]([TLSystemSound alloc], "initWithSoundFileURL:soundID:requiresLongFormPlayback:", self->_soundFileURL, self->_actualSoundID, self->_requiresLongFormPlayback);
    v5 = self->_actualSound;
    self->_actualSound = v4;

    actualSound = self->_actualSound;
  }
  return actualSound;
}

- (TLSystemSound)previewSound
{
  TLSystemSound *previewSound;
  TLSystemSound *v4;
  TLSystemSound *v5;

  previewSound = self->_previewSound;
  if (!previewSound)
  {
    v4 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:]([TLSystemSound alloc], "initWithSoundFileURL:soundID:requiresLongFormPlayback:", self->_soundFileURL, self->_previewSoundID, self->_requiresLongFormPlayback);
    v5 = self->_previewSound;
    self->_previewSound = v4;

    previewSound = self->_previewSound;
  }
  return previewSound;
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (BOOL)requiresLongFormPlayback
{
  return self->_requiresLongFormPlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundFileURL, 0);
  objc_storeStrong((id *)&self->_previewSound, 0);
  objc_storeStrong((id *)&self->_actualSound, 0);
}

@end
