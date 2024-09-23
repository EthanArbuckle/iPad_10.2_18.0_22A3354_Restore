@implementation TSUSafeSaveAssistant

- (TSUSafeSaveAssistant)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSafeSaveAssistant init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSafeSaveAssistant.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 16, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSUSafeSaveAssistant init]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)initForSavingToURL:(id)a3 error:(id *)a4
{
  id v6;
  TSUSafeSaveAssistant *v7;
  uint64_t v8;
  NSURL *saveURL;
  uint64_t v10;
  NSURL *temporaryDirectoryURL;
  NSURL *v12;
  _BOOL4 v13;
  TSUSafeSaveAssistant *v14;
  TSUSafeSaveAssistant *v15;
  NSURL *v16;
  void *writeURL;
  TSUSafeSaveAssistant *v18;
  NSURL *v19;
  uint64_t v20;
  NSURL *v21;
  id v23;
  objc_super v24;

  v6 = a3;
  if (v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)TSUSafeSaveAssistant;
    v7 = -[TSUSafeSaveAssistant init](&v24, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      saveURL = v7->_saveURL;
      v7->_saveURL = (NSURL *)v8;

      objc_msgSend((id)objc_opt_class(), "temporaryDirectoryURLForWritingToURL:error:", v6, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      temporaryDirectoryURL = v7->_temporaryDirectoryURL;
      v7->_temporaryDirectoryURL = (NSURL *)v10;

      if (v7->_temporaryDirectoryURL)
      {
        v12 = v7->_saveURL;
        v23 = 0;
        v13 = -[NSURL getResourceValue:forKey:error:](v12, "getResourceValue:forKey:error:", &v23, *MEMORY[0x24BDBCC60], 0);
        v14 = (TSUSafeSaveAssistant *)v23;
        v15 = v14;
        if (v13 && -[TSUSafeSaveAssistant BOOLValue](v14, "BOOLValue"))
        {
          v16 = v7->_temporaryDirectoryURL;
          writeURL = v7->_writeURL;
          v7->_writeURL = v16;
        }
        else
        {
          v19 = v7->_temporaryDirectoryURL;
          -[NSURL lastPathComponent](v7->_saveURL, "lastPathComponent");
          writeURL = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL URLByAppendingPathComponent:](v19, "URLByAppendingPathComponent:", writeURL);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v7->_writeURL;
          v7->_writeURL = (NSURL *)v20;

        }
      }
      else
      {
        v15 = v7;
        v7 = 0;
      }

    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUSafeSaveAssistant removeTemporaryDirectory](self, "removeTemporaryDirectory");
  v3.receiver = self;
  v3.super_class = (Class)TSUSafeSaveAssistant;
  -[TSUSafeSaveAssistant dealloc](&v3, sel_dealloc);
}

- (BOOL)endSaveWithSuccess:(BOOL)a3 addingAttributes:(id)a4 error:(id *)a5
{
  return -[TSUSafeSaveAssistant endSaveWithSuccess:toURL:addingAttributes:error:](self, "endSaveWithSuccess:toURL:addingAttributes:error:", a3, self->_saveURL, a4, a5);
}

- (BOOL)endSaveWithSuccess:(BOOL)a3 toURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v11 = a4;
  v12 = a5;
  if (!self->_temporaryDirectoryURL)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSafeSaveAssistant endSaveWithSuccess:toURL:addingAttributes:error:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSafeSaveAssistant.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 66, CFSTR("%@ should only be called once."), v17);

    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v13 = objc_msgSend((id)objc_opt_class(), "finishWritingToURL:byMovingItemAtURL:addingAttributes:error:", v11, self->_writeURL, v12, a6);
LABEL_6:
  -[TSUSafeSaveAssistant removeTemporaryDirectory](self, "removeTemporaryDirectory");

  return v13;
}

- (void)removeTemporaryDirectory
{
  NSURL *temporaryDirectoryURL;

  if (self->_temporaryDirectoryURL)
  {
    objc_msgSend((id)objc_opt_class(), "removeTemporaryDirectoryAtURL:", self->_temporaryDirectoryURL);
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;

  }
}

+ (id)temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v6, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)writeAttributes:(id)a3 toURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != (v6 != 0) || objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v9, v7, 0);

    }
  }

}

+ (BOOL)finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDD1580];
  v13 = a3;
  objc_msgSend(v12, "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "fileExistsAtPath:", v15)
    && !objc_msgSend(v14, "removeItemAtPath:error:", v15, a6))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(a1, "writeAttributes:toURL:", v11, v10);
    objc_msgSend(v10, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "moveItemAtPath:toPath:error:", v16, v15, a6);

  }
  return v17;
}

+ (void)removeTemporaryDirectoryAtURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_saveURL, 0);
}

@end
