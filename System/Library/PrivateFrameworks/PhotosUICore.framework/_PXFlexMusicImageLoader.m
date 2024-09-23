@implementation _PXFlexMusicImageLoader

- (_PXFlexMusicImageLoader)initWithArtworkAsset:(id)a3 maxSize:(CGSize)a4 sharedImageLoadingQueue:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  _PXFlexMusicImageLoader *v12;
  _PXFlexMusicImageLoader *v13;
  PXFlexMusicDownloader *v14;
  void *v15;
  uint64_t v16;
  PXFlexMusicDownloader *downloader;
  objc_super v19;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PXFlexMusicImageLoader;
  v12 = -[_PXFlexMusicImageLoader init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_artworkAsset, a3);
    v13->_maxSize.width = width;
    v13->_maxSize.height = height;
    objc_storeStrong((id *)&v13->_sharedImageLoadingQueue, a5);
    v14 = [PXFlexMusicDownloader alloc];
    objc_msgSend(v10, "audioAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXFlexMusicDownloader initWithAsset:resource:](v14, "initWithAsset:resource:", v15, 1);
    downloader = v13->_downloader;
    v13->_downloader = (PXFlexMusicDownloader *)v16;

  }
  return v13;
}

- (void)startWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  -[_PXFlexMusicImageLoader completionHandler](self, "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.completionHandler == nil"));

  }
  -[_PXFlexMusicImageLoader setCompletionHandler:](self, "setCompletionHandler:", v5);
  objc_initWeak(&location, self);
  -[_PXFlexMusicImageLoader downloader](self, "downloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47___PXFlexMusicImageLoader_startWithCompletion___block_invoke;
  v9[3] = &unk_1E5144F70;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "startWithCompletion:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_handleDownloadCompleted:(BOOL)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _PXFlexMusicImageLoader *v15;

  v5 = a4;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXFlexMusicImageLoader artworkAsset](self, "artworkAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localURLForAsset:resourceType:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_PXFlexMusicImageLoader sharedImageLoadingQueue](self, "sharedImageLoadingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke;
    block[3] = &unk_1E5148D08;
    v14 = v9;
    v15 = self;
    dispatch_async(v10, block);

    v11 = v14;
  }
  else
  {
    v12 = v5;
    px_dispatch_on_main_queue();
    v11 = v12;
  }

}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)_PXFlexMusicImageLoader;
  -[_PXFlexMusicImageLoader dealloc](&v3, sel_dealloc);
}

- (PXFlexMusicArtworkAsset)artworkAsset
{
  return self->_artworkAsset;
}

- (PXFlexMusicDownloader)downloader
{
  return self->_downloader;
}

- (OS_dispatch_queue)sharedImageLoadingQueue
{
  return self->_sharedImageLoadingQueue;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sharedImageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_artworkAsset, 0);
}

@end
