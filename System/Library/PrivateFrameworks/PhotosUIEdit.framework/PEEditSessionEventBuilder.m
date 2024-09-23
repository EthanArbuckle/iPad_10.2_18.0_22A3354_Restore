@implementation PEEditSessionEventBuilder

+ (id)allowedAdjustmentIdentifiers
{
  if (allowedAdjustmentIdentifiers_onceToken != -1)
    dispatch_once(&allowedAdjustmentIdentifiers_onceToken, &__block_literal_global_2219);
  return (id)allowedAdjustmentIdentifiers_identifiers;
}

void __57__PEEditSessionEventBuilder_allowedAdjustmentIdentifiers__block_invoke()
{
  void *v0;

  v0 = (void *)allowedAdjustmentIdentifiers_identifiers;
  allowedAdjustmentIdentifiers_identifiers = (uint64_t)&unk_24C624B20;

}

- (id)buildEvent
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  const __CFString *v17;
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
  int64_t v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  unint64_t v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  __CFString *v79;
  _QWORD v80[13];
  _QWORD v81[13];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  const __CFString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[PEEditSessionEventBuilder asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE121B8]);
    -[PEEditSessionEventBuilder asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pixelWidth");
    v7 = objc_msgSend(v4, "pixelHeight") * v6;

  }
  else
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_ERROR, "PEEditAnalyticsEventBuilder building payload with nil asset", buf, 2u);
    }

    v7 = 0;
  }
  -[PEEditSessionEventBuilder adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PEEditSessionEventBuilder adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PEEditSessionEventBuilder shouldReportAdjustmentIdentifierString:](self, "shouldReportAdjustmentIdentifierString:", v10);

    if (v11)
    {
      -[PEEditSessionEventBuilder adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[PEEditSessionEventBuilder adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v83 = v15;
      v84 = 2112;
      v85 = CFSTR("ThirdPartyEditPlugin");
      _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_INFO, "PEEditAnalyticsEventBuilder - adjustmentIdentifierAndVersion (%@) doesn't seem to be part of our allow-list (1st party bundleIDs only), reporting it as \"%@\", buf, 0x16u);

    }
    v13 = CFSTR("ThirdPartyEditPlugin");
  }
  else
  {
    PLPhotoEditGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v12, OS_LOG_TYPE_INFO, "PEEditAnalyticsEventBuilder - nil adjustmentIdentifierAndVersionString", buf, 2u);
    }

    v13 = &stru_24C619BD0;
  }
  v71 = (void *)v13;
