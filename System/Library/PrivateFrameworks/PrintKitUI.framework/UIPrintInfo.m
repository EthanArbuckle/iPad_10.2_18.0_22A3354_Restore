@implementation UIPrintInfo

+ (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithDictionary:", 0);
}

+ (UIPrintInfo)printInfoWithDictionary:(NSDictionary *)dictionary
{
  NSDictionary *v4;
  void *v5;

  v4 = dictionary;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDictionary:", v4);

  return (UIPrintInfo *)v5;
}

- (UIPrintInfo)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIPrintInfo init] not allowed"));

  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  UIPrintInfo *v5;
  NSString *v6;
  NSString *printerID;
  void *v8;
  NSString *v9;
  NSString *jobName;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  int64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  int64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  int64_t v41;
  int64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  int64_t v57;
  int64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  int64_t v65;
  NSString *v66;
  NSString *finishingTemplate;
  NSString *v68;
  NSString *outputBin;
  NSString *v70;
  NSString *pageStackOrder;
  NSString *v72;
  NSString *inputSlot;
  NSString *v74;
  NSString *mediaType;
  uint64_t v76;
  NSDictionary *jobPreset;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  NSArray *v83;
  NSArray *nUpRowsColumns;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  int64_t v89;
  int64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  int64_t v97;
  char v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  float v106;
  objc_super v108;
  _QWORD v109[3];

  v109[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)UIPrintInfo;
  v5 = -[UIPrintInfo init](&v108, sel_init);
  if (!v5)
    goto LABEL_82;
  v6 = (NSString *)CopyDictionaryString(v4, CFSTR("UIPrintInfoPrinterIDKey"), 0);
  printerID = v5->_printerID;
  v5->_printerID = v6;

  GetDefaultJobName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)CopyDictionaryString(v4, CFSTR("UIPrintInfoJobNameKey"), v8);
  jobName = v5->_jobName;
  v5->_jobName = v9;

  v11 = v4;
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "objectForKey:", CFSTR("UIPrintInfoOutputTypeKey")),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    v15 = (int)objc_msgSend(v13, "intValue");

  }
  else
  {
    v15 = 0;
  }

  v5->_outputType = v15;
  v16 = v12;
  v17 = v16;
  if (v12
    && (objc_msgSend(v16, "objectForKey:", CFSTR("UIPrintInfoOrientationKey")),
        (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = v18;
    v20 = (int)objc_msgSend(v18, "intValue");

  }
  else
  {
    v20 = 0;
  }

  v5->_orientation = v20;
  v21 = (v5->_outputType & 0xFFFFFFFFFFFFFFFDLL) != 1;
  v22 = v17;
  v23 = v22;
  if (v12)
  {
    objc_msgSend(v22, "objectForKey:", CFSTR("UIPrintInfoDuplexKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = v24;
      v21 = (int)objc_msgSend(v24, "intValue");

    }
    v5->_duplex = v21;
    objc_msgSend(v23, "objectForKey:", CFSTR("UIPrintInfoCopiesKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = v26;
      v28 = (int)objc_msgSend(v26, "intValue");

      goto LABEL_17;
    }
  }
  else
  {
    v5->_duplex = v21;
  }
  v28 = 1;
LABEL_17:

  v5->_copies = v28;
  v29 = v23;
  v30 = v29;
  if (v12)
  {
    objc_msgSend(v29, "objectForKey:", CFSTR("UIPrintInfoScaleUpKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = v31;
      v33 = objc_msgSend(v31, "BOOLValue");

    }
    else
    {
      v33 = 0;
    }

    v5->_scaleUp = v33;
    objc_msgSend(v30, "objectForKey:", CFSTR("UIPrintInfoStapleKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = v35;
      v34 = (int)objc_msgSend(v35, "intValue");

    }
    else
    {
      v34 = 0;
    }
  }
  else
  {
    v34 = 0;
    v5->_scaleUp = 0;
  }

  v5->_staple = v34;
  v37 = v30;
  v38 = v37;
  if (v12)
  {
    objc_msgSend(v37, "objectForKey:", CFSTR("UIPrintInfoPunchKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = v39;
      v41 = (int)objc_msgSend(v39, "intValue");

    }
    else
    {
      v41 = 0;
    }

    v5->_punch = v41;
    objc_msgSend(v38, "objectForKey:", CFSTR("UIPrintInfoFoldKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = v43;
      v42 = (int)objc_msgSend(v43, "intValue");

    }
    else
    {
      v42 = 0;
    }
  }
  else
  {
    v42 = 0;
    v5->_punch = 0;
  }

  v5->_fold = v42;
  v45 = v38;
  v46 = v45;
  if (!v12)
  {
    v5->_imagePDFAnnotations = 0;
LABEL_40:
    v52 = 4;
    goto LABEL_41;
  }
  objc_msgSend(v45, "objectForKey:", CFSTR("UIPrintInfoImageAnnotationsKey"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = v47;
    v49 = objc_msgSend(v47, "BOOLValue");

  }
  else
  {
    v49 = 0;
  }

  v5->_imagePDFAnnotations = v49;
  objc_msgSend(v46, "objectForKey:", CFSTR("UIPrintInfoQualityKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
    goto LABEL_40;
  v51 = v50;
  v52 = (int)objc_msgSend(v50, "intValue");

LABEL_41:
  v5->_quality = v52;
  v53 = v46;
  v54 = v53;
  if (v12)
  {
    objc_msgSend(v53, "objectForKey:", CFSTR("UIPrintInfoCoatKey"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      v56 = v55;
      v57 = (int)objc_msgSend(v55, "intValue");

    }
    else
    {
      v57 = 0;
    }

    v5->_coat = v57;
    objc_msgSend(v54, "objectForKey:", CFSTR("UIPrintInfoLaminateKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = v59;
      v58 = (int)objc_msgSend(v59, "intValue");

    }
    else
    {
      v58 = 0;
    }
  }
  else
  {
    v58 = 0;
    v5->_coat = 0;
  }

  v5->_laminate = v58;
  v61 = v54;
  v62 = v61;
  if (v12
    && (objc_msgSend(v61, "objectForKey:", CFSTR("UIPrintInfoTrimKey")),
        (v63 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v64 = v63;
    v65 = (int)objc_msgSend(v63, "intValue");

  }
  else
  {
    v65 = 0;
  }

  v5->_trim = v65;
  v66 = (NSString *)CopyDictionaryString(v62, CFSTR("UIPrintInfoFinishingTemplateKey"), 0);
  finishingTemplate = v5->_finishingTemplate;
  v5->_finishingTemplate = v66;

  v68 = (NSString *)CopyDictionaryString(v62, CFSTR("UIPrintInfoOutputBinKey"), 0);
  outputBin = v5->_outputBin;
  v5->_outputBin = v68;

  v70 = (NSString *)CopyDictionaryString(v62, CFSTR("UIPrintInfoPageStackOrderKey"), 0);
  pageStackOrder = v5->_pageStackOrder;
  v5->_pageStackOrder = v70;

  v72 = (NSString *)CopyDictionaryString(v62, CFSTR("UIPrintInfoInputSlotKey"), 0);
  inputSlot = v5->_inputSlot;
  v5->_inputSlot = v72;

  v74 = (NSString *)CopyDictionaryString(v62, CFSTR("UIPrintInfoMediaTypeKey"), 0);
  mediaType = v5->_mediaType;
  v5->_mediaType = v74;

  if (v12)
  {
    objc_msgSend(v62, "objectForKey:", CFSTR("UIPrintInfoJobPresetKey"));
    v76 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v76 = 0;
  }
  jobPreset = v5->_jobPreset;
  v5->_jobPreset = (NSDictionary *)v76;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v78;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v80 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v62, "objectForKey:", CFSTR("UIPrintInfoNUpRowsColumnsKey"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v81 = 0;
  }
  if (v81)
    v82 = v81;
  else
    v82 = v80;
  v83 = v82;

  nUpRowsColumns = v5->_nUpRowsColumns;
  v5->_nUpRowsColumns = v83;

  v85 = v62;
  v86 = v85;
  if (v12)
  {
    objc_msgSend(v85, "objectForKey:", CFSTR("UIPrintInfoLayoutDirectionKey"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      v88 = v87;
      v89 = (int)objc_msgSend(v87, "intValue");

    }
    else
    {
      v89 = 0;
    }

    v5->_nUpLayoutDirection = v89;
    objc_msgSend(v86, "objectForKey:", CFSTR("UIPrintInfoBorderTypeKey"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      v92 = v91;
      v90 = (int)objc_msgSend(v91, "intValue");

    }
    else
    {
      v90 = 0;
    }
  }
  else
  {
    v90 = 0;
    v5->_nUpLayoutDirection = 0;
  }

  v5->_borderType = v90;
  v93 = v86;
  v94 = v93;
  if (v12)
  {
    objc_msgSend(v93, "objectForKey:", CFSTR("UIPrintInfoBookletStyleKey"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      v96 = v95;
      v97 = (int)objc_msgSend(v95, "intValue");

    }
    else
    {
      v97 = 0;
    }

    v5->_bookletStyle = v97;
    objc_msgSend(v94, "objectForKey:", CFSTR("UIPrintInfoFipHorizontalKey"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      v100 = v99;
      v98 = objc_msgSend(v99, "BOOLValue");

    }
    else
    {
      v98 = 0;
    }
  }
  else
  {
    v98 = 0;
    v5->_bookletStyle = 0;
  }

  v5->_flipHorizontal = v98;
  v101 = v94;
  v102 = v101;
  v103 = 1.0;
  if (v12)
  {
    objc_msgSend(v101, "objectForKey:", CFSTR("UIPrintInfoScalingFactorKey"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      v105 = v104;
      objc_msgSend(v104, "floatValue");
      v103 = v106;

    }
  }

  v5->_scalingFactor = v103;
LABEL_82:

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *printerID;
  NSString *jobName;
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
  NSString *finishingTemplate;
  NSString *outputBin;
  NSString *pageStackOrder;
  NSString *inputSlot;
  NSString *mediaType;
  NSDictionary *jobPreset;
  NSArray *nUpRowsColumns;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (self->_outputType & 0xFFFFFFFFFFFFFFFDLL) != 1;
  printerID = self->_printerID;
  if (printerID)
    objc_msgSend(v3, "setObject:forKey:", printerID, CFSTR("UIPrintInfoPrinterIDKey"));
  jobName = self->_jobName;
  if (jobName)
    objc_msgSend(v4, "setObject:forKey:", jobName, CFSTR("UIPrintInfoJobNameKey"));
  if (self->_outputType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("UIPrintInfoOutputTypeKey"));

  }
  if (self->_orientation)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("UIPrintInfoOrientationKey"));

  }
  if (self->_duplex != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("UIPrintInfoDuplexKey"));

  }
  if (self->_copies != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("UIPrintInfoCopiesKey"));

  }
  if (self->_scaleUp)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("UIPrintInfoScaleUpKey"));

  }
  if (self->_staple)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("UIPrintInfoStapleKey"));

  }
  if (self->_punch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("UIPrintInfoPunchKey"));

  }
  if (self->_fold)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("UIPrintInfoFoldKey"));

  }
  if (self->_imagePDFAnnotations)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("UIPrintInfoImageAnnotationsKey"));

  }
  if (self->_quality != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("UIPrintInfoQualityKey"));

  }
  if (self->_coat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("UIPrintInfoCoatKey"));

  }
  if (self->_laminate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("UIPrintInfoLaminateKey"));

  }
  if (self->_trim)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("UIPrintInfoTrimKey"));

  }
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate)
    objc_msgSend(v4, "setObject:forKey:", finishingTemplate, CFSTR("UIPrintInfoFinishingTemplateKey"));
  outputBin = self->_outputBin;
  if (outputBin)
    objc_msgSend(v4, "setObject:forKey:", outputBin, CFSTR("UIPrintInfoOutputBinKey"));
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder)
    objc_msgSend(v4, "setObject:forKey:", pageStackOrder, CFSTR("UIPrintInfoPageStackOrderKey"));
  inputSlot = self->_inputSlot;
  if (inputSlot)
    objc_msgSend(v4, "setObject:forKey:", inputSlot, CFSTR("UIPrintInfoInputSlotKey"));
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v4, "setObject:forKey:", mediaType, CFSTR("UIPrintInfoMediaTypeKey"));
  jobPreset = self->_jobPreset;
  if (jobPreset)
    objc_msgSend(v4, "setObject:forKey:", jobPreset, CFSTR("UIPrintInfoJobPresetKey"));
  nUpRowsColumns = self->_nUpRowsColumns;
  if (nUpRowsColumns)
    objc_msgSend(v4, "setObject:forKey:", nUpRowsColumns, CFSTR("UIPrintInfoNUpRowsColumnsKey"));
  if (self->_nUpLayoutDirection)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("UIPrintInfoLayoutDirectionKey"));

  }
  if (self->_borderType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("UIPrintInfoBorderTypeKey"));

  }
  if (self->_bookletStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("UIPrintInfoBookletStyleKey"));

  }
  if (self->_flipHorizontal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("UIPrintInfoFipHorizontalKey"));

  }
  if (self->_scalingFactor != 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("UIPrintInfoScalingFactorKey"));

  }
  return (NSDictionary *)v4;
}

