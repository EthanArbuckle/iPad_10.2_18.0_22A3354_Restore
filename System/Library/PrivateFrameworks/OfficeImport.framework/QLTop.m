@implementation QLTop

- (void)initializeClasses
{
  objc_opt_class();
  objc_opt_class();
}

- (Class)stateClass
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 368, CFSTR("Please override -[%@ %@]"), v5, v6);

  return 0;
}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 374, CFSTR("Please override -[%@ %@]"), v6, v7);

  return 0;
}

- (Class)readerClassForXMLDocuments
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 380, CFSTR("Please override -[%@ %@]"), v5, v6);

  return 0;
}

- (Class)readerClassForBinaryDocuments
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 386, CFSTR("Please override -[%@ %@]"), v5, v6);

  return 0;
}

- (void)setupMappingStateWithDocument:(id)a3
{
  CMIndexingState *v4;
  CMState *state;
  CMMapper *v6;
  CMMapper *mapper;
  id v8;

  v8 = a3;
  if (self->_forIndexing)
    v4 = objc_alloc_init(CMIndexingState);
  else
    v4 = (CMIndexingState *)objc_alloc_init(-[QLTop stateClass](self, "stateClass"));
  state = self->_state;
  self->_state = &v4->super;

  -[CMState setIsOnPhone:](self->_state, "setIsOnPhone:", -[CMArchiveManager isOnPhone](self->_archiver, "isOnPhone"));
  -[CMState setSourceFormat:](self->_state, "setSourceFormat:", self->_format);
  -[CMState setIsThumbnail:](self->_state, "setIsThumbnail:", -[CMArchiveManager isThumbnail](self->_archiver, "isThumbnail"));
  -[CMState setDocument:](self->_state, "setDocument:", v8);
  v6 = (CMMapper *)objc_msgSend(objc_alloc(-[QLTop mapperClassForIndexing:](self, "mapperClassForIndexing:", self->_forIndexing)), "initWithDocument:archiver:", v8, self->_archiver);
  mapper = self->_mapper;
  self->_mapper = v6;

  -[CMMapper setFileName:](self->_mapper, "setFileName:", self->_fileName);
}

- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  NSString *v17;
  NSString *fileName;
  OCDDocument *v19;
  OCDDocument *document;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_storeStrong((id *)&self->_archiver, a7);
  self->_format = a6;
  if (v15)
  {
    v17 = (NSString *)v15;
  }
  else
  {
    objc_msgSend(v21, "lastPathComponent");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  fileName = self->_fileName;
  self->_fileName = v17;

  self->_forIndexing = a8;
  -[QLTop documentWithFile:orData:isXML:archiver:](self, "documentWithFile:orData:isXML:archiver:", v21, v14, (a6 & 0xFFFFFFFFFFFFFFF9) == 0, v16);
  v19 = (OCDDocument *)objc_claimAutoreleasedReturnValue();
  document = self->_document;
  self->_document = v19;

  if ((objc_msgSend((id)objc_opt_class(), "supportsProgressiveMapping") & 1) == 0)
  {
    -[QLTop setupMappingStateWithDocument:](self, "setupMappingStateWithDocument:", self->_document);
    -[CMMapper mapWithState:](self->_mapper, "mapWithState:", self->_state);
  }

}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_alloc_init((Class)a1);
  v16 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v15, "readFile:orData:dataFileName:format:archiver:forIndexing:", v17, v12, v13, a6, v14, 0);
  objc_autoreleasePoolPop(v16);

}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 dataFormat:(unint64_t)a4 archiver:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a5;
  v8 = classForFormat(a4);
  if (v8)
    objc_msgSend(v8, "fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:", v9, 0, 0, a4, v7);
  else
    +[QLTop fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:](WMTop, "fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:", v9, 0, 0, a4, v7);

}

+ (id)metadataForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CMFileManager getFileTypeFromPath:](CMFileManager, "getFileTypeFromPath:", v7);

  if ((v8 & 0xFFFFFFFFFFFFFFF9) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("QLTop.mm"), 492, CFSTR("XML file import is implemented in OISpotlightImporter, not in QLTop"));

  }
  v9 = (objc_class *)classForFormat(v8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("QLTop.mm"), 495, CFSTR("Missing importer class for file type %@"), v17);

  }
  v10 = (id *)objc_alloc_init(v9);
  v11 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "readFile:orData:dataFileName:format:archiver:forIndexing:", v12, 0, 0, v8, 0, 1);

  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10[2], "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)searchableAttributesForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CMFileManager getFileTypeFromPath:](CMFileManager, "getFileTypeFromPath:", v7);

  if ((v8 & 0xFFFFFFFFFFFFFFF9) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("QLTop.mm"), 522, CFSTR("XML file import is implemented in OISpotlightImporter, not in QLTop"));

  }
  v9 = (objc_class *)classForFormat(v8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("QLTop.mm"), 525, CFSTR("Missing importer class for file type %@"), v17);

  }
  v10 = (id *)objc_alloc_init(v9);
  v11 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "readFile:orData:dataFileName:format:archiver:forIndexing:", v12, 0, 0, v8, 0, 1);

  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10[2], "searchableAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)fillHTMLArchiveForOfficeData:(id)a3 fileName:(id)a4 dataFormat:(unint64_t)a5 archiver:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a6;
  v11 = classForFormat(a5);
  if (v11)
    objc_msgSend(v11, "fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:", 0, v12, v9, a5, v10);
  else
    +[QLTop fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:](WMTop, "fillHTMLArchiveForOfficeFile:orData:dataFileName:dataFormat:archiver:", 0, v12, v9, a5, v10);

}

