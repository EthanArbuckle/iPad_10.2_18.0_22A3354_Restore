@implementation SWConfigurationSerializer

- (id)serializeWebContentConfiguration:(id)a3
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  void *v79;
  SWConfigurationSerializer *v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[6];
  _QWORD v85[6];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("identifier"));

    }
    objc_msgSend(v4, "storeFront");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "storeFront");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("storeFront"));

    }
    objc_msgSend(v4, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "locale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("locale"));

    }
    objc_msgSend(v4, "contentEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "contentEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("environment"));

    }
    objc_msgSend(v4, "contentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "contentSizeCategory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("dynamicType"));

    }
    objc_msgSend(v4, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v4, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v24, CFSTR("URL"));

      }
      objc_msgSend(v4, "location");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v4, "location");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "context");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v28, CFSTR("context"));

      }
      objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("location"));

    }
    objc_msgSend(v4, "sourceURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "sourceURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "absoluteString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("sourceURL"));

    }
    objc_msgSend(v4, "systemVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "systemVersion");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("systemVersion"));

    }
    objc_msgSend(v4, "appVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v4, "appVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("appVersion"));

    }
    objc_msgSend(v4, "dataSources");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataSources");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = __62__SWConfigurationSerializer_serializeWebContentConfiguration___block_invoke;
      v82[3] = &unk_24DA0BBF8;
      v83 = v39;
      v41 = v39;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v82);

      objc_msgSend(v5, "setObject:forKey:", v41, CFSTR("dataSources"));
    }
    v86[0] = CFSTR("width");
    v42 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "canvasSize");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = CFSTR("height");
    v87[0] = v43;
    v44 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "canvasSize");
    objc_msgSend(v44, "numberWithDouble:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v47, CFSTR("canvasSize"));
    objc_msgSend(v4, "contentFrame");
    -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("contentFrame"));
    objc_msgSend(v4, "keyboardConfiguration");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v4, "keyboardConfiguration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = CFSTR("keyboardFrame");
      objc_msgSend(v50, "keyboardFrame");
      -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v78;
      v84[1] = CFSTR("inputAccessoryViewFrame");
      objc_msgSend(v50, "inputAccessoryViewFrame");
      -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
      v80 = self;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v51;
      v84[2] = CFSTR("isKeyboardSplit");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v50, "isKeyboardSplit"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v52;
      v84[3] = CFSTR("isKeyboardFloating");
      v79 = v48;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v50, "isKeyboardFloating"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v53;
      v84[4] = CFSTR("isHardwareKeyboard");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v50, "isHardwareKeyboard"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v85[4] = v54;
      v84[5] = CFSTR("isKeyboardVisible");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v50, "isKeyboardVisible"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v85[5] = v55;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 6);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = v79;
      self = v80;

      objc_msgSend(v5, "setObject:forKey:", v56, CFSTR("keyboardInfo"));
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SWConfigurationSerializer isNetworkReachableForStatus:](self, "isNetworkReachableForStatus:", objc_msgSend(v4, "networkStatus")));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v57, CFSTR("isNetworkReachable"));

    objc_msgSend(v4, "activePictureInPictureURL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "absoluteString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v4, "activePictureInPictureURL");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "absoluteString");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v61, CFSTR("activePictureInPictureURL"));

    }
    objc_msgSend(v4, "feedConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v4, "feedConfiguration");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "selectors");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v4, "feedConfiguration");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "selectors");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "allObjects");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v67, CFSTR("selectors"));

      }
      objc_msgSend(v4, "feedConfiguration");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "configuration");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        objc_msgSend(v4, "feedConfiguration");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "configuration");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v71, CFSTR("feed"));

      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "is24HourTime"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v72, CFSTR("is24HourTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isTransitioning"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v73, CFSTR("isTransitioning"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "supportsLiveActivities"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v74, CFSTR("supportsLiveActivities"));

    v81 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, &v81);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
      v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v75, 4);
    else
      v76 = 0;

  }
  else
  {
    v5 = 0;
    v76 = 0;
  }

  return v76;
}

void __62__SWConfigurationSerializer_serializeWebContentConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)serializedRectFromCGRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3.origin.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = CFSTR("height");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isNetworkReachableForStatus:(int64_t)a3
{
  return (a3 & 3) != 0;
}

@end
