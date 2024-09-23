@implementation APOdmlSettings

- (APOdmlSettings)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  APOdmlSettings *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)APOdmlSettings;
  v8 = -[APOdmlSettings init](&v15, sel_init);
  if (v8)
  {
    v9 = (id)objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v6, v7);
    objc_msgSend_prewarmModelWithPlacementType_assetManagerType_(APOdmlSettings, v10, a3, a4);
    v13 = (id)objc_msgSend_sharedInstance(APOdmlAllowList, v11, v12);
    v8->_assetManagerType = a4;
    v8->_placementType = a3;
  }
  return v8;
}

+ (void)prewarmModelWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1B69D7CD0;
  v4[3] = &unk_1E6A29740;
  v4[4] = a3;
  v4[5] = a4;
  if (qword_1ED532F30 != -1)
    dispatch_once(&qword_1ED532F30, v4);
}

- (int)deploymentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(self, v5, v6);
  v10 = objc_msgSend_assetManagerType(self, v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend_deploymentID(v12, v13, v14);

  return v7;
}

- (NSString)experimentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(self, v5, v6);
  v10 = objc_msgSend_assetManagerType(self, v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)treatmentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(self, v5, v6);
  v10 = objc_msgSend_assetManagerType(self, v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_treatmentID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)odmlNamespace
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(self, v5, v6);
  v10 = objc_msgSend_assetManagerType(self, v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_odmlNamespace(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (int)odmlVersion
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(self, v5, v6);
  v10 = objc_msgSend_assetManagerType(self, v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend_odmlVersion(v12, v13, v14);

  return v7;
}

- (id)serverRequestDictionary
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend_experimentID(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = (__CFString *)v4;
  else
    v7 = &stru_1E6A29F10;
  objc_msgSend_treatmentID(self, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = (__CFString *)v8;
  else
    v11 = &stru_1E6A29F10;
  v25[0] = CFSTR("supportedODMLVersion");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend_odmlVersion(self, v9, v10);
  objc_msgSend_numberWithInt_(v12, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = v7;
  v25[1] = CFSTR("experimentID");
  v25[2] = CFSTR("treatmentID");
  v26[2] = v11;
  v25[3] = CFSTR("deploymentID");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend_deploymentID(self, v17, v18);
  objc_msgSend_numberWithInt_(v16, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v26[4] = MEMORY[0x1E0C9AAA0];
  v25[4] = CFSTR("inAllocation");
  v25[5] = CFSTR("clientExclusive");
  v26[5] = MEMORY[0x1E0C9AAA0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v26, v25, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (unint64_t)assetManagerType
{
  return self->_assetManagerType;
}

- (unint64_t)placementType
{
  return self->_placementType;
}

@end
