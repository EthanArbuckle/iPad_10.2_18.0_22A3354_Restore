@implementation PUExitEditPerformanceEventBuilder

- (id)buildEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double Seconds;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v42;
  const __CFString *v43;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PUExitEditPerformanceEventBuilder *v73;
  void *v74;
  id obj;
  id v76;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  const __CFString *v88;
  void *v89;
  _QWORD v90[11];
  _QWORD v91[11];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v94 = *MEMORY[0x1E0C80C00];
  v76 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PUExitEditPerformanceEventBuilder compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = v4;
  objc_msgSend(v4, "allAdjustmentTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = self;
  -[PUExitEditPerformanceEventBuilder compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v6, "compositionKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v6, "compositionKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v85 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v6, "adjustmentControllerForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "canBeEnabled") || objc_msgSend(v16, "enabled"))
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(v9, "copy");
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v5;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v81 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adjustment_%@"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "containsObject:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKeyedSubscript:", v24, v23);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v19);
  }

  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "duration");
  v27 = v26;

  -[PUExitEditPerformanceEventBuilder compositionController](v73, "compositionController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trimAdjustmentController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  Seconds = v27;
  if (v29)
  {
    objc_msgSend(v29, "endTime");
    objc_msgSend(v29, "startTime");
    CMTimeSubtract(&time, &lhs, &rhs);
    Seconds = CMTimeGetSeconds(&time);
  }
  v72 = v29;
  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "pixelWidth");
  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "pixelHeight") * v32;

  -[PUExitEditPerformanceEventBuilder compositionController](v73, "compositionController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cropAdjustmentController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v34;
  if (v36)
  {
    objc_msgSend(v36, "cropRect");
    v96 = CGRectStandardize(v95);
    x = v96.origin.x;
    y = v96.origin.y;
    width = v96.size.width;
    height = v96.size.height;
    v42 = CGRectGetWidth(v96);
    v97.origin.x = x;
    v97.origin.y = y;
    v97.size.width = width;
    v97.size.height = height;
    v37 = (unint64_t)(v42 * CGRectGetHeight(v97));
  }
  v71 = v36;
  v90[0] = CFSTR("assetInputDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v70;
  v90[1] = CFSTR("assetInputPixelCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v69;
  v90[2] = CFSTR("assetOutputDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Seconds);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v68;
  v90[3] = CFSTR("assetOutputPixelCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v67;
  v90[4] = CFSTR("assetSubtypes");
  v66 = -[PUExitEditPerformanceEventBuilder isEditingWithRaw](v73, "isEditingWithRaw");
  if (v66)
  {
    v43 = CFSTR("raw");
  }
  else
  {
    v44 = (void *)MEMORY[0x1E0CD1390];
    -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descriptionForMediaSubtypes:", objc_msgSend(v61, "mediaSubtypes"));
    v43 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v62 = (__CFString *)v43;
  v91[4] = v43;
  v90[5] = CFSTR("assetType");
  v45 = (void *)MEMORY[0x1E0CD1390];
  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "descriptionForMediaType:", objc_msgSend(v65, "mediaType"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v64;
  v90[6] = CFSTR("bundleIdentifier");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bundleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v46;
  v90[7] = CFSTR("iCPLEnabled");
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "isCloudPhotoLibraryEnabled"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v49;
  v90[8] = CFSTR("isFirstSinceLaunch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUExitEditPerformanceEventBuilder isFirstSinceLaunch](v73, "isFirstSinceLaunch"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v91[8] = v50;
  v90[9] = CFSTR("reason");
  -[PUExitEditPerformanceEventBuilder sessionEndReason](v73, "sessionEndReason");
  PEPhotoEditSessionEndString();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v91[9] = v51;
  v90[10] = CFSTR("totalDuration");
  v52 = (void *)MEMORY[0x1E0CB37E8];
  -[PUExitEditPerformanceEventBuilder exitEditDuration](v73, "exitEditDuration");
  objc_msgSend(v52, "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v91[10] = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addEntriesFromDictionary:", v54);

  if (!v66)
  {

  }
  v55 = (void *)MEMORY[0x1E0D7CAB8];
  -[PUExitEditPerformanceEventBuilder asset](v73, "asset");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "semanticStylesIdentifierForItem:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57 && objc_msgSend(v57, "length"))
  {
    v88 = CFSTR("photoedit_asset_semantic_style");
    v89 = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addEntriesFromDictionary:", v58);

  }
  v59 = (void *)objc_msgSend(v76, "copy");

  return v59;
}

- (PUEditableAsset)asset
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

- (BOOL)isEditingWithRaw
{
  return self->_editingWithRaw;
}

- (void)setEditingWithRaw:(BOOL)a3
{
  self->_editingWithRaw = a3;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setSessionEndReason:(int64_t)a3
{
  self->_sessionEndReason = a3;
}

- (double)exitEditDuration
{
  return self->_exitEditDuration;
}

- (void)setExitEditDuration:(double)a3
{
  self->_exitEditDuration = a3;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)saveActionType
{
  return self->_saveActionType;
}

- (void)setSaveActionType:(unint64_t)a3
{
  self->_saveActionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
