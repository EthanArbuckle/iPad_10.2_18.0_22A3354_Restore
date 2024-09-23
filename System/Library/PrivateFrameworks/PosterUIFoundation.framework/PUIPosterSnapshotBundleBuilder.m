@implementation PUIPosterSnapshotBundleBuilder

- (PUIPosterSnapshotBundleBuilder)initWithSnapshotBundle:(id)a3
{
  id v4;
  void *v5;
  PUIPosterSnapshotBundleBuilder *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  PUIColorStatistics *colorStatistics;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSClassFromString(CFSTR("PUIPosterSnapshotBundle"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244676538);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PUIPosterSnapshotBundleClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24467659CLL);
  }

  objc_msgSend(v4, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:](self, "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v5, objc_msgSend(v4, "userInterfaceStyle"), objc_msgSend(v4, "interfaceOrientation"), objc_msgSend(v4, "deviceOrientation"));

  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "snapshotLevelSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "snapshotForLevelSet:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_levelToImage, "setObject:forKeyedSubscript:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "colorStatistics");
    v14 = objc_claimAutoreleasedReturnValue();
    colorStatistics = v6->_colorStatistics;
    v6->_colorStatistics = (PUIColorStatistics *)v14;

    -[PUIPosterSnapshotBundleBuilder infoDictionary](v6, "infoDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v17);

  }
  return v6;
}

- (PUIPosterSnapshotBundleBuilder)initWithHardwareIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 interfaceOrientation:(int64_t)a5 deviceOrientation:(int64_t)a6
{
  id v10;
  PUIPosterSnapshotBundleBuilder *v11;
  uint64_t v12;
  NSString *hardwareIdentifier;
  uint64_t v14;
  NSMutableDictionary *infoDictionary;
  uint64_t v16;
  NSMutableDictionary *levelToImage;
  void *v19;
  objc_super v20;

  v10 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244676704);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:].cold.1();
    goto LABEL_11;
  }

  v20.receiver = self;
  v20.super_class = (Class)PUIPosterSnapshotBundleBuilder;
  v11 = -[PUIPosterSnapshotBundleBuilder init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSString *)v12;

    v14 = objc_opt_new();
    infoDictionary = v11->_infoDictionary;
    v11->_infoDictionary = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    levelToImage = v11->_levelToImage;
    v11->_levelToImage = (NSMutableDictionary *)v16;

    v11->_userInterfaceStyle = a4;
    v11->_interfaceOrientation = a5;
    v11->_deviceOrientation = a6;
    -[PUIPosterSnapshotBundleBuilder setFileAttributes:](v11, "setFileAttributes:", 0);
    -[PUIPosterSnapshotBundleBuilder setURLResourceValues:](v11, "setURLResourceValues:", 0);
  }

  return v11;
}

- (void)updateWithPoster:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v13, "serverIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("PUIPosterSnapshotBundleInfoKeyPosterUUID"));

    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "serverIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v10, CFSTR("PUIPosterSnapshotBundleInfoKeyPosterVersion"));

    objc_msgSend(v13, "serverIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v12, CFSTR("PUIPosterSnapshotBundleInfoKeyPosterProvider"));

  }
}

- (void)setURLResourceValues:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *URLResourceValues;

  if (a3)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
  else
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBCC68]);
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  URLResourceValues = self->_URLResourceValues;
  self->_URLResourceValues = v4;

}

- (void)setFileAttributes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *fileAttributes;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    fileAttributes = self->_fileAttributes;
    self->_fileAttributes = v4;
  }
  else
  {
    PFFileProtectionNoneAttributes();
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v8, "mutableCopy");
    v7 = self->_fileAttributes;
    self->_fileAttributes = v6;

    fileAttributes = v8;
  }

}

