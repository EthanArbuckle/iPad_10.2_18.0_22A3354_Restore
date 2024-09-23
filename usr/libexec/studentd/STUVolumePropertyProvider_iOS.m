@implementation STUVolumePropertyProvider_iOS

- (void)beginUpdating
{
  MPVolumeController *v3;
  id v4;

  v3 = objc_opt_new(MPVolumeController);
  -[STUVolumePropertyProvider_iOS setVolumeController:](self, "setVolumeController:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUVolumePropertyProvider_iOS volumeController](self, "volumeController"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)endUpdating
{
  -[STUVolumePropertyProvider_iOS setVolumeController:](self, "setVolumeController:", 0);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  -[STUVolumePropertyProvider setVolume:](self, "setVolume:", a3);
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
