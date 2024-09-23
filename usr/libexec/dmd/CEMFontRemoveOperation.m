@implementation CEMFontRemoveOperation

- (CEMFontRemoveOperation)initWithFontDeclaration:(id)a3 installMetadata:(id)a4
{
  id v7;
  id v8;
  CEMFontRemoveOperation *v9;
  CEMFontRemoveOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CEMFontRemoveOperation;
  v9 = -[CEMFontRemoveOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fontDeclaration, a3);
    objc_storeStrong((id *)&v10->_installMetadata, a4);
  }

  return v10;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontRemoveOperation installMetadata](self, "installMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontURL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (!v7)
  {
    v9 = 0;
    goto LABEL_5;
  }
  v10 = 0;
  v8 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v10);
  v9 = v10;
  if ((v8 & 1) != 0)
  {
LABEL_5:
    -[CEMFontRemoveOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    goto LABEL_6;
  }
  -[CEMFontRemoveOperation endOperationWithError:](self, "endOperationWithError:", v9);
LABEL_6:

}

- (CEMFontDeclaration)fontDeclaration
{
  return self->_fontDeclaration;
}

- (void)setFontDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_fontDeclaration, a3);
}

- (CEMFontAssetInstallMetadata)installMetadata
{
  return self->_installMetadata;
}

- (void)setInstallMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_installMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installMetadata, 0);
  objc_storeStrong((id *)&self->_fontDeclaration, 0);
}

@end
