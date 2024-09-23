@implementation ASKImageDataConsumer

- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  ASKImageDataConsumer *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)ASKImageDataConsumer;
  result = -[ASKImageDataConsumer init](&v8, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_scale = a4;
    result->_retainAspectRatio = 0;
  }
  return result;
}

- (id)objectForData:(id)a3 error:(id *)a4
{
  id v6;
  ASKImageDataConsumer *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  ASKImageDataConsumer *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  ASKImageDataConsumer *v19;
  void *v20;
  _QWORD v22[4];
  ASKImageDataConsumer *v23;
  double v24;
  double v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v6 = a3;
  v7 = (ASKImageDataConsumer *)objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v6);

  if (a4 && !v7)
  {
    v26 = NSLocalizedDescriptionKey;
    v27 = CFSTR("Could not decode image");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ASKImageDataConsumerErrorDomain"), -99, v8));

  }
  -[ASKImageDataConsumer size](self, "size");
  v11 = v10 == CGSizeZero.width && v9 == CGSizeZero.height;
  v12 = v7;
  if (!v11)
  {
    if (-[ASKImageDataConsumer retainAspectRatio](self, "retainAspectRatio"))
      v12 = v7;
    else
      v12 = self;
  }
  -[ASKImageDataConsumer size](v12, "size");
  v14 = v13;
  v16 = v15;
  v17 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  -[ASKImageDataConsumer scale](self, "scale");
  objc_msgSend(v17, "setScale:");
  v18 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v17, v14, v16);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __44__ASKImageDataConsumer_objectForData_error___block_invoke;
  v22[3] = &unk_3728A8;
  v23 = v7;
  v24 = v14;
  v25 = v16;
  v19 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithActions:", v22));

  return v20;
}

id __44__ASKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
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

- (double)scale
{
  return self->_scale;
}

- (BOOL)retainAspectRatio
{
  return self->_retainAspectRatio;
}

- (void)setRetainAspectRatio:(BOOL)a3
{
  self->_retainAspectRatio = a3;
}

@end
