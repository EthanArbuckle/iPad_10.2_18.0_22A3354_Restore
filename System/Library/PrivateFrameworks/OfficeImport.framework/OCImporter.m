@implementation OCImporter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

- (OCImporter)initWithURL:(id)a3
{
  id v4;
  OCImporter *v5;
  OCImporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OCImporter;
  v5 = -[OCMapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[OCImporter setURL:](v5, "setURL:", v4);
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)+[CXCommon ignoreExternalEntityLoader](CXCommon, "ignoreExternalEntityLoader"));
  }

  return v6;
}

- (OCImporter)initWithData:(id)a3
{
  id v5;
  OCImporter *v6;
  OCImporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OCImporter;
  v6 = -[OCMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mData, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  xmlSetExternalEntityLoader((xmlExternalEntityLoader)+[CXCommon defaultExternalEntityLoader](CXCommon, "defaultExternalEntityLoader"));
  v3.receiver = self;
  v3.super_class = (Class)OCImporter;
  -[OCImporter dealloc](&v3, sel_dealloc);
}

- (id)url
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->mURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mURL, a3);
    v5 = v6;
  }

}

- (BOOL)tryAlternateReader
{
  return self->mTryAlternateReader;
}

- (BOOL)isDocumentEncryptedUnsupportedVersionHelper:(BOOL *)a3 errorMessage:(id *)a4 readError:(BOOL *)a5
{
  OCDReader *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v21;

  if (-[OCImporter start](self, "start"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = self->mReader;
      v21 = 0;
      if ((-[OCDReader retainDecryptorWithErrorCode:](v9, "retainDecryptorWithErrorCode:", &v21) & 1) != 0)
      {
        -[OCDReader decryptor](v9, "decryptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isReadProtectedUsingDefaultPassphrase");

        if ((v11 & 1) == 0)
        {
          *a3 = 0;
          v12 = 1;
LABEL_18:

          return v12;
        }
      }
      else
      {
        v19 = v21;
        if (v21 == 8011 || v21 == 8001)
        {
          -[OCDReader verifyFileFormat](self->mReader, "verifyFileFormat");
          v19 = v21;
        }
        if (v19 == 8003)
        {
          v12 = 1;
          *a3 = 1;
          if (a4)
            *a4 = objc_retainAutorelease((id)kErrorMessageUnsupportedEncryption);
          goto LABEL_18;
        }
      }
      v12 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    -[OCDReader startError](self->mReader, "startError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)TCInvalidFileFormatMessage, "messageText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        *a5 = 1;
        objc_msgSend(v14, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v18, "copy");

      }
    }

  }
  return 0;
}

- (BOOL)isDocumentEncryptedUnsupportedVersion:(BOOL *)a3 errorMessage:(id *)a4
{
  BOOL result;
  OCDReader *mReader;
  char v9;

  v9 = 0;
  result = -[OCImporter isDocumentEncryptedUnsupportedVersionHelper:errorMessage:readError:](self, "isDocumentEncryptedUnsupportedVersionHelper:errorMessage:readError:", a3, a4, &v9);
  if (!result && v9)
  {
    if (self->mTryAlternateReader)
    {
      return 0;
    }
    else
    {
      mReader = self->mReader;
      self->mReader = 0;

      self->mTryAlternateReader = 1;
      *a4 = 0;
      return -[OCImporter isDocumentEncryptedUnsupportedVersionHelper:errorMessage:readError:](self, "isDocumentEncryptedUnsupportedVersionHelper:errorMessage:readError:", a3, a4, &v9);
    }
  }
  return result;
}

- (BOOL)setPassphrase:(id)a3
{
  id v4;
  OCDReader *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = self->mReader;
  -[OCDReader decryptor](v5, "decryptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "verifyPassphrase:", v4);

  if (v7)
    -[OCImporter setLastPasswordAttempted:](self, "setLastPasswordAttempted:", v4);

  return v7;
}

- (id)filename
{
  return -[OCDReader fileName](self->mReader, "fileName");
}

- (id)displayName
{
  void *v2;
  void *v3;

  -[OCDReader fileName](self->mReader, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)finalizeWithDocumentState:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Background objects"), 100.0, 10.0);
  objc_msgSend(v4, "backgroundThreadManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitUntilComplete");

  +[TCProgressContext endStage](TCProgressContext, "endStage");
  +[TCMessageContext reportWarningsToDelegate](TCMessageContext, "reportWarningsToDelegate");

}

+ (id)xmlPathExtensions
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OCImporter xmlPathExtensions]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 211, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "+[OCImporter xmlPathExtensions]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (Class)binaryReaderClass
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OCImporter binaryReaderClass]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 216, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "+[OCImporter binaryReaderClass]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (Class)xmlReaderClass
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OCImporter xmlReaderClass]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 221, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "+[OCImporter xmlReaderClass]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (BOOL)URLIsXML:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "xmlPathExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v6, "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a1;
}

+ (Class)readerClassForURL:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;

  v4 = a3;
  if (objc_msgSend(a1, "URLIsXML:", v4))
    v5 = (void *)objc_msgSend(a1, "xmlReaderClass");
  else
    v5 = (void *)objc_msgSend(a1, "binaryReaderClass");
  v6 = v5;

  return v6;
}

- (BOOL)isXML
{
  return objc_msgSend((id)objc_opt_class(), "URLIsXML:", self->mURL);
}

- (Class)readerClass
{
  int v3;
  int v4;
  void *v5;
  void *v6;

  v3 = -[OCImporter isXML](self, "isXML");
  v4 = -[OCImporter tryAlternateReader](self, "tryAlternateReader");
  v5 = (void *)objc_opt_class();
  if (v3 == v4)
    v6 = (void *)objc_msgSend(v5, "binaryReaderClass");
  else
    v6 = (void *)objc_msgSend(v5, "xmlReaderClass");
  return (Class)v6;
}

- (OITSUProgressContext)progressContext
{
  return (OITSUProgressContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)officeDOMInspector
{
  return self->mOfficeDOMInspector;
}

- (void)setOfficeDOMInspector:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)lastPasswordAttempted
{
  return self->_lastPasswordAttempted;
}

- (void)setLastPasswordAttempted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPasswordAttempted, 0);
  objc_storeStrong(&self->mOfficeDOMInspector, 0);
  objc_storeStrong((id *)&self->mProgressContext, 0);
  objc_storeStrong((id *)&self->mReader, 0);
  objc_storeStrong((id *)&self->mData, 0);
  objc_storeStrong((id *)&self->mURL, 0);
}

- (BOOL)start
{
  return 0;
}

@end
