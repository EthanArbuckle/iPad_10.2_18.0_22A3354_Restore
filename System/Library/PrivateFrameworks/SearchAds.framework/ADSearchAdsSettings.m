@implementation ADSearchAdsSettings

- (double)requestedLocationAccuracy
{
  return self->_requestedLocationAccuracy;
}

- (ADSearchAdsSettings)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ADSearchAdsSettings *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *algoID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSArray *v17;
  NSArray *userKeyboards;
  ADFCapSettings *v19;
  const char *v20;
  uint64_t v21;
  ADFCapSettings *searchSettings;
  ADFCapSettings *v23;
  const char *v24;
  uint64_t v25;
  ADFCapSettings *landingPageSettings;
  ADFCapSettings *v27;
  const char *v28;
  uint64_t v29;
  ADFCapSettings *iris1Settings;
  ADFCapSettings *v31;
  const char *v32;
  uint64_t v33;
  ADFCapSettings *iris2Settings;
  ADFCapSettings *v35;
  const char *v36;
  uint64_t v37;
  ADFCapSettings *metisSettings;
  ADFCapSettings *v39;
  const char *v40;
  uint64_t v41;
  ADFCapSettings *floraSettings;
  NSString *requestedText;
  NSString *requestedIcon;
  NSString *templateType;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)ADSearchAdsSettings;
  v6 = -[ADSearchAdsSettings init](&v55, sel_init);
  if (v6)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v7, v8, (uint64_t)CFSTR("ToroAlgoID"), v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    algoID = v6->_algoID;
    v6->_algoID = (NSString *)v11;

    if (objc_msgSend_isEqualToString_(v6->_algoID, v13, (uint64_t)&stru_24F0D9888, v14, v15))
    {
      v16 = v6->_algoID;
      v6->_algoID = 0;

    }
    v17 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    userKeyboards = v6->_userKeyboards;
    v6->_userKeyboards = v17;

    v6->_requestedLocationAccuracy = *(double *)MEMORY[0x24BDBFB48];
    v6->_locationGridSpacing = 250.0;
    v19 = [ADFCapSettings alloc];
    v21 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v19, v20, 0, 1000, 1000, 1000.0, 604800.0, 604800.0);
    searchSettings = v6->_searchSettings;
    v6->_searchSettings = (ADFCapSettings *)v21;

    v23 = [ADFCapSettings alloc];
    v25 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v23, v24, 1, 1000, 1000, 1000.0, 604800.0, 604800.0);
    landingPageSettings = v6->_landingPageSettings;
    v6->_landingPageSettings = (ADFCapSettings *)v25;

    v27 = [ADFCapSettings alloc];
    v29 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v27, v28, 2, 1000, 1000, 1000.0, 604800.0, 604800.0);
    iris1Settings = v6->_iris1Settings;
    v6->_iris1Settings = (ADFCapSettings *)v29;

    v31 = [ADFCapSettings alloc];
    v33 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v31, v32, 3, 1000, 1000, 1000.0, 604800.0, 604800.0);
    iris2Settings = v6->_iris2Settings;
    v6->_iris2Settings = (ADFCapSettings *)v33;

    v35 = [ADFCapSettings alloc];
    v37 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v35, v36, 4, 1000, 1000, 1000.0, 604800.0, 604800.0);
    metisSettings = v6->_metisSettings;
    v6->_metisSettings = (ADFCapSettings *)v37;

    v39 = [ADFCapSettings alloc];
    v41 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v39, v40, 5, 1000, 1000, 1000.0, 604800.0, 604800.0);
    floraSettings = v6->_floraSettings;
    v6->_floraSettings = (ADFCapSettings *)v41;

    v6->_isTest = 0;
    v6->_isBaseline = 0;
    v6->_isCustomTemplate = 0;
    v6->_isRequestedImage = 0;
    v6->_isRequestedRating = 0;
    requestedText = v6->_requestedText;
    v6->_requestedText = (NSString *)CFSTR("none");

    requestedIcon = v6->_requestedIcon;
    v6->_requestedIcon = (NSString *)CFSTR("regular");

    templateType = v6->_templateType;
    v6->_templateType = (NSString *)CFSTR("regular");

    objc_msgSend_refresh(v6, v46, v47, v48, v49);
    objc_msgSend_restoreClientSettings(v6, v50, v51, v52, v53);
  }
  return v6;
}

- (void)restoreClientSettings
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  ADCopyDataFromKeychain();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE02198]);
    v11 = (void *)objc_msgSend_initWithData_(v7, v8, (uint64_t)v6, v9, v10);
    objc_msgSend_setClientSettings_(self, v12, (uint64_t)v11, v13, v14);

    objc_msgSend_applyClientSettings(self, v15, v16, v17, v18);
  }
  objc_msgSend_refreshClientSettings_(self, v3, 0, v4, v5);

}

- (void)setClientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_clientSettings, a3);
}

