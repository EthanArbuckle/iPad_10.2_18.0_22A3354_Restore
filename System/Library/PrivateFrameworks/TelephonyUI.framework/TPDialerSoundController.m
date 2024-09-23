@implementation TPDialerSoundController

- (void)setSoundsActivated:(BOOL)a3
{
  char v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  NSObject *v10;
  int inPropertyData;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *((_BYTE *)self + 16);
  if (!a3)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
      return;
    if (!--__SystemSoundActivationCount_0)
    {
      objc_msgSend((id)objc_opt_class(), "performSelector:withObject:afterDelay:", sel__delayedDeactivate, 0, 0.0);
      __PendingDeactivate_0 = 1;
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSuspended") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 ^ objc_msgSend(v7, "isSuspendedEventsOnly");

    if ((v8 & 1) != 0)
      return;
    goto LABEL_9;
  }

  if ((v5 & 1) != 0)
  {
LABEL_9:
    v9 = __SystemSoundActivationCount_0++;
    if (!v9 && (__PendingDeactivate_0 & 1) == 0)
    {
      inPropertyData = 1;
      AudioServicesSetProperty(0x61637421u, 4u, &kSoundIDs_0, 4u, &inPropertyData);
      TPDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v13 = inPropertyData;
        _os_log_impl(&dword_1BCFA3000, v10, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
      }

    }
LABEL_14:
    *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
  }
}

- (void)setIncompleteSoundCount:(unint64_t)a3
{
  self->_incompleteSoundCount = a3;
}

- (TPDialerSoundController)init
{
  TPDialerSoundController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPDialerSoundController;
  v2 = -[TPDialerSoundController init](&v5, sel_init);
  if (v2)
  {
    v2->_inflightSounds = CFSetCreateMutable(0, 12, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationSuspendedNotification_, *MEMORY[0x1E0DC4848], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationSuspendedNotification_, *MEMORY[0x1E0DC4840], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationResumedNotification_, *MEMORY[0x1E0DC4828], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationResumedNotification_, *MEMORY[0x1E0DC4820], 0);
    -[TPDialerSoundController setSoundsActivated:](v2, "setSoundsActivated:", 1);

  }
  return v2;
}

- (unint64_t)incompleteSoundCount
{
  return self->_incompleteSoundCount;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TPDialerSoundController setSoundsActivated:](self, "setSoundsActivated:", 0);
  if (self->_inflightSounds)
  {
    -[TPDialerSoundController _stopAllSoundsForcingCallbacks:](self, "_stopAllSoundsForcingCallbacks:", 1);
    CFRelease(self->_inflightSounds);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TPDialerSoundController;
  -[TPDialerSoundController dealloc](&v4, sel_dealloc);
}

- (void)applicationResumedNotification:(id)a3
{
  -[TPDialerSoundController setSoundsActivated:](self, "setSoundsActivated:", 1);
}

- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3
{
  __CFSet *inflightSounds;
  _BOOL4 v5;
  uint64_t i;
  void *v7;

  inflightSounds = self->_inflightSounds;
  if (inflightSounds)
  {
    v5 = a3;
    CFSetApplyFunction(inflightSounds, (CFSetApplierFunction)__TPStopSoundForKeyCallback_0, self);
    CFSetRemoveAllValues(self->_inflightSounds);
    if (v5)
    {
      for (i = 0; i != 12; ++i)
        AudioServicesRemoveSystemSoundCompletion(kSoundIDs_0[i]);
      if (-[TPDialerSoundController incompleteSoundCount](self, "incompleteSoundCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:", CFSTR("TPDialerSoundControllerWillEndSoundsNotification"), self);

      }
      -[TPDialerSoundController setIncompleteSoundCount:](self, "setIncompleteSoundCount:", 0);
    }
  }
}

- (void)applicationSuspendedNotification:(id)a3
{
  -[TPDialerSoundController setSoundsActivated:](self, "setSoundsActivated:", 0);
}

- (void)playSoundForDialerCharacter:(int64_t)a3
{
  SystemSoundID v4;
  void *v6;
  __CFRunLoop *Current;

  if (a3 <= 11)
  {
    v4 = kSoundIDs_0[a3];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("TPDialerSoundControllerWillBeginSoundsNotification"), self);

      Current = CFRunLoopGetCurrent();
      AudioServicesAddSystemSoundCompletion(v4, Current, (CFStringRef)*MEMORY[0x1E0C9B270], (AudioServicesSystemSoundCompletionProc)_SoundCompletedPlaying_0, self);
      -[TPDialerSoundController setIncompleteSoundCount:](self, "setIncompleteSoundCount:", -[TPDialerSoundController incompleteSoundCount](self, "incompleteSoundCount") + 1);
      AudioServicesStartSystemSound();
      CFSetAddValue(self->_inflightSounds, (const void *)a3);
    }
  }
}

- (void)stopSoundForDialerCharacter:(int64_t)a3
{
  if (a3 <= 11)
  {
    if (kSoundIDs_0[a3])
    {
      AudioServicesStopSystemSound();
      CFSetRemoveValue(self->_inflightSounds, (const void *)a3);
    }
  }
}

- (void)soundCompletedPlaying:(unsigned int)a3
{
  id v5;

  if (-[TPDialerSoundController incompleteSoundCount](self, "incompleteSoundCount"))
  {
    -[TPDialerSoundController setIncompleteSoundCount:](self, "setIncompleteSoundCount:", -[TPDialerSoundController incompleteSoundCount](self, "incompleteSoundCount") - 1);
    if (!-[TPDialerSoundController incompleteSoundCount](self, "incompleteSoundCount"))
    {
      AudioServicesRemoveSystemSoundCompletion(a3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("TPDialerSoundControllerWillEndSoundsNotification"), self);

    }
  }
}

+ (void)_delayedDeactivate
{
  NSObject *v2;
  int inPropertyData;
  uint8_t buf[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!__SystemSoundActivationCount_0)
  {
    inPropertyData = 0;
    AudioServicesSetProperty(0x61637421u, 4u, kSoundIDs_0, 4u, &inPropertyData);
    TPDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v5 = inPropertyData;
      _os_log_impl(&dword_1BCFA3000, v2, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
    }

    __PendingDeactivate_0 = 0;
  }
}

@end