- (UIPrintInfo)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  NSString *v5;
  NSString *printerID;
  NSString *v7;
  NSString *jobName;
  NSString *v9;
  NSString *finishingTemplate;
  NSString *v11;
  NSString *outputBin;
  NSString *v13;
  NSString *pageStackOrder;
  NSString *v15;
  NSString *inputSlot;
  NSString *v17;
  NSString *mediaType;
  NSDictionary *v19;
  NSDictionary *jobPreset;
  NSArray *v21;
  NSArray *nUpRowsColumns;
  float v23;
  float v24;

  v4 = coder;
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoPrinterIDKey"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  printerID = self->_printerID;
  self->_printerID = v5;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoJobNameKey"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  jobName = self->_jobName;
  self->_jobName = v7;

  self->_outputType = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoOutputTypeKey"));
  self->_orientation = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoOrientationKey"));
  self->_duplex = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoDuplexKey"));
  self->_copies = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoCopiesKey"));
  self->_scaleUp = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIPrintInfoScaleUpKey"));
  self->_staple = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoStapleKey"));
  self->_punch = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoPunchKey"));
  self->_fold = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoFoldKey"));
  self->_imagePDFAnnotations = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIPrintInfoImageAnnotationsKey"));
  self->_quality = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoQualityKey"));
  self->_coat = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoCoatKey"));
  self->_laminate = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoLaminateKey"));
  self->_trim = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("UIPrintInfoTrimKey"));
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoFinishingTemplateKey"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  finishingTemplate = self->_finishingTemplate;
  self->_finishingTemplate = v9;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoOutputBinKey"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  outputBin = self->_outputBin;
  self->_outputBin = v11;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoPageStackOrderKey"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  pageStackOrder = self->_pageStackOrder;
  self->_pageStackOrder = v13;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoInputSlotKey"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  inputSlot = self->_inputSlot;
  self->_inputSlot = v15;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoMediaTypeKey"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  mediaType = self->_mediaType;
  self->_mediaType = v17;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoJobPresetKey"));
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  jobPreset = self->_jobPreset;
  self->_jobPreset = v19;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrintInfoNUpRowsColumnsKey"));
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  nUpRowsColumns = self->_nUpRowsColumns;
  self->_nUpRowsColumns = v21;

  self->_nUpLayoutDirection = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIPrintInfoLayoutDirectionKey"));
  self->_borderType = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIPrintInfoBorderTypeKey"));
  self->_bookletStyle = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIPrintInfoBookletStyleKey"));
  self->_flipHorizontal = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIPrintInfoFipHorizontalKey"));
  -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("UIPrintInfoScalingFactorKey"));
  v24 = v23;

  self->_scalingFactor = v24;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *printerID;
  NSString *jobName;
  int64_t outputType;
  int64_t orientation;
  int64_t duplex;
  int64_t copies;
  int64_t staple;
  int64_t punch;
  int64_t fold;
  int64_t quality;
  int64_t coat;
  int64_t laminate;
  int64_t trim;
  NSString *finishingTemplate;
  NSString *outputBin;
  NSString *pageStackOrder;
  NSString *inputSlot;
  NSString *mediaType;
  NSDictionary *jobPreset;
  NSArray *nUpRowsColumns;
  int64_t nUpLayoutDirection;
  int64_t borderType;
  int64_t bookletStyle;
  double scalingFactor;
  id v29;

  v4 = a3;
  printerID = self->_printerID;
  v29 = v4;
  if (printerID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", printerID, CFSTR("UIPrintInfoPrinterIDKey"));
    v4 = v29;
  }
  jobName = self->_jobName;
  if (jobName)
  {
    objc_msgSend(v29, "encodeObject:forKey:", jobName, CFSTR("UIPrintInfoJobNameKey"));
    v4 = v29;
  }
  outputType = self->_outputType;
  if (outputType)
  {
    objc_msgSend(v29, "encodeInt:forKey:", outputType, CFSTR("UIPrintInfoOutputTypeKey"));
    v4 = v29;
  }
  orientation = self->_orientation;
  if (orientation)
  {
    objc_msgSend(v29, "encodeInt:forKey:", orientation, CFSTR("UIPrintInfoOrientationKey"));
    v4 = v29;
  }
  duplex = self->_duplex;
  if (duplex)
  {
    objc_msgSend(v29, "encodeInt:forKey:", duplex, CFSTR("UIPrintInfoDuplexKey"));
    v4 = v29;
  }
  copies = self->_copies;
  if (copies)
  {
    objc_msgSend(v29, "encodeInt:forKey:", copies, CFSTR("UIPrintInfoCopiesKey"));
    v4 = v29;
  }
  if (self->_scaleUp)
  {
    objc_msgSend(v29, "encodeBool:forKey:", 1, CFSTR("UIPrintInfoScaleUpKey"));
    v4 = v29;
  }
  staple = self->_staple;
  if (staple)
  {
    objc_msgSend(v29, "encodeInt:forKey:", staple, CFSTR("UIPrintInfoStapleKey"));
    v4 = v29;
  }
  punch = self->_punch;
  if (punch)
  {
    objc_msgSend(v29, "encodeInt:forKey:", punch, CFSTR("UIPrintInfoPunchKey"));
    v4 = v29;
  }
  fold = self->_fold;
  if (fold)
  {
    objc_msgSend(v29, "encodeInt:forKey:", fold, CFSTR("UIPrintInfoFoldKey"));
    v4 = v29;
  }
  if (self->_imagePDFAnnotations)
  {
    objc_msgSend(v29, "encodeBool:forKey:", 1, CFSTR("UIPrintInfoImageAnnotationsKey"));
    v4 = v29;
  }
  quality = self->_quality;
  if (quality != 4)
  {
    objc_msgSend(v29, "encodeInt:forKey:", quality, CFSTR("UIPrintInfoQualityKey"));
    v4 = v29;
  }
  coat = self->_coat;
  if (coat)
  {
    objc_msgSend(v29, "encodeInt:forKey:", coat, CFSTR("UIPrintInfoCoatKey"));
    v4 = v29;
  }
  laminate = self->_laminate;
  if (laminate)
  {
    objc_msgSend(v29, "encodeInt:forKey:", laminate, CFSTR("UIPrintInfoLaminateKey"));
    v4 = v29;
  }
  trim = self->_trim;
  if (trim)
  {
    objc_msgSend(v29, "encodeInt:forKey:", trim, CFSTR("UIPrintInfoTrimKey"));
    v4 = v29;
  }
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate)
  {
    objc_msgSend(v29, "encodeObject:forKey:", finishingTemplate, CFSTR("UIPrintInfoFinishingTemplateKey"));
    v4 = v29;
  }
  outputBin = self->_outputBin;
  if (outputBin)
  {
    objc_msgSend(v29, "encodeObject:forKey:", outputBin, CFSTR("UIPrintInfoOutputBinKey"));
    v4 = v29;
  }
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder)
  {
    objc_msgSend(v29, "encodeObject:forKey:", pageStackOrder, CFSTR("UIPrintInfoPageStackOrderKey"));
    v4 = v29;
  }
  inputSlot = self->_inputSlot;
  if (inputSlot)
  {
    objc_msgSend(v29, "encodeObject:forKey:", inputSlot, CFSTR("UIPrintInfoInputSlotKey"));
    v4 = v29;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    objc_msgSend(v29, "encodeObject:forKey:", mediaType, CFSTR("UIPrintInfoMediaTypeKey"));
    v4 = v29;
  }
  jobPreset = self->_jobPreset;
  if (jobPreset)
  {
    objc_msgSend(v29, "encodeObject:forKey:", jobPreset, CFSTR("UIPrintInfoJobPresetKey"));
    v4 = v29;
  }
  nUpRowsColumns = self->_nUpRowsColumns;
  if (nUpRowsColumns)
  {
    objc_msgSend(v29, "encodeObject:forKey:", nUpRowsColumns, CFSTR("UIPrintInfoNUpRowsColumnsKey"));
    v4 = v29;
  }
  nUpLayoutDirection = self->_nUpLayoutDirection;
  if (nUpLayoutDirection)
  {
    objc_msgSend(v29, "encodeInteger:forKey:", nUpLayoutDirection, CFSTR("UIPrintInfoLayoutDirectionKey"));
    v4 = v29;
  }
  borderType = self->_borderType;
  if (borderType)
  {
    objc_msgSend(v29, "encodeInteger:forKey:", borderType, CFSTR("UIPrintInfoBorderTypeKey"));
    v4 = v29;
  }
  bookletStyle = self->_bookletStyle;
  if (bookletStyle)
  {
    objc_msgSend(v29, "encodeInteger:forKey:", bookletStyle, CFSTR("UIPrintInfoBookletStyleKey"));
    v4 = v29;
  }
  if (self->_flipHorizontal)
  {
    objc_msgSend(v29, "encodeBool:forKey:", 1, CFSTR("UIPrintInfoFipHorizontalKey"));
    v4 = v29;
  }
  scalingFactor = self->_scalingFactor;
  if (scalingFactor != 1.0)
  {
    *(float *)&scalingFactor = scalingFactor;
    objc_msgSend(v29, "encodeFloat:forKey:", CFSTR("UIPrintInfoScalingFactorKey"), scalingFactor);
    v4 = v29;
  }

}

