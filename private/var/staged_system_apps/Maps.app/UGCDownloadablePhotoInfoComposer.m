@implementation UGCDownloadablePhotoInfoComposer

- (UGCDownloadablePhotoInfoComposer)initWithIdentifier:(id)a3 url:(id)a4 timeoutInterval:(double)a5
{
  id v9;
  id v10;
  UGCDownloadablePhotoInfoComposer *v11;
  UGCDownloadablePhotoInfoComposer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UGCDownloadablePhotoInfoComposer;
  v11 = -[UGCDownloadablePhotoInfoComposer init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downloadIdentifier, a3);
    objc_storeStrong((id *)&v12->_url, a4);
    v12->_timeoutInterval = a5;
  }

  return v12;
}

+ (id)downloadablePhotoForGeoMapItemPhotoInfo:(id)a3
{
  void *v3;
  UGCDownloadablePhotoInfoComposer *v4;
  void *v5;
  UGCDownloadablePhotoInfoComposer *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "url"));
  v4 = [UGCDownloadablePhotoInfoComposer alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v6 = -[UGCDownloadablePhotoInfoComposer initWithIdentifier:url:timeoutInterval:](v4, "initWithIdentifier:url:timeoutInterval:", v5, v3, 15.0);

  return v6;
}

+ (id)downloadablePhotoForUGCPhoto:(id)a3
{
  id v3;
  void *v4;
  UGCDownloadablePhotoInfoComposer *v5;
  void *v6;
  UGCDownloadablePhotoInfoComposer *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = [UGCDownloadablePhotoInfoComposer alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v7 = -[UGCDownloadablePhotoInfoComposer initWithIdentifier:url:timeoutInterval:](v5, "initWithIdentifier:url:timeoutInterval:", v6, v4, 15.0);
  return v7;
}

- (NSString)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
}

@end
