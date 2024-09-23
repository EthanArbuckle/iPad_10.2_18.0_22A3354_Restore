@implementation PXPeopleDetailSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDetailSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPeopleDetailSettings setShowAnnotateButton:](self, "setShowAnnotateButton:", 0);
  -[PXPeopleDetailSettings setUnverifiedPeopleAnnotationMinimumFaceCount:](self, "setUnverifiedPeopleAnnotationMinimumFaceCount:", 5);
}

- (void)setUnverifiedPeopleAnnotationMinimumFaceCount:(unint64_t)a3
{
  self->_unverifiedPeopleAnnotationMinimumFaceCount = a3;
}

- (void)setShowAnnotateButton:(BOOL)a3
{
  self->_showAnnotateButton = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showAnnotateButton
{
  return self->_showAnnotateButton;
}

- (unint64_t)unverifiedPeopleAnnotationMinimumFaceCount
{
  return self->_unverifiedPeopleAnnotationMinimumFaceCount;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_86729 != -1)
    dispatch_once(&sharedInstance_onceToken_86729, &__block_literal_global_86730);
  return (id)sharedInstance_sharedInstance_86731;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Person Details"), &__block_literal_global_5_86701);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Face Crop Details"), &__block_literal_global_9_86703);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("People Donation"), &__block_literal_global_13_86705);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v5;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Pet Details"), &__block_literal_global_17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAnnotateButton);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("People Annotation"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v13 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_unverifiedPeopleAnnotationMinimumFaceCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Unverified Person Minimum Face Count"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 1.0, 50.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_increment:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionFormat:", CFSTR("showAnnotateButton == YES"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v19, CFSTR("People Annotation Settings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83078];
  v25[0] = v8;
  v25[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("Faces Debug UI"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  PXPeopleDetailSettingsViewController *v3;

  v2 = a2;
  v3 = -[PXPeopleDetailSettingsViewController initWithPersonDetectionType:]([PXPeopleDetailSettingsViewController alloc], "initWithPersonDetectionType:", 2);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PXPeopleDonationSettingsViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXPeopleDonationSettingsViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PXPeopleDetailSettingsFaceCropController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXPeopleDetailSettingsFaceCropController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXPeopleDetailSettingsViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXPeopleDetailSettingsViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __40__PXPeopleDetailSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleDetail");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_86731;
  sharedInstance_sharedInstance_86731 = v0;

}

@end
