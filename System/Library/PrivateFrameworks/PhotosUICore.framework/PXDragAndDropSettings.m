@implementation PXDragAndDropSettings

+ (PXDragAndDropSettings)sharedInstance
{
  if (sharedInstance_onceToken_126036 != -1)
    dispatch_once(&sharedInstance_onceToken_126036, &__block_literal_global_126037);
  return (PXDragAndDropSettings *)(id)sharedInstance_sharedInstance_126038;
}

- (BOOL)dragOutEnabled
{
  return self->_dragOutEnabled;
}

- (BOOL)springLoadingEnabled
{
  return self->_springLoadingEnabled;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDragAndDropSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXDragAndDropSettings setUseData:](self, "setUseData:", 0);
  -[PXDragAndDropSettings setUseFileProvider:](self, "setUseFileProvider:", 1);
  -[PXDragAndDropSettings setDragOutEnabled:](self, "setDragOutEnabled:", PLIsCamera() ^ 1);
  -[PXDragAndDropSettings setAlwaysAllowDragsWithinUserAlbums:](self, "setAlwaysAllowDragsWithinUserAlbums:", 1);
  -[PXDragAndDropSettings setSpringLoadingEnabled:](self, "setSpringLoadingEnabled:", 1);
  -[PXDragAndDropSettings setReorderCadence:](self, "setReorderCadence:", 2);
  -[PXDragAndDropSettings setDropGestureSpeedLimit:](self, "setDropGestureSpeedLimit:", 100.0);
}

- (void)setUseFileProvider:(BOOL)a3
{
  self->_useFileProvider = a3;
}

- (void)setUseData:(BOOL)a3
{
  self->_useData = a3;
}

- (void)setSpringLoadingEnabled:(BOOL)a3
{
  self->_springLoadingEnabled = a3;
}

- (void)setReorderCadence:(int64_t)a3
{
  self->_reorderCadence = a3;
}

- (void)setDropGestureSpeedLimit:(double)a3
{
  self->_dropGestureSpeedLimit = a3;
}

- (void)setDragOutEnabled:(BOOL)a3
{
  self->_dragOutEnabled = a3;
}

- (void)setAlwaysAllowDragsWithinUserAlbums:(BOOL)a3
{
  self->_alwaysAllowDragsWithinUserAlbums = a3;
}

void __39__PXDragAndDropSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragAndDrop");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_126038;
  sharedInstance_sharedInstance_126038 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)useData
{
  return self->_useData;
}

- (BOOL)useFileProvider
{
  return self->_useFileProvider;
}

- (BOOL)alwaysAllowDragsWithinUserAlbums
{
  return self->_alwaysAllowDragsWithinUserAlbums;
}

- (int64_t)reorderCadence
{
  return self->_reorderCadence;
}

- (double)dropGestureSpeedLimit
{
  return self->_dropGestureSpeedLimit;
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
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use NSData for images"), CFSTR("useData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Drag out enabled"), CFSTR("dragOutEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Spring-loading enabled"), CFSTR("springLoadingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always allow drags in User Albums"), CFSTR("alwaysAllowDragsWithinUserAlbums"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use File Provider Extension"), CFSTR("useFileProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Reorder Cadence"), CFSTR("reorderCadence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E53EAA58, &unk_1E53EAA70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Drop Gesture Speed Limit"), CFSTR("dropGestureSpeedLimit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 1000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_increment:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v20[0] = v12;
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Drag & Drop"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
