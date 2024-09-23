@implementation PXLivePhotoRequestOptions

- (id)photoKitRequestOptions
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CD1618]);
  objc_msgSend(v3, "setDeliveryMode:", -[PXLivePhotoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v3, "setNetworkAccessAllowed:", -[PXLivePhotoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v3, "setDownloadPriority:", -[PXLivePhotoRequestOptions downloadPriority](self, "downloadPriority"));
  objc_msgSend(v3, "setDownloadIntent:", -[PXLivePhotoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v3, "setPreferHDR:", -[PXLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  -[PXLivePhotoRequestOptions progressHandler](self, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressHandler:", v4);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDeliveryMode:", self->_deliveryMode);
  objc_msgSend(v4, "setNetworkAccessAllowed:", self->_networkAccessAllowed);
  objc_msgSend(v4, "setDownloadPriority:", self->_downloadPriority);
  objc_msgSend(v4, "setDownloadIntent:", self->_downloadIntent);
  objc_msgSend(v4, "setPreferHDR:", -[PXLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  objc_msgSend(v4, "setProgressHandler:", self->_progressHandler);
  return v4;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
