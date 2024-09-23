@implementation UIPrintWebKitThumbnailGenerationOperation

- (UIPrintWebKitThumbnailGenerationOperation)initWithPagesController:(id)a3
{
  id v4;
  UIPrintWebKitThumbnailGenerationOperation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPrintWebKitThumbnailGenerationOperation;
  v5 = -[NSBlockOperation init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "webKitThumbnailGenerationThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintWebKitThumbnailGenerationOperation setCurrentWebKitThumbnailGenerationThread:](v5, "setCurrentWebKitThumbnailGenerationThread:", v6);

  }
  return v5;
}

- (void)main
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  -[UIPrintWebKitThumbnailGenerationOperation currentWebKitThumbnailGenerationThread](self, "currentWebKitThumbnailGenerationThread");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      -[UIPrintWebKitThumbnailGenerationOperation currentWebKitThumbnailGenerationThread](self, "currentWebKitThumbnailGenerationThread");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isFinished");

      if ((v6 & 1) != 0)
        break;
      usleep(0);
      -[UIPrintWebKitThumbnailGenerationOperation currentWebKitThumbnailGenerationThread](self, "currentWebKitThumbnailGenerationThread");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v4);
  }
  if ((-[UIPrintWebKitThumbnailGenerationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPrintWebKitThumbnailGenerationOperation;
    -[NSBlockOperation main](&v7, sel_main);
  }
}

- (NSThread)currentWebKitThumbnailGenerationThread
{
  return (NSThread *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCurrentWebKitThumbnailGenerationThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWebKitThumbnailGenerationThread, 0);
}

@end
