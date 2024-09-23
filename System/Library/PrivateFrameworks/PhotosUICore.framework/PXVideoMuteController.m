@implementation PXVideoMuteController

- (PXVideoMuteController)init
{
  PXVideoMuteController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXVideoMuteController;
  result = -[PXVideoMuteController init](&v3, sel_init);
  if (result)
  {
    result->_muteState = 1;
    result->_isMuted = 1;
  }
  return result;
}

- (void)userDidMute
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__PXVideoMuteController_userDidMute__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXVideoMuteController performChanges:](self, "performChanges:", v2);
}

- (void)userDidUnmute
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__PXVideoMuteController_userDidUnmute__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXVideoMuteController performChanges:](self, "performChanges:", v2);
}

- (void)applicationDidMoveToBackground
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__PXVideoMuteController_applicationDidMoveToBackground__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXVideoMuteController performChanges:](self, "performChanges:", v2);
}

- (void)setMuteState:(int64_t)a3
{
  if (self->_muteState != a3)
  {
    self->_muteState = a3;
    -[PXVideoMuteController _updateIsMuted](self, "_updateIsMuted");
  }
}

- (void)_updateIsMuted
{
  -[PXVideoMuteController setIsMuted:](self, "setIsMuted:", isMutedForMuteState(-[PXVideoMuteController muteState](self, "muteState")));
}

- (void)setIsMuted:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    -[PXVideoMuteController signalChange:](self, "signalChange:", 1);
    PLVideoPlaybackGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PXVideoMuteController debugDescription](self, "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Video Mute State Changed: %@", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXVideoMuteController muteState](self, "muteState") - 1;
  if (v6 > 3)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E512AC58[v6];
  v8 = -[PXVideoMuteController isMuted](self, "isMuted");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; State: %@, Muted: %@>"), v5, self, v7, v9);

  return v10;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (int64_t)muteState
{
  return self->_muteState;
}

uint64_t __55__PXVideoMuteController_applicationDidMoveToBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMuteState:", 4);
}

uint64_t __38__PXVideoMuteController_userDidUnmute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMuteState:", 2);
}

uint64_t __36__PXVideoMuteController_userDidMute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMuteState:", 3);
}

+ (PXVideoMuteController)sharedController
{
  if (sharedController_onceToken_129123 != -1)
    dispatch_once(&sharedController_onceToken_129123, &__block_literal_global_129124);
  return (PXVideoMuteController *)(id)sharedController_sharedController_129125;
}

void __41__PXVideoMuteController_sharedController__block_invoke()
{
  PXApplicationVideoMuteController *v0;
  void *v1;

  v0 = objc_alloc_init(PXApplicationVideoMuteController);
  v1 = (void *)sharedController_sharedController_129125;
  sharedController_sharedController_129125 = (uint64_t)v0;

}

@end