- (BOOL)captureSnapshot:(id)a3 forLevelSet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  BOOL v38;
  void *v40;
  CGSize v41;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("snapshot"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder captureSnapshot:forLevelSet:error:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244676CF4);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("levelSet"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder captureSnapshot:forLevelSet:error:].cold.2();
    goto LABEL_27;
  }
  v10 = (void *)MEMORY[0x249515064]();
  if (objc_msgSend(v7, "capture")
    && (objc_msgSend(MEMORY[0x24BDF6AC8], "pui_imageFromSceneSnapshot:", v7),
        (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    -[NSMutableDictionary setObject:forKey:](self->_levelToImage, "setObject:forKey:", v11, v9);
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v12, "size");
      NSStringFromCGSize(v41);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));

    }
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyScale"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
      objc_msgSend(v16, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, CFSTR("PUIPosterSnapshotBundleInfoKeyScale"));

    }
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "settings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v22, "pui_userInterfaceStyle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v23, CFSTR("PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"));

    }
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v7, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "settings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pui_previewIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v27, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"));

    }
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v29 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "settings");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v31, "pui_deviceOrientation"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v32, CFSTR("PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"));

    }
    -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v34 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v36, "interfaceOrientation"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v37, CFSTR("PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"));

    }
    v38 = 1;
  }
  else
  {
    v38 = 0;
  }
  objc_autoreleasePoolPop(v10);

  return v38;
}

- (void)setImage:(id)a3 forLevelSet:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  CGSize v8;

  v7 = a3;
  -[NSMutableDictionary setObject:forKey:](self->_levelToImage, "setObject:forKey:");
  -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v7, "size");
    NSStringFromCGSize(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));

  }
}

