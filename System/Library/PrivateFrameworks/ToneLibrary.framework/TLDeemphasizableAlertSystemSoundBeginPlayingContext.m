@implementation TLDeemphasizableAlertSystemSoundBeginPlayingContext

- (TLDeemphasizableAlertSystemSoundBeginPlayingContext)initWithAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TLDeemphasizableAlertSystemSoundBeginPlayingContext *v15;
  TLDeemphasizableAlertSystemSoundBeginPlayingContext *v16;
  uint64_t v17;
  NSString *toneIdentifierForDeemphasizingAlert;
  uint64_t v19;
  NSString *vibrationIdentifierForDeemphasizingAlert;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TLDeemphasizableAlertSystemSoundBeginPlayingContext;
  v15 = -[TLDeemphasizableAlertSystemSoundBeginPlayingContext init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alert, a3);
    objc_storeStrong((id *)&v16->_alertSystemSoundContext, a4);
    v17 = objc_msgSend(v13, "copy");
    toneIdentifierForDeemphasizingAlert = v16->_toneIdentifierForDeemphasizingAlert;
    v16->_toneIdentifierForDeemphasizingAlert = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    vibrationIdentifierForDeemphasizingAlert = v16->_vibrationIdentifierForDeemphasizingAlert;
    v16->_vibrationIdentifierForDeemphasizingAlert = (NSString *)v19;

  }
  return v16;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (TLAlertSystemSoundContext)alertSystemSoundContext
{
  return self->_alertSystemSoundContext;
}

- (NSString)toneIdentifierForDeemphasizingAlert
{
  return self->_toneIdentifierForDeemphasizingAlert;
}

- (NSString)vibrationIdentifierForDeemphasizingAlert
{
  return self->_vibrationIdentifierForDeemphasizingAlert;
}

- (TLSystemSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_toneIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_alertSystemSoundContext, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
