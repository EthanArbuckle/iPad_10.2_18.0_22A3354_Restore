@implementation UIUDetector

+ (float)defaultIOUThreshold
{
  float result;

  +[UIUDetectorCompat staticIOUThreshold](UIUDetectorCompat, "staticIOUThreshold");
  return result;
}

+ (int64_t)convertPlatform:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (id)initForPlatform:(int64_t)a3 elementConfidence:(id)a4 clickabilityConfidence:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  UIUDetector *v15;
  UIUDetectorCompat *v16;
  id v17;
  void *v18;
  void *v19;
  UIUDetector *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)UIUDetector;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = -[UIUDetector init](&v23, sel_init);
  v22 = 0;
  v16 = -[UIUDetectorCompat initWithPlatform:elementConfidenceThresholds:clickabilityConfidenceThresholds:elementConfig:clickabilityConfig:error:]([UIUDetectorCompat alloc], "initWithPlatform:elementConfidenceThresholds:clickabilityConfidenceThresholds:elementConfig:clickabilityConfig:error:", +[UIUDetector convertPlatform:](UIUDetector, "convertPlatform:", a3), v14, v13, v12, v11, &v22);

  v17 = v22;
  v18 = v17;
  if (v16 || !v17)
  {
    objc_storeStrong((id *)&v15->_underlyingObject, v16);
    v20 = v15;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_2496CB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to initialize detector with error %@", buf, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

- (id)initForPlatform:(int64_t)a3
{
  return -[UIUDetector initForPlatform:elementConfidence:clickabilityConfidence:elementConfig:clickabilityConfig:](self, "initForPlatform:elementConfidence:clickabilityConfidence:elementConfig:clickabilityConfig:", a3, 0, 0, 0, 0);
}

- (id)getDetectionsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIcons:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10
{
  _BOOL8 v10;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  UIObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v10 = a9;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUDetector underlyingObject](self, "underlyingObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v20 = a8;
  objc_msgSend(v19, "getUIObjectsInScreen:addOCR:addIconRecognition:addClickability:addFocusElements:nmsThreshold:useAccurateOCR:error:", a3, v15, v14, v13, v12, v10, v20, a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a10)
  {
    v22 = 0;
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          v28 = -[UIObject initWithCompat:]([UIObject alloc], "initWithCompat:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v27));
          objc_msgSend(v18, "addObject:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v25);
    }

    v22 = v18;
  }

  return v22;
}

- (UIUDetectorCompat)underlyingObject
{
  return (UIUDetectorCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
