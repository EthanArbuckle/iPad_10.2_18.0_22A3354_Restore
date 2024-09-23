@implementation SWConfiguration

+ (id)configurationWithContainerConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  SWConfiguration *v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  SWConfiguration *v30;

  v3 = a3;
  v30 = [SWConfiguration alloc];
  objc_msgSend(v3, "storeFront");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canvasSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "contentFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "dataSources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePictureInPictureURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "supportsLiveActivities");

  LOBYTE(v28) = 0;
  LOBYTE(v27) = v24;
  v25 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v30, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v29, v4, v5, v6, v19, v20, v8, v10, v12, v14, v16, v18, v21, v22, v23,
          v27,
          0,
          0,
          v28);

  return v25;
}

- (SWConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14 keyboardConfiguration:(id)a15 networkStatus:(int64_t)a16 isTransitioning:(BOOL)a17
{
  double height;
  double width;
  double y;
  double x;
  double v26;
  double v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SWConfiguration *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v26 = a7.height;
  v27 = a7.width;
  v56 = a3;
  v29 = a4;
  v57 = a5;
  v30 = a6;
  v31 = a9;
  v32 = a10;
  v33 = a11;
  v34 = a12;
  v35 = a13;
  v36 = a15;
  v58.receiver = self;
  v58.super_class = (Class)SWConfiguration;
  v37 = -[SWConfiguration init](&v58, sel_init);
  if (v37)
  {
    v54 = v36;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUIDString");
    v55 = v30;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWConfiguration setIdentifier:](v37, "setIdentifier:", v39);

    -[SWConfiguration setStoreFront:](v37, "setStoreFront:", v56);
    -[SWConfiguration setLocale:](v37, "setLocale:", v29);
    -[SWConfiguration setContentEnvironment:](v37, "setContentEnvironment:", v57);
    -[SWConfiguration setContentSizeCategory:](v37, "setContentSizeCategory:", v55);
    -[SWConfiguration setCanvasSize:](v37, "setCanvasSize:", v27, v26);
    -[SWConfiguration setContentFrame:](v37, "setContentFrame:", x, y, width, height);
    v53 = v31;
    -[SWConfiguration setDataSources:](v37, "setDataSources:", v31);
    -[SWConfiguration setLocation:](v37, "setLocation:", v32);
    -[SWConfiguration setSourceURL:](v37, "setSourceURL:", v33);
    -[SWConfiguration setActivePictureInPictureURL:](v37, "setActivePictureInPictureURL:", v34);
    -[SWConfiguration setFeedConfiguration:](v37, "setFeedConfiguration:", v35);
    -[SWConfiguration setSupportsLiveActivities:](v37, "setSupportsLiveActivities:", a14);
    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v29);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v29;
    v41 = v32;
    if ((objc_msgSend(v40, "containsString:", CFSTR("H")) & 1) != 0)
      v42 = 1;
    else
      v42 = objc_msgSend(v40, "containsString:", CFSTR("k"));

    -[SWConfiguration setIs24HourTime:](v37, "setIs24HourTime:", v42);
    -[SWConfiguration setKeyboardConfiguration:](v37, "setKeyboardConfiguration:", v36);
    -[SWConfiguration setNetworkStatus:](v37, "setNetworkStatus:", a16);
    -[SWConfiguration setIsTransitioning:](v37, "setIsTransitioning:", a17);
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "systemName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "systemVersion");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ %@"), v45, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWConfiguration setSystemVersion:](v37, "setSystemVersion:", v48);

    v36 = v54;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWConfiguration setAppVersion:](v37, "setAppVersion:", v50);

    v30 = v55;
    v32 = v41;
    v29 = v52;
    v31 = v53;
  }

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  int64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SWConfiguration *v30;
  SWConfiguration *v31;
  void *v32;
  void *v33;

  v30 = [SWConfiguration alloc];
  -[SWConfiguration storeFront](self, "storeFront");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration contentEnvironment](self, "contentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration contentSizeCategory](self, "contentSizeCategory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration canvasSize](self, "canvasSize");
  v8 = v7;
  v10 = v9;
  -[SWConfiguration contentFrame](self, "contentFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SWConfiguration dataSources](self, "dataSources");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration location](self, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration sourceURL](self, "sourceURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration activePictureInPictureURL](self, "activePictureInPictureURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration feedConfiguration](self, "feedConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWConfiguration supportsLiveActivities](self, "supportsLiveActivities");
  -[SWConfiguration keyboardConfiguration](self, "keyboardConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SWConfiguration networkStatus](self, "networkStatus");
  LOBYTE(v27) = -[SWConfiguration isTransitioning](self, "isTransitioning");
  LOBYTE(v26) = v21;
  v31 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v30, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v4, v5, v6, v33, v32, v29, v8, v10, v12, v14, v16, v18, v28, v19, v20,
          v26,
          v22,
          v23,
          v27);

  -[SWConfiguration identifier](self, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration setIdentifier:](v31, "setIdentifier:", v24);

  return v31;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SWMutableConfiguration *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  int64_t v24;
  uint64_t v26;
  uint64_t v27;
  SWMutableConfiguration *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = [SWMutableConfiguration alloc];
  -[SWConfiguration storeFront](self, "storeFront");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration locale](self, "locale");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration contentEnvironment](self, "contentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration contentSizeCategory](self, "contentSizeCategory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration canvasSize](self, "canvasSize");
  v8 = v7;
  v10 = v9;
  -[SWConfiguration contentFrame](self, "contentFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SWConfiguration dataSources](self, "dataSources");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration location](self, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration sourceURL](self, "sourceURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration activePictureInPictureURL](self, "activePictureInPictureURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration feedConfiguration](self, "feedConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SWConfiguration supportsLiveActivities](self, "supportsLiveActivities");
  -[SWConfiguration keyboardConfiguration](self, "keyboardConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SWConfiguration networkStatus](self, "networkStatus");
  LOBYTE(v27) = -[SWConfiguration isTransitioning](self, "isTransitioning");
  LOBYTE(v26) = v22;
  v28 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v4, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v5, v32, v6, v31, v30, v29, v8, v10, v12, v14, v16, v18, v19, v20, v21,
          v26,
          v23,
          v24,
          v27);

  return v28;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  int v8;
  id v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  int64_t v64;
  int v65;
  _BOOL4 v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  CGRect v90;
  CGRect v91;

  v4 = a3;
  -[SWConfiguration storeFront](self, "storeFront");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeFront");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

