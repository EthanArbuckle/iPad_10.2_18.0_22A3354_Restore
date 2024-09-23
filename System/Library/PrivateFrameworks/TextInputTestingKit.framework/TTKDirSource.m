@implementation TTKDirSource

- (void)loadRootDir
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray **p_testCaseDirs;
  char v22;
  NSMutableArray **p_testCaseFiles;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", self->_rootDir, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TTKDirSource loadLayouts:](self, "loadLayouts:", self->_rootDir);
  self->_is_multiDir = 1;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isEqualToString:", CFSTR("layouts.json")))self->_is_multiDir = 0;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    p_testCaseFiles = &self->_testCaseFiles;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR(".DS_Store"), p_testCaseFiles) & 1) == 0)
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          v33[0] = self->_rootDir;
          v33[1] = v16;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pathWithComponents:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 0;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, &v24);

          p_testCaseDirs = &self->_testCaseDirs;
          if (v24
            || (v22 = objc_msgSend(v16, "isEqualToString:", CFSTR("layouts.json")),
                p_testCaseDirs = p_testCaseFiles,
                (v22 & 1) == 0))
          {
            -[NSMutableArray addObject:](*p_testCaseDirs, "addObject:", v16);
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

}

- (id)getNextTestCase
{
  void *v3;
  TTKTestCaseSource *currTestCaseSource;
  void *v5;
  TTKTestCaseSource *v6;
  void *v7;
  NSString *rootDir;
  NSString *currDir;
  void *v10;
  void *v11;
  void *v12;
  TTKTestCaseSource *v13;
  TTKTestCaseSource *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *layouts;
  NSMutableDictionary *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  TTKTestCaseSource *v24;
  TTKTestCaseSource *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *testCaseFiles;

  v3 = (void *)MEMORY[0x2348A8D30](self, a2);
  currTestCaseSource = self->_currTestCaseSource;
  if (currTestCaseSource)
  {
    -[TTKTestCaseSource getNextTestCase](currTestCaseSource, "getNextTestCase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_15;
    v6 = self->_currTestCaseSource;
    self->_currTestCaseSource = 0;

  }
  if (-[NSMutableArray count](self->_testCaseFiles, "count"))
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    rootDir = self->_rootDir;
    currDir = self->_currDir;
    -[NSMutableArray objectAtIndex:](self->_testCaseFiles, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", rootDir, currDir, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_testCaseFiles, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TTKTestCaseReader loadFromFile:inputMode:layouts:](TTKTestCaseReader, "loadFromFile:inputMode:layouts:", v12, self->_inputMode, self->_layouts);
    v13 = (TTKTestCaseSource *)objc_claimAutoreleasedReturnValue();
    v14 = self->_currTestCaseSource;
    self->_currTestCaseSource = v13;

    -[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      -[TTKDirSource onNewLayoutsFound](self, "onNewLayoutsFound");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_14:
        -[TTKDirSource getNextTestCase](self, "getNextTestCase");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_layouts);
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      -[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v18);

      layouts = self->_layouts;
      self->_layouts = v17;
      v20 = v17;

      -[TTKDirSource onNewLayoutsFound](self, "onNewLayoutsFound");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *))v15)[2](v15, v21);
    }

    goto LABEL_14;
  }
  if (-[NSMutableArray count](self->_testCaseDirs, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_testCaseDirs, "objectAtIndex:", 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_currDir;
    self->_currDir = v22;

    -[NSMutableArray removeObjectAtIndex:](self->_testCaseDirs, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_rootDir, self->_currDir, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_is_multiDir)
    {
      v24 = -[TTKDirSource init:]([TTKDirSource alloc], "init:", v12);
      v25 = self->_currTestCaseSource;
      self->_currTestCaseSource = v24;

    }
    else
    {
      v26 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentsOfDirectoryAtPath:error:", v12, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayWithArray:", v28);
      v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      testCaseFiles = self->_testCaseFiles;
      self->_testCaseFiles = v29;

      -[NSMutableArray removeObject:](self->_testCaseFiles, "removeObject:", CFSTR(".DS_Store"));
    }
    goto LABEL_14;
  }
  v5 = 0;
LABEL_15:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)init:(id)a3
{
  id v5;
  NSObject *v6;
  TTKDirSource *v7;
  TTKDirSource *v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  TTKLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 4);
    _os_log_debug_impl(&dword_22FA56000, v6, OS_LOG_TYPE_DEBUG, "Loading test cases from directory %s", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)TTKDirSource;
  v7 = -[TTKDirSource init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rootDir, a3);
    -[TTKDirSource reset](v8, "reset");
  }

  return v8;
}