- (BOOL)captureColorStatistics:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  PUIColorStatistics *v8;
  PUIColorStatistics *colorStatistics;
  BOOL v10;
  BOOL result;
  void *v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x249515064]();
    v8 = (PUIColorStatistics *)objc_msgSend(v6, "copy");
    colorStatistics = self->_colorStatistics;
    self->_colorStatistics = v8;

    objc_autoreleasePoolPop(v7);
    v10 = self->_colorStatistics != 0;

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("colorStatistics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotBundleBuilder captureColorStatistics:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIColorStatistics)capturedColorStatistics
{
  return self->_colorStatistics;
}

- (NSSet)capturedSnapshotLevelSets
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_levelToImage, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)capturedSnapshotForLevelSet:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_levelToImage, "objectForKey:", a3);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUIPosterSnapshotBundleBuilder infoDictionary](self, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PUIPosterSnapshotBundleBuilder infoDictionary](self, "infoDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)buildWithOutputURL:(id)a3 diskFormat:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  PUIImageEncoder *v33;
  void *v34;
  PUIImageEncoder *v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  PUIColorStatistics *colorStatistics;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  NSMutableDictionary *URLResourceValues;
  id v56;
  NSMutableDictionary *fileAttributes;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void (**v66)(void);
  id v67;
  id v68;
  void *v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id obj;
  _QWORD v85[4];
  id v86;
  id v87;
  uint64_t *v88;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;
  CGSize v101;

  v100 = *MEMORY[0x24BDAC8D0];
  v67 = a3;
  v68 = a4;
  v7 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF48];
  PFTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:relativeToURL:", v9, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v70, 1, self->_fileAttributes, a5))
  {
    v15 = MEMORY[0x24BDAC760];
    v95[0] = MEMORY[0x24BDAC760];
    v95[1] = 3221225472;
    v95[2] = __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke;
    v95[3] = &unk_25154BFC0;
    v16 = v14;
    v96 = v16;
    v17 = v70;
    v97 = v17;
    v66 = (void (**)(void))MEMORY[0x2495151FC](v95);
    v89 = 0;
    v90 = (id *)&v89;
    v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__0;
    v93 = __Block_byref_object_dispose__0;
    v94 = 0;
    v85[0] = v15;
    v85[1] = 3221225472;
    v85[2] = __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke_63;
    v85[3] = &unk_25154C3B0;
    v65 = v17;
    v86 = v65;
    v18 = v16;
    v87 = v18;
    v88 = &v89;
    PUIPosterSnapshotBundleComponentEnumerateDirectories(v85);
    v19 = v90[5];
    if (v19)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v19);
      v66[2]();
      v20 = 0;
      goto LABEL_17;
    }
    if (v68)
    {
      objc_msgSend(v68, "filenameExtension");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    -[PUIPosterSnapshotBundleBuilder _finalizedInfoPlistDictionaryWithSnapshotImageFormat:](self, "_finalizedInfoPlistDictionaryWithSnapshotImageFormat:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v59 = v18;
    v60 = (void *)v21;
    v23 = v90;
    obj = 0;
    v61 = (void *)v22;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v23 + 5, 0);
    if (!v64 || v90[5])
    {
      if (a5)
        *a5 = objc_retainAutorelease(v90[5]);
      v66[2]();
      goto LABEL_15;
    }
    PUIPosterSnapshotBundleURLForComponent(v65, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v64, "writeToURL:options:error:", v25, 0, a5);

    if ((v26 & 1) == 0)
    {
LABEL_15:
      v20 = 0;
LABEL_16:

LABEL_17:
      _Block_object_dispose(&v89, 8);

      goto LABEL_18;
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[NSMutableDictionary allKeys](self->_levelToImage, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
    if (v28)
    {
      v63 = *(_QWORD *)v81;
      while (2)
      {
        v62 = v28;
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v81 != v63)
            objc_enumerationMutation(v27);
          v30 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_levelToImage, "objectForKey:", v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x249515064]();
          v33 = [PUIImageEncoder alloc];
          PUIPosterSnapshotBundleURLForPosterLevelSet(v65, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[PUIImageEncoder initWithURL:format:](v33, "initWithURL:format:", v34, v68);

          v79 = 0;
          -[PUIImageEncoder saveUIImage:error:](v35, "saveUIImage:error:", v31, &v79);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v79;
          if (v36)
          {
            -[PUIPosterSnapshotBundleBuilder objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38 == 0;

            if (v39)
            {
              objc_msgSend(v31, "size");
              NSStringFromCGSize(v101);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUIPosterSnapshotBundleBuilder setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v40, CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));

            }
          }

          objc_autoreleasePoolPop(v32);
          if (v37)
          {
            if (a5)
              *a5 = objc_retainAutorelease(v37);
            v66[2]();

            goto LABEL_59;
          }

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
        if (v28)
          continue;
        break;
      }
    }

    if (self->_colorStatistics)
    {
      v41 = (void *)MEMORY[0x249515064]();
      PUIPosterSnapshotBundleURLForComponent(v65, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      colorStatistics = self->_colorStatistics;
      v78 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", colorStatistics, 1, &v78);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v78;
      v77 = v45;
      objc_msgSend(v44, "writeToURL:options:error:", v42, 0x10000000, &v77);
      v46 = v77;

      objc_autoreleasePoolPop(v41);
      v27 = v46;
      if (v46)
      {
        if (a5)
        {
          *a5 = objc_retainAutorelease(v46);
          v27 = v46;
        }
        v66[2]();
        v20 = 0;
        goto LABEL_61;
      }
    }
    v47 = (void *)MEMORY[0x249515064]();
    -[NSMutableDictionary allKeys](self->_URLResourceKeys, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v65, v48, 0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v50 = v49;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v74;
      while (2)
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v74 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          URLResourceValues = self->_URLResourceValues;
          v72 = 0;
          objc_msgSend(v54, "setResourceValues:error:", URLResourceValues, &v72);
          v56 = v72;
          if (v56)
          {
            v31 = v56;
            goto LABEL_51;
          }
          fileAttributes = self->_fileAttributes;
          objc_msgSend(v54, "path");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
          objc_msgSend(v59, "setAttributes:ofItemAtPath:error:", fileAttributes, v58, &v71);
          v31 = v71;

          if (v31)
            goto LABEL_51;
        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
        v31 = 0;
        if (v51)
          continue;
        break;
      }
    }
    else
    {
      v31 = 0;
    }
LABEL_51:

    objc_autoreleasePoolPop(v47);
    if (v31)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v31);
    }
    else if ((objc_msgSend(v59, "moveItemAtURL:toURL:error:", v65, v67, a5) & 1) != 0)
    {
      +[PUIPosterSnapshotBundle snapshotBundleAtURL:error:](PUIPosterSnapshotBundle, "snapshotBundleAtURL:error:", v67, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        -[PUIPosterSnapshotBundleBuilder reset](self, "reset");
      v27 = 0;
LABEL_60:

LABEL_61:
      goto LABEL_16;
    }
    v66[2]();
    v27 = 0;
LABEL_59:
    v20 = 0;
    goto LABEL_60;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

uint64_t __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

void __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke_63(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id obj;

  PUIPosterSnapshotBundleURLForComponent(*(void **)(a1 + 32), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  PFFileProtectionNoneAttributes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  LOBYTE(v6) = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

  if ((v6 & 1) == 0)
    *a3 = 1;

}

- (id)buildWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PUIPosterSnapshotBundleBuilder _finalizedInfoPlistDictionaryWithSnapshotImageFormat:](self, "_finalizedInfoPlistDictionaryWithSnapshotImageFormat:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableDictionary copy](self->_levelToImage, "copy");
  +[PUIPosterSnapshotBundle snapshotBundleForInfoDictionary:levelToImage:colorStatistics:error:](PUIPosterSnapshotBundle, "snapshotBundleForInfoDictionary:levelToImage:colorStatistics:error:", v5, v6, self->_colorStatistics, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[PUIPosterSnapshotBundleBuilder reset](self, "reset");
  return v7;
}

- (void)reset
{
  PUIColorStatistics *colorStatistics;

  -[NSMutableDictionary removeAllObjects](self->_levelToImage, "removeAllObjects");
  colorStatistics = self->_colorStatistics;
  self->_colorStatistics = 0;

}

- (id)_finalizedInfoPlistDictionaryWithSnapshotImageFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *hardwareIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  -[PUIPosterSnapshotBundleBuilder infoDictionary](self, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotImageFormat"));
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    objc_msgSend(v7, "setObject:forKey:", hardwareIdentifier, CFSTR("PUIPosterSnapshotBundleInfoKeyHardwareIdentifier"));
  PUIPosterSnapshotBundleSharedDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("PUIPosterSnapshotBundleInfoKeyDateCreated"));

  objc_msgSend(v7, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotEpoch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v7, "setObject:forKey:", &unk_25156ADF8, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotEpoch"));
  objc_msgSend(v7, "setObject:forKey:", &unk_25156AE10, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotVersion"));
  objc_msgSend(v7, "setObject:forKey:", &unk_25156AE28, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotBundleVersion"));
  -[NSMutableDictionary allKeys](self->_levelToImage, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x24BDBD1A8];
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  objc_msgSend(v18, "bs_mapNoNulls:", &__block_literal_global_16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_userInterfaceStyle);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"));

  objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotLevels"));
  objc_msgSend(v7, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_interfaceOrientation);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"));

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_deviceOrientation);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_colorStatistics != 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("PUIPosterSnapshotBundleInfoKeyContainsColorStatistics"));

  objc_msgSend(MEMORY[0x24BDD17C8], "pf_bootInstanceIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v7, "setObject:forKey:", v26, CFSTR("PUIPosterSnapshotBundleInfoKeyBootSessionIdentifier"));
  v27 = (void *)objc_msgSend(v7, "copy");

  return v27;
}

uint64_t __87__PUIPosterSnapshotBundleBuilder__finalizedInfoPlistDictionaryWithSnapshotImageFormat___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
}

- (NSMutableDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSMutableDictionary)URLResourceValues
{
  return self->_URLResourceValues;
}

- (NSMutableDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_infoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_URLResourceValues, 0);
  objc_storeStrong((id *)&self->_levelToImage, 0);
  objc_storeStrong((id *)&self->_URLResourceKeys, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_colorStatistics, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

- (void)initWithSnapshotBundle:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)captureSnapshot:forLevelSet:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)captureSnapshot:forLevelSet:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)captureColorStatistics:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