- (void)refresh
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;
  id location;

  if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], a2, v2, v3, v4))
  {
    objc_msgSend_sharedInputModeController(MEMORY[0x24BEBD6F0], v6, v7, v8, v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_normalizedEnabledInputModeIdentifiers(v18, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserKeyboards_(self, v15, (uint64_t)v14, v16, v17);

  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_228283384;
    block[3] = &unk_24F0D8EC0;
    objc_copyWeak(&v20, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)applyClientSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  ADSearchAdsSettings *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int isEqualToString;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  float v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  ADSearchAdsSettings *v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v111 = self;
  v4 = 0;
  v118 = *MEMORY[0x24BDAC8D0];
  do
  {
    v5 = v111;
    objc_msgSend__fCapParametersFromType_(v111, a2, v4, v2, v3, v111);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v4;
    objc_msgSend__fCapSettingsFromType_(v5, v7, v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v11 = v6;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v113, (uint64_t)v117, 16);
    if (v13)
    {
      v18 = v13;
      v19 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v114 != v19)
            objc_enumerationMutation(v11);
          v21 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          objc_msgSend_key(v21, v14, v15, v16, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("frequencyCapExpirationInSeconds"), v24, v25);

          if (isEqualToString)
          {
            objc_msgSend_value(v21, v27, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v31, v32, v33, v34, v35);
            objc_msgSend_setFrequencyCapExpirationInSeconds_(v10, v37, v38, v39, v40, v36);

          }
          objc_msgSend_key(v21, v27, v28, v29, v30);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_isEqualToString_(v41, v42, (uint64_t)CFSTR("reverseGeolocationRefreshThresholdInMeters"), v43, v44);

          if (v45)
          {
            objc_msgSend_value(v21, v46, v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v50, v51, v52, v53, v54);
            objc_msgSend_setReverseGeolocationRefreshThresholdInMeters_(v10, v55, v56, v57, v58);

          }
          objc_msgSend_key(v21, v46, v47, v48, v49);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_isEqualToString_(v59, v60, (uint64_t)CFSTR("maxFrequencyCapElements"), v61, v62);

          if (v63)
          {
            objc_msgSend_value(v21, v64, v65, v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend_integerValue(v68, v69, v70, v71, v72);
            objc_msgSend_setMaxFrequencyCapElements_(v10, v74, v73, v75, v76);

          }
          objc_msgSend_key(v21, v64, v65, v66, v67);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_isEqualToString_(v77, v78, (uint64_t)CFSTR("maxClickCapElements"), v79, v80);

          if (v81)
          {
            objc_msgSend_value(v21, v82, v83, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend_integerValue(v86, v87, v88, v89, v90);
            objc_msgSend_setMaxClickCapElements_(v10, v92, v91, v93, v94);

          }
          objc_msgSend_key(v21, v82, v83, v84, v85);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend_isEqualToString_(v95, v96, (uint64_t)CFSTR("clickExpirationThresholdInSeconds"), v97, v98);

          if (v99)
          {
            objc_msgSend_value(v21, v14, v15, v16, v17);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v100, v101, v102, v103, v104);
            objc_msgSend_setClickExpirationThresholdInSeconds_(v10, v106, v107, v108, v109, v105);

          }
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v113, (uint64_t)v117, 16);
      }
      while (v18);
    }

    v4 = v112 + 1;
  }
  while (v112 != 5);
  objc_msgSend_checkDefaultsAndSetInternalSettingsOverrides(v111, a2, v110, v2, v3);
}