- (id)documentWithFile:(id)a3 orData:(id)a4 isXML:(BOOL)a5 archiver:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v26;
  unsigned int v27;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  -[QLTop initializeClasses](self, "initializeClasses");
  if (v7)
    v14 = -[QLTop readerClassForXMLDocuments](self, "readerClassForXMLDocuments");
  else
    v14 = -[QLTop readerClassForBinaryDocuments](self, "readerClassForBinaryDocuments");
  v15 = v14;
  if ((-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 580, CFSTR("reader class should be an OCDEncryptedReader"));

  }
  v16 = (void *)objc_msgSend([v15 alloc], "initWithCancelDelegate:", v13);
  objc_msgSend(v16, "setIsThumbnail:", objc_msgSend(v13, "isThumbnail"));
  if (v12)
  {
    objc_msgSend(v16, "setData:", v12);
  }
  else if (v11)
  {
    objc_msgSend(v16, "setFileName:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("QLTop.mm"), 593, CFSTR("No file Data or file path"));

  }
  objc_msgSend(v16, "setDelegate:", self);
  if (objc_msgSend(v16, "start"))
  {
    v27 = 8011;
    if (objc_msgSend(v16, "retainDecryptorWithErrorCode:", &v27))
    {
      objc_msgSend(v16, "decryptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isReadProtectedUsingDefaultPassphrase");

      if ((v19 & 1) != 0
        || (objc_msgSend(v13, "passphrase"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        && (objc_msgSend(v16, "decryptor"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "verifyPassphrase:", v20),
            v21,
            v20,
            (v22 & 1) != 0))
      {
        NSLog((NSString *)CFSTR("The document was encrypted, but we decrypted it"));
LABEL_26:
        objc_msgSend(v16, "read");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", kCMTopExceptionDocumentIsEncrypted, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "raise");
      v16 = 0;
    }
    else
    {
      if (v27 == 8011)
        goto LABEL_26;
      if (v27 != 8003)
      {
        if (v27 != 8001)
        {
          NSLog((NSString *)CFSTR("Unkown error when reading the document (%d)"), v27);
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("kCMTopExceptionDocumentIsUnsupported"), 0, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "raise");
          goto LABEL_25;
        }
        if (!objc_msgSend(v16, "isBinaryReader"))
          goto LABEL_26;
      }
      NSLog((NSString *)CFSTR("Unsupported encryption method"));
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("kCMTopExceptionDocumentIsUnsupported"), 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "raise");
    }
LABEL_25:

    goto LABEL_26;
  }
  v23 = 0;
LABEL_27:

  return v23;
}

- (void)readerDidStartDocument:(id)a3 withElementCount:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[CMArchiveManager setPageCount:](self->_archiver, "setPageCount:", a4);
  -[QLTop setupMappingStateWithDocument:](self, "setupMappingStateWithDocument:", v6);
  -[CMMapper startMappingWithState:](self->_mapper, "startMappingWithState:", self->_state);

}

- (void)readerDidReadElement:(id)a3 atIndex:(unint64_t)a4 inDocument:(id)a5 isLastElement:(BOOL)a6
{
  -[CMMapper mapElement:atIndex:withState:isLastElement:](self->_mapper, "mapElement:atIndex:withState:isLastElement:", a3, a4, self->_state, a6);
}

- (void)readerDidEndDocument:(id)a3
{
  CMMapper *mapper;
  OCDDocument *document;

  -[CMMapper finishMappingWithState:](self->_mapper, "finishMappingWithState:", self->_state);
  mapper = self->_mapper;
  self->_mapper = 0;

  document = self->_document;
  self->_document = 0;

}

+ (BOOL)supportsProgressiveMapping
{
  return 0;
}

- (CMMapper)mapper
{
  return (CMMapper *)objc_getProperty(self, a2, 8, 1);
}

- (CMState)state
{
  return (CMState *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)forIndexing
{
  return self->_forIndexing;
}

- (void)setForIndexing:(BOOL)a3
{
  self->_forIndexing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mapper, 0);
}

@end
