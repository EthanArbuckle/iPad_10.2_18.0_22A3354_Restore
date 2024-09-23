@implementation SUPolicyDownload

- (SUPolicyDownload)initWithDownloadOptions:(id)a3
{
  id v4;
  SUPolicyDownload *v5;
  SUPolicyDownload *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyDownload;
  v5 = -[SUPolicyDownload init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SUPolicyDownload setDownloadOptions:](v5, "setDownloadOptions:", v4);

  return v6;
}

- (BOOL)discretionary
{
  void *v2;
  char v3;

  -[SUPolicyDownload downloadOptions](self, "downloadOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutoDownload");

  return v3;
}

- (BOOL)allowsCellular
{
  void *v2;
  char v3;

  -[SUPolicyDownload downloadOptions](self, "downloadOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForCellular");

  return v3;
}

- (BOOL)allowExpensiveNetwork
{
  void *v2;
  char v3;

  -[SUPolicyDownload downloadOptions](self, "downloadOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForExpensiveNetwork");

  return v3;
}

- (BOOL)checkAvailableSpace
{
  return 1;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
  objc_storeStrong((id *)&self->_downloadOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
}

@end
