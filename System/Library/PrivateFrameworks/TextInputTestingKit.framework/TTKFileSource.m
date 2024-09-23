@implementation TTKFileSource

- (void)parseLayouts:(id)a3
{
  id v4;
  NSDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TTKSimpleKeyboardPlane *v11;
  void *v12;
  NSDictionary *layouts;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("layouts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[TTKSimpleKeyboardPlane initWithJsonDictionary:]([TTKSimpleKeyboardPlane alloc], "initWithJsonDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        -[TTKSimpleKeyboardPlane name](v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v11, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  layouts = self->_layouts;
  self->_layouts = v5;

}

- (BOOL)parseData:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  int majorVersion;
  void *v9;
  NSString *v10;
  NSString *inputMode;
  NSMutableArray *v12;
  NSMutableArray *test_cases;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  TTKTestCase *v18;
  NSObject *v19;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("major_version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_majorVersion = objc_msgSend(v7, "intValue");

    majorVersion = self->_majorVersion;
    v6 = majorVersion == 2;
    if (majorVersion == 2)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("minor_version"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_minorVersion = objc_msgSend(v9, "intValue");

      self->_fileVersion = (float)((float)self->_minorVersion / 10.0) + (float)self->_majorVersion;
      if (!self->_inputMode)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("input_mode"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        inputMode = self->_inputMode;
        self->_inputMode = v10;

      }
      if (!self->_layouts)
        -[TTKFileSource parseLayouts:](self, "parseLayouts:", v4);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      test_cases = self->_test_cases;
      self->_test_cases = v12;

      objc_msgSend(v4, "objectForKey:", CFSTR("test_cases"));
      v19 = objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v19);
            v18 = -[TTKTestCase initWithDictionary:]([TTKTestCase alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            -[NSMutableArray addObject:](self->_test_cases, "addObject:", v18);

          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }
    }
    else
    {
      TTKLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_majorVersion;
        *(_DWORD *)buf = 67109376;
        v29 = v22;
        v30 = 1024;
        v31 = 2;
        _os_log_error_impl(&dword_22FA56000, v19, OS_LOG_TYPE_ERROR, "Error: file major version %d incompatible with CURRENT_MAJOR_VERSION_NUMBER %d", buf, 0xEu);
      }
    }

  }
  return v6;
}

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v8;
  id v9;
  id v10;
  TTKFileSource *v11;
  id *p_isa;
  id *v13;
  NSObject *v14;
  uint8_t v16[16];
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TTKFileSource;
  v11 = -[TTKFileSource init](&v17, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (!v11)
    goto LABEL_4;
  objc_storeStrong((id *)&v11->_inputMode, a4);
  objc_storeStrong(p_isa + 3, a5);
  if ((objc_msgSend(p_isa, "parseData:", v8) & 1) != 0)
  {
    objc_msgSend(p_isa, "reset");
LABEL_4:
    v13 = p_isa;
    goto LABEL_8;
  }
  TTKLogFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_22FA56000, v14, OS_LOG_TYPE_ERROR, "Unable to parse data from input file", v16, 2u);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (void)reset
{
  self->_test_case_index = 0;
}

- (id)getNextTestCase
{
  unint64_t test_case_index;
  NSMutableArray *test_cases;
  void *v5;

  test_case_index = self->_test_case_index;
  if (-[NSMutableArray count](self->_test_cases, "count") <= test_case_index)
  {
    v5 = 0;
  }
  else
  {
    test_cases = self->_test_cases;
    ++self->_test_case_index;
    -[NSMutableArray objectAtIndex:](test_cases, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
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
      -[TTKFileSource getNextTestCase](self, "getNextTestCase");
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
  return self->_layouts;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_test_cases, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
