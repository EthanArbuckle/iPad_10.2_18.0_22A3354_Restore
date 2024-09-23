@implementation PRUISPosterSnapshotResult

- (PRUISPosterSnapshotResult)initWithPUIPosterSnapshotResult:(id)a3
{
  id v5;
  PRUISPosterSnapshotResult *v6;
  PRUISPosterSnapshotResult *v7;
  PRUISPosterSnapshotResult *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRUISPosterSnapshotResult;
    v6 = -[PRUISPosterSnapshotResult init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_underlyingResult, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PRPosterSnapshotBundle)snapshotBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE74E20];
  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotBundleWithPUIPosterSnapshotBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterSnapshotBundle *)v4;
}

- (PRUISPosterSnapshotBundle)posterSnapshotBundle
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:](PRUISPosterSnapshotBundle, "snapshotBundleWithPUIPosterSnapshotBundle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRUISPosterSnapshotBundle *)v3;
}

- (UIImage)floatingLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)foregroundLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "foregroundSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)backgroundLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)compositeLayerImage
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotResult snapshotBundle](self->_underlyingResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositeSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (double)executionTime
{
  double result;

  -[PUIPosterSnapshotResult executionTime](self->_underlyingResult, "executionTime");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingResult, 0);
}

@end
