@implementation PXModelSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXModelSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXModelSettings setPhotoAnalysisGraphInitialGraceDelay:](self, "setPhotoAnalysisGraphInitialGraceDelay:", 0.4);
  -[PXModelSettings setPhotoAnalysisGraphProgressUpdateInterval:](self, "setPhotoAnalysisGraphProgressUpdateInterval:", 0.5);
}

- (void)setPhotoAnalysisGraphProgressUpdateInterval:(double)a3
{
  self->_photoAnalysisGraphProgressUpdateInterval = a3;
}

- (void)setPhotoAnalysisGraphInitialGraceDelay:(double)a3
{
  self->_photoAnalysisGraphInitialGraceDelay = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)photoAnalysisGraphInitialGraceDelay
{
  return self->_photoAnalysisGraphInitialGraceDelay;
}

- (double)photoAnalysisGraphProgressUpdateInterval
{
  return self->_photoAnalysisGraphProgressUpdateInterval;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32501 != -1)
    dispatch_once(&sharedInstance_onceToken_32501, &__block_literal_global_32502);
  return (id)sharedInstance_sharedInstance_32503;
}

void __33__PXModelSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_32503;
  sharedInstance_sharedInstance_32503 = v0;

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Initial Grace Delay"), CFSTR("photoAnalysisGraphInitialGraceDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_increment:", 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Progress Update Interval"), CFSTR("photoAnalysisGraphProgressUpdateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_increment:", 0.1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v9, CFSTR("Photo Analysis Graph"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D83078];
  v16[0] = v10;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", CFSTR("Model"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
