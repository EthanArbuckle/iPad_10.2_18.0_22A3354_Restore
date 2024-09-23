@implementation TTKDirSink

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8
{
  id v15;
  id v16;
  id v17;
  TTKDirSink *v18;
  TTKDirSink *v19;
  uint64_t v20;
  NSMutableArray *testCasesToWrite;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TTKDirSink;
  v18 = -[TTKDirSink init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_inputMode, a4);
    objc_storeStrong((id *)&v19->_rootDir, a3);
    objc_storeStrong((id *)&v19->_layouts, a5);
    v19->_writeOnFlush = a6;
    v19->_maxTestCasesPerFile = a7;
    v19->_maxFilesPerDirectory = a8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a8);
    v20 = objc_claimAutoreleasedReturnValue();
    testCasesToWrite = v19->_testCasesToWrite;
    v19->_testCasesToWrite = (NSMutableArray *)v20;

  }
  return v19;
}

- (void)addLayouts:(id)a3
{
  void *v4;
  NSDictionary *layouts;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;

  v4 = (void *)MEMORY[0x24BDBCED8];
  layouts = self->_layouts;
  v6 = a3;
  objc_msgSend(v4, "dictionaryWithDictionary:", layouts);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v6);

  v8 = self->_layouts;
  self->_layouts = v7;

}

- (void)close
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TTKDirSink flushFiles](self, "flushFiles");
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", self->_rootDir, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("layouts.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TTKTestCaseWriter storeToFile:inputMode:layouts:](TTKTestCaseWriter, "storeToFile:inputMode:layouts:", v4, self->_inputMode, self->_layouts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "close");
}

- (void)flushFiles
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_testCasesToWrite, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("d%05u"), self->_dirCounter);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("f%05u.json"), self->_fileCounter);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", self->_rootDir, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v3;
    objc_msgSend(v5, "URLByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

    }
    objc_msgSend(v6, "URLByAppendingPathComponent:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TTKTestCaseWriter storeToFile:inputMode:layouts:](TTKTestCaseWriter, "storeToFile:inputMode:layouts:", v13, self->_inputMode, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = self->_testCasesToWrite;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "pushNextTestCase:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "close");
    -[NSMutableArray removeAllObjects](self->_testCasesToWrite, "removeAllObjects");
    v20 = self->_fileCounter + 1;
    self->_fileCounter = v20;
    if (v20 == self->_maxFilesPerDirectory)
      *(_QWORD *)&self->_dirCounter = self->_dirCounter + 1;

  }
}

- (void)pushNextTestCase:(id)a3
{
  -[NSMutableArray addObject:](self->_testCasesToWrite, "addObject:", a3);
  if (-[NSMutableArray count](self->_testCasesToWrite, "count") == self->_maxTestCasesPerFile)
    -[TTKDirSink flushFiles](self, "flushFiles");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCaseFiles, 0);
  objc_storeStrong((id *)&self->_testCaseDirs, 0);
  objc_storeStrong((id *)&self->_currDir, 0);
  objc_storeStrong((id *)&self->_testCasesToWrite, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
}

@end