- (void)updateWithDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__UIPrintInfo_updateWithDictionary___block_invoke;
  v3[3] = &unk_1E9D97530;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __36__UIPrintInfo_updateWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoOutputTypeKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setOutputType:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoOrientationKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setOrientation:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoDuplexKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDuplex:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoCopiesKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCopies:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoScaleUpKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setScaleUp:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoImageAnnotationsKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setImagePDFAnnotations:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoQualityKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setQuality:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoStapleKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setStaple:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoPunchKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPunch:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoFoldKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFold:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoCoatKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCoat:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoLaminateKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLaminate:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoTrimKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTrim:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoFinishingTemplateKey")))
  {
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFinishingTemplate:", v6);
LABEL_39:

    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoOutputBinKey")))
  {
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOutputBin:", v6);
    goto LABEL_39;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoPageStackOrderKey")))
  {
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPageStackOrder:", v6);
    goto LABEL_39;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoInputSlotKey")))
  {
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInputSlot:", v6);
    goto LABEL_39;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoMediaTypeKey")))
  {
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMediaType:", v6);
    goto LABEL_39;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoJobPresetKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setJobPreset:", v5);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "jobPreset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyPreset:", v6);
    goto LABEL_39;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoNUpRowsColumnsKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNUpRowsColumns:", v5);
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoLayoutDirectionKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNUpLayoutDirection:", objc_msgSend(v5, "integerValue"));
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoBorderTypeKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBorderType:", objc_msgSend(v5, "integerValue"));
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoBookletStyleKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBookletStyle:", objc_msgSend(v5, "integerValue"));
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoFipHorizontalKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFlipHorizontal:", objc_msgSend(v5, "BOOLValue"));
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("UIPrintInfoScalingFactorKey")))
  {
    objc_msgSend(v5, "floatValue");
    objc_msgSend(*(id *)(a1 + 32), "setScalingFactor:", v8);
  }
LABEL_40:

}

- (void)resetToDefaultSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[UIPrintInfo setJobPreset:](self, "setJobPreset:", 0);
  -[UIPrintInfo setAppliedPresetsList:](self, "setAppliedPresetsList:", 0);
  -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", objc_msgSend(v4, "finishingOption"));
  objc_msgSend(v4, "finishingTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setFinishingTemplate:](self, "setFinishingTemplate:", v5);

  -[UIPrintInfo setStaple:](self, "setStaple:", objc_msgSend(v4, "staple"));
  -[UIPrintInfo setPunch:](self, "setPunch:", objc_msgSend(v4, "punch"));
  -[UIPrintInfo setFold:](self, "setFold:", objc_msgSend(v4, "fold"));
  -[UIPrintInfo setLaminate:](self, "setLaminate:", objc_msgSend(v4, "laminate"));
  -[UIPrintInfo setCoat:](self, "setCoat:", objc_msgSend(v4, "coat"));
  -[UIPrintInfo setTrim:](self, "setTrim:", objc_msgSend(v4, "trim"));
  objc_msgSend(v4, "pageStackOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPageStackOrder:](self, "setPageStackOrder:", v6);

  objc_msgSend(v4, "outputBin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintInfo setOutputBin:](self, "setOutputBin:", v7);
  -[UIPrintInfo currentPrinter](self, "currentPrinter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_internalPrinter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo _updateWithPrinter:](self, "_updateWithPrinter:", v8);

}

- (void)applyPreset:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D80B48]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v44)
  {
    v4 = *(_QWORD *)v51;
    v5 = *MEMORY[0x1E0D80A98];
    v45 = *MEMORY[0x1E0D80BA0];
    v41 = *MEMORY[0x1E0D80BF0];
    v6 = *MEMORY[0x1E0D80B28];
    v7 = *MEMORY[0x1E0D80A80];
    v32 = *MEMORY[0x1E0D80B40];
    v8 = *MEMORY[0x1E0D80B38];
    v36 = *MEMORY[0x1E0D80B98];
    v34 = *MEMORY[0x1E0D80B90];
    v39 = *MEMORY[0x1E0D80AA0];
    v35 = *MEMORY[0x1E0D80AB0];
    v37 = *(_QWORD *)v51;
    v38 = *MEMORY[0x1E0D80AA8];
    v42 = *MEMORY[0x1E0D80B28];
    v33 = *MEMORY[0x1E0D80A98];
    v31 = *MEMORY[0x1E0D80B38];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v4)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isEqualToString:", v5))
        {
          objc_msgSend(v43, "objectForKey:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (((objc_msgSend(v11, "isEqualToString:", v39) & 1) != 0
             || objc_msgSend(v11, "isEqualToString:", v35))
            && -[UIPrintInfo duplex](self, "duplex") == UIPrintInfoDuplexNone)
          {
            v12 = 1;
LABEL_21:
            -[UIPrintInfo setDuplex:](self, "setDuplex:", v12);
          }
          else if (objc_msgSend(v11, "isEqualToString:", v38))
          {
            v12 = 0;
            goto LABEL_21;
          }
LABEL_57:

          v6 = v42;
          goto LABEL_58;
        }
        if ((objc_msgSend(v10, "isEqualToString:", v45) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", v41))
        {
          if (objc_msgSend(v10, "isEqualToString:", v41))
          {
            objc_msgSend(v43, "objectForKey:", v41);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "integerValue");

            v6 = v42;
            v15 = v14;
            v4 = v37;
            -[UIPrintInfo setQuality:](self, "setQuality:", v15);
          }
          if (objc_msgSend(v10, "isEqualToString:", v45))
          {
            objc_msgSend(v43, "objectForKey:", v45);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "containsString:", v36) && -[UIPrintInfo quality](self, "quality") == 4)
            {
              v16 = 2;
            }
            else if (objc_msgSend(v11, "isEqualToString:", v34)
                   && -[UIPrintInfo quality](self, "quality") == 5)
            {
              v16 = 1;
            }
            else if (objc_msgSend(v11, "containsString:", v36)
                   && -[UIPrintInfo quality](self, "quality") == 5)
            {
              v16 = 3;
            }
            else
            {
              v16 = 0;
            }
            -[UIPrintInfo setOutputType:](self, "setOutputType:", v16);
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        if (objc_msgSend(v10, "isEqualToString:", v6))
        {
          arrayForKey(v43, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (!v18)
            goto LABEL_51;
          v19 = v18;
          v20 = *(_QWORD *)v47;
          while (1)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v47 != v20)
                objc_enumerationMutation(v17);
              v22 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "integerValue");
              if (v22 > 15)
              {
                v23 = v22 - 16;
                if ((unint64_t)(v22 - 16) <= 0x3F)
                {
                  if (((1 << v23) & 0xC00033030) != 0)
                    goto LABEL_44;
                  if (((1 << v23) & 0xCCC0000000000000) != 0)
                    goto LABEL_48;
                  if (v22 == 16)
                  {
                    -[UIPrintInfo setLaminate:](self, "setLaminate:", 16);
                    continue;
                  }
                }
                if ((unint64_t)(v22 - 90) < 0xB)
                {
                  -[UIPrintInfo setFold:](self, "setFold:");
                  continue;
                }
                if ((unint64_t)(v22 - 82) < 2)
                {
LABEL_48:
                  -[UIPrintInfo setPunch:](self, "setPunch:", v22);
                  continue;
                }
              }
              else if (v22 > 7)
              {
                if (v22 == 8)
                {
LABEL_44:
                  -[UIPrintInfo setStaple:](self, "setStaple:", v22);
                  continue;
                }
                if (v22 == 15)
                  -[UIPrintInfo setCoat:](self, "setCoat:");
              }
              else
              {
                if (v22 == 4)
                  goto LABEL_44;
                if (v22 == 5)
                  goto LABEL_48;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (!v19)
            {
LABEL_51:
              -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", 2);

              v4 = v37;
              v6 = v42;
              goto LABEL_64;
            }
          }
        }
        if (objc_msgSend(v10, "isEqualToString:", v7))
        {
          objc_msgSend(v43, "objectForKey:", v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "integerValue");

          v4 = v37;
          v26 = v25;
          v6 = v42;
          -[UIPrintInfo setCopies:](self, "setCopies:", v26);
LABEL_64:
          v5 = v33;
          goto LABEL_58;
        }
        if (objc_msgSend(v10, "isEqualToString:", v32))
        {
          objc_msgSend(v43, "objectForKey:", v32);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setMediaType:](self, "setMediaType:", v27);

          v4 = v37;
          goto LABEL_64;
        }
        v5 = v33;
        if (objc_msgSend(v10, "isEqualToString:", v8))
        {
          v8 = v31;
          objc_msgSend(v43, "objectForKey:", v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setInputSlot:](self, "setInputSlot:", v28);
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoNUpRowsColumnsKey")))
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoNUpRowsColumnsKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setNUpRowsColumns:](self, "setNUpRowsColumns:", v28);
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoLayoutDirectionKey")))
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoLayoutDirectionKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setNUpLayoutDirection:](self, "setNUpLayoutDirection:", objc_msgSend(v28, "integerValue"));
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoBorderTypeKey")))
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoBorderTypeKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setBorderType:](self, "setBorderType:", objc_msgSend(v28, "integerValue"));
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoBookletStyleKey")))
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoBookletStyleKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setBookletStyle:](self, "setBookletStyle:", objc_msgSend(v28, "integerValue"));
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoFipHorizontalKey")))
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoFipHorizontalKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setFlipHorizontal:](self, "setFlipHorizontal:", objc_msgSend(v28, "BOOLValue"));
        }
        else
        {
          if (!objc_msgSend(v10, "isEqual:", CFSTR("UIPrintInfoScalingFactorKey")))
            goto LABEL_58;
          objc_msgSend(v43, "objectForKey:", CFSTR("UIPrintInfoScalingFactorKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "floatValue");
          -[UIPrintInfo setScalingFactor:](self, "setScalingFactor:", v29);
        }

        v4 = v37;
LABEL_58:
        ++v9;
      }
      while (v9 != v44);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      v44 = v30;
    }
    while (v30);
  }

}

