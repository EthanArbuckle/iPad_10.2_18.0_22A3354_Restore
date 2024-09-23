@implementation UIImageReader

+ (UIImageReader)defaultReader
{
  if (qword_1ECD803C0 != -1)
    dispatch_once(&qword_1ECD803C0, &__block_literal_global_48);
  return (UIImageReader *)(id)qword_1ECD803B8;
}

void __30__UIImageReader_defaultReader__block_invoke()
{
  UIImageReader *v0;
  void *v1;

  v0 = objc_alloc_init(UIImageReader);
  v1 = (void *)qword_1ECD803B8;
  qword_1ECD803B8 = (uint64_t)v0;

}

- (UIImageReader)initWithConfiguration:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIImageReader;
  v5 = -[UIImageReader init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    -[UIImageReaderConfiguration _imageOptions](*((double **)v5 + 1));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

  }
  return (UIImageReader *)v5;
}

- (UIImageReader)init
{
  void *v3;
  UIImageReader *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[UIImageReader initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

+ (UIImageReader)readerWithConfiguration:(UIImageReaderConfiguration *)configuration
{
  UIImageReaderConfiguration *v5;
  void *v6;
  void *v8;

  v5 = configuration;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImageReader.m"), 258, CFSTR("Client Error: configuration==nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v5);

  return (UIImageReader *)v6;
}

- (UIImageReaderConfiguration)configuration
{
  return (UIImageReaderConfiguration *)(id)-[UIImageReaderConfiguration copy](self->_configuration, "copy");
}

- (UIImage)imageWithContentsOfFileURL:(NSURL *)url
{
  UIImageReaderConfiguration *configuration;
  NSURL *v5;
  void *v6;

  configuration = self->_configuration;
  v5 = url;
  -[UIImageReaderConfiguration _checkIsFileURL:]((uint64_t)configuration, v5);
  -[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:]((double *)self->_configuration, v5, 0, self->_imageOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (UIImage)imageWithData:(NSData *)data
{
  return (UIImage *)-[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:]((double *)self->_configuration, 0, data, self->_imageOptions);
}

- (void)imageWithContentsOfFileURL:(NSURL *)url completion:(void *)completion
{
  UIImageReaderConfiguration *configuration;
  void *v7;
  NSURL *v8;

  configuration = self->_configuration;
  v7 = completion;
  v8 = url;
  -[UIImageReaderConfiguration _checkIsFileURL:]((uint64_t)configuration, v8);
  -[UIImageReaderConfiguration _asyncImageFromURL:orData:imageRequestOptions:completion:]((uint64_t)self->_configuration, v8, 0, self->_imageOptions, v7);

}

- (void)imageWithData:(NSData *)data completion:(void *)completion
{
  -[UIImageReaderConfiguration _asyncImageFromURL:orData:imageRequestOptions:completion:]((uint64_t)self->_configuration, 0, data, self->_imageOptions, completion);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
