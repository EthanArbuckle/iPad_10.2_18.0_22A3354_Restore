@implementation CRRecognizerConfiguration

- (CRRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  id *v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  CRRecognizerConfiguration *v28;
  id v30;
  uint8_t buf[16];

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

  if (v9 == 3)
  {
    v11 = -[CRRecognizerConfiguration initV3DefaultConfigWithOptions:](self, "initV3DefaultConfigWithOptions:", v6);
  }
  else
  {
    if (v9 != 2)
    {
      if (v9 != 1)
      {
        if (a4)
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
          v28 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = 0;
        }
        goto LABEL_29;
      }
      CROSLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unexpected attempt to access V1 recognizer configuration", buf, 2u);
      }

    }
    v11 = -[CRRecognizerConfiguration initV2DefaultConfigWithOptions:](self, "initV2DefaultConfigWithOptions:", v6);
  }
  v12 = (id *)v11;
  if (v11)
  {
    v11[3] = v9;
    v30 = 0;
    v13 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:mtlDevice:](CRComputeDeviceUtilities, "computeDeviceTypeForOptions:mtlDevice:", v6, &v30);
    v14 = v30;
    v15 = v30;
    v12[7] = (id)v13;
    if (v15)
      objc_storeStrong(v12 + 6, v14);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderNumTopStringCandidates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderNumTopStringCandidates"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12[4] = (id)objc_msgSend(v17, "integerValue");

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableFalsePositivePostFilter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableFalsePositivePostFilter"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 + 8) = objc_msgSend(v19, "BOOLValue");

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableScriptDetection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableScriptDetection"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 + 9) = objc_msgSend(v21, "BOOLValue");

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderOptimizeGroupsForStability"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderOptimizeGroupsForStability"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 + 12) = objc_msgSend(v23, "BOOLValue");

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderSkipRecognition"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    if (v25)
      *((_BYTE *)v12 + 10) = 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderRectifyPolygons"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27)
      *((_BYTE *)v12 + 11) = 1;

  }
  self = v12;
  v28 = self;
LABEL_29:

  return v28;
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRRecognizerConfiguration;
  result = -[CRRecognizerConfiguration init](&v4, sel_init, a3);
  if (result)
  {
    *((_QWORD *)result + 4) = 1;
    *((_QWORD *)result + 5) = 0;
    *((_BYTE *)result + 12) = 0;
    *((_DWORD *)result + 4) = 0;
    *((_DWORD *)result + 2) = 257;
  }
  return result;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  CRRecognizerConfiguration *v3;
  CRRecognizerConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRRecognizerConfiguration;
  v3 = -[CRRecognizerConfiguration init](&v6, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->_numTopStringCandidates = 1;
    v3->_angleThresholdForRotatedCrops = 0.0;
    *(_WORD *)&v3->_falsePositiveFilteringDisabled = 0;
    v3->_optimizeGroupsForStability = 0;
    v3->_skipRecognition = 0;
    v3->_colorSpace = 0;
    v3->_rectifyPolygons = _os_feature_enabled_impl();
  }
  return v4;
}

- (CRTextFeatureOrdering)textFeatureOrder
{
  void *v3;
  unint64_t v4;
  double v5;
  void *v6;

  -[CRRecognizerConfiguration cachedTextFeatureOrder](self, "cachedTextFeatureOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[CRRecognizerConfiguration revision](self, "revision");
    -[CRRecognizerConfiguration angleThresholdForRotatedCrops](self, "angleThresholdForRotatedCrops");
    +[CRTextFeatureOrderingUtilities textFeatureOrderWithRevision:angleThresholdForRotatedCrops:optimizeGroupsForStability:](CRTextFeatureOrderingUtilities, "textFeatureOrderWithRevision:angleThresholdForRotatedCrops:optimizeGroupsForStability:", v4, -[CRRecognizerConfiguration optimizeGroupsForStability](self, "optimizeGroupsForStability"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRecognizerConfiguration setCachedTextFeatureOrder:](self, "setCachedTextFeatureOrder:", v6);

  }
  return -[CRRecognizerConfiguration cachedTextFeatureOrder](self, "cachedTextFeatureOrder");
}

- (CRTextFeaturesFiltering)textFeatureFilter
{
  void *v3;
  void *v4;

  -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[CRRecognizerConfiguration setCachedTextFeatureFilter:](self, "setCachedTextFeatureFilter:", v4);

  }
  return -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
}