LABEL_16:
  v80[0] = CFSTR("assetInputPixelCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v68;
  v80[1] = CFSTR("bundleIdentifier");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bundleIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v66;
  v80[2] = CFSTR("isFirstSinceLaunch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PEEditSessionEventBuilder isFirstSinceLaunch](self, "isFirstSinceLaunch"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v65;
  v80[3] = CFSTR("sessionEndReason");
  v16 = -[PEEditSessionEventBuilder sessionEndReason](self, "sessionEndReason");
  v69 = v4;
  v70 = v3;
  if ((unint64_t)(v16 - 1) > 4)
    v17 = CFSTR("Saved");
  else
    v17 = off_24C619220[v16 - 1];
  v81[3] = v17;
  v80[4] = CFSTR("exitEditDuration");
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder exitEditDuration](self, "exitEditDuration");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v81[4] = v19;
  v80[5] = CFSTR("editSessionDuration");
  v20 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder editSessionDuration](self, "editSessionDuration");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v81[5] = v21;
  v80[6] = CFSTR("resourceLoadingDuration");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder resourceLoadingDuration](self, "resourceLoadingDuration");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v81[6] = v23;
  v80[7] = CFSTR("resourceDownloadDuration");
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder resourceDownloadDuration](self, "resourceDownloadDuration");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v81[7] = v25;
  v80[8] = CFSTR("resourceCheckingDuration");
  v26 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder resourceCheckingDuration](self, "resourceCheckingDuration");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v81[8] = v27;
  v80[9] = CFSTR("enterEditDuration");
  v28 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder enterEditDuration](self, "enterEditDuration");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v81[9] = v29;
  v80[10] = CFSTR("autoCalcDuration");
  v30 = (void *)MEMORY[0x24BDD16E0];
  -[PEEditSessionEventBuilder autoCalcDuration](self, "autoCalcDuration");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v81[10] = v31;
  v81[11] = v71;
  v80[11] = CFSTR("adjustmentIdentifierAndVersion");
  v80[12] = CFSTR("sessionEntryPoint");
  v32 = -[PEEditSessionEventBuilder sessionEntryPoint](self, "sessionEntryPoint");
  v33 = CFSTR("1UPQuickCrop");
  if (!v32)
    v33 = CFSTR("1UPButton");
  v81[12] = v33;
  v34 = (void *)MEMORY[0x24BDBCE70];
  v35 = v33;
  objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v81, v80, 13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "addEntriesFromDictionary:", v36);
  if (!-[PEEditSessionEventBuilder sessionEndReason](self, "sessionEndReason"))
  {
    v37 = -[PEEditSessionEventBuilder saveActionType](self, "saveActionType");
    v38 = CFSTR("Save");
    if (v37 == 2)
      v38 = CFSTR("SaveAsDuplicate");
    if (v37 == 1)
      v38 = CFSTR("SaveAsNewClip");
    v78 = CFSTR("saveActionType");
    v79 = v38;
    v39 = (void *)MEMORY[0x24BDBCE70];
    v40 = v38;
    objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "addEntriesFromDictionary:", v41);
  }
  if (-[PEEditSessionEventBuilder sessionEntryPoint](self, "sessionEntryPoint") == 1)
  {
    -[PEEditSessionEventBuilder quickCropSelectedAspectRatio](self, "quickCropSelectedAspectRatio");
    if (v42 == 0.0
      || (-[PEEditSessionEventBuilder quickCropSelectedAspectRatio](self, "quickCropSelectedAspectRatio"), v43 == 0.0))
    {
      objc_msgSend(v70, "addEntriesFromDictionary:", &unk_24C624B60);
    }
    else
    {
      v57 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v57, "setMinimumFractionDigits:", 1);
      objc_msgSend(v57, "setMaximumFractionDigits:", 2);
      v76 = CFSTR("quickCropSelectedAspectRatio");
      v58 = (void *)MEMORY[0x24BDD16E0];
      -[PEEditSessionEventBuilder quickCropSelectedAspectRatio](self, "quickCropSelectedAspectRatio");
      v60 = v59;
      -[PEEditSessionEventBuilder quickCropSelectedAspectRatio](self, "quickCropSelectedAspectRatio");
      objc_msgSend(v58, "numberWithDouble:", v60 / v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringFromNumber:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v63;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addEntriesFromDictionary:", v64);

    }
  }
  -[PEEditSessionEventBuilder initialComposition](self, "initialComposition");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEEditSessionEventBuilder compositionController](self, "compositionController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "composition");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEAnalyticsUtility diffKeysFromInitialComposition:toFinalComposition:](PEAnalyticsUtility, "diffKeysFromInitialComposition:toFinalComposition:", v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "addEntriesFromDictionary:", v47);
  if (v69)
  {
    +[PEAnalyticsUtility semanticStylesIdentifierForItem:](PEAnalyticsUtility, "semanticStylesIdentifierForItem:", v69);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48 && objc_msgSend(v48, "length"))
    {
      v74 = CFSTR("semantic_style");
      v75 = v49;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addEntriesFromDictionary:", v50);

    }
    +[PEAnalyticsUtility semanticStyleCapturedCastForItem:](PEAnalyticsUtility, "semanticStyleCapturedCastForItem:", v69);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51 && objc_msgSend(v51, "length"))
    {
      v72 = CFSTR("captured_style_cast");
      v73 = v52;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addEntriesFromDictionary:", v53);

    }
  }
  -[PEEditSessionEventBuilder compositionController](self, "compositionController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEAnalyticsUtility analyticPayloadForCompositionController:](PEAnalyticsUtility, "analyticPayloadForCompositionController:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "addEntriesFromDictionary:", v55);
  return v70;
}

- (BOOL)shouldReportAdjustmentIdentifierString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "allowedAdjustmentIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hasPrefix:", v10);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
}

- (double)enterEditDuration
{
  return self->_enterEditDuration;
}

- (void)setEnterEditDuration:(double)a3
{
  self->_enterEditDuration = a3;
}

- (double)resourceCheckingDuration
{
  return self->_resourceCheckingDuration;
}

- (void)setResourceCheckingDuration:(double)a3
{
  self->_resourceCheckingDuration = a3;
}

- (double)resourceDownloadDuration
{
  return self->_resourceDownloadDuration;
}

- (void)setResourceDownloadDuration:(double)a3
{
  self->_resourceDownloadDuration = a3;
}

- (double)resourceLoadingDuration
{
  return self->_resourceLoadingDuration;
}

- (void)setResourceLoadingDuration:(double)a3
{
  self->_resourceLoadingDuration = a3;
}

- (double)autoCalcDuration
{
  return self->_autoCalcDuration;
}

- (void)setAutoCalcDuration:(double)a3
{
  self->_autoCalcDuration = a3;
}

- (double)exitEditDuration
{
  return self->_exitEditDuration;
}

- (void)setExitEditDuration:(double)a3
{
  self->_exitEditDuration = a3;
}

- (double)editSessionDuration
{
  return self->_editSessionDuration;
}

- (void)setEditSessionDuration:(double)a3
{
  self->_editSessionDuration = a3;
}

- (int64_t)sessionEntryPoint
{
  return self->_sessionEntryPoint;
}

- (void)setSessionEntryPoint:(int64_t)a3
{
  self->_sessionEntryPoint = a3;
}

- (unint64_t)saveActionType
{
  return self->_saveActionType;
}

- (void)setSaveActionType:(unint64_t)a3
{
  self->_saveActionType = a3;
}

- (CGSize)quickCropSelectedAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_quickCropSelectedAspectRatio.width;
  height = self->_quickCropSelectedAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setQuickCropSelectedAspectRatio:(CGSize)a3
{
  self->_quickCropSelectedAspectRatio = a3;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setSessionEndReason:(int64_t)a3
{
  self->_sessionEndReason = a3;
}

- (NUComposition)initialComposition
{
  return self->_initialComposition;
}

- (void)setInitialComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_initialComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