LABEL_5:
    -[SWConfiguration locale](self, "locale");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {

    }
    else
    {
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        LOBYTE(v8) = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    -[SWConfiguration contentEnvironment](self, "contentEnvironment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentEnvironment");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {

    }
    else
    {
      v8 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v8)
        goto LABEL_60;
    }
    -[SWConfiguration contentSizeCategory](self, "contentSizeCategory");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentSizeCategory");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v89 = v14;
    if (v14 == v15)
    {

    }
    else
    {
      v8 = objc_msgSend(v14, "isEqualToString:", v15);

      if (!v8)
        goto LABEL_59;
    }
    -[SWConfiguration canvasSize](self, "canvasSize");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v4, "canvasSize");
    LOBYTE(v8) = 0;
    if (v17 != v21 || v19 != v20)
      goto LABEL_59;
    -[SWConfiguration contentFrame](self, "contentFrame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v4, "contentFrame");
    v91.origin.x = v30;
    v91.origin.y = v31;
    v91.size.width = v32;
    v91.size.height = v33;
    v90.origin.x = v23;
    v90.origin.y = v25;
    v90.size.width = v27;
    v90.size.height = v29;
    if (!CGRectEqualToRect(v90, v91))
    {
      LOBYTE(v8) = 0;
LABEL_59:

LABEL_60:
      goto LABEL_61;
    }
    -[SWConfiguration dataSources](self, "dataSources");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSources");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v87 = v35;
    v88 = v34;
    if (v34 == v35)
    {

    }
    else
    {
      v36 = v35;
      v37 = v34;
      v38 = v36;
      v85 = objc_msgSend(v37, "isEqualToDictionary:", v36);

      if (!v85)
      {
        LOBYTE(v8) = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    -[SWConfiguration location](self, "location");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v84 = v40;
    v86 = v39;
    if (v39 == v40)
    {

    }
    else
    {
      v41 = v40;
      v42 = v39;
      v43 = v41;
      v82 = objc_msgSend(v42, "isEqual:", v41);

      if (!v82)
      {
        LOBYTE(v8) = 0;
LABEL_57:

        goto LABEL_58;
      }
    }
    -[SWConfiguration sourceURL](self, "sourceURL");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceURL");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v81 = v45;
    v83 = v44;
    if (v44 == v45)
    {

    }
    else
    {
      v46 = v45;
      v47 = v44;
      v48 = v46;
      v79 = objc_msgSend(v47, "isEqual:", v46);

      if (!v79)
      {
        LOBYTE(v8) = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    -[SWConfiguration systemVersion](self, "systemVersion");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemVersion");
    v78 = v49;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v49, "isEqualToString:"))
    {
      LOBYTE(v8) = 0;
      v56 = v78;
LABEL_55:

      goto LABEL_56;
    }
    -[SWConfiguration appVersion](self, "appVersion");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appVersion");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v50;
    if (!objc_msgSend(v50, "isEqualToString:"))
    {
      LOBYTE(v8) = 0;
      v56 = v78;
LABEL_54:

      goto LABEL_55;
    }
    -[SWConfiguration activePictureInPictureURL](self, "activePictureInPictureURL");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activePictureInPictureURL");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    v74 = v52;
    v75 = v51;
    if (v51 == v52)
    {

    }
    else
    {
      v53 = v52;
      v54 = v51;
      v55 = v53;
      v72 = objc_msgSend(v54, "isEqual:", v53);

      if (!v72)
      {
        LOBYTE(v8) = 0;
        v56 = v78;
LABEL_53:

        goto LABEL_54;
      }
    }
    -[SWConfiguration feedConfiguration](self, "feedConfiguration");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedConfiguration");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v71 = v58;
    v73 = v57;
    if (v57 == v58)
    {

    }
    else
    {
      v59 = v58;
      v60 = v57;
      v61 = v59;
      v69 = objc_msgSend(v60, "isEqual:", v59);

      if (!v69)
        goto LABEL_46;
    }
    v62 = -[SWConfiguration supportsLiveActivities](self, "supportsLiveActivities");
    if (v62 == objc_msgSend(v4, "supportsLiveActivities"))
    {
      -[SWConfiguration keyboardConfiguration](self, "keyboardConfiguration");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyboardConfiguration");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v63;
      if (objc_msgSend(v63, "isEqual:")
        && (v64 = -[SWConfiguration networkStatus](self, "networkStatus"), v64 == objc_msgSend(v4, "networkStatus"))
        && (v65 = -[SWConfiguration is24HourTime](self, "is24HourTime"),
            v65 == objc_msgSend(v4, "is24HourTime")))
      {
        v67 = -[SWConfiguration isTransitioning](self, "isTransitioning");
        v8 = v67 ^ objc_msgSend(v4, "isTransitioning") ^ 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }

      goto LABEL_52;
    }
LABEL_46:
    LOBYTE(v8) = 0;
LABEL_52:
    v56 = v78;

    goto LABEL_53;
  }
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    goto LABEL_5;
  LOBYTE(v8) = 0;
LABEL_62:

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
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
  void *v21;
  CGSize v23;
  CGRect v24;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWConfiguration storeFront](self, "storeFront");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24DA0D700;
  objc_msgSend(v3, "appendFormat:", CFSTR("; storeFront: %@"), v6);

  -[SWConfiguration locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; locale: %@"), v7);

  -[SWConfiguration contentEnvironment](self, "contentEnvironment");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24DA0D700;
  objc_msgSend(v3, "appendFormat:", CFSTR("; contentEnvironment: %@"), v10);

  -[SWConfiguration contentSizeCategory](self, "contentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; contentSizeCategory: %@"), v11);

  -[SWConfiguration canvasSize](self, "canvasSize");
  NSStringFromCGSize(v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; canvasSize: %@"), v12);

  -[SWConfiguration contentFrame](self, "contentFrame");
  NSStringFromCGRect(v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; contentFrame: %@"), v13);

  -[SWConfiguration dataSources](self, "dataSources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; dataSources: %@"), v14);

  -[SWConfiguration location](self, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; location: %@"), v15);

  -[SWConfiguration sourceURL](self, "sourceURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; sourceURL: %@"), v16);

  -[SWConfiguration systemVersion](self, "systemVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; systemVersion: %@"), v17);

  -[SWConfiguration appVersion](self, "appVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; appVersion: %@"), v18);

  -[SWConfiguration activePictureInPictureURL](self, "activePictureInPictureURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; activePictureInPictureURL: %@"), v19);

  -[SWConfiguration feedConfiguration](self, "feedConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; feedConfiguration: %@"), v20);

  objc_msgSend(v3, "appendFormat:", CFSTR("; supportsLiveActivities: %d"),
    -[SWConfiguration supportsLiveActivities](self, "supportsLiveActivities"));
  -[SWConfiguration keyboardConfiguration](self, "keyboardConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardConfiguration: %@"), v21);

  objc_msgSend(v3, "appendFormat:", CFSTR("; networkStatus: %d"),
    -[SWConfiguration networkStatus](self, "networkStatus"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; is24HourTime: %d"), -[SWConfiguration is24HourTime](self, "is24HourTime"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; isTransitioning: %d"),
    -[SWConfiguration isTransitioning](self, "isTransitioning"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)is24HourTime
{
  return self->_is24HourTime;
}

- (void)setIs24HourTime:(BOOL)a3
{
  self->_is24HourTime = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SWLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)activePictureInPictureURL
{
  return self->_activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)supportsLiveActivities
{
  return self->_supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->_supportsLiveActivities = a3;
}

- (SWKeyboardConfiguration)keyboardConfiguration
{
  return self->_keyboardConfiguration;
}

- (void)setKeyboardConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
