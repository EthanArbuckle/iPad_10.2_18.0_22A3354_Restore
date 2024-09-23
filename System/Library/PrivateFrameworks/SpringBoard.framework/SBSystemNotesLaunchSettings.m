@implementation SBSystemNotesLaunchSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesLaunchSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemNotesLaunchSettings setApplicationBundleID:](self, "setApplicationBundleID:", CFSTR("com.apple.mobilenotes"));
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
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83060], "rowWithTitle:valueKeyPath:", CFSTR("BundleID"), CFSTR("applicationBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v14[0] = v4;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Application Launch Settings"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
}

@end
