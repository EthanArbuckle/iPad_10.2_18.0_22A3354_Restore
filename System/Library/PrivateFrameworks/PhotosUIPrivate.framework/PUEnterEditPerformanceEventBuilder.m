@implementation PUEnterEditPerformanceEventBuilder

- (id)buildEvent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  __CFString *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  _QWORD v56[15];
  _QWORD v57[17];

  v57[15] = *MEMORY[0x1E0C80C00];
  -[PUEnterEditPerformanceEventBuilder enterEditDuration](self, "enterEditDuration");
  v4 = v3;
  -[PUEnterEditPerformanceEventBuilder resourceCheckingDuration](self, "resourceCheckingDuration");
  v6 = v5;
  -[PUEnterEditPerformanceEventBuilder resourceDownloadDuration](self, "resourceDownloadDuration");
  v8 = v6 + v7;
  -[PUEnterEditPerformanceEventBuilder autoCalcDuration](self, "autoCalcDuration");
  v10 = v8 + v9;
  v56[0] = CFSTR("assetAge");
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "creationDate");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v11;
  objc_msgSend(v12, "timeIntervalSinceDate:", v11);
  if (v13 <= 0.0)
  {
    v14 = CFSTR("future");
  }
  else if (v13 >= 3600.0)
  {
    if (v13 >= 86400.0)
    {
      if (v13 >= 604800.0)
      {
        if (v13 >= 2592000.0)
          v14 = CFSTR("longer");
        else
          v14 = CFSTR("month");
      }
      else
      {
        v14 = CFSTR("week");
      }
    }
    else
    {
      v14 = CFSTR("day");
    }
  }
  else
  {
    v14 = CFSTR("hour");
  }
  v15 = v4 - v10;

  v53 = v14;
  v57[0] = v53;
  v56[1] = CFSTR("assetDuration");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "duration");
  objc_msgSend(v16, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v51;
  v56[2] = CFSTR("assetPixelCount");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v50, "pixelWidth");
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v49, "pixelHeight") * v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v48;
  v56[3] = CFSTR("assetSubtypes");
  v47 = -[PUEnterEditPerformanceEventBuilder isEditingWithRaw](self, "isEditingWithRaw");
  if (v47)
  {
    v19 = CFSTR("raw");
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CD1390];
    -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descriptionForMediaSubtypes:", objc_msgSend(v40, "mediaSubtypes"));
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = (__CFString *)v19;
  v57[3] = v19;
  v56[4] = CFSTR("assetType");
  v21 = (void *)MEMORY[0x1E0CD1390];
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptionForMediaType:", objc_msgSend(v46, "mediaType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v45;
  v56[5] = CFSTR("autoCalcDuration");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder autoCalcDuration](self, "autoCalcDuration");
  objc_msgSend(v22, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v44;
  v56[6] = CFSTR("bundleIdentifier");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bundleIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v42;
  v56[7] = CFSTR("iCPLEnabled");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder asset](self, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isCloudPhotoLibraryEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[7] = v25;
  v56[8] = CFSTR("isFirstSinceBoot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUEnterEditPerformanceEventBuilder isFirstSinceBoot](self, "isFirstSinceBoot"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57[8] = v26;
  v56[9] = CFSTR("isFirstSinceLaunch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUEnterEditPerformanceEventBuilder isFirstSinceLaunch](self, "isFirstSinceLaunch"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[9] = v27;
  v56[10] = CFSTR("neededToDownload");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder resourceDownloadDuration](self, "resourceDownloadDuration");
  objc_msgSend(v28, "numberWithInt:", v29 > 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[10] = v30;
  v56[11] = CFSTR("otherDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[11] = v31;
  v56[12] = CFSTR("resourceCheckingDuration");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder resourceCheckingDuration](self, "resourceCheckingDuration");
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v57[12] = v33;
  v56[13] = CFSTR("resourceDownloadDuration");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder resourceDownloadDuration](self, "resourceDownloadDuration");
  objc_msgSend(v34, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v57[13] = v35;
  v56[14] = CFSTR("totalDuration");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[PUEnterEditPerformanceEventBuilder enterEditDuration](self, "enterEditDuration");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57[14] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {

  }
  return v38;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  self->_firstSinceBoot = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
