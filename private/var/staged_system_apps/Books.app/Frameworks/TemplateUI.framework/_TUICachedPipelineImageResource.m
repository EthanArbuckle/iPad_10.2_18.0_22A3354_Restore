@implementation _TUICachedPipelineImageResource

- (_TUICachedPipelineImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8
{
  double height;
  double width;
  id v16;
  _TUICachedPipelineImageResource *v17;
  _TUICachedPipelineImageResource *v18;
  objc_super v20;

  height = a6.height;
  width = a6.width;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_TUICachedPipelineImageResource;
  v17 = -[_TUICachedImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:](&v20, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:", a3, a4, a5, width, height, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageResource, a8);
    -[TUIImageResource addObserver:](v18->_imageResource, "addObserver:", v18);
  }

  return v18;
}

- (id)unprocessedImageResource
{
  return self->_imageResource;
}

- (id)resource
{
  return -[TUIImageResource resource](self->_imageResource, "resource");
}

- (void)loadIntrinsicSize
{
  -[TUIImageResource loadIntrinsicSize](self->_imageResource, "loadIntrinsicSize");
}

- (BOOL)allowsMultipleUpdates
{
  return 1;
}

- (void)_updateWithContent:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_9EAA4;
  v3[3] = &unk_240550;
  v3[4] = self;
  -[_TUICachedPipelineImageResource applyToImage:completion:](self, "applyToImage:completion:", a3, v3);
}

- (void)loadResource
{
  void *v3;
  void *v4;

  -[_TUICachedImageResource loadLargestLoadedImageAsTemporary](self, "loadLargestLoadedImageAsTemporary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResource loadImage](self->_imageResource, "loadImage"));
  if (v3)
  {
    v4 = v3;
    -[_TUICachedPipelineImageResource _updateWithContent:](self, "_updateWithContent:", v3);
    v3 = v4;
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "imageContentWithOptions:", 1));
  -[_TUICachedPipelineImageResource _updateWithContent:](self, "_updateWithContent:", v4);

}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  objc_msgSend(v7, "insets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  (*((void (**)(id, id, double, double, double, double))a4 + 2))(v6, v16, v9, v11, v13, v15);
}

- (id)sizedKey
{
  return -[TUIImageResource sizedKey](self->_imageResource, "sizedKey");
}

- (id)unsizedKey
{
  return -[TUIImageResource unsizedKey](self->_imageResource, "unsizedKey");
}

- (TUIImageResource)imageResource
{
  return self->_imageResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResource, 0);
}

@end