+ (id)supportedLanguagesForVersion:(int64_t)a3
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[12];
  _QWORD v11[18];
  _QWORD v12[8];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3:
      v11[0] = CFSTR("en-US");
      v11[1] = CFSTR("fr-FR");
      v11[2] = CFSTR("it-IT");
      v11[3] = CFSTR("de-DE");
      v11[4] = CFSTR("es-ES");
      v11[5] = CFSTR("pt-BR");
      v11[6] = CFSTR("zh-Hans");
      v11[7] = CFSTR("zh-Hant");
      v11[8] = CFSTR("yue-Hans");
      v11[9] = CFSTR("yue-Hant");
      v11[10] = CFSTR("ko-KR");
      v11[11] = CFSTR("ja-JP");
      v11[12] = CFSTR("ru-RU");
      v11[13] = CFSTR("uk-UA");
      v11[14] = CFSTR("th-TH");
      v11[15] = CFSTR("vi-VT");
      v11[16] = CFSTR("ar-SA");
      v11[17] = CFSTR("ars-SA");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
      {
        v10[0] = CFSTR("tr-TR");
        v10[1] = CFSTR("id-ID");
        v10[2] = CFSTR("cs-CZ");
        v10[3] = CFSTR("da-DK");
        v10[4] = CFSTR("nl-NL");
        v10[5] = CFSTR("no-NO");
        v10[6] = CFSTR("nn-NO");
        v10[7] = CFSTR("nb-NO");
        v10[8] = CFSTR("ms-MY");
        v10[9] = CFSTR("pl-PL");
        v10[10] = CFSTR("ro-RO");
        v10[11] = CFSTR("sv-SE");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        return v8;
      }
      break;
    case 2:
      v12[0] = CFSTR("en-US");
      v12[1] = CFSTR("fr-FR");
      v12[2] = CFSTR("it-IT");
      v12[3] = CFSTR("de-DE");
      v12[4] = CFSTR("es-ES");
      v12[5] = CFSTR("pt-BR");
      v12[6] = CFSTR("zh-Hans");
      v12[7] = CFSTR("zh-Hant");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v12;
      v5 = 8;
      goto LABEL_8;
    case 1:
      v13[0] = CFSTR("en-US");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v13;
      v5 = 1;
LABEL_8:
      objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
      return (id)objc_claimAutoreleasedReturnValue();
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)languageSetFromInputLanguages:(id)a3 supportedLanguages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v5)
  {
    objc_opt_class();
    v9 = 0x1E0C99000uLL;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5;
      v5 = (id)v10;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v29 = v8;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v5 = v5;
      v33 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v33)
      {
        v32 = *(_QWORD *)v35;
        obj = v5;
        v31 = *MEMORY[0x1E0C997E8];
        v12 = 0x1E0C99000uLL;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v35 != v32)
              objc_enumerationMutation(obj);
            v14 = *(void **)(v12 + 3528);
            v15 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v13);
            objc_msgSend(v14, "componentsFromLocaleIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "mutableCopy");

            v18 = (void *)MEMORY[0x1E0CB34D0];
            v38 = v15;
            objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v38, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "preferredLocalizationsFromArray:forPreferences:", v6, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v20, "count"))
            {
              v21 = v6;
              objc_msgSend(v20, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v12;
              objc_msgSend(*(id *)(v12 + 3528), "localeWithLocaleIdentifier:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "languageCode");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v31);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v25, "isEqualToString:", v26);

              if (v27)
                objc_msgSend(v29, "addObject:", v22);

              v6 = v21;
              v9 = 0x1E0C99000;
              v12 = v23;
            }

            ++v13;
          }
          while (v33 != v13);
          v5 = obj;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v33);
      }

      v8 = v29;
    }
  }
  else
  {
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  }
  if (!objc_msgSend(v8, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v6);

  return v8;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (int64_t)numTopStringCandidates
{
  return self->_numTopStringCandidates;
}

- (double)angleThresholdForRotatedCrops
{
  return self->_angleThresholdForRotatedCrops;
}

- (BOOL)falsePositiveFilteringDisabled
{
  return self->_falsePositiveFilteringDisabled;
}

- (BOOL)scriptDetectionDisabled
{
  return self->_scriptDetectionDisabled;
}

- (BOOL)skipRecognition
{
  return self->_skipRecognition;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)rectifyPolygons
{
  return self->_rectifyPolygons;
}

- (MTLDevice)metalDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)computeDeviceType
{
  return self->_computeDeviceType;
}

- (CRTextFeatureOrdering)cachedTextFeatureOrder
{
  return (CRTextFeatureOrdering *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedTextFeatureOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CRTextFeaturesFiltering)cachedTextFeatureFilter
{
  return (CRTextFeaturesFiltering *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedTextFeatureFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)optimizeGroupsForStability
{
  return self->_optimizeGroupsForStability;
}

- (void)setOptimizeGroupsForStability:(BOOL)a3
{
  self->_optimizeGroupsForStability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTextFeatureFilter, 0);
  objc_storeStrong((id *)&self->_cachedTextFeatureOrder, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
