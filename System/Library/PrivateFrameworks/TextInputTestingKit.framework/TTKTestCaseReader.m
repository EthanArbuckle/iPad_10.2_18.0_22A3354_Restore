@implementation TTKTestCaseReader

+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  TTKLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4);
    _os_log_debug_impl(&dword_22FA56000, v10, OS_LOG_TYPE_DEBUG, "Loading data from file %s", (uint8_t *)&v17, 0xCu);
  }

  v11 = (void *)MEMORY[0x2348A8D30]();
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "open");
  if (objc_msgSend(v12, "streamStatus") == 7)
  {
    TTKLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = (uint64_t)v7;
      _os_log_error_impl(&dword_22FA56000, v13, OS_LOG_TYPE_ERROR, "Error loading JSON from a file : %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v12, "close");
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithStream:options:error:", v12, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TTKFileSource init:inputMode:layouts:]([TTKFileSource alloc], "init:inputMode:layouts:", v15, v8, v9);
    objc_msgSend(v12, "close");

  }
  objc_autoreleasePoolPop(v11);

  return v14;
}

+ (id)loadFromFile:(id)a3
{
  return (id)objc_msgSend(a1, "loadFromFile:inputMode:layouts:", a3, 0, 0);
}

+ (id)loadFromDir:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TTKDirSource init:]([TTKDirSource alloc], "init:", v3);

  return v4;
}

+ (id)loadFromPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadFromPath:fileManager:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadFromPath:(id)a3 fileManager:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  char v11;

  v6 = a3;
  v11 = 0;
  v7 = objc_msgSend(a4, "fileExistsAtPath:isDirectory:", v6, &v11);
  if (v7 && v11)
  {
    objc_msgSend(a1, "loadFromDir:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend(a1, "loadFromFile:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

@end
