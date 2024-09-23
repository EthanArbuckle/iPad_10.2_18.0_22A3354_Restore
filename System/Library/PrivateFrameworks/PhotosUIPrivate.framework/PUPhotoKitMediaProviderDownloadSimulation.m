@implementation PUPhotoKitMediaProviderDownloadSimulation

- (PUPhotoKitMediaProviderDownloadSimulation)init
{
  PUPhotoKitMediaProviderDownloadSimulation *v2;
  void *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoKitMediaProviderDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v6, sel_init);
  if (v2)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_shouldSimulateFailure = objc_msgSend(v3, "simulateLoadingError");
    objc_msgSend(v3, "simulatedAssetContentLoadingDuration");
    v2->_downloadDuration = v4;
    v2->__updateInterval = 0.25;

  }
  return v2;
}

- (void)beginSimulation
{
  -[PUPhotoKitMediaProviderDownloadSimulation _setSimulatedProgress:](self, "_setSimulatedProgress:", 0.0);
  -[PUPhotoKitMediaProviderDownloadSimulation _updateSimulatedDownload](self, "_updateSimulatedDownload");
}

- (void)_updateSimulatedDownload
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoKitMediaProviderDownloadSimulation _simulatedProgress](self, "_simulatedProgress");
  v5 = v4;
  -[PUPhotoKitMediaProviderDownloadSimulation _updateInterval](self, "_updateInterval");
  v7 = v6;
  -[PUPhotoKitMediaProviderDownloadSimulation downloadDuration](self, "downloadDuration");
  v9 = v5 + v7 / v8;
  if (v9 <= 1.0)
    v10 = v9;
  else
    v10 = 1.0;
  -[PUPhotoKitMediaProviderDownloadSimulation _setSimulatedProgress:](self, "_setSimulatedProgress:", v10);
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](self, "updateSimulationWithProgress:", v10);
  v11 = -[PUPhotoKitMediaProviderDownloadSimulation shouldSimulateFailure](self, "shouldSimulateFailure");
  v12 = 0.75;
  if (!v11)
    v12 = 1.0;
  if (v10 >= v12)
  {
    if (-[PUPhotoKitMediaProviderDownloadSimulation shouldSimulateFailure](self, "shouldSimulateFailure"))
    {
      PLUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "One Up: Simulating failure because of debug 1-up settings", v17, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUPhotoKitMediaProviderImageDownloadSimulation"), 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](self, "endSimulationWithError:", v15);
  }
  else
  {
    -[PUPhotoKitMediaProviderDownloadSimulation _updateInterval](self, "_updateInterval");
    v14 = v13;
    v18[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderDownloadSimulation performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", a2, self, v15, v14);
  }

}

- (BOOL)shouldSimulateFailure
{
  return self->_shouldSimulateFailure;
}

- (void)setShouldSimulateFailure:(BOOL)a3
{
  self->_shouldSimulateFailure = a3;
}

- (double)downloadDuration
{
  return self->_downloadDuration;
}

- (void)setDownloadDuration:(double)a3
{
  self->_downloadDuration = a3;
}

- (double)_updateInterval
{
  return self->__updateInterval;
}

- (double)_simulatedProgress
{
  return self->__simulatedProgress;
}

- (void)_setSimulatedProgress:(double)a3
{
  self->__simulatedProgress = a3;
}

@end
