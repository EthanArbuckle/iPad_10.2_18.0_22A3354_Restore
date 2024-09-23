@implementation TSUSafeSaveAssistant

- (TSUSafeSaveAssistant)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSafeSaveAssistant init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSafeSaveAssistant.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 22, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUSafeSaveAssistant init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)initForSavingToURL:(id)a3 error:(id *)a4
{
  id v6;
  TSUSafeSaveAssistant *v7;
  uint64_t v8;
  NSURL *saveURL;
  OITSUTemporaryDirectory *v10;
  id v11;
  OITSUTemporaryDirectory *temporaryDirectory;
  OITSUTemporaryDirectory *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *writeURL;
  TSUSafeSaveAssistant *v18;
  id v20;
  objc_super v21;

  v6 = a3;
  if (v6)
  {
    v21.receiver = self;
    v21.super_class = (Class)TSUSafeSaveAssistant;
    v7 = -[TSUSafeSaveAssistant init](&v21, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      saveURL = v7->_saveURL;
      v7->_saveURL = (NSURL *)v8;

      v20 = 0;
      v10 = -[OITSUTemporaryDirectory initForWritingToURL:error:]([OITSUTemporaryDirectory alloc], "initForWritingToURL:error:", v6, &v20);
      v11 = v20;
      temporaryDirectory = v7->_temporaryDirectory;
      v7->_temporaryDirectory = v10;

      v13 = v7->_temporaryDirectory;
      if (v13)
      {
        -[OITSUTemporaryDirectory URL](v13, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL lastPathComponent](v7->_saveURL, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        writeURL = v7->_writeURL;
        v7->_writeURL = (NSURL *)v16;

      }
      else
      {
        v14 = v7;
        v7 = 0;
      }

      if (!a4)
        goto LABEL_11;
    }
    else
    {
      v11 = 0;
      if (!a4)
        goto LABEL_11;
    }
    *a4 = objc_retainAutorelease(v11);
LABEL_11:
    self = v7;

    v18 = self;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:

  return v18;
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
  OITSUTemporaryDirectory *temporaryDirectory;

  v8 = a3;
  v11 = a4;
  v12 = a5;
  if (!self->_temporaryDirectory)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSafeSaveAssistant endSaveWithSuccess:toURL:addingAttributes:error:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSafeSaveAssistant.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 57, 0, "%{public}@ should only be called once.", v16);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v13 = objc_msgSend((id)objc_opt_class(), "finishWritingToURL:byMovingOrCopyingItemAtURL:addingAttributes:error:", v11, self->_writeURL, v12, a6);
LABEL_6:
  temporaryDirectory = self->_temporaryDirectory;
  self->_temporaryDirectory = 0;

  return v13;
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

+ (BOOL)finishWritingToURL:(id)a3 byMovingOrCopyingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  TSUExtendedAttributeCollection *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  int v20;
  id *v21;
  id v22;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileExistsAtPath:", v14))
  {
    v28 = 0;
    v15 = -[TSUExtendedAttributeCollection initWithPath:options:error:]([TSUExtendedAttributeCollection alloc], "initWithPath:options:error:", v14, 0, &v28);
    v16 = v28;
    v17 = v16;
    if (!v15)
    {
      LOBYTE(v20) = 0;
      goto LABEL_11;
    }
    v24 = a6;
    v27 = v16;
    v18 = objc_msgSend(v13, "removeItemAtURL:error:", v10, &v27);
    v19 = v27;

    if (!v18)
    {
      LOBYTE(v20) = 0;
      v17 = v19;
      a6 = v24;
      if (!v24)
        goto LABEL_13;
      goto LABEL_12;
    }
    a6 = v24;
  }
  else
  {
    v15 = 0;
    v19 = 0;
  }
  objc_msgSend(a1, "writeAttributes:toURL:", v12, v11);
  v26 = v19;
  v20 = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v11, v10, &v26);
  v17 = v26;

  if (v20 && v15)
  {
    v25 = v17;
    LOBYTE(v20) = -[TSUExtendedAttributeCollection setAttributeCollectionToPath:intent:options:error:](v15, "setAttributeCollectionToPath:intent:options:error:", v14, 2, 0, &v25);
    v21 = a6;
    v22 = v25;

    v17 = v22;
    a6 = v21;
    if (!v21)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_11:
  if (a6)
LABEL_12:
    *a6 = objc_retainAutorelease(v17);
LABEL_13:

  return v20;
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_saveURL, 0);
}

@end
