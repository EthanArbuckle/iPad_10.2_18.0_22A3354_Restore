@implementation TLAlertSystemSoundPlayTaskDescriptor

- (TLAlertSystemSoundPlayTaskDescriptor)initWithAlert:(id)a3 sound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6 alertSystemSoundContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TLAlertSystemSoundPlayTaskDescriptor *v17;
  TLAlertSystemSoundPlayTaskDescriptor *v18;
  uint64_t v19;
  NSString *vibrationIdentifier;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TLAlertSystemSoundPlayTaskDescriptor;
  v17 = -[TLAlertSystemSoundPlayTaskDescriptor init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_alert, a3);
    objc_storeStrong((id *)&v18->_sound, a4);
    v19 = objc_msgSend(v15, "copy");
    vibrationIdentifier = v18->_vibrationIdentifier;
    v18->_vibrationIdentifier = (NSString *)v19;

    v18->_deemphasized = a6;
    objc_storeStrong((id *)&v18->_alertSystemSoundContext, a7);
  }

  return v18;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (TLSystemSound)sound
{
  return self->_sound;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (BOOL)isDeemphasized
{
  return self->_deemphasized;
}

- (TLAlertSystemSoundContext)alertSystemSoundContext
{
  return self->_alertSystemSoundContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSystemSoundContext, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