- (void)clearPreset:(id)a3 origPrintInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D80B48]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setCopies:](self, "setCopies:", objc_msgSend(v6, "copies"));
  objc_msgSend(v6, "pageRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPageRanges:](self, "setPageRanges:", v7);

  -[UIPrintInfo currentPrinter](self, "currentPrinter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "supportsDuplex"))
    v9 = objc_msgSend(v6, "duplex");
  else
    v9 = 0;
  -[UIPrintInfo setDuplex:](self, "setDuplex:", v9);

  -[UIPrintInfo setOutputType:](self, "setOutputType:", objc_msgSend(v6, "outputType"));
  objc_msgSend(v6, "printPaper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPrintPaper:](self, "setPrintPaper:", v10);

  -[UIPrintInfo setOrientation:](self, "setOrientation:", objc_msgSend(v6, "orientation"));
  objc_msgSend(v6, "scalingFactor");
  -[UIPrintInfo setScalingFactor:](self, "setScalingFactor:");
  -[UIPrintInfo setImagePDFAnnotations:](self, "setImagePDFAnnotations:", objc_msgSend(v6, "imagePDFAnnotations"));
  objc_msgSend(v6, "inputSlot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setInputSlot:](self, "setInputSlot:", v11);

  objc_msgSend(v6, "mediaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setMediaType:](self, "setMediaType:", v12);

  -[UIPrintInfo setQuality:](self, "setQuality:", objc_msgSend(v6, "quality"));
  -[UIPrintInfo setNUpRowsColumns:](self, "setNUpRowsColumns:", 0);
  -[UIPrintInfo setNUpLayoutDirection:](self, "setNUpLayoutDirection:", 0);
  -[UIPrintInfo setBorderType:](self, "setBorderType:", 0);
  -[UIPrintInfo setBookletStyle:](self, "setBookletStyle:", 0);
  -[UIPrintInfo setFlipHorizontal:](self, "setFlipHorizontal:", 0);
  -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", objc_msgSend(v6, "finishingOption"));
  objc_msgSend(v6, "finishingTemplate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setFinishingTemplate:](self, "setFinishingTemplate:", v13);

  -[UIPrintInfo setStaple:](self, "setStaple:", objc_msgSend(v6, "staple"));
  -[UIPrintInfo setPunch:](self, "setPunch:", objc_msgSend(v6, "punch"));
  -[UIPrintInfo setFold:](self, "setFold:", objc_msgSend(v6, "fold"));
  -[UIPrintInfo setLaminate:](self, "setLaminate:", objc_msgSend(v6, "laminate"));
  -[UIPrintInfo setCoat:](self, "setCoat:", objc_msgSend(v6, "coat"));
  -[UIPrintInfo setTrim:](self, "setTrim:", objc_msgSend(v6, "trim"));
  objc_msgSend(v6, "pageStackOrder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPageStackOrder:](self, "setPageStackOrder:", v14);

  objc_msgSend(v6, "outputBin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setOutputBin:](self, "setOutputBin:", v15);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v39, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v43)
  {
    v17 = *(_QWORD *)v49;
    v18 = *MEMORY[0x1E0D80A98];
    v42 = *MEMORY[0x1E0D80BA0];
    v41 = *MEMORY[0x1E0D80BF0];
    v19 = *MEMORY[0x1E0D80B28];
    v36 = *MEMORY[0x1E0D80A80];
    v34 = *MEMORY[0x1E0D80B38];
    v35 = *MEMORY[0x1E0D80B40];
    v37 = *(_QWORD *)v49;
    v38 = v16;
    v40 = *MEMORY[0x1E0D80A98];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
        if (objc_msgSend(v21, "isEqualToString:", v18, v34))
        {
          -[UIPrintInfo currentPrinter](self, "currentPrinter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "supportsDuplex"))
            v23 = objc_msgSend(v6, "duplex");
          else
            v23 = 0;
          -[UIPrintInfo setDuplex:](self, "setDuplex:", v23);
          goto LABEL_16;
        }
        if (objc_msgSend(v21, "isEqualToString:", v42))
        {
          -[UIPrintInfo setOutputType:](self, "setOutputType:", objc_msgSend(v6, "outputType"));
          goto LABEL_17;
        }
        if (objc_msgSend(v21, "isEqualToString:", v41))
        {
          -[UIPrintInfo setQuality:](self, "setQuality:", objc_msgSend(v6, "quality"));
          goto LABEL_17;
        }
        if (objc_msgSend(v21, "isEqualToString:", v19))
        {
          arrayForKey(v39, v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (!v25)
            goto LABEL_47;
          v26 = v25;
          v27 = *(_QWORD *)v45;
          while (1)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v45 != v27)
                objc_enumerationMutation(v24);
              v29 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "integerValue");
              if (v29 > 15)
              {
                v30 = v29 - 16;
                if ((unint64_t)(v29 - 16) <= 0x3F)
                {
                  if (((1 << v30) & 0xC00033030) != 0)
                    goto LABEL_40;
                  if (((1 << v30) & 0xCCC0000000000000) != 0)
                    goto LABEL_44;
                  if (v29 == 16)
                  {
                    -[UIPrintInfo setLaminate:](self, "setLaminate:", objc_msgSend(v6, "laminate"));
                    continue;
                  }
                }
                if ((unint64_t)(v29 - 90) < 0xB)
                {
                  -[UIPrintInfo setFold:](self, "setFold:", objc_msgSend(v6, "fold"));
                  continue;
                }
                if ((unint64_t)(v29 - 82) < 2)
                {
LABEL_44:
                  -[UIPrintInfo setPunch:](self, "setPunch:", objc_msgSend(v6, "punch"));
                  continue;
                }
              }
              else if (v29 > 7)
              {
                if (v29 == 8)
                {
LABEL_40:
                  -[UIPrintInfo setStaple:](self, "setStaple:", objc_msgSend(v6, "staple"));
                  continue;
                }
                if (v29 == 15)
                  -[UIPrintInfo setCoat:](self, "setCoat:", objc_msgSend(v6, "coat"));
              }
              else
              {
                if (v29 == 4)
                  goto LABEL_40;
                if (v29 == 5)
                  goto LABEL_44;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (!v26)
            {
LABEL_47:
              -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", 2);

              v17 = v37;
              v16 = v38;
              goto LABEL_52;
            }
          }
        }
        if (objc_msgSend(v21, "isEqualToString:", v36))
        {
          -[UIPrintInfo setCopies:](self, "setCopies:", objc_msgSend(v6, "copies"));
LABEL_52:
          v18 = v40;
          goto LABEL_17;
        }
        if (objc_msgSend(v21, "isEqualToString:", v35))
        {
          objc_msgSend(v6, "mediaType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setMediaType:](self, "setMediaType:", v31);

          goto LABEL_52;
        }
        if (objc_msgSend(v21, "isEqualToString:", v34))
        {
          objc_msgSend(v6, "inputSlot");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setInputSlot:](self, "setInputSlot:", v32);

          goto LABEL_52;
        }
        v18 = v40;
        if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoNUpRowsColumnsKey")))
        {
          objc_msgSend(v6, "nUpRowsColumns");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInfo setNUpRowsColumns:](self, "setNUpRowsColumns:", v22);
LABEL_16:

          goto LABEL_17;
        }
        if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoLayoutDirectionKey")))
        {
          -[UIPrintInfo setNUpLayoutDirection:](self, "setNUpLayoutDirection:", objc_msgSend(v6, "nUpLayoutDirection"));
        }
        else if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoBorderTypeKey")))
        {
          -[UIPrintInfo setBorderType:](self, "setBorderType:", objc_msgSend(v6, "borderType"));
        }
        else if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoBookletStyleKey")))
        {
          -[UIPrintInfo setBookletStyle:](self, "setBookletStyle:", objc_msgSend(v6, "bookletStyle"));
        }
        else if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoFipHorizontalKey")))
        {
          -[UIPrintInfo setFlipHorizontal:](self, "setFlipHorizontal:", objc_msgSend(v6, "flipHorizontal"));
        }
        else if (objc_msgSend(v21, "isEqual:", CFSTR("UIPrintInfoScalingFactorKey")))
        {
          objc_msgSend(v6, "scalingFactor");
          -[UIPrintInfo setScalingFactor:](self, "setScalingFactor:");
        }
LABEL_17:
        ++v20;
      }
      while (v20 != v43);
      v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      v43 = v33;
    }
    while (v33);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[UIPrintInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithDictionary:", v5);

  return v6;
}

- (void)_updateWithPrinter:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *printerID;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t duplex;
  _QWORD *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  printerID = self->_printerID;
  self->_printerID = v5;

  if (objc_msgSend(v24, "hasPrintInfoSupported"))
  {
    objc_msgSend(v24, "printInfoSupported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D80A98]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = 1;
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_6:
  duplex = self->_duplex;
  if (duplex == 1)
  {
    v12 = (_QWORD *)MEMORY[0x1E0D80AB0];
  }
  else
  {
    if (duplex != 2)
      goto LABEL_12;
    v12 = (_QWORD *)MEMORY[0x1E0D80AA0];
  }
  if ((objc_msgSend(v9, "containsObject:", *v12) & 1) == 0)
    self->_duplex = 0;
LABEL_12:
  if ((v10 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D80AF0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_staple);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v15 & 1) == 0)
    self->_staple = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_punch);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "containsObject:", v16);

  if ((v17 & 1) == 0)
    self->_punch = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_fold);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "containsObject:", v18);

  if ((v19 & 1) == 0)
    self->_fold = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_coat);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "containsObject:", v20);

  if ((v21 & 1) == 0)
    self->_coat = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_laminate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v13, "containsObject:", v22);

  if ((v23 & 1) == 0)
    self->_laminate = 0;

}

