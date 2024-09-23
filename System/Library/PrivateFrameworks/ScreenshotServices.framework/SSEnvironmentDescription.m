@implementation SSEnvironmentDescription

- (SSEnvironmentDescription)init
{
  SSEnvironmentDescription *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  void *v6;
  uint64_t v7;
  NSString *sessionIdentifier;
  uint64_t v9;
  NSDate *date;
  NSArray *elements;
  SSUIServiceOptions *v12;
  SSUIServiceOptions *serviceOptions;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SSEnvironmentDescription;
  v2 = -[SSEnvironmentDescription init](&v15, sel_init);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();
  identifier = v2->_identifier;
  v2->_identifier = (NSString *)v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  sessionIdentifier = v2->_sessionIdentifier;
  v2->_sessionIdentifier = (NSString *)v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  date = v2->_date;
  v2->_date = (NSDate *)v9;

  elements = v2->_elements;
  v2->_elements = (NSArray *)MEMORY[0x24BDBD1A8];

  v12 = objc_alloc_init(SSUIServiceOptions);
  serviceOptions = v2->_serviceOptions;
  v2->_serviceOptions = v12;

  -[SSUIServiceOptions setFlashStyle:](v2->_serviceOptions, "setFlashStyle:", 0);
  -[SSUIServiceOptions setSaveLocation:](v2->_serviceOptions, "setSaveLocation:", 0);
  return v2;
}

- (void)takeElementsFromDisplayLayout:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SSEnvironmentElement *v11;
  NSArray *elements;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "elements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[SSEnvironmentElement initWithDisplayLayoutElement:]([SSEnvironmentElement alloc], "initWithDisplayLayoutElement:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  elements = self->_elements;
  self->_elements = v5;

}

- (void)setDebugElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SSEnvironmentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSEnvironmentDescriptionIdentifier"));

  -[SSEnvironmentDescription elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v6, CFSTR("SSEnvironmentDescriptionElements"));

  -[SSEnvironmentDescription imageSurface](self, "imageSurface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SSEnvironmentDescriptionImageSurface"));

  -[SSEnvironmentDescription imagePixelSize](self, "imagePixelSize");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("SSEnvironmentDescriptionImagePixelSize"));
  -[SSEnvironmentDescription imageScale](self, "imageScale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SSEnvironmentDescriptionImageScale"));
  -[SSEnvironmentDescription sessionIdentifier](self, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("SSEnvironmentDescriptionSessionIdentifier"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SSEnvironmentDescription presentationMode](self, "presentationMode"), CFSTR("SSEnvironmentDescriptionPresentationMode"));
  -[SSEnvironmentDescription serviceOptions](self, "serviceOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SSEnvironmentDescriptionServiceOptions"));

  -[SSEnvironmentDescription appleInternalOptions](self, "appleInternalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SSEnvironmentDescriptionAppleInternalOptions"));

  -[SSEnvironmentDescription date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("SSEnvironmentDescriptionDate"));

  -[SSEnvironmentDescription betaApplicationBundleID](self, "betaApplicationBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("SSEnvironmentDescriptionBetaApplicationBundleID"));

  -[SSEnvironmentDescription betaApplicationName](self, "betaApplicationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("SSEnvironmentDescriptionBetaApplicationName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription canAutosaveToFiles](self, "canAutosaveToFiles"), CFSTR("SSEnvironmentDescriptionCanAutosaveToFilesKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription skipShutterSound](self, "skipShutterSound"), CFSTR("SSEnvironmentDescriptionSkipShutterSoundKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SSEnvironmentDescription hasOnenessScreen](self, "hasOnenessScreen"), CFSTR("SSEnvironmentDescriptionHasOnenessScreenKey"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSEnvironmentDescription externalFlashLayerRenderID](self, "externalFlashLayerRenderID"), CFSTR("SSEnvironmentDescriptionExternalFlashLayerRenderIDKey"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSEnvironmentDescription externalFlashLayerContextID](self, "externalFlashLayerContextID"), CFSTR("SSEnvironmentDescriptionExternalFlashLayerContextIDKey"));
  -[SSEnvironmentDescription harvestedMetadata](self, "harvestedMetadata");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v14, CFSTR("SSEnvironmentDescriptionHarvestedMetadataKey"));

}