- (id)_fCapSettingsFromType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      objc_msgSend_searchSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend_landingPageSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend_iris1Settings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend_iris2Settings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend_metisSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend_floraSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_fCapParametersFromType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  switch(a3)
  {
    case 0:
      objc_msgSend_clientSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_searchAdsSettingsParams(v5, v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      objc_msgSend_clientSettings(self, a2, a3, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_searchLandingAdsSettingsParams(v5, v12, v13, v14, v15);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v11 = (void *)v10;

      return v11;
    case 2:
      objc_msgSend__getParametersForName_(self, a2, (uint64_t)CFSTR("iris1"), v3, v4);
      goto LABEL_10;
    case 3:
      objc_msgSend__getParametersForName_(self, a2, (uint64_t)CFSTR("iris2"), v3, v4);
      goto LABEL_10;
    case 4:
      objc_msgSend__getParametersForName_(self, a2, (uint64_t)CFSTR("metis"), v3, v4);
      goto LABEL_10;
    case 5:
      objc_msgSend__getParametersForName_(self, a2, (uint64_t)CFSTR("flora"), v3, v4);
LABEL_10:
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

- (id)_getParametersForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_clientSettings(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchLandingAdsSettingsParams(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22827BF08;
  block[3] = &unk_24F0D8E98;
  block[4] = a1;
  if (qword_253E8E8E8 != -1)
    dispatch_once(&qword_253E8E8E8, block);
  return (id)qword_253E8E8E0;
}

- (ADFCapSettings)iris2Settings
{
  return self->_iris2Settings;
}

- (ADFCapSettings)iris1Settings
{
  return self->_iris1Settings;
}

- (ADFCapSettings)searchSettings
{
  return self->_searchSettings;
}

- (void)refreshClientSettings:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int hasExpirationDate;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  _QWORD v81[5];
  id v82;
  id v83;
  uint8_t buf[4];
  double v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_BOOLForKey_(v9, v10, (uint64_t)CFSTR("ClientSettingsForceExpire"), v11, v12);

  if (v13)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBool_forKey_(v18, v19, 0, (uint64_t)CFSTR("ClientSettingsForceExpire"), v20);

    APLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228279000, v21, OS_LOG_TYPE_DEFAULT, "Client Settings is being forced to expire", buf, 2u);
    }

  }
  objc_msgSend_clientSettings(self, v14, v15, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  hasExpirationDate = objc_msgSend_hasExpirationDate(v22, v23, v24, v25, v26);

  if (((hasExpirationDate ^ 1 | v13) & 1) != 0)
    goto LABEL_7;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (double)(int)objc_msgSend_AD_toServerTime(v32, v33, v34, v35, v36);

  objc_msgSend_clientSettings(self, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expirationDate(v42, v43, v44, v45, v46);
  v48 = v47;

  if (v48 <= v37)
  {
LABEL_7:
    objc_msgSend_sharedInstance(MEMORY[0x24BE02228], v28, v29, v30, v31);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_workQueue(MEMORY[0x24BE02228], v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = sub_2282833E8;
    v81[3] = &unk_24F0D8F10;
    v81[4] = self;
    v82 = v49;
    v83 = v4;
    v55 = v49;
    objc_msgSend_addOperationWithBlock_(v54, v56, (uint64_t)v81, v57, v58);

  }
  else
  {
    APLogForCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_clientSettings(self, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_expirationDate(v64, v65, v66, v67, v68);
      *(_DWORD *)buf = 134218240;
      v85 = v37;
      v86 = 2048;
      v87 = v69;
      _os_log_impl(&dword_228279000, v59, OS_LOG_TYPE_DEFAULT, "Client Settings has not expired. (%f < %f)", buf, 0x16u);

    }
    APLogForCategory();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_clientSettings(self, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_AD_jsonString(v75, v76, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v85 = *(double *)&v80;
      _os_log_impl(&dword_228279000, v70, OS_LOG_TYPE_DEFAULT, "Current Client Settings: %@", buf, 0xCu);

    }
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (ADClientSettingsResponse)clientSettings
{
  return self->_clientSettings;
}

- (void)checkDefaultsAndSetInternalSettingsOverrides
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const __CFString *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const __CFString *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *v63;
  NSString *requestedText;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  NSString *v73;
  NSString *requestedIcon;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSString *v83;
  NSString *templateType;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  void *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  void *v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  void *v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  void *v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  void *v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  void *v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  void *v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  void *v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  void *v566;
  const char *v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  void *v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  void *v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  const char *v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  void *v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  void *v621;
  const char *v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  void *v626;
  const char *v627;
  uint64_t v628;
  uint64_t v629;
  void *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  const char *v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  void *v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  void *v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  void *v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  const char *v669;
  uint64_t v670;
  uint64_t v671;
  void *v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  void *v686;
  const char *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  void *v691;
  const char *v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  const char *v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  void *v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  void *v709;
  const char *v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  const char *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  const char *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  void *v724;
  const char *v725;
  uint64_t v726;
  uint64_t v727;
  void *v728;
  const char *v729;
  uint64_t v730;
  uint64_t v731;
  uint64_t v732;
  const char *v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  void *v737;
  const char *v738;
  uint64_t v739;
  uint64_t v740;
  void *v741;
  const char *v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  void *v751;
  const char *v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  void *v756;
  const char *v757;
  uint64_t v758;
  uint64_t v759;
  void *v760;
  const char *v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  void *v769;
  const char *v770;
  uint64_t v771;
  uint64_t v772;
  void *v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  const char *v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  void *v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  void *v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  void *v792;
  const char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  const char *v798;
  uint64_t v799;
  uint64_t v800;
  uint64_t v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  void *v806;
  const char *v807;
  uint64_t v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  const char *v812;
  uint64_t v813;
  uint64_t v814;
  uint64_t v815;
  void *v816;
  const char *v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  void *v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  void *v825;
  const char *v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  const char *v831;
  uint64_t v832;
  uint64_t v833;
  void *v834;
  const char *v835;
  uint64_t v836;
  uint64_t v837;
  void *v838;
  const char *v839;
  uint64_t v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  const char *v844;
  uint64_t v845;
  uint64_t v846;
  uint64_t v847;
  void *v848;
  const char *v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  void *v853;
  const char *v854;
  uint64_t v855;
  uint64_t v856;
  void *v857;
  const char *v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  const char *v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  void *v867;
  const char *v868;
  uint64_t v869;
  uint64_t v870;
  void *v871;
  const char *v872;
  uint64_t v873;
  uint64_t v874;
  uint64_t v875;
  uint64_t v876;
  const char *v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  void *v881;
  const char *v882;
  uint64_t v883;
  uint64_t v884;
  uint64_t v885;
  void *v886;
  const char *v887;
  uint64_t v888;
  uint64_t v889;
  void *v890;
  const char *v891;
  uint64_t v892;
  uint64_t v893;
  uint64_t v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  void *v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  void *v903;
  const char *v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  const char *v909;
  uint64_t v910;
  uint64_t v911;
  uint64_t v912;
  void *v913;
  const char *v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  void *v918;
  const char *v919;
  uint64_t v920;
  uint64_t v921;
  void *v922;
  const char *v923;
  uint64_t v924;
  uint64_t v925;
  uint64_t v926;
  uint64_t v927;
  const char *v928;
  uint64_t v929;
  uint64_t v930;
  void *v931;
  const char *v932;
  uint64_t v933;
  uint64_t v934;
  void *v935;
  const char *v936;
  uint64_t v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  const char *v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  void *v945;
  const char *v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  void *v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  void *v954;
  const char *v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  uint64_t v959;
  const char *v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  void *v964;
  const char *v965;
  uint64_t v966;
  uint64_t v967;
  void *v968;
  const char *v969;
  uint64_t v970;
  uint64_t v971;
  uint64_t v972;
  uint64_t v973;
  const char *v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  void *v978;
  const char *v979;
  uint64_t v980;
  uint64_t v981;
  uint64_t v982;
  void *v983;
  const char *v984;
  uint64_t v985;
  uint64_t v986;
  void *v987;
  const char *v988;
  uint64_t v989;
  uint64_t v990;
  uint64_t v991;
  uint64_t v992;
  const char *v993;
  uint64_t v994;
  uint64_t v995;
  void *v996;
  const char *v997;
  uint64_t v998;
  uint64_t v999;
  void *v1000;
  const char *v1001;
  uint64_t v1002;
  uint64_t v1003;
  uint64_t v1004;
  uint64_t v1005;
  const char *v1006;
  uint64_t v1007;
  uint64_t v1008;
  uint64_t v1009;
  void *v1010;
  const char *v1011;
  uint64_t v1012;
  uint64_t v1013;
  uint64_t v1014;
  void *v1015;
  const char *v1016;
  uint64_t v1017;
  uint64_t v1018;
  void *v1019;
  const char *v1020;
  uint64_t v1021;
  uint64_t v1022;
  uint64_t v1023;
  uint64_t v1024;
  const char *v1025;
  uint64_t v1026;
  uint64_t v1027;
  uint64_t v1028;
  void *v1029;
  const char *v1030;
  uint64_t v1031;
  uint64_t v1032;
  void *v1033;
  const char *v1034;
  uint64_t v1035;
  uint64_t v1036;
  uint64_t v1037;
  uint64_t v1038;
  const char *v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  void *v1043;
  const char *v1044;
  uint64_t v1045;
  uint64_t v1046;
  uint64_t v1047;
  void *v1048;
  const char *v1049;
  uint64_t v1050;
  uint64_t v1051;
  void *v1052;
  const char *v1053;
  uint64_t v1054;
  uint64_t v1055;
  uint64_t v1056;
  const char *v1057;
  uint64_t v1058;
  uint64_t v1059;
  uint64_t v1060;
  int v1061;
  const __CFString *v1062;
  uint64_t v1063;

  v1063 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBaseline = objc_msgSend_BOOLForKey_(v6, v7, (uint64_t)CFSTR("IsBaselineRequest"), v8, v9);

  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isBaseline)
      v11 = CFSTR("enabled.");
    else
      v11 = CFSTR("disabled.");
    v1061 = 138412290;
    v1062 = v11;
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_DEFAULT, "Is Baseline Request has been %@", (uint8_t *)&v1061, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isCustomTemplate = objc_msgSend_BOOLForKey_(v16, v17, (uint64_t)CFSTR("EnableRequestedTemplate"), v18, v19);

  APLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isCustomTemplate)
      v21 = CFSTR("enabled.");
    else
      v21 = CFSTR("disabled.");
    v1061 = 138412290;
    v1062 = v21;
    _os_log_impl(&dword_228279000, v20, OS_LOG_TYPE_DEFAULT, "RequestedTemplate has been %@", (uint8_t *)&v1061, 0xCu);
  }

  if (self->_isCustomTemplate)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBool_forKey_(v26, v27, 1, (uint64_t)CFSTR("ToroTestClient"), v28);

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isTest = objc_msgSend_BOOLForKey_(v29, v30, (uint64_t)CFSTR("ToroTestClient"), v31, v32);

  APLogForCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isTest)
      v34 = CFSTR("enabled.");
    else
      v34 = CFSTR("disabled.");
    v1061 = 138412290;
    v1062 = v34;
    _os_log_impl(&dword_228279000, v33, OS_LOG_TYPE_DEFAULT, "Toro Is Test Search Request has been %@", (uint8_t *)&v1061, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isRequestedImage = objc_msgSend_BOOLForKey_(v39, v40, (uint64_t)CFSTR("ToroRequestedImage"), v41, v42);

  APLogForCategory();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isRequestedImage)
      v44 = CFSTR("enabled.");
    else
      v44 = CFSTR("disabled.");
    v1061 = 138412290;
    v1062 = v44;
    _os_log_impl(&dword_228279000, v43, OS_LOG_TYPE_DEFAULT, "Toro requested image ad template has been %@", (uint8_t *)&v1061, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isRequestedRating = objc_msgSend_BOOLForKey_(v49, v50, (uint64_t)CFSTR("ToroRequestedRating"), v51, v52);

  APLogForCategory();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isRequestedRating)
      v54 = CFSTR("enabled.");
    else
      v54 = CFSTR("disabled.");
    v1061 = 138412290;
    v1062 = v54;
    _os_log_impl(&dword_228279000, v53, OS_LOG_TYPE_DEFAULT, "Toro requested rating ad template has been %@", (uint8_t *)&v1061, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v59, v60, (uint64_t)CFSTR("ToroRequestedText"), v61, v62);
  v63 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestedText = self->_requestedText;
  self->_requestedText = v63;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v69, v70, (uint64_t)CFSTR("ToroRequestedIcon"), v71, v72);
  v73 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestedIcon = self->_requestedIcon;
  self->_requestedIcon = v73;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v75, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v79, v80, (uint64_t)CFSTR("ToroTemplateType"), v81, v82);
  v83 = (NSString *)objc_claimAutoreleasedReturnValue();
  templateType = self->_templateType;
  self->_templateType = v83;

  if (MGGetBoolAnswer())
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v89, v90, (uint64_t)CFSTR("MaxFrequencyCapElementsOverride"), v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_length(v93, v94, v95, v96, v97);

    if (v98)
    {
      objc_msgSend_searchSettings(self, v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v108, v109, (uint64_t)CFSTR("MaxFrequencyCapElementsOverride"), v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend_integerValue(v112, v113, v114, v115, v116);
      objc_msgSend_overrideMaxFrequencyCapElements_(v103, v118, v117, v119, v120);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v99, v100, v101, v102);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v121, v122, (uint64_t)CFSTR("FrequencyCapExpirationOverride"), v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend_length(v125, v126, v127, v128, v129);

    if (v130)
    {
      objc_msgSend_searchSettings(self, v131, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v136, v137, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v140, v141, (uint64_t)CFSTR("FrequencyCapExpirationOverride"), v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend_integerValue(v144, v145, v146, v147, v148);
      objc_msgSend_overrideFrequencyCapExpiration_(v135, v150, v151, v152, v153, (double)v149);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v131, v132, v133, v134);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v154, v155, (uint64_t)CFSTR("MaxClickElementsOverride"), v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend_length(v158, v159, v160, v161, v162);

    if (v163)
    {
      objc_msgSend_searchSettings(self, v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v169, v170, v171, v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v173, v174, (uint64_t)CFSTR("MaxClickElementsOverride"), v175, v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = objc_msgSend_integerValue(v177, v178, v179, v180, v181);
      objc_msgSend_overrideMaxClickElements_(v168, v183, v182, v184, v185);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v164, v165, v166, v167);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v186, v187, (uint64_t)CFSTR("ClickExpirationOverride"), v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend_length(v190, v191, v192, v193, v194);

    if (v195)
    {
      objc_msgSend_searchSettings(self, v196, v197, v198, v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v201, v202, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v205, v206, (uint64_t)CFSTR("ClickExpirationOverride"), v207, v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = objc_msgSend_integerValue(v209, v210, v211, v212, v213);
      objc_msgSend_overrideClickExpiration_(v200, v215, v216, v217, v218, (double)v214);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v196, v197, v198, v199);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v219, v220, (uint64_t)CFSTR("ReverseGeolocationThresholdOverride"), v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = objc_msgSend_length(v223, v224, v225, v226, v227);

    if (v228)
    {
      objc_msgSend_searchSettings(self, v229, v230, v231, v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v234, v235, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v238, v239, (uint64_t)CFSTR("ReverseGeolocationThresholdOverride"), v240, v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v242, v243, v244, v245, v246);
      objc_msgSend_overrideRevGeoThreshold_(v233, v247, v248, v249, v250);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v229, v230, v231, v232);
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v251, v252, (uint64_t)CFSTR("SLPMaxFrequencyCapElementsOverride"), v253, v254);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = objc_msgSend_length(v255, v256, v257, v258, v259);

    if (v260)
    {
      objc_msgSend_landingPageSettings(self, v261, v262, v263, v264);
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v270, v271, (uint64_t)CFSTR("SLPMaxFrequencyCapElementsOverride"), v272, v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = objc_msgSend_integerValue(v274, v275, v276, v277, v278);
      objc_msgSend_overrideMaxFrequencyCapElements_(v265, v280, v279, v281, v282);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v261, v262, v263, v264);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v283, v284, (uint64_t)CFSTR("SLPFrequencyCapExpirationOverride"), v285, v286);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = objc_msgSend_length(v287, v288, v289, v290, v291);

    if (v292)
    {
      objc_msgSend_landingPageSettings(self, v293, v294, v295, v296);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v298, v299, v300, v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v302, v303, (uint64_t)CFSTR("SLPFrequencyCapExpirationOverride"), v304, v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = objc_msgSend_integerValue(v306, v307, v308, v309, v310);
      objc_msgSend_overrideFrequencyCapExpiration_(v297, v312, v313, v314, v315, (double)v311);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v293, v294, v295, v296);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v316, v317, (uint64_t)CFSTR("SLPMaxClickElementsOverride"), v318, v319);
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = objc_msgSend_length(v320, v321, v322, v323, v324);

    if (v325)
    {
      objc_msgSend_landingPageSettings(self, v326, v327, v328, v329);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v331, v332, v333, v334);
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v335, v336, (uint64_t)CFSTR("SLPMaxClickElementsOverride"), v337, v338);
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      v344 = objc_msgSend_integerValue(v339, v340, v341, v342, v343);
      objc_msgSend_overrideMaxClickElements_(v330, v345, v344, v346, v347);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v326, v327, v328, v329);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v348, v349, (uint64_t)CFSTR("SLPClickExpirationOverride"), v350, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    v357 = objc_msgSend_length(v352, v353, v354, v355, v356);

    if (v357)
    {
      objc_msgSend_landingPageSettings(self, v358, v359, v360, v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v363, v364, v365, v366);
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v367, v368, (uint64_t)CFSTR("SLPClickExpirationOverride"), v369, v370);
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      v376 = objc_msgSend_integerValue(v371, v372, v373, v374, v375);
      objc_msgSend_overrideClickExpiration_(v362, v377, v378, v379, v380, (double)v376);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v358, v359, v360, v361);
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v381, v382, (uint64_t)CFSTR("SLPReverseGeolocationThresholdOverride"), v383, v384);
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    v390 = objc_msgSend_length(v385, v386, v387, v388, v389);

    if (v390)
    {
      objc_msgSend_landingPageSettings(self, v391, v392, v393, v394);
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v396, v397, v398, v399);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v400, v401, (uint64_t)CFSTR("SLPReverseGeolocationThresholdOverride"), v402, v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v404, v405, v406, v407, v408);
      objc_msgSend_overrideRevGeoThreshold_(v395, v409, v410, v411, v412);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v391, v392, v393, v394);
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v413, v414, (uint64_t)CFSTR("Iris1MaxFrequencyCapElementsOverride"), v415, v416);
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    v422 = objc_msgSend_length(v417, v418, v419, v420, v421);

    if (v422)
    {
      objc_msgSend_iris1Settings(self, v423, v424, v425, v426);
      v427 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v428, v429, v430, v431);
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v432, v433, (uint64_t)CFSTR("Iris1MaxFrequencyCapElementsOverride"), v434, v435);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = objc_msgSend_integerValue(v436, v437, v438, v439, v440);
      objc_msgSend_overrideMaxFrequencyCapElements_(v427, v442, v441, v443, v444);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v423, v424, v425, v426);
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v445, v446, (uint64_t)CFSTR("Iris1FrequencyCapExpirationOverride"), v447, v448);
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    v454 = objc_msgSend_length(v449, v450, v451, v452, v453);

    if (v454)
    {
      objc_msgSend_iris1Settings(self, v455, v456, v457, v458);
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v460, v461, v462, v463);
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v464, v465, (uint64_t)CFSTR("Iris1FrequencyCapExpirationOverride"), v466, v467);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      v473 = objc_msgSend_integerValue(v468, v469, v470, v471, v472);
      objc_msgSend_overrideFrequencyCapExpiration_(v459, v474, v475, v476, v477, (double)v473);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v455, v456, v457, v458);
    v478 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v478, v479, (uint64_t)CFSTR("Iris1MaxClickElementsOverride"), v480, v481);
    v482 = (void *)objc_claimAutoreleasedReturnValue();
    v487 = objc_msgSend_length(v482, v483, v484, v485, v486);

    if (v487)
    {
      objc_msgSend_iris1Settings(self, v488, v489, v490, v491);
      v492 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v493, v494, v495, v496);
      v497 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v497, v498, (uint64_t)CFSTR("Iris1MaxClickElementsOverride"), v499, v500);
      v501 = (void *)objc_claimAutoreleasedReturnValue();
      v506 = objc_msgSend_integerValue(v501, v502, v503, v504, v505);
      objc_msgSend_overrideMaxClickElements_(v492, v507, v506, v508, v509);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v488, v489, v490, v491);
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v510, v511, (uint64_t)CFSTR("Iris1ClickExpirationOverride"), v512, v513);
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    v519 = objc_msgSend_length(v514, v515, v516, v517, v518);

    if (v519)
    {
      objc_msgSend_iris1Settings(self, v520, v521, v522, v523);
      v524 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v525, v526, v527, v528);
      v529 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v529, v530, (uint64_t)CFSTR("Iris1ClickExpirationOverride"), v531, v532);
      v533 = (void *)objc_claimAutoreleasedReturnValue();
      v538 = objc_msgSend_integerValue(v533, v534, v535, v536, v537);
      objc_msgSend_overrideClickExpiration_(v524, v539, v540, v541, v542, (double)v538);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v520, v521, v522, v523);
    v543 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v543, v544, (uint64_t)CFSTR("Iris1ReverseGeolocationThresholdOverride"), v545, v546);
    v547 = (void *)objc_claimAutoreleasedReturnValue();
    v552 = objc_msgSend_length(v547, v548, v549, v550, v551);

    if (v552)
    {
      objc_msgSend_iris1Settings(self, v553, v554, v555, v556);
      v557 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v558, v559, v560, v561);
      v562 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v562, v563, (uint64_t)CFSTR("Iris1ReverseGeolocationThresholdOverride"), v564, v565);
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v566, v567, v568, v569, v570);
      objc_msgSend_overrideRevGeoThreshold_(v557, v571, v572, v573, v574);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v553, v554, v555, v556);
    v575 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v575, v576, (uint64_t)CFSTR("Iris2MaxFrequencyCapElementsOverride"), v577, v578);
    v579 = (void *)objc_claimAutoreleasedReturnValue();
    v584 = objc_msgSend_length(v579, v580, v581, v582, v583);

    if (v584)
    {
      objc_msgSend_iris2Settings(self, v585, v586, v587, v588);
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v590, v591, v592, v593);
      v594 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v594, v595, (uint64_t)CFSTR("Iris2MaxFrequencyCapElementsOverride"), v596, v597);
      v598 = (void *)objc_claimAutoreleasedReturnValue();
      v603 = objc_msgSend_integerValue(v598, v599, v600, v601, v602);
      objc_msgSend_overrideMaxFrequencyCapElements_(v589, v604, v603, v605, v606);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v585, v586, v587, v588);
    v607 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v607, v608, (uint64_t)CFSTR("Iris2FrequencyCapExpirationOverride"), v609, v610);
    v611 = (void *)objc_claimAutoreleasedReturnValue();
    v616 = objc_msgSend_length(v611, v612, v613, v614, v615);

    if (v616)
    {
      objc_msgSend_iris2Settings(self, v617, v618, v619, v620);
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v622, v623, v624, v625);
      v626 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v626, v627, (uint64_t)CFSTR("Iris2FrequencyCapExpirationOverride"), v628, v629);
      v630 = (void *)objc_claimAutoreleasedReturnValue();
      v635 = objc_msgSend_integerValue(v630, v631, v632, v633, v634);
      objc_msgSend_overrideFrequencyCapExpiration_(v621, v636, v637, v638, v639, (double)v635);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v617, v618, v619, v620);
    v640 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v640, v641, (uint64_t)CFSTR("Iris2MaxClickElementsOverride"), v642, v643);
    v644 = (void *)objc_claimAutoreleasedReturnValue();
    v649 = objc_msgSend_length(v644, v645, v646, v647, v648);

    if (v649)
    {
      objc_msgSend_iris2Settings(self, v650, v651, v652, v653);
      v654 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v655, v656, v657, v658);
      v659 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v659, v660, (uint64_t)CFSTR("Iris2MaxClickElementsOverride"), v661, v662);
      v663 = (void *)objc_claimAutoreleasedReturnValue();
      v668 = objc_msgSend_integerValue(v663, v664, v665, v666, v667);
      objc_msgSend_overrideMaxClickElements_(v654, v669, v668, v670, v671);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v650, v651, v652, v653);
    v672 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v672, v673, (uint64_t)CFSTR("Iris2ClickExpirationOverride"), v674, v675);
    v676 = (void *)objc_claimAutoreleasedReturnValue();
    v681 = objc_msgSend_length(v676, v677, v678, v679, v680);

    if (v681)
    {
      objc_msgSend_iris2Settings(self, v682, v683, v684, v685);
      v686 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v687, v688, v689, v690);
      v691 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v691, v692, (uint64_t)CFSTR("Iris2ClickExpirationOverride"), v693, v694);
      v695 = (void *)objc_claimAutoreleasedReturnValue();
      v700 = objc_msgSend_integerValue(v695, v696, v697, v698, v699);
      objc_msgSend_overrideClickExpiration_(v686, v701, v702, v703, v704, (double)v700);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v682, v683, v684, v685);
    v705 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v705, v706, (uint64_t)CFSTR("Iris2ReverseGeolocationThresholdOverride"), v707, v708);
    v709 = (void *)objc_claimAutoreleasedReturnValue();
    v714 = objc_msgSend_length(v709, v710, v711, v712, v713);

    if (v714)
    {
      objc_msgSend_iris2Settings(self, v715, v716, v717, v718);
      v719 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v720, v721, v722, v723);
      v724 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v724, v725, (uint64_t)CFSTR("Iris2ReverseGeolocationThresholdOverride"), v726, v727);
      v728 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v728, v729, v730, v731, v732);
      objc_msgSend_overrideRevGeoThreshold_(v719, v733, v734, v735, v736);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v715, v716, v717, v718);
    v737 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v737, v738, (uint64_t)CFSTR("MetisMaxFrequencyCapElementsOverride"), v739, v740);
    v741 = (void *)objc_claimAutoreleasedReturnValue();
    v746 = objc_msgSend_length(v741, v742, v743, v744, v745);

    if (v746)
    {
      objc_msgSend_metisSettings(self, v747, v748, v749, v750);
      v751 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v752, v753, v754, v755);
      v756 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v756, v757, (uint64_t)CFSTR("MetisMaxFrequencyCapElementsOverride"), v758, v759);
      v760 = (void *)objc_claimAutoreleasedReturnValue();
      v765 = objc_msgSend_integerValue(v760, v761, v762, v763, v764);
      objc_msgSend_overrideMaxFrequencyCapElements_(v751, v766, v765, v767, v768);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v747, v748, v749, v750);
    v769 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v769, v770, (uint64_t)CFSTR("MetisFrequencyCapExpirationOverride"), v771, v772);
    v773 = (void *)objc_claimAutoreleasedReturnValue();
    v778 = objc_msgSend_length(v773, v774, v775, v776, v777);

    if (v778)
    {
      objc_msgSend_metisSettings(self, v779, v780, v781, v782);
      v783 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v784, v785, v786, v787);
      v788 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v788, v789, (uint64_t)CFSTR("MetisFrequencyCapExpirationOverride"), v790, v791);
      v792 = (void *)objc_claimAutoreleasedReturnValue();
      v797 = objc_msgSend_integerValue(v792, v793, v794, v795, v796);
      objc_msgSend_overrideFrequencyCapExpiration_(v783, v798, v799, v800, v801, (double)v797);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v779, v780, v781, v782);
    v802 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v802, v803, (uint64_t)CFSTR("MetisMaxClickElementsOverride"), v804, v805);
    v806 = (void *)objc_claimAutoreleasedReturnValue();
    v811 = objc_msgSend_length(v806, v807, v808, v809, v810);

    if (v811)
    {
      objc_msgSend_metisSettings(self, v812, v813, v814, v815);
      v816 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v817, v818, v819, v820);
      v821 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v821, v822, (uint64_t)CFSTR("MetisMaxClickElementsOverride"), v823, v824);
      v825 = (void *)objc_claimAutoreleasedReturnValue();
      v830 = objc_msgSend_integerValue(v825, v826, v827, v828, v829);
      objc_msgSend_overrideMaxClickElements_(v816, v831, v830, v832, v833);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v812, v813, v814, v815);
    v834 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v834, v835, (uint64_t)CFSTR("MetisClickExpirationOverride"), v836, v837);
    v838 = (void *)objc_claimAutoreleasedReturnValue();
    v843 = objc_msgSend_length(v838, v839, v840, v841, v842);

    if (v843)
    {
      objc_msgSend_metisSettings(self, v844, v845, v846, v847);
      v848 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v849, v850, v851, v852);
      v853 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v853, v854, (uint64_t)CFSTR("MetisClickExpirationOverride"), v855, v856);
      v857 = (void *)objc_claimAutoreleasedReturnValue();
      v862 = objc_msgSend_integerValue(v857, v858, v859, v860, v861);
      objc_msgSend_overrideClickExpiration_(v848, v863, v864, v865, v866, (double)v862);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v844, v845, v846, v847);
    v867 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v867, v868, (uint64_t)CFSTR("MetisReverseGeolocationThresholdOverride"), v869, v870);
    v871 = (void *)objc_claimAutoreleasedReturnValue();
    v876 = objc_msgSend_length(v871, v872, v873, v874, v875);

    if (v876)
    {
      objc_msgSend_metisSettings(self, v877, v878, v879, v880);
      v881 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v882, v883, v884, v885);
      v886 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v886, v887, (uint64_t)CFSTR("MetisReverseGeolocationThresholdOverride"), v888, v889);
      v890 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v890, v891, v892, v893, v894);
      objc_msgSend_overrideRevGeoThreshold_(v881, v895, v896, v897, v898);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v877, v878, v879, v880);
    v899 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v899, v900, (uint64_t)CFSTR("FloraMaxFrequencyCapElementsOverride"), v901, v902);
    v903 = (void *)objc_claimAutoreleasedReturnValue();
    v908 = objc_msgSend_length(v903, v904, v905, v906, v907);

    if (v908)
    {
      objc_msgSend_floraSettings(self, v909, v910, v911, v912);
      v913 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v914, v915, v916, v917);
      v918 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v918, v919, (uint64_t)CFSTR("FloraMaxFrequencyCapElementsOverride"), v920, v921);
      v922 = (void *)objc_claimAutoreleasedReturnValue();
      v927 = objc_msgSend_integerValue(v922, v923, v924, v925, v926);
      objc_msgSend_overrideMaxFrequencyCapElements_(v913, v928, v927, v929, v930);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v909, v910, v911, v912);
    v931 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v931, v932, (uint64_t)CFSTR("FloraFrequencyCapExpirationOverride"), v933, v934);
    v935 = (void *)objc_claimAutoreleasedReturnValue();
    v940 = objc_msgSend_length(v935, v936, v937, v938, v939);

    if (v940)
    {
      objc_msgSend_floraSettings(self, v941, v942, v943, v944);
      v945 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v946, v947, v948, v949);
      v950 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v950, v951, (uint64_t)CFSTR("FloraFrequencyCapExpirationOverride"), v952, v953);
      v954 = (void *)objc_claimAutoreleasedReturnValue();
      v959 = objc_msgSend_integerValue(v954, v955, v956, v957, v958);
      objc_msgSend_overrideFrequencyCapExpiration_(v945, v960, v961, v962, v963, (double)v959);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v941, v942, v943, v944);
    v964 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v964, v965, (uint64_t)CFSTR("FloraMaxClickElementsOverride"), v966, v967);
    v968 = (void *)objc_claimAutoreleasedReturnValue();
    v973 = objc_msgSend_length(v968, v969, v970, v971, v972);

    if (v973)
    {
      objc_msgSend_floraSettings(self, v974, v975, v976, v977);
      v978 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v979, v980, v981, v982);
      v983 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v983, v984, (uint64_t)CFSTR("FloraMaxClickElementsOverride"), v985, v986);
      v987 = (void *)objc_claimAutoreleasedReturnValue();
      v992 = objc_msgSend_integerValue(v987, v988, v989, v990, v991);
      objc_msgSend_overrideMaxClickElements_(v978, v993, v992, v994, v995);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v974, v975, v976, v977);
    v996 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v996, v997, (uint64_t)CFSTR("FloraClickExpirationOverride"), v998, v999);
    v1000 = (void *)objc_claimAutoreleasedReturnValue();
    v1005 = objc_msgSend_length(v1000, v1001, v1002, v1003, v1004);

    if (v1005)
    {
      objc_msgSend_floraSettings(self, v1006, v1007, v1008, v1009);
      v1010 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v1011, v1012, v1013, v1014);
      v1015 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v1015, v1016, (uint64_t)CFSTR("FloraClickExpirationOverride"), v1017, v1018);
      v1019 = (void *)objc_claimAutoreleasedReturnValue();
      v1024 = objc_msgSend_integerValue(v1019, v1020, v1021, v1022, v1023);
      objc_msgSend_overrideClickExpiration_(v1010, v1025, v1026, v1027, v1028, (double)v1024);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v1006, v1007, v1008, v1009);
    v1029 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v1029, v1030, (uint64_t)CFSTR("FloraReverseGeolocationThresholdOverride"), v1031, v1032);
    v1033 = (void *)objc_claimAutoreleasedReturnValue();
    v1038 = objc_msgSend_length(v1033, v1034, v1035, v1036, v1037);

    if (v1038)
    {
      objc_msgSend_floraSettings(self, v1039, v1040, v1041, v1042);
      v1043 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v1044, v1045, v1046, v1047);
      v1048 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForKey_(v1048, v1049, (uint64_t)CFSTR("FloraReverseGeolocationThresholdOverride"), v1050, v1051);
      v1052 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1052, v1053, v1054, v1055, v1056);
      objc_msgSend_overrideRevGeoThreshold_(v1043, v1057, v1058, v1059, v1060);

    }
  }
}