- (id)_createPrintSettingsForPrinter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  int v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  char v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  int64_t duplex;
  void *v25;
  NSUInteger v26;
  _QWORD *v27;
  void *v28;
  int64_t outputType;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  int v34;
  _QWORD *v35;
  void *v36;
  id v37;
  void *v38;
  int64_t staple;
  uint64_t v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  int v64;
  void *v65;
  int64_t punch;
  uint64_t v67;
  void *v68;
  char v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  int v91;
  void *v92;
  int64_t fold;
  uint64_t v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  void *v101;
  char v102;
  void *v103;
  char v104;
  void *v105;
  char v106;
  void *v107;
  char v108;
  void *v109;
  char v110;
  void *v111;
  char v112;
  void *v113;
  char v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  NSString *finishingTemplate;
  NSString *outputBin;
  NSString *pageStackOrder;
  NSString *pdfPassword;
  void *v124;
  void *v125;
  NSString *inputSlot;
  NSString *mediaType;
  NSDictionary *jobPreset;
  id v129;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D80A60]);
  if (self->_copies >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0D80A80]);

  }
  if ((self->_outputType | 2) == 3)
    goto LABEL_4;
  duplex = self->_duplex;
  if (duplex == 2)
  {
    v7 = (_QWORD *)MEMORY[0x1E0D80AA0];
  }
  else
  {
    if (duplex != 1)
    {
LABEL_4:
      v7 = (_QWORD *)MEMORY[0x1E0D80AA8];
      goto LABEL_5;
    }
    v7 = (_QWORD *)MEMORY[0x1E0D80AB0];
  }
