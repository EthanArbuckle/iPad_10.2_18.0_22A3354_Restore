@implementation BKImageResizerHelper

- (BKImageResizerHelper)init
{
  BKImageResizerHelper *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKImageResizerHelper;
  v2 = -[BKImageResizerHelper init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[BKImageResizerHelper setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKImageResizerHelper operationQueue](v2, "operationQueue"));
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 5);

  }
  return v2;
}

- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22[3];
  id location;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSBlockOperation);
  objc_initWeak(&location, v11);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_7DE90;
  v19 = &unk_1C0948;
  objc_copyWeak(v22, &location);
  v12 = v9;
  v20 = v12;
  v22[1] = *(id *)&width;
  v22[2] = *(id *)&height;
  v13 = v10;
  v21 = v13;
  objc_msgSend(v11, "addExecutionBlock:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKImageResizerHelper operationQueue](self, "operationQueue", v16, v17, v18, v19));
  objc_msgSend(v14, "addOperation:", v11);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  return v11;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
