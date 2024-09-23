@implementation PUErrorPresentationController

- (PUErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4
{
  id v6;
  id v7;
  PUErrorPresentationController *v8;
  uint64_t v9;
  NSArray *errors;
  uint64_t v11;
  NSArray *assets;
  uint64_t v13;
  NSString *dismissButtonTitle;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUErrorPresentationController;
  v8 = -[PUErrorPresentationController init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    errors = v8->_errors;
    v8->_errors = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    assets = v8->_assets;
    v8->_assets = (NSArray *)v11;

    PULocalizedString(CFSTR("OK"));
    v13 = objc_claimAutoreleasedReturnValue();
    dismissButtonTitle = v8->_dismissButtonTitle;
    v8->_dismissButtonTitle = (NSString *)v13;

  }
  return v8;
}

- (void)setRadarComponentID:(id)a3 name:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *radarComponentID;
  NSString *v12;
  NSString *radarComponentName;
  NSString *v14;
  NSString *radarComponentVersion;

  v8 = a5;
  v9 = a4;
  v10 = (NSString *)objc_msgSend(a3, "copy");
  radarComponentID = self->_radarComponentID;
  self->_radarComponentID = v10;

  v12 = (NSString *)objc_msgSend(v9, "copy");
  radarComponentName = self->_radarComponentName;
  self->_radarComponentName = v12;

  v14 = (NSString *)objc_msgSend(v8, "copy");
  radarComponentVersion = self->_radarComponentVersion;
  self->_radarComponentVersion = v14;

}

- (BOOL)shouldShowFileRadarAction
{
  return 0;
}

- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3
{
  return 1;
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)assetsDescriptionFromAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id obj;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v33 = 1;
    v7 = *(_QWORD *)v39;
    v26 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        if (-[PUErrorPresentationController shouldIncludeAssetInRadarDescription:](self, "shouldIncludeAssetInRadarDescription:", v9))
        {
          objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaType:", objc_msgSend(v9, "mediaType"));
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaSubtypes:", objc_msgSend(v9, "mediaSubtypes"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForPlaybackStyle:", objc_msgSend(v9, "playbackStyle"));
          v12 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB37A0];
          objc_msgSend(v9, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v9, "isGuestAsset");
          v15 = CFSTR("NO");
          if (v14)
            v15 = CFSTR("YES");
          v16 = v15;
          objc_msgSend(v9, "creationDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)v12;
          v32 = (void *)v10;
          objc_msgSend(v30, "stringWithFormat:", CFSTR("#%lu: Asset ID: %@\n\tType: %@ (Subtypes: %@) (Playback Style: %@)\n\tIs Guest/Shared with You: %@\n\tCreation Date: %@"), v33, v13, v10, v11, v12, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUErrorPresentationController additionalRadarDescriptionLinesForAsset:](self, "additionalRadarDescriptionLinesForAsset:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v35 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(v18, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v21);
          }
          ++v33;
          objc_msgSend(v27, "addObject:", v18);

          v6 = v28;
          v7 = v26;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)alertControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUErrorPresentationController errors](self, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!MEMORY[0x1AF429AFC]())
    goto LABEL_8;
  -[PUErrorPresentationController radarComponentID](self, "radarComponentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_7;
  -[PUErrorPresentationController radarComponentName](self, "radarComponentName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

LABEL_7:
    goto LABEL_8;
  }
  -[PUErrorPresentationController radarComponentVersion](self, "radarComponentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = -[PUErrorPresentationController shouldShowFileRadarAction](self, "shouldShowFileRadarAction");
    goto LABEL_9;
  }
LABEL_8:
  v11 = 0;
LABEL_9:
  -[PUErrorPresentationController assets](self, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUErrorPresentationController configureAlertPropertiesFromError:withAssets:willShowFileRadarButton:alertCompletion:](self, "configureAlertPropertiesFromError:withAssets:willShowFileRadarButton:alertCompletion:", v6, v12, v11, v4);

  v13 = (void *)MEMORY[0x1E0DC3450];
  -[PUErrorPresentationController alertTitle](self, "alertTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUErrorPresentationController alertMessage](self, "alertMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3448];
  -[PUErrorPresentationController dismissButtonTitle](self, "dismissButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke;
  v38[3] = &unk_1E58AB6C0;
  v20 = v4;
  v39 = v20;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PUErrorPresentationController additionalAlertActions](self, "additionalAlertActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v16, "addAction:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26++));
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v24);
  }

  if (v11)
  {
    -[PUErrorPresentationController assets](self, "assets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUErrorPresentationController configureRadarPropertiesFromError:withAssets:](self, "configureRadarPropertiesFromError:withAssets:", v6, v27);

    v28 = (void *)MEMORY[0x1E0DC3448];
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_2;
    v31[3] = &unk_1E58A7C98;
    v31[4] = self;
    v32 = v6;
    v33 = v20;
    objc_msgSend(v28, "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v29);

  }
  return v16;
}

- (NSArray)errors
{
  return self->_errors;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)radarComponentID
{
  return self->_radarComponentID;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)additionalAlertActions
{
  return self->_additionalAlertActions;
}

- (void)setAdditionalAlertActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)additionalQuestionsInRadarDescription
{
  return self->_additionalQuestionsInRadarDescription;
}

- (void)setAdditionalQuestionsInRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)assetsListDescription
{
  return self->_assetsListDescription;
}

- (void)setAssetsListDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsListDescription, 0);
  objc_storeStrong((id *)&self->_additionalQuestionsInRadarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_additionalAlertActions, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

uint64_t __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "additionalQuestionsInRadarDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v2, "appendString:", CFSTR("Additional Questions:\n"));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "additionalQuestionsInRadarDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v51 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "appendString:", CFSTR("\n\n"));
  }
  objc_msgSend(*(id *)(a1 + 32), "radarDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "radarDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "assetsListDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetsListDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("%@:\n"), v15);

  }
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v16, "assets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetsDescriptionFromAssets:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v18;
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v18);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\nError:\n%@"), *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v19);

  objc_msgSend(v2, "appendString:", CFSTR("\n\nAlert Shown to User:"));
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "alertTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("\nTitle: \"%@\"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "alertMessage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("\nMessage: \"%@\"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v25);

  v26 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "assets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "assets");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(*(id *)(a1 + 32), "shouldIncludeAssetInRadarDescription:", v34))
        {
          objc_msgSend(MEMORY[0x1E0D7B428], "detailedDebugDescriptionFileForAsset:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v28, "addObject:", v35);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v31);
  }

  v36 = (void *)MEMORY[0x1E0D7B428];
  objc_msgSend(*(id *)(a1 + 32), "radarTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarComponentID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarComponentName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarComponentVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x1E0D7C3A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_3;
  v44[3] = &unk_1E58AA518;
  v45 = *(id *)(a1 + 48);
  LOWORD(v42) = 1;
  objc_msgSend(v36, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v37, v2, CFSTR("Serious Bug"), v38, v39, v40, CFSTR("1448466"), 0, 0, v42, v41, v44);

}

uint64_t __63__PUErrorPresentationController_alertControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)alertActionForNavigatingToDestination:(int64_t)a3 withTitle:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3448];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke;
  v12[3] = &unk_1E589B558;
  v13 = v7;
  v14 = a3;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:style:handler:", a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)isNetworkRelatedError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1D80]) && objc_msgSend(v3, "code") == 3169)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
      v5 = objc_msgSend(v3, "code") == -1009;
    else
      v5 = 0;

  }
  return v5;
}

+ (BOOL)errorIsLowDiskSpaceRelatedCPLError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCPLErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = objc_msgSend(v3, "code") == 1005;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)errorIsAuthenticationRelatedCPLError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCPLErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = objc_msgSend(v3, "code") == 1006;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)assetIsStandardVideo:(id)a3
{
  return objc_msgSend(a3, "playbackStyle") == 4;
}

void __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x1E0D7BAD8];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke_2;
  v3[3] = &unk_1E58AA6A8;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v1, "navigateToDestination:completion:", v2, v3);

}

uint64_t __92__PUErrorPresentationController_alertActionForNavigatingToDestination_withTitle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