- (SSEnvironmentDescription)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSEnvironmentDescription *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  uint64_t v9;
  NSArray *elements;
  uint64_t v11;
  SSImageSurface *imageSurface;
  CGFloat v13;
  CGFloat v14;
  double v15;
  uint64_t v16;
  NSString *sessionIdentifier;
  uint64_t v18;
  SSUIServiceOptions *serviceOptions;
  uint64_t v20;
  SSEnvironmentDescriptionAppleInternalOptions *appleInternalOptions;
  uint64_t v22;
  NSDate *date;
  uint64_t v24;
  NSString *betaApplicationBundleID;
  uint64_t v26;
  NSString *betaApplicationName;
  uint64_t v28;
  uint64_t v29;
  NSArray *harvestedMetadata;

  v4 = a3;
  v5 = -[SSEnvironmentDescription init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("SSEnvironmentDescriptionElements"));
  v9 = objc_claimAutoreleasedReturnValue();
  elements = v5->_elements;
  v5->_elements = (NSArray *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionImageSurface"));
  v11 = objc_claimAutoreleasedReturnValue();
  imageSurface = v5->_imageSurface;
  v5->_imageSurface = (SSImageSurface *)v11;

  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("SSEnvironmentDescriptionImagePixelSize"));
  v5->_imagePixelSize.width = v13;
  v5->_imagePixelSize.height = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SSEnvironmentDescriptionImageScale"));
  v5->_imageScale = v15;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionSessionIdentifier"));
  v16 = objc_claimAutoreleasedReturnValue();
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v16;

  v5->_presentationMode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSEnvironmentDescriptionPresentationMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionServiceOptions"));
  v18 = objc_claimAutoreleasedReturnValue();
  serviceOptions = v5->_serviceOptions;
  v5->_serviceOptions = (SSUIServiceOptions *)v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionAppleInternalOptions"));
  v20 = objc_claimAutoreleasedReturnValue();
  appleInternalOptions = v5->_appleInternalOptions;
  v5->_appleInternalOptions = (SSEnvironmentDescriptionAppleInternalOptions *)v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionDate"));
  v22 = objc_claimAutoreleasedReturnValue();
  date = v5->_date;
  v5->_date = (NSDate *)v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionBetaApplicationBundleID"));
  v24 = objc_claimAutoreleasedReturnValue();
  betaApplicationBundleID = v5->_betaApplicationBundleID;
  v5->_betaApplicationBundleID = (NSString *)v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionBetaApplicationName"));
  v26 = objc_claimAutoreleasedReturnValue();
  betaApplicationName = v5->_betaApplicationName;
  v5->_betaApplicationName = (NSString *)v26;

  v5->_canAutosaveToFiles = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SSEnvironmentDescriptionCanAutosaveToFilesKey"));
  v5->_skipShutterSound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SSEnvironmentDescriptionSkipShutterSoundKey"));
  v5->_hasOnenessScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SSEnvironmentDescriptionHasOnenessScreenKey"));
  v5->_externalFlashLayerRenderID = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("SSEnvironmentDescriptionExternalFlashLayerRenderIDKey"));
  v5->_externalFlashLayerContextID = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("SSEnvironmentDescriptionExternalFlashLayerContextIDKey"));
  v28 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v28, objc_opt_class(), CFSTR("SSEnvironmentDescriptionHarvestedMetadataKey"));
  v29 = objc_claimAutoreleasedReturnValue();

  harvestedMetadata = v5->_harvestedMetadata;
  v5->_harvestedMetadata = (NSArray *)v29;

  return v5;
}

