@implementation TTKFileSink

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v9;
  id v10;
  id v11;
  TTKFileSink *v12;
  TTKFileSink *v13;
  uint64_t v14;
  NSMutableArray *testCases;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TTKFileSink;
  v12 = -[TTKFileSink init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileName, a3);
    objc_storeStrong((id *)&v13->_inputMode, a4);
    objc_storeStrong((id *)&v13->_layouts, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    testCases = v13->_testCases;
    v13->_testCases = (NSMutableArray *)v14;

  }
  return v13;
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

- (void)pushNextTestCase:(id)a3
{
  -[NSMutableArray addObject:](self->_testCases, "addObject:", a3);
}

- (id)generateLayouts
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_layouts;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSDictionary objectForKey:](self->_layouts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "toJsonDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)generateTestCases
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_testCases;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "toJsonDictionary", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)generateData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("major_version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("minor_version"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_inputMode, CFSTR("input_mode"));
  if (self->_layouts)
  {
    -[TTKFileSink generateLayouts](self, "generateLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("layouts"));

  }
  if (self->_testCases)
  {
    -[TTKFileSink generateTestCases](self, "generateTestCases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("test_cases"));

  }
  return v3;
}

- (void)close
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x2348A8D30](self, a2);
  objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamToFileAtPath:append:", self->_fileName, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "open");
  if (objc_msgSend(v4, "streamStatus") == 7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22FA56000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error opening JSON from a file", buf, 2u);
    }
    objc_msgSend(v4, "close");
  }
  else
  {
    -[TTKFileSink generateData](self, "generateData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v5, v4, 1, &v6))
      NSLog(CFSTR("Error writing JSON Data"));
    objc_msgSend(v4, "close");

  }
  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCases, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
