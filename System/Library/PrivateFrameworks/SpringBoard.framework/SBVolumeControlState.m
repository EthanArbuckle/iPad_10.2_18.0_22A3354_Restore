@implementation SBVolumeControlState

- (id)copyWithZone:(_NSZone *)a3
{
  SBVolumeControlState *v4;
  void *v5;

  v4 = objc_alloc_init(SBVolumeControlState);
  -[SBVolumeControlState activeVolumeCategoryName](self, "activeVolumeCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVolumeControlState setActiveVolumeCategoryName:](v4, "setActiveVolumeCategoryName:", v5);

  -[SBVolumeControlState setAudioPlayingSomewhere:](v4, "setAudioPlayingSomewhere:", -[SBVolumeControlState isAudioPlayingSomewhere](self, "isAudioPlayingSomewhere"));
  -[SBVolumeControlState setCallOrFaceTimeActive:](v4, "setCallOrFaceTimeActive:", -[SBVolumeControlState isCallOrFaceTimeActive](self, "isCallOrFaceTimeActive"));
  -[SBVolumeControlState setCurrentRouteHasVolumeControl:](v4, "setCurrentRouteHasVolumeControl:", -[SBVolumeControlState currentRouteHasVolumeControl](self, "currentRouteHasVolumeControl"));
  -[SBVolumeControlState setFullyMuted:](v4, "setFullyMuted:", -[SBVolumeControlState isFullyMuted](self, "isFullyMuted"));
  -[SBVolumeControlState setLocked:](v4, "setLocked:", -[SBVolumeControlState isLocked](self, "isLocked"));
  -[SBVolumeControlState setHostingAppOnLockScreen:](v4, "setHostingAppOnLockScreen:", -[SBVolumeControlState isHostingAppOnLockScreen](self, "isHostingAppOnLockScreen"));
  -[SBVolumeControlState setShowingLockScreenMediaControls:](v4, "setShowingLockScreenMediaControls:", -[SBVolumeControlState isShowingLockScreenMediaControls](self, "isShowingLockScreenMediaControls"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVolumeControlState activeVolumeCategoryName](self, "activeVolumeCategoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("activeVolumeCategoryName"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isAudioPlayingSomewhere](self, "isAudioPlayingSomewhere"), CFSTR("isAudioPlayingSomewhere"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isCallOrFaceTimeActive](self, "isCallOrFaceTimeActive"), CFSTR("isCallOrFaceTimeActive"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState currentRouteHasVolumeControl](self, "currentRouteHasVolumeControl"), CFSTR("currentRouteHasVolumeControl"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isFullyMuted](self, "isFullyMuted"), CFSTR("isFullyMuted"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isLocked](self, "isLocked"), CFSTR("isLocked"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isHostingAppOnLockScreen](self, "isHostingAppOnLockScreen"), CFSTR("isHostingAppOnLockScreen"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isShowingLockScreenMediaControls](self, "isShowingLockScreenMediaControls"), CFSTR("isShowingLockScreenMediaControls"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)activeVolumeCategoryName
{
  return self->_activeVolumeCategoryName;
}

- (void)setActiveVolumeCategoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAudioPlayingSomewhere
{
  return self->_isAudioPlayingSomewhere;
}

- (void)setAudioPlayingSomewhere:(BOOL)a3
{
  self->_isAudioPlayingSomewhere = a3;
}

- (BOOL)isCallOrFaceTimeActive
{
  return self->_isCallOrFaceTimeActive;
}

- (void)setCallOrFaceTimeActive:(BOOL)a3
{
  self->_isCallOrFaceTimeActive = a3;
}

- (BOOL)currentRouteHasVolumeControl
{
  return self->_currentRouteHasVolumeControl;
}

- (void)setCurrentRouteHasVolumeControl:(BOOL)a3
{
  self->_currentRouteHasVolumeControl = a3;
}

- (BOOL)isFullyMuted
{
  return self->_isFullyMuted;
}

- (void)setFullyMuted:(BOOL)a3
{
  self->_isFullyMuted = a3;
}

- (BOOL)isRingerMuted
{
  return self->_isRingerMuted;
}

- (void)setRingerMuted:(BOOL)a3
{
  self->_isRingerMuted = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)isHostingAppOnLockScreen
{
  return self->_isHostingAppOnLockScreen;
}

- (void)setHostingAppOnLockScreen:(BOOL)a3
{
  self->_isHostingAppOnLockScreen = a3;
}

- (BOOL)isShowingLockScreenMediaControls
{
  return self->_isShowingLockScreenMediaControls;
}

- (void)setShowingLockScreenMediaControls:(BOOL)a3
{
  self->_isShowingLockScreenMediaControls = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeVolumeCategoryName, 0);
}

@end
