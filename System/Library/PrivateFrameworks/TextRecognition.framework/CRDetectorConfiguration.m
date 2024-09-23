@implementation CRDetectorConfiguration

- (CRDetectorConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  unint64_t v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  CRDetectorConfiguration *v38;
  id v40;
  uint8_t buf[8];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v9 = +[CRImageReader defaultRevisionNumber](CRImageReader, "defaultRevisionNumber");
  }

  if (v9 != 3)
  {
    if (v9 != 2)
    {
      if (v9 != 1)
      {
        if (a4)
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
          v38 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        goto LABEL_35;
      }
      CROSLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 detector config", buf, 2u);
      }

    }
    CROSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 detector config", buf, 2u);
    }

  }
  v12 = -[CRDetectorConfiguration initV3DefaultConfig](self, "initV3DefaultConfig");
  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderMinimumTextHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderMinimumTextHeight"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      *((_QWORD *)v12 + 7) = v15;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableScriptDetection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      v12[11] = 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableTextTypeDetection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
      v12[12] = 1;
    v40 = 0;
    v20 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:mtlDevice:](CRComputeDeviceUtilities, "computeDeviceTypeForOptions:mtlDevice:", v6, &v40);
    v21 = v40;
    v22 = v40;
    *((_QWORD *)v12 + 12) = v20;
    if (v22)
      objc_storeStrong((id *)v12 + 11, v21);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CREnableLogIntermediateDetectorResult"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
      v12[10] = 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectorModelPath"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)*((_QWORD *)v12 + 3);
      *((_QWORD *)v12 + 3) = v26;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderCoreMode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12[8] = objc_msgSend(v28, "BOOLValue") ^ 1;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderSkipVerticalText"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12[9] = objc_msgSend(v29, "BOOLValue");

    if (v9 >= 3)
    {
      +[CRImageReader prioritizationForOptions:](CRImageReader, "prioritizationForOptions:", v6);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)*((_QWORD *)v12 + 5);
      *((_QWORD *)v12 + 5) = v30;

      if (objc_msgSend(*((id *)v12 + 5), "isEqualToString:", CFSTR("CRImageReaderPrioritizationPerformance")))
      {
        *(int64x2_t *)(v12 + 136) = vdupq_n_s64(0x408D000000000000uLL);
        v42[0] = CFSTR("CRScriptThresholdLatinToChinese");
        v42[1] = CFSTR("CRScriptThresholdPreferredLatinCJK");
        v43[0] = &unk_1E99449B8;
        v43[1] = &unk_1E99449B8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)*((_QWORD *)v12 + 9);
        *((_QWORD *)v12 + 9) = v32;

        *((_QWORD *)v12 + 6) = 0x409E000000000000;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectorMaxInputSize"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectorMaxInputSize"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

        if (v37 > 0.0)
        {
          *((double *)v12 + 17) = v37;
          *((double *)v12 + 18) = v37;
        }
      }
      *((_QWORD *)v12 + 8) = 1000;
    }

  }
  self = v12;
  v38 = self;
LABEL_35:

  return v38;
}

- (id)initV3DefaultConfig
{
  char *v2;
  id v3;
  int64x2_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CRDetectorConfiguration;
  v2 = -[CRDetectorConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = vdupq_n_s64(0x407E000000000000uLL);
    *(int64x2_t *)(v2 + 104) = v4;
    *(_DWORD *)(v2 + 10) = 16842752;
    *((_WORD *)v2 + 7) = 1;
    v2[16] = 1;
    *(int64x2_t *)(v2 + 120) = v4;
    *(int64x2_t *)(v2 + 136) = vdupq_n_s64(0x4095800000000000uLL);
    *((_QWORD *)v2 + 6) = 0x40AFC00000000000;
    *((_QWORD *)v2 + 10) = 0x3FD0000000000000;
    v5 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 4) = 0x4040000000000000;

    *((_DWORD *)v3 + 5) = 3;
    v10[0] = CFSTR("CRScriptThresholdLatinToChinese");
    v10[1] = CFSTR("CRScriptThresholdPreferredLatinCJK");
    v11[0] = &unk_1E99449C8;
    v11[1] = &unk_1E99449D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v3 + 9);
    *((_QWORD *)v3 + 9) = v6;

    objc_storeStrong((id *)v3 + 5, CFSTR("CRImageReaderPrioritizationAccuracy"));
    *((_BYTE *)v3 + 17) = 1;
  }
  return v3;
}

- (BOOL)detectTables
{
  return self->_detectTables;
}

- (BOOL)skipVerticalText
{
  return self->_skipVerticalText;
}

- (BOOL)logIntermediateResults
{
  return self->_logIntermediateResults;
}

- (NSURL)customModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)disableScriptDetection
{
  return self->_disableScriptDetection;
}

- (BOOL)disableTextTypeDetection
{
  return self->_disableTextTypeDetection;
}

- (BOOL)runFullTile
{
  return self->_runFullTile;
}

- (void)setRunFullTile:(BOOL)a3
{
  self->_runFullTile = a3;
}

- (BOOL)runFineScale
{
  return self->_runFineScale;
}

- (void)setRunFineScale:(BOOL)a3
{
  self->_runFineScale = a3;
}

- (BOOL)mergeFullTile
{
  return self->_mergeFullTile;
}

- (void)setMergeFullTile:(BOOL)a3
{
  self->_mergeFullTile = a3;
}

- (BOOL)useScaleTraversal
{
  return self->_useScaleTraversal;
}

- (void)setUseScaleTraversal:(BOOL)a3
{
  self->_useScaleTraversal = a3;
}

- (BOOL)extractPolygons
{
  return self->_extractPolygons;
}

- (void)setExtractPolygons:(BOOL)a3
{
  self->_extractPolygons = a3;
}

- (CGSize)tileSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_tileSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)tileOverlap
{
  return self->_tileOverlap;
}

- (NSString)prioritization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CGSize)minimumInputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_minimumInputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumInputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_maximumInputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)inputLengthLimit
{
  return self->_inputLengthLimit;
}

- (double)minimumTextHeight
{
  return self->_minimumTextHeight;
}

- (unint64_t)tableMinDetectableArea
{
  return self->_tableMinDetectableArea;
}

- (NSDictionary)scriptRatioThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (double)scoreMapScaleFactor
{
  return self->_scoreMapScaleFactor;
}

- (int)mergingType
{
  return self->_mergingType;
}

- (void)setMergingType:(int)a3
{
  self->_mergingType = a3;
}

- (MTLDevice)metalDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)computeDeviceType
{
  return self->_computeDeviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_scriptRatioThresholds, 0);
  objc_storeStrong((id *)&self->_prioritization, 0);
  objc_storeStrong((id *)&self->_customModelURL, 0);
}

@end
