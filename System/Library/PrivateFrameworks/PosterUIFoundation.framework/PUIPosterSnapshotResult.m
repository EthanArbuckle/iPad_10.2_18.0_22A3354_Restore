@implementation PUIPosterSnapshotResult

- (PUIPosterSnapshotResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executeTime:(double)a5
{
  id v9;
  PUIPosterSnapshotResult *v10;
  PUIPosterSnapshotResult *v11;

  v9 = a3;
  v10 = -[PUIPosterSnapshotResult initWithSnapshotBundle:](self, "initWithSnapshotBundle:", a4);
  v11 = v10;
  if (v10)
  {
    -[PUIPosterSnapshotResult setExecutionTime:](v10, "setExecutionTime:", a5);
    objc_storeStrong((id *)&v11->_request, a3);
  }

  return v11;
}

- (PUIPosterSnapshotResult)initWithSnapshotterResult:(id)a3
{
  id v5;
  PUIPosterSnapshotResult *v6;
  PUIPosterSnapshotResult *v7;
  void *v8;
  uint64_t v9;
  BSInvalidatable *pathValidityExtension;
  uint64_t v11;
  PUIPosterSnapshotRequest *request;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUIPosterSnapshotResult;
  v6 = -[PUIPosterSnapshotResult init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshotterResult, a3);
    objc_msgSend(v5, "outputPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendValidityForReason:", CFSTR("PUIPosterSnapshotResult"));
    v9 = objc_claimAutoreleasedReturnValue();
    pathValidityExtension = v7->_pathValidityExtension;
    v7->_pathValidityExtension = (BSInvalidatable *)v9;

    objc_msgSend(v5, "request");
    v11 = objc_claimAutoreleasedReturnValue();
    request = v7->_request;
    v7->_request = (PUIPosterSnapshotRequest *)v11;

    objc_msgSend(v5, "snapshotBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotResult setSnapshotBundle:](v7, "setSnapshotBundle:", v13);

    objc_msgSend(v5, "executionTime");
    -[PUIPosterSnapshotResult setExecutionTime:](v7, "setExecutionTime:");
  }

  return v7;
}

- (PUIPosterSnapshotResult)initWithSnapshotBundle:(id)a3
{
  id v4;
  PUIPosterSnapshotResult *v5;
  PUIPosterSnapshotResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUIPosterSnapshotResult;
  v5 = -[PUIPosterSnapshotResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PUIPosterSnapshotResult setSnapshotBundle:](v5, "setSnapshotBundle:", v4);

  return v6;
}

- (UIImage)foregroundLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "foregroundSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)backgroundLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)floatingLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)compositeLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositeSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotResult;
  -[PUIPosterSnapshotResult dealloc](&v3, sel_dealloc);
}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  return self->_snapshotBundle;
}

- (void)setSnapshotBundle:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBundle, a3);
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (void)setFloatingLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_floatingLayerImage, a3);
}

- (void)setForegroundLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundLayerImage, a3);
}

- (void)setBackgroundLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayerImage, a3);
}

- (void)setCompositeLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_compositeLayerImage, a3);
}

- (BSInvalidatable)snapshotBundlePath
{
  return self->_snapshotBundlePath;
}

- (void)setSnapshotBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBundlePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBundlePath, 0);
  objc_storeStrong((id *)&self->_compositeLayerImage, 0);
  objc_storeStrong((id *)&self->_backgroundLayerImage, 0);
  objc_storeStrong((id *)&self->_foregroundLayerImage, 0);
  objc_storeStrong((id *)&self->_floatingLayerImage, 0);
  objc_storeStrong((id *)&self->_snapshotBundle, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotterResult, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

@end