LABEL_5:
  v8 = *MEMORY[0x1E0D80A98];
  objc_msgSend(v5, "setObject:forKey:", *v7, *MEMORY[0x1E0D80A98]);
  if (-[UIPrintInfo bookletStyle](self, "bookletStyle") == 1)
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D80AA0], v8);
  v9 = -[UIPrintInfo numNUpRows](self, "numNUpRows");
  v10 = -[UIPrintInfo numNUpColumns](self, "numNUpColumns") * v9;
  if (v10 < 2)
  {
    if (self->_orientation != 1)
      goto LABEL_36;
    v20 = objc_msgSend(v4, "hasPrintInfoSupported");
    v21 = (uint64_t *)MEMORY[0x1E0D80B68];
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v4, "printInfoSupported");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *v21;
      objc_msgSend(v22, "objectForKey:", v23);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
      v23 = *MEMORY[0x1E0D80B68];
    }
    v25 = (void *)*MEMORY[0x1E0D80B80];
    if (objc_msgSend(v16, "containsObject:", *MEMORY[0x1E0D80B80]))
      v19 = v25;
    else
      v19 = (id)*MEMORY[0x1E0D80B70];
    v18 = v5;
    v17 = v23;
  }
  else
  {
    if (((1 << v10) & 0x10210) != 0)
      v11 = (id *)MEMORY[0x1E0D80B78];
    else
      v11 = (id *)MEMORY[0x1E0D80B70];
    if (((1 << v10) & 0x10210) != 0)
      v12 = (id *)MEMORY[0x1E0D80B70];
    else
      v12 = (id *)MEMORY[0x1E0D80B78];
    if (v10 <= 0x10)
      v13 = v11;
    else
      v13 = (id *)MEMORY[0x1E0D80B70];
    if (v10 <= 0x10)
      v14 = v12;
    else
      v14 = (id *)MEMORY[0x1E0D80B78];
    if (-[UIPrintInfo orientation](self, "orientation"))
      v15 = v14;
    else
      v15 = v13;
    v16 = *v15;
    v17 = *MEMORY[0x1E0D80B68];
    v18 = v5;
    v19 = v16;
  }
  objc_msgSend(v18, "setObject:forKey:", v19, v17);

