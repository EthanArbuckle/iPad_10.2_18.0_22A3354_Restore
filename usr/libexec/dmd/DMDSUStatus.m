@implementation DMDSUStatus

- (BOOL)isInstalling
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus autoInstallOperation](self, "autoInstallOperation"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloading
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloadComplete
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress"));
    v6 = objc_msgSend(v5, "isDone");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)downloadPercentComplete
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress"));
    objc_msgSend(v5, "normalizedPercentComplete");
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (NSString)productBuildVersion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productBuildVersion"));

  return (NSString *)v4;
}

- (SUDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
  objc_storeStrong((id *)&self->_download, a3);
}

- (SUInstallPolicy)installPolicy
{
  return self->_installPolicy;
}

- (void)setInstallPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_installPolicy, a3);
}

- (SUAutoInstallOperation)autoInstallOperation
{
  return self->_autoInstallOperation;
}

- (void)setAutoInstallOperation:(id)a3
{
  objc_storeStrong((id *)&self->_autoInstallOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInstallOperation, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_storeStrong((id *)&self->_download, 0);
}

@end
