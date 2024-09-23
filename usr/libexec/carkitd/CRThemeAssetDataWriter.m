@implementation CRThemeAssetDataWriter

- (CRThemeAssetDataWriter)initWithAssetURL:(id)a3 version:(id)a4 chunkCount:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRThemeAssetDataWriter *v12;
  CRThemeAssetDataWriter *v13;
  CRFileTransferDataWriter *v14;
  void *v15;
  CRThemeAssetDataWriter *v16;
  CRFileTransferDataWriter *assetArchiveWriter;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRThemeAssetDataWriter;
  v12 = -[CRThemeAssetDataWriter init](&v19, "init");
  v13 = v12;
  if (!v12)
    goto LABEL_4;
  objc_storeStrong((id *)&v12->_assetURL, a3);
  objc_storeStrong((id *)&v13->_version, a4);
  v14 = [CRFileTransferDataWriter alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDataWriter _assetArchiveURL](v13, "_assetArchiveURL"));
  v16 = -[CRFileTransferDataWriter initWithFileURL:chunkCount:](v14, "initWithFileURL:chunkCount:", v15, v11);

  if (v16)
  {
    assetArchiveWriter = v13->_assetArchiveWriter;
    v13->_assetArchiveWriter = (CRFileTransferDataWriter *)v16;

LABEL_4:
    v16 = v13;
  }

  return v16;
}

- (id)_assetArchiveURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDataWriter assetURL](self, "assetURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CARThemeAssetArchiveFilename));

  return v3;
}

- (BOOL)saveCertificateData:(id)a3 signatureData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  NSObject *v25;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDataWriter assetURL](self, "assetURL"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", CARThemeAssetCertificateFilename));

  v23 = 0;
  v10 = objc_msgSend(v7, "writeToURL:options:error:", v9, 0, &v23);

  v11 = v23;
  v12 = CarThemeAssetsLogging();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "saved certificate to %@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDataWriter assetURL](self, "assetURL"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:", CARThemeAssetSignatureFilename));

    v22 = 0;
    v16 = objc_msgSend(v6, "writeToURL:options:error:", v14, 0, &v22);
    v17 = v22;
    v18 = CarThemeAssetsLogging();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "saved signature to %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      sub_10006BAC4();
    }

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006BB24();
    v16 = 0;
  }

  return v16;
}

- (BOOL)saveAdditionsData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDataWriter assetURL](self, "assetURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CARThemeAssetAccessoryAdditionsFilename));

  v13 = 0;
  v7 = objc_msgSend(v4, "writeToURL:options:error:", v6, 0, &v13);

  v8 = v13;
  v9 = CarThemeAssetsLogging();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "saved accesory additions to %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10006BB84();
  }

  return v7;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (NSNumber)version
{
  return self->_version;
}

- (CRFileTransferDataWriter)assetArchiveWriter
{
  return self->_assetArchiveWriter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetArchiveWriter, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end
