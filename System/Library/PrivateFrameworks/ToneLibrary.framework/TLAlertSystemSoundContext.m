@implementation TLAlertSystemSoundContext

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; sound = %@"), self->_sound);
  objc_msgSend(v6, "appendFormat:", CFSTR("; vibrationIdentifier = %@"), self->_vibrationIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("; playbackCompletionContext = %@"), self->_playbackCompletionContext);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackObserver);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(v6, "appendFormat:", CFSTR("; playbackObserver = %@"), WeakRetained);
  if (self->_requiringBacklightObservation)
    objc_msgSend(v6, "appendString:", CFSTR("; isRequiringBacklightObservation = YES"));
  if (self->_loadingSound)
    objc_msgSend(v6, "appendString:", CFSTR("; isLoadingSound = YES"));
  if (self->_hasPlaybackStarted)
    objc_msgSend(v6, "appendString:", CFSTR("; hasPlaybackStarted = YES"));
  if (self->_beingInterrupted)
    objc_msgSend(v6, "appendString:", CFSTR("; isBeingInterrupted = YES"));
  v9 = self->_toneIdentifierForDeemphasizingAlert;
  v10 = v9;
  if (v9)
    objc_msgSend(v6, "appendFormat:", CFSTR("; toneIdentifierForDeemphasizingAlert = %@"), v9);
  v11 = self->_vibrationIdentifierForDeemphasizingAlert;
  v12 = v11;
  if (v11)
    objc_msgSend(v6, "appendFormat:", CFSTR("; vibrationIdentifierForDeemphasizingAlert = %@"), v11);
  if (self->_beingDeemphasized)
    objc_msgSend(v6, "appendString:", CFSTR("; isBeingDeemphasized = YES"));
  if (self->_deemphasized)
    objc_msgSend(v6, "appendString:", CFSTR("; isDeemphasized = YES"));
  if (self->_hasDeemphasizedPlaybackStarted)
    objc_msgSend(v6, "appendString:", CFSTR("; hasDeemphasizedPlaybackStarted = YES"));
  if (self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldBeInterruptedAfterDeemphasizedPlaybackStarts = YES"));
  if (self->_stoppingOptionsForDeferredInterruption)
    objc_msgSend(v6, "appendFormat:", CFSTR("; stoppingOptionsForDeferredInterruption = %@"),
      self->_stoppingOptionsForDeferredInterruption);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TLAlertPlaybackCompletionContext)playbackCompletionContext
{
  return self->_playbackCompletionContext;
}

- (void)setPlaybackCompletionContext:(id)a3
{
  objc_storeStrong((id *)&self->_playbackCompletionContext, a3);
}

- (TLAlertPlaybackObserver)playbackObserver
{
  return (TLAlertPlaybackObserver *)objc_loadWeakRetained((id *)&self->_playbackObserver);
}

- (void)setPlaybackObserver:(id)a3
{
  objc_storeWeak((id *)&self->_playbackObserver, a3);
}

- (BOOL)isRequiringBacklightObservation
{
  return self->_requiringBacklightObservation;
}

- (void)setRequiringBacklightObservation:(BOOL)a3
{
  self->_requiringBacklightObservation = a3;
}

- (BOOL)isLoadingSound
{
  return self->_loadingSound;
}

- (void)setLoadingSound:(BOOL)a3
{
  self->_loadingSound = a3;
}

- (BOOL)hasPlaybackStarted
{
  return self->_hasPlaybackStarted;
}

- (void)setHasPlaybackStarted:(BOOL)a3
{
  self->_hasPlaybackStarted = a3;
}

- (BOOL)isBeingInterrupted
{
  return self->_beingInterrupted;
}

- (void)setBeingInterrupted:(BOOL)a3
{
  self->_beingInterrupted = a3;
}

- (NSString)toneIdentifierForDeemphasizingAlert
{
  return self->_toneIdentifierForDeemphasizingAlert;
}

- (void)setToneIdentifierForDeemphasizingAlert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)vibrationIdentifierForDeemphasizingAlert
{
  return self->_vibrationIdentifierForDeemphasizingAlert;
}

- (void)setVibrationIdentifierForDeemphasizingAlert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isBeingDeemphasized
{
  return self->_beingDeemphasized;
}

- (void)setBeingDeemphasized:(BOOL)a3
{
  self->_beingDeemphasized = a3;
}

- (BOOL)isDeemphasized
{
  return self->_deemphasized;
}

- (void)setDeemphasized:(BOOL)a3
{
  self->_deemphasized = a3;
}

- (BOOL)hasDeemphasizedPlaybackStarted
{
  return self->_hasDeemphasizedPlaybackStarted;
}

- (void)setHasDeemphasizedPlaybackStarted:(BOOL)a3
{
  self->_hasDeemphasizedPlaybackStarted = a3;
}

- (BOOL)shouldBeInterruptedAfterDeemphasizedPlaybackStarts
{
  return self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts;
}

- (void)setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:(BOOL)a3
{
  self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts = a3;
}

- (TLAlertStoppingOptions)stoppingOptionsForDeferredInterruption
{
  return self->_stoppingOptionsForDeferredInterruption;
}

- (void)setStoppingOptionsForDeferredInterruption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppingOptionsForDeferredInterruption, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_toneIdentifierForDeemphasizingAlert, 0);
  objc_destroyWeak((id *)&self->_playbackObserver);
  objc_storeStrong((id *)&self->_playbackCompletionContext, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_sound, 0);
}

@end