- (ADFCapSettings)metisSettings
{
  return self->_metisSettings;
}

- (ADFCapSettings)landingPageSettings
{
  return self->_landingPageSettings;
}

- (ADFCapSettings)floraSettings
{
  return self->_floraSettings;
}

- (double)locationGridSpacing
{
  return self->_locationGridSpacing;
}

- (void)expireClientSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_clientSettings(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(v9, v5, v6, v7, v8, 0.0);

}

- (NSURL)defaultToroServerURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v5, v6, (uint64_t)CFSTR("ToroAdServerURL"), v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR("https://tr.iadsdk.apple.com/adserver");
  v11 = objc_alloc(MEMORY[0x24BDBCF48]);
  v15 = (void *)objc_msgSend_initWithString_(v11, v12, (uint64_t)v10, v13, v14);

  return (NSURL *)v15;
}

- (NSURL)defaultAdTargetingServerURL
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = objc_alloc(MEMORY[0x24BDBCF48]);
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v7, v8, (uint64_t)CFSTR("TargetingAdServerURL"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithString_(v2, v12, (uint64_t)v11, v13, v14);

  return (NSURL *)v15;
}

- (double)clientSettingsExpirationDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;

  objc_msgSend_clientSettings(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expirationDate(v5, v6, v7, v8, v9);
  v11 = v10;

  return v11;
}

