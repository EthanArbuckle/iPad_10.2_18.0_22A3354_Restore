@implementation PHImageManagerSettings

- (id)parentSettings
{
  return +[PHRootSettings sharedSettings](PHRootSettings, "sharedSettings");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHImageManagerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PHImageManagerSettings setAllowImageRequests:](self, "setAllowImageRequests:", 1);
  -[PHImageManagerSettings setAllowCaching:](self, "setAllowCaching:", 1);
}

- (BOOL)allowImageRequests
{
  return *(&self->super.super.super.__isObservingChildren + 1);
}

- (void)setAllowImageRequests:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 1) = a3;
}

- (BOOL)allowCaching
{
  return *(&self->super.super.super.__isObservingChildren + 2);
}

- (void)setAllowCaching:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 2) = a3;
}

+ (id)sharedSettings
{
  void *v2;
  void *v3;

  +[PHRootSettings sharedSettings](PHRootSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageManagerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  _QWORD v17[2];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Image Requests"), CFSTR("allowImageRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Caching"), CFSTR("allowCaching"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83078];
  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v6;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Image Manager"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
