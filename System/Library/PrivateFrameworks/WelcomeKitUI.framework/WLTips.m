@implementation WLTips

- (WLTips)initWithTitle:(id)a3 desc:(id)a4 thumbnail:(id)a5 image:(id)a6 video:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WLTips *v17;
  WLTips *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)WLTips;
  v17 = -[WLTips init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[WLTips setTitle:](v17, "setTitle:", v12);
    -[WLTips setDesc:](v18, "setDesc:", v13);
    -[WLTips setThumbnail:](v18, "setThumbnail:", v14);
    -[WLTips setImage:](v18, "setImage:", v15);
    -[WLTips setVideo:](v18, "setVideo:", v16);
  }

  return v18;
}

+ (id)tips
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WLAsset *v28;
  WLInterfaceStyleAsset *v29;
  WLAsset *v30;
  WLAsset *v31;
  WLInterfaceStyleAsset *v32;
  WLTips *v33;
  id obj;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  WLInterfaceStyleAsset *v42;
  WLAsset *v43;
  void *v44;
  void *v45;
  void *v46;
  WLAsset *v47;
  WLAsset *v48;
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
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = +[WLDeviceCapability hasHomeButton](WLDeviceCapability, "hasHomeButton");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = v5;
  if (v3)
  {
    if (v4)
      v7 = CFSTR("IPAD_HOME_BUTTON");
    else
      v7 = CFSTR("IPAD_NO_HOME_BUTTON");
    v8 = CFSTR("3Z");
    if (v4)
      v8 = CFSTR("4Z");
    v37 = v8;
    v38 = v7;
    objc_msgSend(v5, "addObject:", CFSTR("GoHome"));
    objc_msgSend(v6, "addObject:", CFSTR("AppSwitcher"));
    objc_msgSend(v6, "addObject:", CFSTR("ControlCenter"));
    objc_msgSend(v6, "addObject:", CFSTR("TouchAndHold"));
    objc_msgSend(v6, "addObject:", CFSTR("NotificationCenter"));
  }
  else
  {
    if (v4)
      v9 = CFSTR("IPHONE_HOME_BUTTON");
    else
      v9 = CFSTR("IPHONE_NO_HOME_BUTTON");
    v10 = CFSTR("1V");
    if (v4)
      v10 = CFSTR("2Y");
    v37 = v10;
    v38 = v9;
    if (!+[WLDeviceCapability hasHomeButton](WLDeviceCapability, "hasHomeButton"))
      objc_msgSend(v6, "addObject:", CFSTR("GoHome"));
    if (+[WLDeviceCapability hasDynamicIsland](WLDeviceCapability, "hasDynamicIsland"))
      objc_msgSend(v6, "addObject:", CFSTR("DynamicIsland"));
    objc_msgSend(v6, "addObject:", CFSTR("AppSwitcher"));
    objc_msgSend(v6, "addObject:", CFSTR("ControlCenter"));
    objc_msgSend(v6, "addObject:", CFSTR("TouchAndHold"));
    objc_msgSend(v6, "addObject:", CFSTR("NotificationCenter"));
    if (+[WLDeviceCapability hasActionButton](WLDeviceCapability, "hasActionButton"))
    {
      v11 = CFSTR("SilentModeActionButton");
      goto LABEL_20;
    }
  }
  v11 = CFSTR("SilentMode");