- (NSString)loggableDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGSize v47;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shorterLoggableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("identifier: %@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription imagePixelSize](self, "imagePixelSize");
  NSStringFromCGSize(v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("pixelSize: %@ "), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription imageScale](self, "imageScale");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("scale: %f "), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription sessionIdentifier](self, "sessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shorterLoggableString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("sessionIdentifier: %@ "), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v17);

  objc_msgSend(v3, "appendString:", CFSTR("elements: ["));
  v18 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription betaApplicationBundleID](self, "betaApplicationBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("beta app bundleID: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v20);

  v21 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentDescription betaApplicationName](self, "betaApplicationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("beta app name: %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v23);

  v24 = (void *)MEMORY[0x24BDD17C8];
  if (-[SSEnvironmentDescription canAutosaveToFiles](self, "canAutosaveToFiles"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("can autosave to files: %@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  if (-[SSEnvironmentDescription skipShutterSound](self, "skipShutterSound"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v27, "stringWithFormat:", CFSTR("skip shutter sound: %@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v29);

  v30 = (void *)MEMORY[0x24BDD17C8];
  if (-[SSEnvironmentDescription hasOnenessScreen](self, "hasOnenessScreen"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  objc_msgSend(v30, "stringWithFormat:", CFSTR("has oneness screen: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v32);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[SSEnvironmentDescription elements](self, "elements");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v37);
        objc_msgSend(v3, "appendString:", CFSTR("<"));
        objc_msgSend(v38, "loggableDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v39);

        objc_msgSend(v3, "appendString:", CFSTR(">"));
        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v35);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return (NSString *)v3;
}

- (CGSize)imagePointSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SSEnvironmentDescription imagePixelSize](self, "imagePixelSize");
  v4 = v3;
  v6 = v5;
  -[SSEnvironmentDescription imageScale](self, "imageScale");
  v8 = v6 / v7;
  v9 = v4 / v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (NSString)currentApplicationBundleID
{
  void *v2;
  void *v3;
  void *v4;

  -[SSEnvironmentDescription elements](self, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BSSettings)bsSettings
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", self, 1);
  return (BSSettings *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)elements
{
  return self->_elements;
}

- (SSImageSurface)imageSurface
{
  return self->_imageSurface;
}

- (void)setImageSurface:(id)a3
{
  objc_storeStrong((id *)&self->_imageSurface, a3);
}

- (CGSize)imagePixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imagePixelSize.width;
  height = self->_imagePixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImagePixelSize:(CGSize)a3
{
  self->_imagePixelSize = a3;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SSUIServiceOptions)serviceOptions
{
  return self->_serviceOptions;
}

- (void)setServiceOptions:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOptions, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)externalFlashLayerRenderID
{
  return self->_externalFlashLayerRenderID;
}

- (void)setExternalFlashLayerRenderID:(unint64_t)a3
{
  self->_externalFlashLayerRenderID = a3;
}

- (unsigned)externalFlashLayerContextID
{
  return self->_externalFlashLayerContextID;
}

- (void)setExternalFlashLayerContextID:(unsigned int)a3
{
  self->_externalFlashLayerContextID = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SSEnvironmentDescriptionAppleInternalOptions)appleInternalOptions
{
  return self->_appleInternalOptions;
}

- (void)setAppleInternalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_appleInternalOptions, a3);
}

- (NSString)betaApplicationBundleID
{
  return self->_betaApplicationBundleID;
}

- (void)setBetaApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)betaApplicationName
{
  return self->_betaApplicationName;
}

- (void)setBetaApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)canAutosaveToFiles
{
  return self->_canAutosaveToFiles;
}

- (void)setCanAutosaveToFiles:(BOOL)a3
{
  self->_canAutosaveToFiles = a3;
}

- (BOOL)skipShutterSound
{
  return self->_skipShutterSound;
}

- (void)setSkipShutterSound:(BOOL)a3
{
  self->_skipShutterSound = a3;
}

- (BOOL)hasOnenessScreen
{
  return self->_hasOnenessScreen;
}

- (void)setHasOnenessScreen:(BOOL)a3
{
  self->_hasOnenessScreen = a3;
}

- (NSArray)harvestedMetadata
{
  return self->_harvestedMetadata;
}

- (void)setHarvestedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestedMetadata, 0);
  objc_storeStrong((id *)&self->_betaApplicationName, 0);
  objc_storeStrong((id *)&self->_betaApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_appleInternalOptions, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_serviceOptions, 0);
  objc_storeStrong((id *)&self->_imageSurface, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
