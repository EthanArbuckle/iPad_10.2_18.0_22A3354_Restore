@implementation PFLivePhotoExportDestination

- (PFLivePhotoExportDestination)initWithPhotoURL:(id)a3 videoURL:(id)a4
{
  NSURL *v6;
  NSURL *v7;
  PFLivePhotoExportDestination *v8;
  NSURL *photoURL;
  NSURL *v10;
  NSURL *videoURL;
  objc_super v13;

  v6 = (NSURL *)a3;
  v7 = (NSURL *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFLivePhotoExportDestination;
  v8 = -[PFLivePhotoExportDestination init](&v13, sel_init);
  photoURL = v8->_photoURL;
  v8->_photoURL = v6;
  v10 = v6;

  videoURL = v8->_videoURL;
  v8->_videoURL = v7;

  return v8;
}

- (NSURL)photoURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)videoURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
}

+ (id)destinationWithPhotoURL:(id)a3 videoURL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhotoURL:videoURL:", v7, v6);

  return v8;
}

@end