LABEL_36:
  v26 = -[NSString length](self->_jobName, "length");
  v27 = (_QWORD *)MEMORY[0x1E0D80B18];
  if (v26)
  {
    objc_msgSend(v5, "setObject:forKey:", self->_jobName, *MEMORY[0x1E0D80B18]);
  }
  else
  {
    GetDefaultJobName();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, *v27);

  }
  outputType = self->_outputType;
  switch(outputType)
  {
    case 1:
      v31 = (_QWORD *)MEMORY[0x1E0D80B90];
LABEL_45:
      objc_msgSend(v5, "setObject:forKey:", *v31, *MEMORY[0x1E0D80BA0]);
      v32 = (_QWORD *)MEMORY[0x1E0D80BE8];
      goto LABEL_48;
    case 3:
      v31 = (_QWORD *)MEMORY[0x1E0D80B98];
      goto LABEL_45;
    case 2:
      v30 = (_QWORD *)MEMORY[0x1E0D80B98];
      break;
    default:
      v30 = (_QWORD *)MEMORY[0x1E0D80B90];
      break;
  }
  objc_msgSend(v5, "setObject:forKey:", *v30, *MEMORY[0x1E0D80BA0]);
  v32 = (_QWORD *)MEMORY[0x1E0D80BF8];
LABEL_48:
  v33 = *MEMORY[0x1E0D80BF0];
  objc_msgSend(v5, "setObject:forKey:", *v32, *MEMORY[0x1E0D80BF0]);
  v34 = objc_msgSend(v4, "hasPrintInfoSupported");
  v35 = (_QWORD *)MEMORY[0x1E0D80AF0];
  if (v34)
  {
    objc_msgSend(v4, "printInfoSupported");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", *v35);
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  staple = self->_staple;
  if (!staple || (self->_outputType | 2) != 2)
    goto LABEL_89;
  if (staple == 4)
  {
    v40 = 4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v37, "containsObject:", v41);

    if ((v42 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v37, "containsObject:", v43);

    v40 = 20;
    if ((v44 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 21);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v37, "containsObject:", v45);

    v40 = 21;
    if ((v46 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 28)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 28);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v37, "containsObject:", v47);

    v40 = 28;
    if ((v48 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 29);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v37, "containsObject:", v49);

    v40 = 29;
    if ((v50 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 31);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v37, "containsObject:", v51);

    v40 = 31;
    if ((v52 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 32)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 32);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v37, "containsObject:", v53);

    v40 = 32;
    if ((v54 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 33)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 33);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v37, "containsObject:", v55);

    v40 = 33;
    if ((v56 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 35)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 35);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v37, "containsObject:", v57);

    v40 = 35;
    if ((v58 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 50)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 50);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v37, "containsObject:", v59);

    v40 = 50;
    if ((v60 & 1) != 0)
      goto LABEL_88;
    staple = self->_staple;
  }
  if (staple == 51)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 51);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v37, "containsObject:", v61);

    v40 = 51;
    if ((v62 & 1) == 0)
    {
      staple = self->_staple;
      goto LABEL_86;
    }
LABEL_88:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v65);

    goto LABEL_89;
  }
LABEL_86:
  if (staple == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v37, "containsObject:", v63);

    v40 = 8;
    if (v64)
      goto LABEL_88;
  }
LABEL_89:
  punch = self->_punch;
  if (!punch || (self->_outputType | 2) != 2)
    goto LABEL_127;
  if (punch == 5)
  {
    v67 = 5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v37, "containsObject:", v68);

    if ((v69 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 70)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 70);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v37, "containsObject:", v70);

    v67 = 70;
    if ((v71 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 71)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v37, "containsObject:", v72);

    v67 = 71;
    if ((v73 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 74)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 74);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v37, "containsObject:", v74);

    v67 = 74;
    if ((v75 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 75)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v37, "containsObject:", v76);

    v67 = 75;
    if ((v77 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 77)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v37, "containsObject:", v78);

    v67 = 77;
    if ((v79 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 78)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 78);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v37, "containsObject:", v80);

    v67 = 78;
    if ((v81 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 79)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 79);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v37, "containsObject:", v82);

    v67 = 79;
    if ((v83 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 81)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 81);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v37, "containsObject:", v84);

    v67 = 81;
    if ((v85 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 82)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 82);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v37, "containsObject:", v86);

    v67 = 82;
    if ((v87 & 1) != 0)
      goto LABEL_126;
    punch = self->_punch;
  }
  if (punch == 83)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 83);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v37, "containsObject:", v88);

    v67 = 83;
    if ((v89 & 1) == 0)
    {
      punch = self->_punch;
      goto LABEL_124;
    }
LABEL_126:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v67);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v92);

    goto LABEL_127;
  }
LABEL_124:
  if (punch == 85)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 85);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v37, "containsObject:", v90);

    v67 = 85;
    if (v91)
      goto LABEL_126;
  }
LABEL_127:
  fold = self->_fold;
  if (!fold || (self->_outputType | 2) != 2)
    goto LABEL_162;
  if (fold == 90)
  {
    v94 = 90;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 90);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v37, "containsObject:", v95);

    if ((v96 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 91)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 91);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v37, "containsObject:", v97);

    v94 = 91;
    if ((v98 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 92)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 92);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v37, "containsObject:", v99);

    v94 = 92;
    if ((v100 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 93)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 93);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v37, "containsObject:", v101);

    v94 = 93;
    if ((v102 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 94)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 94);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v37, "containsObject:", v103);

    v94 = 94;
    if ((v104 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 95)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 95);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v37, "containsObject:", v105);

    v94 = 95;
    if ((v106 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 96)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 96);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v37, "containsObject:", v107);

    v94 = 96;
    if ((v108 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 97)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 97);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v37, "containsObject:", v109);

    v94 = 97;
    if ((v110 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 98)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 98);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v37, "containsObject:", v111);

    v94 = 98;
    if ((v112 & 1) != 0)
      goto LABEL_161;
    fold = self->_fold;
  }
  if (fold == 99)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 99);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v37, "containsObject:", v113);

    v94 = 99;
    if ((v114 & 1) == 0)
    {
      fold = self->_fold;
      goto LABEL_159;
    }
LABEL_161:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v94);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v117);

    goto LABEL_162;
  }
LABEL_159:
  if (fold == 100)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v37, "containsObject:", v115);

    v94 = 100;
    if (v116)
      goto LABEL_161;
  }
LABEL_162:
  if (self->_coat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 15);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v118);

  }
  if (self->_laminate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v119);

  }
  if (objc_msgSend(v38, "count"))
    objc_msgSend(v5, "setObject:forKey:", v38, *v35);
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate)
    objc_msgSend(v5, "setObject:forKey:", finishingTemplate, *MEMORY[0x1E0D80AE0]);
  outputBin = self->_outputBin;
  if (outputBin)
    objc_msgSend(v5, "setObject:forKey:", outputBin, *MEMORY[0x1E0D80B88]);
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder)
    objc_msgSend(v5, "setObject:forKey:", pageStackOrder, *MEMORY[0x1E0D80BC8]);
  if (self->_jobAccountID && objc_msgSend(v4, "supportsJobAccountID"))
    objc_msgSend(v5, "setObject:forKey:", self->_jobAccountID, *MEMORY[0x1E0D80B10]);
  pdfPassword = self->_pdfPassword;
  if (pdfPassword)
    objc_msgSend(v5, "setObject:forKey:", pdfPassword, *MEMORY[0x1E0D80A88]);
  if (self->_imagePDFAnnotations)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v124, *MEMORY[0x1E0D80A78]);

  }
  if (self->_quality != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v125, v33);

  }
  inputSlot = self->_inputSlot;
  if (inputSlot)
    objc_msgSend(v5, "setObject:forKey:", inputSlot, *MEMORY[0x1E0D80B00]);
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v5, "setObject:forKey:", mediaType, *MEMORY[0x1E0D80B58]);
  jobPreset = self->_jobPreset;
  if (jobPreset)
    objc_msgSend(v5, "setObject:forKey:", jobPreset, *MEMORY[0x1E0D80B30]);
  v129 = v5;

  return v129;
}