- (void)setDefaultToroServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultToroServerURL, a3);
}

- (void)setDefaultAdTargetingServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAdTargetingServerURL, a3);
}

- (NSString)algoID
{
  return self->_algoID;
}

- (void)setAlgoID:(id)a3
{
  objc_storeStrong((id *)&self->_algoID, a3);
}

- (NSArray)userKeyboards
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserKeyboards:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setRequestedLocationAccuracy:(double)a3
{
  self->_requestedLocationAccuracy = a3;
}

- (void)setLocationGridSpacing:(double)a3
{
  self->_locationGridSpacing = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (BOOL)isBaseline
{
  return self->_isBaseline;
}

- (void)setIsBaseline:(BOOL)a3
{
  self->_isBaseline = a3;
}

- (BOOL)isCustomTemplate
{
  return self->_isCustomTemplate;
}

- (void)setIsCustomTemplate:(BOOL)a3
{
  self->_isCustomTemplate = a3;
}

- (BOOL)isRequestedImage
{
  return self->_isRequestedImage;
}

- (void)setIsRequestedImage:(BOOL)a3
{
  self->_isRequestedImage = a3;
}

- (BOOL)isRequestedRating
{
  return self->_isRequestedRating;
}

- (void)setIsRequestedRating:(BOOL)a3
{
  self->_isRequestedRating = a3;
}

- (NSString)requestedText
{
  return self->_requestedText;
}

- (void)setRequestedText:(id)a3
{
  objc_storeStrong((id *)&self->_requestedText, a3);
}

- (NSString)requestedIcon
{
  return self->_requestedIcon;
}

- (void)setRequestedIcon:(id)a3
{
  objc_storeStrong((id *)&self->_requestedIcon, a3);
}

- (NSString)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(id)a3
{
  objc_storeStrong((id *)&self->_templateType, a3);
}

- (void)setSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchSettings, a3);
}

- (void)setLandingPageSettings:(id)a3
{
  objc_storeStrong((id *)&self->_landingPageSettings, a3);
}

- (void)setIris1Settings:(id)a3
{
  objc_storeStrong((id *)&self->_iris1Settings, a3);
}

- (void)setIris2Settings:(id)a3
{
  objc_storeStrong((id *)&self->_iris2Settings, a3);
}

- (void)setMetisSettings:(id)a3
{
  objc_storeStrong((id *)&self->_metisSettings, a3);
}

- (void)setFloraSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floraSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_floraSettings, 0);
  objc_storeStrong((id *)&self->_metisSettings, 0);
  objc_storeStrong((id *)&self->_iris2Settings, 0);
  objc_storeStrong((id *)&self->_iris1Settings, 0);
  objc_storeStrong((id *)&self->_landingPageSettings, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
  objc_storeStrong((id *)&self->_requestedIcon, 0);
  objc_storeStrong((id *)&self->_requestedText, 0);
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_algoID, 0);
  objc_storeStrong((id *)&self->_defaultAdTargetingServerURL, 0);
  objc_storeStrong((id *)&self->_defaultToroServerURL, 0);
}

@end
