@implementation SVVideoVolumeObserver

- (SVVideoVolumeObserver)initWithPlaybackCoordinator:(id)a3 audioSession:(id)a4
{
  id v6;
  id v7;
  SVVideoVolumeObserver *v8;
  SVVideoVolumeObserver *v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  SVKeyValueObserver *v14;
  uint64_t v15;
  SVKeyValueObserver *outputVolumeObserver;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SVVideoVolumeObserver;
  v8 = -[SVVideoVolumeObserver init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackCoordinator, v6);
    objc_storeWeak((id *)&v9->_audioSession, v7);
    objc_msgSend(v6, "addPlaybackObserver:", v9);
    objc_msgSend(v7, "outputVolume");
    v11 = v10;
    v12 = objc_msgSend(v6, "muted");
    LODWORD(v13) = v11;
    -[SVVideoVolumeObserver updateWithVolume:muted:](v9, "updateWithVolume:muted:", v12, v13);
    objc_initWeak(&location, v9);
    v14 = [SVKeyValueObserver alloc];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __66__SVVideoVolumeObserver_initWithPlaybackCoordinator_audioSession___block_invoke;
    v18[3] = &unk_24DBC23B8;
    objc_copyWeak(&v19, &location);
    v15 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v14, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("outputVolume"), v7, 1, v18);
    outputVolumeObserver = v9->_outputVolumeObserver;
    v9->_outputVolumeObserver = (SVKeyValueObserver *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__SVVideoVolumeObserver_initWithPlaybackCoordinator_audioSession___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "audioSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outputVolume");
  objc_msgSend(v2, "volumeChanged:");

}

- (void)playbackCoordinatorMuteStateChanged:(id)a3
{
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = 0;
  if ((objc_msgSend(v9, "muted") & 1) == 0)
  {
    -[SVVideoVolumeObserver audioSession](self, "audioSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputVolume");
    v4 = v6;

  }
  v7 = objc_msgSend(v9, "muted");
  LODWORD(v8) = v4;
  -[SVVideoVolumeObserver updateWithVolume:muted:](self, "updateWithVolume:muted:", v7, v8);

}

- (void)volumeChanged:(float)a3
{
  -[SVVideoVolumeObserver updateWithVolume:muted:](self, "updateWithVolume:muted:", a3 < 0.00000011921);
}

- (void)updateWithVolume:(float)a3 muted:(BOOL)a4
{
  int v4;
  int muted;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void (**v10)(id, SVVideoVolumeObserver *);

  v4 = a4;
  muted = self->_muted;
  if (self->_volume == a3)
  {
    if (muted == a4)
      return;
    self->_muted = a4;
    self->_volume = a3;
    goto LABEL_8;
  }
  self->_muted = a4;
  self->_volume = a3;
  -[SVVideoVolumeObserver volumeChangeBlock](self, "volumeChangeBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SVVideoVolumeObserver volumeChangeBlock](self, "volumeChangeBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, SVVideoVolumeObserver *))v8)[2](v8, self);

  }
  if (muted != v4)
  {
LABEL_8:
    -[SVVideoVolumeObserver muteStateChangeBlock](self, "muteStateChangeBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SVVideoVolumeObserver muteStateChangeBlock](self, "muteStateChangeBlock");
      v10 = (void (**)(id, SVVideoVolumeObserver *))objc_claimAutoreleasedReturnValue();
      v10[2](v10, self);

    }
  }
}

- (BOOL)muted
{
  return self->_muted;
}

- (float)volume
{
  return self->_volume;
}

- (id)volumeChangeBlock
{
  return self->_volumeChangeBlock;
}

- (void)onVolumeChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)muteStateChangeBlock
{
  return self->_muteStateChangeBlock;
}

- (void)onMuteStateChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SVPlaybackCoordinator)playbackCoordinator
{
  return (SVPlaybackCoordinator *)objc_loadWeakRetained((id *)&self->_playbackCoordinator);
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)objc_loadWeakRetained((id *)&self->_audioSession);
}

- (SVKeyValueObserver)outputVolumeObserver
{
  return self->_outputVolumeObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputVolumeObserver, 0);
  objc_destroyWeak((id *)&self->_audioSession);
  objc_destroyWeak((id *)&self->_playbackCoordinator);
  objc_storeStrong(&self->_muteStateChangeBlock, 0);
  objc_storeStrong(&self->_volumeChangeBlock, 0);
}

@end
