@implementation PHResourceDownloadSettings

- (id)parentSettings
{
  return +[PHRootSettings sharedSettings](PHRootSettings, "sharedSettings");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHResourceDownloadSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PHResourceDownloadSettings setSimulateDownload:](self, "setSimulateDownload:", 0);
  -[PHResourceDownloadSettings setSimulateDownloadFailure:](self, "setSimulateDownloadFailure:", 0);
}

- (BOOL)simulateDownload
{
  return *(&self->super.super.super.__isObservingChildren + 1);
}

- (void)setSimulateDownload:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 1) = a3;
}

- (BOOL)simulateDownloadFailure
{
  return *(&self->super.super.super.__isObservingChildren + 2);
}

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 2) = a3;
}

+ (id)sharedSettings
{
  void *v2;
  void *v3;

  +[PHRootSettings sharedSettings](PHRootSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceDownloadSettings");
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
  void *v16;
  _QWORD v18[2];
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Download"), CFSTR("simulateDownload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Download Failure"), CFSTR("simulateDownloadFailure"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionFormat:", CFSTR("simulateDownload == YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
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
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Resource Download Request"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