LABEL_20:
  objc_msgSend(v6, "addObject:", v11);
  objc_msgSend(v6, "addObject:", CFSTR("Screenshot"));
  +[WLTipAssetRemoteDocumentIdentifier documentIDs](WLTipAssetRemoteDocumentIdentifier, "documentIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v6;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v41)
  {
    v36 = *(_QWORD *)v62;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v62 != v36)
          objc_enumerationMutation(obj);
        v60 = v12;
        v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "uppercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("TIPS_%@_TITLE"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        WLLocalizedString();
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "uppercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("TIPS_%@_DESCRIPTION_%@"), v18, v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        WLLocalizedString();
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@_T.png"), v13, v37, CFSTR("L"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@.jpg"), v13, v37, CFSTR("L"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@.mp4"), v13, v37, CFSTR("L"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@_T.png"), v13, v37, CFSTR("D"));
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@.jpg"), v13, v37, CFSTR("D"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@~%@.mp4"), v13, v37, CFSTR("D"));
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v58);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v22);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = (void *)v20;
        objc_msgSend(v39, "objectForKeyedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v23);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "objectForKeyedSubscript:", v54);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v24);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "objectForKeyedSubscript:", v57);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v25);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "objectForKeyedSubscript:", v53);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v26);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)v21;
        objc_msgSend(v39, "objectForKeyedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLTipAssetRemoteDocumentIdentifier url:](WLTipAssetRemoteDocumentIdentifier, "url:", v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v58, v50);
        v47 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v20, v49);
        v42 = -[WLInterfaceStyleAsset initWithLight:dark:]([WLInterfaceStyleAsset alloc], "initWithLight:dark:", v48, v47);
        v43 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v54, v56);
        v28 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v57, v55);
        v29 = -[WLInterfaceStyleAsset initWithLight:dark:]([WLInterfaceStyleAsset alloc], "initWithLight:dark:", v43, v28);
        v30 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v53, v46);
        v31 = -[WLAsset initWithName:remoteURL:]([WLAsset alloc], "initWithName:remoteURL:", v21, v45);
        v32 = -[WLInterfaceStyleAsset initWithLight:dark:]([WLInterfaceStyleAsset alloc], "initWithLight:dark:", v30, v31);
        v33 = -[WLTips initWithTitle:desc:thumbnail:image:video:]([WLTips alloc], "initWithTitle:desc:thumbnail:image:video:", v59, v52, v42, v29, v32);
        objc_msgSend(v40, "addObject:", v33);

        v12 = v60 + 1;
      }
      while (v41 != v60 + 1);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v41);
  }

  return v40;
}

+ (BOOL)download
{
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[128];
  _QWORD v57[3];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  +[WLTips tips](WLTips, "tips");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v52;
    do
    {
      v6 = 0;
      v37 = v3;
      do
      {
        if (*(_QWORD *)v52 != v5)
          objc_enumerationMutation(v2);
        v41 = v6;
        v7 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v6);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v7, "thumbnail");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v8;
        objc_msgSend(v7, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v9;
        objc_msgSend(v7, "video");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v48;
          v39 = v11;
          v40 = v2;
          v35 = *(_QWORD *)v48;
          v36 = v5;
          while (2)
          {
            v14 = 0;
            v38 = v12;
            do
            {
              if (*(_QWORD *)v48 != v13)
                objc_enumerationMutation(v11);
              v42 = v14;
              v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v15, "light");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v55[0] = v16;
              objc_msgSend(v15, "dark");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v55[1] = v17;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v44;
                while (2)
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v44 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                    objc_msgSend(v23, "name", v30, v31, v32, v34);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "remoteURL");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "localFile");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    _WLLog();

                    v26 = objc_msgSend(v23, "download", v24, v25, v33);
                    objc_msgSend(v23, "name");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "remoteURL");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "localFile");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v26;
                    v30 = v27;
                    v31 = v28;
                    _WLLog();

                    if ((v26 & 1) == 0)
                    {

                      v11 = v39;
                      v2 = v40;
                      goto LABEL_29;
                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16, v27, v28, v32, v26);
                  if (v20)
                    continue;
                  break;
                }

                v11 = v39;
                v2 = v40;
                v13 = v35;
                v5 = v36;
              }
              else
              {

                if (!v4)
                {
LABEL_29:

                  goto LABEL_30;
                }
              }
              v14 = v42 + 1;
              v4 = 1;
            }
            while (v42 + 1 != v38);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
            if (v12)
              continue;
            break;
          }

        }
        else
        {

          if (!v4)
            goto LABEL_30;
        }
        v6 = v41 + 1;
        v4 = 1;
      }
      while (v41 + 1 != v37);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v3);
  }
  else
  {
LABEL_30:
    v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (WLInterfaceStyleAsset)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (WLInterfaceStyleAsset)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (WLInterfaceStyleAsset)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
