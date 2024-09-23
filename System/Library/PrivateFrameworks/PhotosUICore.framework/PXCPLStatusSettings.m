@implementation PXCPLStatusSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCPLStatusSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXCPLStatusSettings setCloudQuotaOfferLevel:](self, "setCloudQuotaOfferLevel:", 0);
  -[PXCPLStatusSettings setCloudQuotaOfferIncludeAssetCounts:](self, "setCloudQuotaOfferIncludeAssetCounts:", 0);
  -[PXCPLStatusSettings setResumeOverrideHours:](self, "setResumeOverrideHours:", &unk_1E53ED878);
}

- (void)setResumeOverrideHours:(id)a3
{
  objc_storeStrong((id *)&self->_resumeOverrideHours, a3);
}

- (void)setCloudQuotaOfferLevel:(int64_t)a3
{
  self->_cloudQuotaOfferLevel = a3;
}

- (void)setCloudQuotaOfferIncludeAssetCounts:(BOOL)a3
{
  self->_cloudQuotaOfferIncludeAssetCounts = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)cloudQuotaOfferLevel
{
  return self->_cloudQuotaOfferLevel;
}

- (BOOL)cloudQuotaOfferIncludeAssetCounts
{
  return self->_cloudQuotaOfferIncludeAssetCounts;
}

- (NSNumber)resumeOverrideHours
{
  return self->_resumeOverrideHours;
}

- (NSNumber)shouldHideMockStatusWarning
{
  return self->_shouldHideMockStatusWarning;
}

- (void)setShouldHideMockStatusWarning:(id)a3
{
  objc_storeStrong((id *)&self->_shouldHideMockStatusWarning, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldHideMockStatusWarning, 0);
  objc_storeStrong((id *)&self->_resumeOverrideHours, 0);
}

+ (PXCPLStatusSettings)sharedInstance
{
  if (sharedInstance_onceToken_133264 != -1)
    dispatch_once(&sharedInstance_onceToken_133264, &__block_literal_global_133265);
  return (PXCPLStatusSettings *)(id)sharedInstance_sharedInstance_133266;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[9];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_cloudQuotaOfferLevel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Offer Level"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E53E99F0, &unk_1E53E9A08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_cloudQuotaOfferIncludeAssetCounts);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Offer Include Asset Counts"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v10, CFSTR("Cloud Quota"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; syncing=1; upload=25; progress=50}"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Active Upload"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v61;
  v14 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; upload=25; progress=50; battery-budget=1}"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Paused Upload (Battery)"), v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v59;
  v15 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; upload=25; progress=50; cellular-budget=1}"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:action:", CFSTR("Paused Upload (Cellular)"), v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v57;
  v16 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; upload=25; progress=50; low-data-mode=1}"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:action:", CFSTR("Paused Upload (Low Data)"), v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v55;
  v17 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_resumeOverrideHours);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Resume Override Time"), v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "possibleValues:titles:", &unk_1E53E9A20, &unk_1E53E9A38);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v52;
  v18 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; upload=25; progress=50; cloud-quota=1}"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:action:", CFSTR("iCloud Quota Full"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v20;
  v21 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=1; upload=25; progress=50; cloud-quota=1; offer=1}"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:action:", CFSTR("iCloud Quota Full + Offer"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v23;
  v24 = (void *)MEMORY[0x1E0D83010];
  _SetMockRowAction(CFSTR("{enabled=0}"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:action:", CFSTR("iCPL Disabled"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v26;
  v27 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldHideMockStatusWarning);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Hide Warning Message"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v30, CFSTR("Mocks"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0D83078];
  v33 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_91);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:action:", CFSTR("Set WelcomeViewLastPresentationDate to Now"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v35;
  v36 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_95);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:action:", CFSTR("Clear WelcomeViewLastPresentationDate"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:title:", v39, CFSTR("Cloud Quota Upsell"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObject:", v40);

  v41 = (void *)MEMORY[0x1E0D83078];
  v42 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_100_133203);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:action:", CFSTR("Clear Mocks"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v44;
  v45 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:action:", CFSTR("Restore Default Settings"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sectionWithRows:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObject:", v49);

  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("CPL Status"), v63);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke_3()
{
  void *v0;

  PXSharedUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("CPLStatusProviderMock"));

  return 1;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke_2()
{
  PXPreferencesSetValue(CFSTR("WelcomeViewLastPresentationTimeInterval"), 0);
  return 1;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PXPreferencesSetWelcomeViewLastPresentationDate(v0);

  return 1;
}

void __37__PXCPLStatusSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplStatusSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_133266;
  sharedInstance_sharedInstance_133266 = v0;

}

@end
