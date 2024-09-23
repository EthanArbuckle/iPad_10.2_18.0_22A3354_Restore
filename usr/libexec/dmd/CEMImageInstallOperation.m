@implementation CEMImageInstallOperation

- (CEMImageInstallOperation)initWithImageDeclaration:(id)a3 resolver:(id)a4
{
  id v7;
  id v8;
  CEMImageInstallOperation *v9;
  CEMImageInstallOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CEMImageInstallOperation;
  v9 = -[CEMImageInstallOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageDeclaration, a3);
    objc_storeStrong((id *)&v10->_resolver, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation resolver](self, "resolver"));
  objc_msgSend(v3, "resolveAssetWithContext:", self);

}

- (NSString)assetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation imageDeclaration](self, "imageDeclaration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "declarationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation imageDeclaration](self, "imageDeclaration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "declarationServerHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v6));

  return (NSString *)v7;
}

- (CEMAssetBaseDescriptor)assetDescriptor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation imageDeclaration](self, "imageDeclaration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "payloadDescriptor"));

  return (CEMAssetBaseDescriptor *)v3;
}

- (CEMAssetBaseReference)assetReference
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation imageDeclaration](self, "imageDeclaration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "payloadReference"));

  return (CEMAssetBaseReference *)v3;
}

- (void)assetResolutionDidSucceedWithAssetURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  CEMImageAssetInstallMetadata *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;

  v4 = a3;
  if (-[CEMImageInstallOperation isExecuting](self, "isExecuting"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager dmd_userImageDatabaseDirectoryURL](NSFileManager, "dmd_userImageDatabaseDirectoryURL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v20 = 0;
      v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v20);
      v8 = v20;

      if ((v7 & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageInstallOperation assetIdentifier](self, "assetIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v9, v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v19 = v8;
        LOBYTE(v11) = objc_msgSend(v13, "copyItemAtURL:toURL:error:", v4, v12, &v19);
        v14 = v19;

        if ((v11 & 1) != 0)
        {
          v15 = objc_opt_new(CEMImageAssetInstallMetadata);
          -[CEMImageAssetInstallMetadata setImageURL:](v15, "setImageURL:", v12);
          -[CEMImageInstallOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);

        }
        else
        {
          -[CEMImageInstallOperation endOperationWithError:](self, "endOperationWithError:", v14);
        }

      }
      else
      {
        -[CEMImageInstallOperation endOperationWithError:](self, "endOperationWithError:", v8);
        v14 = v8;
      }

    }
    else
    {
      v16 = DMFConfigurationEngineLog();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100070F50(v17);

      v18 = DMFErrorWithCodeAndUserInfo(0, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue(v18);
      -[CEMImageInstallOperation endOperationWithError:](self, "endOperationWithError:", v14);
    }

  }
}

- (void)assetResolutionFailedWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CEMImageInstallOperation isExecuting](self, "isExecuting"))
    -[CEMImageInstallOperation endOperationWithError:](self, "endOperationWithError:", v4);

}

- (CEMImageDeclaration)imageDeclaration
{
  return self->_imageDeclaration;
}

- (void)setImageDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_imageDeclaration, a3);
}

- (DMDRemoteAssetResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_imageDeclaration, 0);
}

@end
