@implementation STUMutePropertyProvider_iOS

- (void)beginUpdating
{
  MPVolumeController *v3;
  void *v4;
  id v5;

  v3 = objc_opt_new(MPVolumeController);
  -[STUMutePropertyProvider_iOS setVolumeController:](self, "setVolumeController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUMutePropertyProvider_iOS volumeController](self, "volumeController"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUMutePropertyProvider_iOS volumeController](self, "volumeController"));
  -[STUMutePropertyProvider setMuted:](self, "setMuted:", objc_msgSend(v5, "isMuted"));

}

- (void)endUpdating
{
  -[STUMutePropertyProvider_iOS setVolumeController:](self, "setVolumeController:", 0);
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[STUMutePropertyProvider isMuted](self, "isMuted", a3) != a4)
    -[STUMutePropertyProvider setMuted:](self, "setMuted:", v4);
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeController, 0);
}

@end