- (int64_t)numNUpRows
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIPrintInfo nUpRowsColumns](self, "nUpRowsColumns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (int64_t)numNUpColumns
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIPrintInfo nUpRowsColumns](self, "nUpRowsColumns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (BOOL)nUpActive
{
  return -[UIPrintInfo numNUpRows](self, "numNUpRows") > 1 || -[UIPrintInfo numNUpColumns](self, "numNUpColumns") > 1;
}

- (NSString)printerID
{
  return self->_printerID;
}

- (void)setPrinterID:(NSString *)printerID
{
  objc_setProperty_nonatomic_copy(self, a2, printerID, 16);
}

- (NSString)jobName
{
  return self->_jobName;
}

- (void)setJobName:(NSString *)jobName
{
  objc_setProperty_nonatomic_copy(self, a2, jobName, 24);
}

- (UIPrintInfoOutputType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(UIPrintInfoOutputType)outputType
{
  self->_outputType = outputType;
}

- (UIPrintInfoOrientation)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(UIPrintInfoOrientation)orientation
{
  self->_orientation = orientation;
}

- (UIPrintInfoDuplex)duplex
{
  return self->_duplex;
}

- (void)setDuplex:(UIPrintInfoDuplex)duplex
{
  self->_duplex = duplex;
}

- (UIPrinter)currentPrinter
{
  return self->_currentPrinter;
}

- (void)setCurrentPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_currentPrinter, a3);
}

- (int64_t)copies
{
  return self->_copies;
}

- (void)setCopies:(int64_t)a3
{
  self->_copies = a3;
}

- (NSDictionary)jobPreset
{
  return self->_jobPreset;
}

- (void)setJobPreset:(id)a3
{
  objc_storeStrong((id *)&self->_jobPreset, a3);
}

- (NSArray)appliedPresetsList
{
  return self->_appliedPresetsList;
}

- (void)setAppliedPresetsList:(id)a3
{
  objc_storeStrong((id *)&self->_appliedPresetsList, a3);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (NSArray)pageRanges
{
  return self->_pageRanges;
}

- (void)setPageRanges:(id)a3
{
  objc_storeStrong((id *)&self->_pageRanges, a3);
}

- (UIPrintPaper)printPaper
{
  return self->_printPaper;
}

- (void)setPrintPaper:(id)a3
{
  objc_storeStrong((id *)&self->_printPaper, a3);
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (BOOL)pdfAnnotationsAvailable
{
  return self->_pdfAnnotationsAvailable;
}

- (void)setPdfAnnotationsAvailable:(BOOL)a3
{
  self->_pdfAnnotationsAvailable = a3;
}

- (NSString)jobAccountID
{
  return self->_jobAccountID;
}

- (void)setJobAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_jobAccountID, a3);
}

- (BOOL)scaleToFit
{
  return self->_scaleToFit;
}

- (void)setScaleToFit:(BOOL)a3
{
  self->_scaleToFit = a3;
}

- (BOOL)scaleDownOnly
{
  return self->_scaleDownOnly;
}

- (void)setScaleDownOnly:(BOOL)a3
{
  self->_scaleDownOnly = a3;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)inputSlot
{
  return self->_inputSlot;
}

- (void)setInputSlot:(id)a3
{
  objc_storeStrong((id *)&self->_inputSlot, a3);
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

- (NSArray)nUpRowsColumns
{
  return self->_nUpRowsColumns;
}

- (void)setNUpRowsColumns:(id)a3
{
  objc_storeStrong((id *)&self->_nUpRowsColumns, a3);
}

- (int64_t)nUpLayoutDirection
{
  return self->_nUpLayoutDirection;
}

- (void)setNUpLayoutDirection:(int64_t)a3
{
  self->_nUpLayoutDirection = a3;
}

- (int64_t)borderType
{
  return self->_borderType;
}

- (void)setBorderType:(int64_t)a3
{
  self->_borderType = a3;
}

- (int64_t)bookletStyle
{
  return self->_bookletStyle;
}

- (void)setBookletStyle:(int64_t)a3
{
  self->_bookletStyle = a3;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (int64_t)finishingOption
{
  return self->_finishingOption;
}

- (void)setFinishingOption:(int64_t)a3
{
  self->_finishingOption = a3;
}

- (NSString)finishingTemplate
{
  return self->_finishingTemplate;
}

- (void)setFinishingTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_finishingTemplate, a3);
}

- (int64_t)staple
{
  return self->_staple;
}

- (void)setStaple:(int64_t)a3
{
  self->_staple = a3;
}

- (int64_t)punch
{
  return self->_punch;
}

- (void)setPunch:(int64_t)a3
{
  self->_punch = a3;
}

- (int64_t)fold
{
  return self->_fold;
}

- (void)setFold:(int64_t)a3
{
  self->_fold = a3;
}

- (int64_t)laminate
{
  return self->_laminate;
}

- (void)setLaminate:(int64_t)a3
{
  self->_laminate = a3;
}

- (int64_t)coat
{
  return self->_coat;
}

- (void)setCoat:(int64_t)a3
{
  self->_coat = a3;
}

- (int64_t)trim
{
  return self->_trim;
}

- (void)setTrim:(int64_t)a3
{
  self->_trim = a3;
}

- (NSString)outputBin
{
  return self->_outputBin;
}

- (void)setOutputBin:(id)a3
{
  objc_storeStrong((id *)&self->_outputBin, a3);
}

- (NSString)pageStackOrder
{
  return self->_pageStackOrder;
}

- (void)setPageStackOrder:(id)a3
{
  objc_storeStrong((id *)&self->_pageStackOrder, a3);
}

- (BOOL)scaleUp
{
  return self->_scaleUp;
}

- (void)setScaleUp:(BOOL)a3
{
  self->_scaleUp = a3;
}

- (NSString)pdfPassword
{
  return self->_pdfPassword;
}

- (void)setPdfPassword:(id)a3
{
  objc_storeStrong((id *)&self->_pdfPassword, a3);
}

- (BOOL)imagePDFAnnotations
{
  return self->_imagePDFAnnotations;
}

- (void)setImagePDFAnnotations:(BOOL)a3
{
  self->_imagePDFAnnotations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfPassword, 0);
  objc_storeStrong((id *)&self->_pageStackOrder, 0);
  objc_storeStrong((id *)&self->_outputBin, 0);
  objc_storeStrong((id *)&self->_finishingTemplate, 0);
  objc_storeStrong((id *)&self->_nUpRowsColumns, 0);
  objc_storeStrong((id *)&self->_inputSlot, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_jobAccountID, 0);
  objc_storeStrong((id *)&self->_printPaper, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong((id *)&self->_appliedPresetsList, 0);
  objc_storeStrong((id *)&self->_jobPreset, 0);
  objc_storeStrong((id *)&self->_currentPrinter, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
  objc_storeStrong((id *)&self->_printerID, 0);
}

@end
