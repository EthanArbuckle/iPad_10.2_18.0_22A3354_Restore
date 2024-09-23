@implementation PUPosterSettings

- (id)parentSettings
{
  return 0;
}

- (PUPosterSettings)initWithDefaultValues
{
  PUPosterSettings *v2;
  PUPosterSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPosterSettings;
  v2 = -[PTSettings initWithDefaultValues](&v5, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
    -[PTSettings _setObservationEnabled:](v2, "_setObservationEnabled:", 1);
  return v3;
}

- (void)createChildren
{
  PUPosterHeadroomSettings *v3;
  PUPosterHeadroomSettings *headroomSettings;

  v3 = -[PTSettings initWithDefaultValues]([PUPosterHeadroomSettings alloc], "initWithDefaultValues");
  headroomSettings = self->_headroomSettings;
  self->_headroomSettings = v3;

}

- (id)reparentedRootSettings
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_photosUICoreSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PUPosterHeadroomSettings)headroomSettings
{
  return self->_headroomSettings;
}

- (void)setHeadroomSettings:(id)a3
{
  objc_storeStrong((id *)&self->_headroomSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headroomSettings, 0);
}

+ (id)sharedInstance
{
  uint64_t v3;
  void *v4;

  os_unfair_lock_lock(MEMORY[0x1E0D7C768]);
  if (!sharedInstance_sharedInstance_99085)
  {
    objc_msgSend(a1, "createSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedInstance_sharedInstance_99085;
    sharedInstance_sharedInstance_99085 = v3;

  }
  os_unfair_lock_unlock(MEMORY[0x1E0D7C768]);
  return (id)sharedInstance_sharedInstance_99085;
}

+ (id)_photosUICoreSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
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
  _QWORD v18[2];
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_headroomSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:childSettingsKeyPath:", CFSTR("Headroom"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v7;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Photos Poster"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
