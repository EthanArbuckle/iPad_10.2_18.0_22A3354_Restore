@implementation AEPDFMinifiedController

- (AEPDFMinifiedController)initWithHelper:(id)a3
{
  id v5;
  AEPDFMinifiedController *v6;
  AEPDFMinifiedController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEPDFMinifiedController;
  v6 = -[AEPDFMinifiedController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_helper, a3);

  return v7;
}

- (void)minifiedControllerDidCloseAssetFully
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController helper](self, "helper"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  v5 = objc_msgSend(v4, "copyCacheObjectForURL:", v10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "document"));
  v7 = objc_msgSend(v6, "isEncrypted");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  objc_msgSend(v8, "removeCacheObjectForURL:", v10);

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController minifiedControllerDelegate](self, "minifiedControllerDelegate"));
    objc_msgSend(v9, "minifiedControllerRequestClose:error:", self, 0);

  }
}

- (void)minifiedControllerWillUnloadAsset
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
  objc_msgSend(v3, "close:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
  v5 = objc_opt_respondsToSelector(v4, "assetViewControllerWillUnload");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
    objc_msgSend(v6, "assetViewControllerWillUnload");

  }
}

- (BOOL)minifiedControllerShouldPreloadAssetViewController
{
  return 0;
}

- (BOOL)minifiedControllerShouldUnloadAssetViewController
{
  return 0;
}

- (AEAssetMinibarViewController)minifiedControllerMinibarViewController
{
  return 0;
}

- (BOOL)minifiedControllerAnimateFromMinibarIfPossible
{
  return 0;
}

- (id)minifiedControllerStateConforminigToProtocol:(id)a3
{
  return (id)BUProtocolCast(a3, self);
}

- (void)minifiedControllerSaveState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AEPDFMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
  objc_msgSend(v2, "saveStateClosing:", 0);

}

- (AEAssetViewController)minifiedControllerLoadedAssetViewController
{
  return self->_minifiedControllerLoadedAssetViewController;
}

- (void)setMinifiedControllerLoadedAssetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, a3);
}

- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate
{
  return (AEAssetMinifiedControllerDelegate *)objc_loadWeakRetained((id *)&self->_minifiedControllerDelegate);
}

- (void)setMinifiedControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_minifiedControllerDelegate, a3);
}

- (AEPDFBookHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_minifiedControllerDelegate);
  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, 0);
}

@end