- (void)reset
{
  TTKTestCaseSource *currTestCaseSource;
  NSString *currDir;
  NSMutableArray *v5;
  NSMutableArray *testCaseDirs;
  NSMutableArray *v7;
  NSMutableArray *testCaseFiles;

  currTestCaseSource = self->_currTestCaseSource;
  self->_currTestCaseSource = 0;

  currDir = self->_currDir;
  self->_currDir = (NSString *)&stru_24FD49B78;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  testCaseDirs = self->_testCaseDirs;
  self->_testCaseDirs = v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  testCaseFiles = self->_testCaseFiles;
  self->_testCaseFiles = v7;

  -[TTKDirSource loadRootDir](self, "loadRootDir");
}

- (void)loadLayouts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary **p_layouts;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  float v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  float v46;
  void *v47;
  id *location;
  id *locationa;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  _QWORD v66[2];
  _BYTE v67[128];
  _BYTE v68[128];
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x2348A8D30]();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v52 = v4;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v4, &v65);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v65;

  if (!v8)
  {
    v50 = v5;
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    v51 = v10;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v62;
      location = (id *)&self->_inputMode;
      p_layouts = &self->_layouts;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v62 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR(".DS_Store")) & 1) == 0)
          {
            v17 = (void *)MEMORY[0x24BDD17C8];
            v69[0] = v52;
            v69[1] = v16;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "pathWithComponents:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v16, "isEqualToString:", CFSTR("layouts.json")) & 1) != 0)
            {
              +[TTKTestCaseReader loadFromFile:](TTKTestCaseReader, "loadFromFile:", v19);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "inputMode");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)MEMORY[0x24BDBCED8];
              objc_msgSend(v29, "layouts");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "dictionaryWithDictionary:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = objc_msgSend(v29, "majorVersion");
              v35 = objc_msgSend(v29, "minorVersion");
              objc_msgSend(v29, "fileVersion");
              if (*location)
              {
                v47 = v30;
                locationa = (id *)v29;
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                objc_msgSend(v33, "allKeys");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v58;
                  do
                  {
                    for (j = 0; j != v39; ++j)
                    {
                      if (*(_QWORD *)v58 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                      -[NSMutableDictionary objectForKey:](*p_layouts, "objectForKey:", v42);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v43)
                      {
                        v44 = *p_layouts;
                        objc_msgSend(v33, "objectForKeyedSubscript:", v42);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v45, v42);

                      }
                    }
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
                  }
                  while (v39);
                }

                v30 = v47;
                v29 = locationa;
              }
              else
              {
                v46 = v36;
                objc_storeStrong(location, v30);
                objc_storeStrong((id *)&self->_layouts, v33);
                self->_majorVersion = v34;
                self->_minorVersion = v35;
                self->_fileVersion = v46;
              }

              goto LABEL_35;
            }

            v10 = v51;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v12)
          continue;
        break;
      }
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          if ((objc_msgSend(v25, "isEqualToString:", CFSTR(".DS_Store")) & 1) == 0)
          {
            v26 = (void *)MEMORY[0x24BDD17C8];
            v66[0] = v52;
            v66[1] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "pathWithComponents:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[TTKDirSource loadLayouts:](self, "loadLayouts:", v28);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      }
      while (v22);
    }
LABEL_35:
    v7 = v51;

    v8 = 0;
    v5 = v50;
  }

  objc_autoreleasePoolPop(v5);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9;
  unint64_t result;

  if (!a3->var0)
    a3->var2 = a3->var3;
  a3->var0 = 0;
  if (a5)
  {
    do
    {
      -[TTKDirSource getNextTestCase](self, "getNextTestCase");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      result = a3->var0;
      if (!v9)
        break;
      a3->var0 = result + 1;
      a4[result] = v9;
      result = a3->var0;
    }
    while (a3->var0 < a5);
  }
  else
  {
    result = 0;
  }
  a3->var1 = a4;
  return result;
}

- (NSDictionary)layouts
{
  return &self->_layouts->super;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (void)setOnNewLayoutsFound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_currTestCaseSource, 0);
  objc_storeStrong((id *)&self->_testCaseFiles, 0);
  objc_storeStrong((id *)&self->_testCaseDirs, 0);
  objc_storeStrong((id *)&self->_currDir, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
