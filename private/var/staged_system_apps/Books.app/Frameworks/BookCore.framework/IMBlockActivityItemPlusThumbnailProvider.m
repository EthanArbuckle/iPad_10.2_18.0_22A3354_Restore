@implementation IMBlockActivityItemPlusThumbnailProvider

- (IMBlockActivityItemPlusThumbnailProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4 thumbnailResolutionBlock:(id)a5
{
  id v8;
  IMBlockActivityItemPlusThumbnailProvider *v9;
  id v10;
  id thumbnailResolutionBlock;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMBlockActivityItemPlusThumbnailProvider;
  v9 = -[IMBlockActivityItemProvider initWithUTI:resolutionBlock:](&v13, "initWithUTI:resolutionBlock:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    thumbnailResolutionBlock = v9->_thumbnailResolutionBlock;
    v9->_thumbnailResolutionBlock = v10;

  }
  return v9;
}

- (id)thumbnailResolutionBlock
{
  return self->_thumbnailResolutionBlock;
}

- (void)setThumbnailResolutionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbnailResolutionBlock, 0);
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD, double, double);
  uint64_t v10;
  void *v11;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v9 = (uint64_t (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue(-[IMBlockActivityItemPlusThumbnailProvider thumbnailResolutionBlock](self, "thumbnailResolutionBlock"));
  v10 = ((uint64_t (**)(_QWORD, id, double, double))v9)[2](v9, v8, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

@end
