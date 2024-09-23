@implementation WFWidgetConfigurationRequest

- (WFWidgetConfigurationRequest)initWithOptions:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  WFWidgetConfigurationRequest *v60;
  NSObject *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  double v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  WFWidgetConfigurationRequest *v79;
  id v80[2];
  _BYTE buf[12];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWidgetConfigurationRequest.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v79 = self;
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDC1558];
    objc_msgSend(v5, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "intent");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      objc_msgSend(v12, "extensionBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x24BDC1528]);
        objc_msgSend(v9, "extensionBundleId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v11 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:error:", v15, buf);
        v16 = *(id *)buf;

      }
      else
      {
        v16 = 0;
        v11 = 0;
      }
      objc_msgSend(v11, "intentDefinitionURLs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (!v18)
      {
        objc_msgSend(v9, "launchId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v80[1] = 0;
        INExtractAppInfoFromSiriLaunchId();
        v20 = 0;

        v80[0] = v16;
        v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v20, 0, v80);
        v22 = v80[0];

        v16 = v22;
        v11 = (void *)v21;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  v78 = v11;
  objc_msgSend(v11, "bundleIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x24BEB0B58]);
  v77 = (void *)v23;
  objc_msgSend(v24, "previewMetricsSpecificationForBundleIdentifier:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "metricsForFamily:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "size");
    v29 = v28;
LABEL_16:
    v30 = ceil(v29 * 0.7);
    goto LABEL_17;
  }
  getWFWidgetConfigurationLogObject();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "WFWidgetConfiugrationRequestDefaultCardSizeForBundleIdentifier";
    _os_log_impl(&dword_20CE0F000, v62, OS_LOG_TYPE_FAULT, "%s Cannot load the widget metrics from SpringBoard Services", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bounds");
  v65 = v64;
  v67 = v66;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "traitCollection");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "userInterfaceIdiom");

  if (v70)
  {
    if (v70 == 1)
    {
      if (fmax(v65, v67) <= 1024.0)
      {
LABEL_30:
        v30 = 230.0;
        v29 = 329.0;
        goto LABEL_17;
      }
      goto LABEL_40;
    }
    v30 = 300.0;
    v29 = 400.0;
  }
  else
  {
    v71 = fmax(v67, v65);
    if (v71 >= 926.0)
    {
LABEL_40:
      v30 = 255.0;
      v29 = 364.0;
      goto LABEL_17;
    }
    if (v71 >= 896.0)
    {
      v30 = 252.0;
      v29 = 360.0;
    }
    else if (v71 >= 844.0)
    {
      v30 = 237.0;
      v29 = 338.0;
    }
    else
    {
      if (v71 >= 812.0)
        goto LABEL_30;
      if (v71 >= 736.0)
      {
        v30 = 244.0;
        v29 = 348.0;
      }
      else
      {
        v30 = 205.0;
        v29 = 292.0;
        if (v71 < 693.0)
        {
          if (v71 >= 667.0)
          {
            v30 = 225.0;
            v29 = 321.0;
          }
          else if (v71 < 568.0)
          {
            v29 = fmin(v67, v65) + -28.0;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:

  objc_msgSend(v5, "intent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = objc_opt_isKindOfClass();

  if ((v32 & 1) != 0)
  {
    v33 = (void *)MEMORY[0x24BDC1558];
    objc_msgSend(v5, "intent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "extensionBundleId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v35, 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "intent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_codableDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizationBundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
LABEL_23:
      v75 = 0;
      v76 = 0;
      goto LABEL_24;
    }
    v40 = (void *)MEMORY[0x24BDC1558];
    objc_msgSend(v5, "intent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_codableDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizationBundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v41, 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v36)
    goto LABEL_23;
  v42 = objc_alloc(MEMORY[0x24BDD17B8]);
  v76 = v36;
  objc_msgSend(v36, "URL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v42, "initWithURL:readonly:", v43, 1);

LABEL_24:
  objc_msgSend(v5, "intent");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v5, "family");
  v45 = objc_msgSend(v5, "widgetConfigurationStyle");
  v46 = objc_msgSend(v5, "widgetConfigurationType");
  objc_msgSend(v5, "initialConfigurationCardViewFrame");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  objc_msgSend(v5, "widgetDisplayName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetDescription");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteDeviceIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteAppLocalizedName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteAppIcon");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v73) = 1;
  v60 = -[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](v79, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v44, v77, v75, 0, v74, v45, v29, v30, v48, v50, v52, v54, v46, v55, v56,
          v73,
          v57,
          v58,
          v59);

  return v60;
}

- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 usesWidgetAccentColor:(BOOL)a14 remoteDeviceIdentifier:(id)a15 remoteAppLocalizedName:(id)a16 remoteAppIcon:(id)a17
{
  double height;
  double width;
  double y;
  double x;
  double v24;
  double v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v36;
  void *v37;
  id v38;
  WFWidgetConfigurationRequest *v41;
  id v42;
  id v43;
  id v44;
  id v45[2];

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v24 = a10.height;
  v25 = a10.width;
  v43 = a3;
  v42 = a4;
  v38 = a5;
  v27 = a6;
  v28 = a12;
  v29 = a13;
  v30 = a15;
  v31 = a16;
  v32 = a17;
  v37 = v27;
  if (v27)
  {
    objc_msgSend(v27, "url");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "startAccessingSecurityScopedResource");
    v44 = 0;
    v45[0] = 0;
    WFWidgetColorsFromBundle((uint64_t)v33, v45, &v44);
    v34 = v45[0];
    v27 = v44;
    objc_msgSend(v33, "stopAccessingSecurityScopedResource");

  }
  else
  {
    v34 = 0;
  }
  LOBYTE(v36) = a14;
  v41 = -[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](self, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v43, v42, v38, v37, a7, a8, v25, v24, x, y, width, height, a9, v28, v29,
          v34,
          v27,
          v36,
          v30,
          v31,
          v32);

  return v41;
}

- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 widgetPrimaryColor:(id)a14 widgetTintColor:(id)a15 usesWidgetAccentColor:(BOOL)a16 remoteDeviceIdentifier:(id)a17 remoteAppLocalizedName:(id)a18 remoteAppIcon:(id)a19
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v26;
  CGFloat v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  WFWidgetConfigurationRequest *v33;
  WFWidgetConfigurationRequest *v34;
  id v35;
  uint64_t v36;
  NSString *bundleIdentifier;
  uint64_t v38;
  NSString *widgetDisplayName;
  uint64_t v40;
  NSString *widgetDescription;
  uint64_t v42;
  NSString *remoteDeviceIdentifier;
  uint64_t v44;
  NSString *remoteAppLocalizedName;
  uint64_t v46;
  WFImage *remoteAppIcon;
  INIntent *remoteLocalizedIntent;
  NSString *remoteLanguageCode;
  double *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  WFWidgetConfigurationRequest *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v65;
  id v66;
  id v69;
  id v70;
  id v71;
  id v72;
  id v74;
  void *v75;
  id v76;
  id v77;
  objc_super v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v26 = a10.height;
  v27 = a10.width;
  v83 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v28 = a4;
  v65 = a5;
  v71 = a5;
  v66 = a6;
  v70 = a6;
  v29 = a12;
  v77 = a13;
  v69 = a14;
  v76 = a15;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v78.receiver = self;
  v78.super_class = (Class)WFWidgetConfigurationRequest;
  v33 = -[WFWidgetConfigurationRequest init](&v78, sel_init);
  v34 = v33;
  v75 = v31;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_intent, a3);
    v35 = v28;
    v36 = objc_msgSend(v28, "copy");
    bundleIdentifier = v34->_bundleIdentifier;
    v34->_bundleIdentifier = (NSString *)v36;

    objc_storeStrong((id *)&v34->_intentLocalizationTableBundleURL, v65);
    objc_storeStrong((id *)&v34->_widgetBundleScopedURL, v66);
    v34->_family = a7;
    v34->_widgetConfigurationStyle = a8;
    v34->_widgetConfigurationType = a9;
    v34->_defaultCardSize.width = v27;
    v34->_defaultCardSize.height = v26;
    v34->_initialCardFrame.origin.x = x;
    v34->_initialCardFrame.origin.y = y;
    v34->_initialCardFrame.size.width = width;
    v34->_initialCardFrame.size.height = height;
    v38 = objc_msgSend(v29, "copy");
    widgetDisplayName = v34->_widgetDisplayName;
    v34->_widgetDisplayName = (NSString *)v38;

    v40 = objc_msgSend(v77, "copy");
    widgetDescription = v34->_widgetDescription;
    v34->_widgetDescription = (NSString *)v40;

    objc_storeStrong((id *)&v34->_widgetPrimaryColor, a14);
    objc_storeStrong((id *)&v34->_widgetTintColor, a15);
    v34->_usesWidgetAccentColor = a16;
    v74 = v30;
    v42 = objc_msgSend(v30, "copy");
    remoteDeviceIdentifier = v34->_remoteDeviceIdentifier;
    v34->_remoteDeviceIdentifier = (NSString *)v42;

    v44 = objc_msgSend(v31, "copy");
    remoteAppLocalizedName = v34->_remoteAppLocalizedName;
    v34->_remoteAppLocalizedName = (NSString *)v44;

    v46 = objc_msgSend(v32, "copy");
    remoteAppIcon = v34->_remoteAppIcon;
    v34->_remoteAppIcon = (WFImage *)v46;

    remoteLocalizedIntent = v34->_remoteLocalizedIntent;
    v34->_remoteLocalizedIntent = 0;

    remoteLanguageCode = v34->_remoteLanguageCode;
    v34->_remoteLanguageCode = 0;

    v50 = (double *)MEMORY[0x24BDBF148];
    v51 = v29;
    if (v34->_intent
      && (v34->_bundleIdentifier || v34->_remoteDeviceIdentifier)
      && (v34->_defaultCardSize.width != *MEMORY[0x24BDBF148]
       || v34->_defaultCardSize.height != *(double *)(MEMORY[0x24BDBF148] + 8)))
    {
      v60 = v72;
      v61 = v69;
      v56 = v35;
      if (!v34->_family)
      {
        getWFWidgetConfigurationLogObject();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v80 = "-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBu"
                "ndleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:w"
                "idgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDevice"
                "Identifier:remoteAppLocalizedName:remoteAppIcon:]";
          _os_log_impl(&dword_20CE0F000, v62, OS_LOG_TYPE_DEBUG, "%s Widget Configuration UI was requested with undefined widget family", buf, 0xCu);
        }

      }
      v59 = v34;
      v55 = v70;
      v54 = v71;
    }
    else
    {
      v52 = (void *)objc_opt_new();
      v53 = v52;
      v55 = v70;
      v54 = v71;
      if (!v34->_intent)
        objc_msgSend(v52, "addObject:", CFSTR("Intent"));
      if (!v34->_bundleIdentifier)
        objc_msgSend(v53, "addObject:", CFSTR("Bundle Identifier"));
      v56 = v35;
      if (v34->_defaultCardSize.width == *v50 && v34->_defaultCardSize.height == v50[1])
        objc_msgSend(v53, "addObject:", CFSTR("Default Card Size"));
      getWFWidgetConfigurationLogObject();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR(", "));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v80 = "-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBund"
              "leScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widge"
              "tDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdenti"
              "fier:remoteAppLocalizedName:remoteAppIcon:]";
        v81 = 2114;
        v82 = v58;
        _os_log_impl(&dword_20CE0F000, v57, OS_LOG_TYPE_FAULT, "%s Invalid Widget Configuration Request with invalid %{public}@", buf, 0x16u);

        v30 = v74;
      }

      v59 = 0;
      v60 = v72;
      v61 = v69;
    }
  }
  else
  {
    v59 = 0;
    v54 = v71;
    v60 = v72;
    v56 = v28;
    v55 = v70;
    v51 = v29;
    v61 = v69;
  }

  return v59;
}

- (id)fallbackDisplayName
{
  __CFString *v2;

  if (-[WFWidgetConfigurationRequest widgetConfigurationType](self, "widgetConfigurationType") == 1)
    v2 = CFSTR("Control");
  else
    v2 = CFSTR("Widget");
  WFLocalizedStringFromTable(v2, CFSTR("WidgetConfiguration"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)resolvedWidgetConfigurationStyle
{
  if (-[WFWidgetConfigurationRequest widgetConfigurationStyle](self, "widgetConfigurationStyle"))
    return -[WFWidgetConfigurationRequest widgetConfigurationStyle](self, "widgetConfigurationStyle");
  -[WFWidgetConfigurationRequest family](self, "family");
  if (CHSWidgetFamilyIsAccessory())
    return 2;
  else
    return 1;
}

- (UIColor)widgetTintColor
{
  UIColor *v3;

  if (-[WFWidgetConfigurationRequest usesWidgetAccentColor](self, "usesWidgetAccentColor"))
    v3 = self->_widgetTintColor;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isWidgetExtensionInformationLoaded
{
  void *v2;
  BOOL v3;

  -[WFWidgetConfigurationRequest widgetBundleScopedURL](self, "widgetBundleScopedURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[WFWidgetConfigurationRequest intent](self, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_intents_bundleIdForLaunching");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFWidgetConfigurationRequest intentLocalizationTableBundleURL](self, "intentLocalizationTableBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAccessingSecurityScopedResource");

  v5.receiver = self;
  v5.super_class = (Class)WFWidgetConfigurationRequest;
  -[WFWidgetConfigurationRequest dealloc](&v5, sel_dealloc);
}

- (void)loadWidgetExtensionInformationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  WFShortcutsWidgetConfigurationIntent *v6;
  WFShortcutsSmallWidgetConfigurationIntent *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSSecurityScopedURLWrapper *widgetBundleScopedURL;
  void *v35;
  UIColor *v36;
  UIColor *v37;
  UIColor *widgetPrimaryColor;
  UIColor *v39;
  UIColor *widgetTintColor;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void (**v47)(id, _QWORD);
  WFWidgetConfigurationRequest *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (-[WFWidgetConfigurationRequest isWidgetExtensionInformationLoaded](self, "isWidgetExtensionInformationLoaded"))
    goto LABEL_6;
  -[WFWidgetConfigurationRequest intent](self, "intent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(WFShortcutsWidgetConfigurationIntent);
  v7 = objc_alloc_init(WFShortcutsSmallWidgetConfigurationIntent);
  softLinkDOCCreateDefaultHomeScreenWidgetIntent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_className");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
    goto LABEL_5;
  v48 = self;
  objc_msgSend(v5, "_className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v14) & 1) != 0)
  {

LABEL_5:
LABEL_6:
    v4[2](v4, 0);
    goto LABEL_7;
  }
  objc_msgSend(v5, "_className");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v47 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v15, "isEqualToString:", v17);

  v4 = v47;
  if ((v46 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDDA2D0], "sharedProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationRequest intent](v48, "intent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptorForIntent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "extensionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    -[WFWidgetConfigurationRequest intent](v48, "intent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[WFWidgetConfigurationRequest intent](v48, "intent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_asMigratedAppIntent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v25, "extensionBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          objc_msgSend(v25, "launchId");
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v28;

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }
  v51 = 0;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v21, &v51);
  v30 = v51;
  if (v29)
  {
    v31 = objc_alloc(MEMORY[0x24BDD17B8]);
    objc_msgSend(v29, "URL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithURL:readonly:", v32, 1);
    widgetBundleScopedURL = v48->_widgetBundleScopedURL;
    v48->_widgetBundleScopedURL = (NSSecurityScopedURLWrapper *)v33;

    objc_msgSend(v29, "URL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v50 = 0;
    WFWidgetColorsFromBundle((uint64_t)v35, &v50, &v49);
    v36 = (UIColor *)v50;
    v37 = (UIColor *)v49;

    widgetPrimaryColor = v48->_widgetPrimaryColor;
    v48->_widgetPrimaryColor = v36;
    v39 = v36;

    widgetTintColor = v48->_widgetTintColor;
    v48->_widgetTintColor = v37;

    v41 = 0;
  }
  else
  {
    v42 = objc_alloc(MEMORY[0x24BDBCED8]);
    v43 = *MEMORY[0x24BDD0FC8];
    v52[0] = *MEMORY[0x24BDD0FD8];
    v52[1] = v43;
    v53[0] = CFSTR("Widget Extension Not found");
    v53[1] = CFSTR("The associated Widget Extension is not found.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v42, "initWithDictionary:", v44);

    objc_msgSend(v45, "if_setObjectIfNonNil:forKey:", v30, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, v45);
    v41 = objc_claimAutoreleasedReturnValue();
    v39 = (UIColor *)v41;
    v30 = v45;
  }
  v4 = v47;
  v47[2](v47, v41);

LABEL_7:
}

- (void)startAccessingSecurityScopedBundleResource
{
  void *v2;
  id v3;

  -[WFWidgetConfigurationRequest intentLocalizationTableBundleURL](self, "intentLocalizationTableBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAccessingSecurityScopedResource");

}

- (WFWidgetConfigurationRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFWidgetConfigurationRequest *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedIntentWithIntent();
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentLocalizationTableBundleURL"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetBundleScopedURL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("family"));
  v26 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("widgetConfigurationStyle"));
  v24 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("widgetConfigurationType"));
  v34 = *MEMORY[0x24BDBF148];
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultCardSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "getValue:size:", &v34, 16);
  v8 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v32 = *MEMORY[0x24BDBF070];
  v33 = v8;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialCardFrame"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "getValue:size:", &v32, 32);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetDescription"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetDisplayName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("usesWidgetAccentColor"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteAppLocalizedName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteAppIcon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteLocalizedIntent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedIntentWithIntent();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteLanguageCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = v12;
  v18 = objc_retain(-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](self, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v31, v30, v29, v28, v27, v26, v34, v32, v33, v24, v22, v23, v20, v13,
            v21,
            v14));
  -[WFWidgetConfigurationRequest setRemoteLocalizedIntent:](v18, "setRemoteLocalizedIntent:", v16);
  -[WFWidgetConfigurationRequest setRemoteLanguageCode:](v18, "setRemoteLanguageCode:", v17);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  INIntentWithTypedIntent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("intent"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_intentLocalizationTableBundleURL, CFSTR("intentLocalizationTableBundleURL"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_widgetBundleScopedURL, CFSTR("widgetBundleScopedURL"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_widgetConfigurationStyle, CFSTR("widgetConfigurationStyle"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_widgetConfigurationType, CFSTR("widgetConfigurationType"));
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &self->_defaultCardSize, "{CGSize=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("defaultCardSize"));

  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &self->_initialCardFrame, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("initialCardFrame"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_widgetDisplayName, CFSTR("widgetDisplayName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_widgetDescription, CFSTR("widgetDescription"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_usesWidgetAccentColor, CFSTR("usesWidgetAccentColor"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_remoteDeviceIdentifier, CFSTR("remoteDeviceIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_remoteAppLocalizedName, CFSTR("remoteAppLocalizedName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_remoteAppIcon, CFSTR("remoteAppIcon"));
  INIntentWithTypedIntent();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("remoteLocalizedIntent"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_remoteLanguageCode, CFSTR("remoteLanguageCode"));
}

- (INIntent)intent
{
  return self->_intent;
}

- (int64_t)family
{
  return self->_family;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (unint64_t)widgetConfigurationType
{
  return self->_widgetConfigurationType;
}

- (CGSize)defaultCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultCardSize.width;
  height = self->_defaultCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)initialCardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialCardFrame.origin.x;
  y = self->_initialCardFrame.origin.y;
  width = self->_initialCardFrame.size.width;
  height = self->_initialCardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)widgetDisplayName
{
  return self->_widgetDisplayName;
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (UIColor)widgetPrimaryColor
{
  return self->_widgetPrimaryColor;
}

- (BOOL)usesWidgetAccentColor
{
  return self->_usesWidgetAccentColor;
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (NSString)remoteAppLocalizedName
{
  return self->_remoteAppLocalizedName;
}

- (WFImage)remoteAppIcon
{
  return self->_remoteAppIcon;
}

- (INIntent)remoteLocalizedIntent
{
  return self->_remoteLocalizedIntent;
}

- (void)setRemoteLocalizedIntent:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLocalizedIntent, a3);
}

- (NSString)remoteLanguageCode
{
  return self->_remoteLanguageCode;
}

- (void)setRemoteLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSSecurityScopedURLWrapper)intentLocalizationTableBundleURL
{
  return self->_intentLocalizationTableBundleURL;
}

- (NSSecurityScopedURLWrapper)widgetBundleScopedURL
{
  return self->_widgetBundleScopedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBundleScopedURL, 0);
  objc_storeStrong((id *)&self->_intentLocalizationTableBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteLanguageCode, 0);
  objc_storeStrong((id *)&self->_remoteLocalizedIntent, 0);
  objc_storeStrong((id *)&self->_remoteAppIcon, 0);
  objc_storeStrong((id *)&self->_remoteAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetPrimaryColor, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_widgetDisplayName, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_widgetTintColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
