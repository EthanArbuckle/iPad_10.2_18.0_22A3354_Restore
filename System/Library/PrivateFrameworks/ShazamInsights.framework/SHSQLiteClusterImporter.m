@implementation SHSQLiteClusterImporter

- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SHClusterMetadata *v21;
  id v22;
  SHClusterMetadata *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "dataFilePathURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:error:](SHClusterMetadataQuery, "metadataFromDatabaseAtLocation:error:", v12, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v25;

  if (!v13)
  {
    if (a6)
    {
      v22 = objc_retainAutorelease(v14);
LABEL_9:
      LOBYTE(v17) = 0;
      *a6 = v22;
      goto LABEL_11;
    }
LABEL_10:
    LOBYTE(v17) = 0;
    goto LABEL_11;
  }
  v15 = objc_msgSend(v10, "clusterType");
  if (v15 != objc_msgSend(v13, "clusterType"))
  {
    if (a6)
    {
      +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "dataFilePathURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = +[SHClusterImporterUtils copyDatabaseFromURL:toDatabaseDestinationURL:error:](SHClusterImporterUtils, "copyDatabaseFromURL:toDatabaseDestinationURL:error:", v16, v11, a6);

  if ((_DWORD)v17)
  {
    v24 = [SHClusterMetadata alloc];
    v18 = objc_msgSend(v13, "clusterType");
    objc_msgSend(v13, "storefront");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueHash");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SHClusterMetadata initWithType:storefront:uniqueHash:creationDate:](v24, "initWithType:storefront:uniqueHash:creationDate:", v18, v19, v20, v17);

    LOBYTE(v17) = +[SHClusterMetadataQuery writeMetadata:toDatabaseAtLocation:error:](SHClusterMetadataQuery, "writeMetadata:toDatabaseAtLocation:error:", v21, v11, a6);
  }
LABEL_11:

  return (char)v17;
}

@end
