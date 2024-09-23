@implementation SXImageRequest

- (SXImageRequest)initWithImageIdentifier:(id)a3 imageQualities:(unint64_t)a4 url:(id)a5 size:(CGSize)a6 preserveColorspace:(BOOL)a7 loadingBlock:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  SXImageRequest *v19;
  SXImageRequest *v20;
  uint64_t v21;
  id loadingBlock;
  objc_super v24;

  height = a6.height;
  width = a6.width;
  v16 = a3;
  v17 = a5;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SXImageRequest;
  v19 = -[SXImageRequest init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageIdentifier, a3);
    v20->_qualities = a4;
    objc_storeStrong((id *)&v20->_imageIdentifier, a3);
    objc_storeStrong((id *)&v20->_URL, a5);
    v20->_size.width = width;
    v20->_size.height = height;
    v21 = objc_msgSend(v18, "copy");
    loadingBlock = v20->_loadingBlock;
    v20->_loadingBlock = (id)v21;

    v20->_preserveColorspace = a7;
  }

  return v20;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)qualities
{
  return self->_qualities;
}

- (id)loadingBlock
{
  return self->_loadingBlock;
}

- (void)setLoadingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)preserveColorspace
{
  return self->_preserveColorspace;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingBlock, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end
