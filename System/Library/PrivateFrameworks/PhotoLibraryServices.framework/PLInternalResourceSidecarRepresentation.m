@implementation PLInternalResourceSidecarRepresentation

- (id)extension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v6;
  }
  else
  {
    objc_msgSend(v5, "uniformTypeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLInternalResourceSidecarRepresentation resource](self, "resource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "resourceType") == 5)
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CEC4A0]);

      if (v13)
      {
        -[PLInternalResourceSidecarRepresentation resource](self, "resource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pathManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isUBF");

        v17 = (void *)*MEMORY[0x1E0D75A70];
        if (v16)
        {
          v18 = v17;
        }
        else
        {
          objc_msgSend(v17, "uppercaseString");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v8 = v18;
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[PLInternalResourceSidecarRepresentation resource](self, "resource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniformTypeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferredExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "resourceType");

  if (v22 == 3)
  {
    objc_msgSend(v8, "uppercaseString");
    v23 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v23;
  }
  return v8;
}

- (PLInternalResourceSidecarRepresentation)initWithResource:(id)a3
{
  id v5;
  PLInternalResourceSidecarRepresentation *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLInternalResourceSidecarRepresentation;
  v6 = -[PLInternalResourceSidecarRepresentation init](&v9, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLInternalResource+SidecarAdoption.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    }
    objc_storeWeak((id *)&v6->_resource, v5);
  }

  return v6;
}

- (NSDate)captureDate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCreated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)modificationDate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSString)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSNumber)compressedSize
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "dataLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (PLManagedAsset)asset
{
  void *v2;
  void *v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLManagedAsset *)v3;
}

- (NSNumber)index
{
  void *v2;
  void *v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sidecarIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setPtpTrashedState:(int64_t)a3
{
  id v4;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPtpTrashedState:", a3);

}

- (int64_t)ptpTrashedState
{
  void *v2;
  int64_t v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ptpTrashedState");

  return v3;
}

- (signed)indexValue
{
  void *v2;
  void *v3;
  signed __int16 v4;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sidecarIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shortValue");

  return v4;
}

- (unint64_t)compressedSizeValue
{
  void *v2;
  unint64_t v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataLength");

  return v3;
}

- (NSString)filename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInternalResourceSidecarRepresentation extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)originalFilename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInternalResourceSidecarRepresentation extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSManagedObjectID)objectID
{
  void *v2;
  void *v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectID *)v3;
}

- (NSURL)fileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PLInternalResourceSidecarRepresentation resource](self, "resource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUBF");

    -[PLInternalResourceSidecarRepresentation resource](self, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PLInternalResourceSidecarRepresentation resource](self, "resource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInternalResourceSidecarRepresentation resource](self, "resource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "bundleScope");
      -[PLInternalResourceSidecarRepresentation resource](self, "resource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniformTypeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInternalResourceSidecarRepresentation resource](self, "resource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v24, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:", v12, v15, v18, 0, objc_msgSend(v19, "resourceType"));

      objc_msgSend(v11, "readOnlyUrlWithIdentifier:", v20);
    }
    else
    {
      objc_msgSend(v8, "asset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mainFileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLByDeletingLastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLInternalResourceSidecarRepresentation filename](self, "filename");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", v20);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLInternalResourceSidecarRepresentation;
  -[PLInternalResourceSidecarRepresentation description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResourceSidecarRepresentation filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResourceSidecarRepresentation fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResourceSidecarRepresentation compressedSize](self, "compressedSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResourceSidecarRepresentation index](self, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" filename: %@, fileURL: %@, compressedSize: %@, index: %@, trashedState: %ld"), v4, v5, v6, v7, -[PLInternalResourceSidecarRepresentation ptpTrashedState](self, "ptpTrashedState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unsigned)resourceType
{
  void *v2;
  unsigned int v3;

  -[PLInternalResourceSidecarRepresentation resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resourceType");

  return v3;
}

- (PLInternalResource)resource
{
  return (PLInternalResource *)objc_loadWeakRetained((id *)&self->_resource);
}

- (void)setResource:(id)a3
{
  objc_storeWeak((id *)&self->_resource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resource);
}

@end
