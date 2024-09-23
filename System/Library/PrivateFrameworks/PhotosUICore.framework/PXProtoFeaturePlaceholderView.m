@implementation PXProtoFeaturePlaceholderView

- (PXProtoFeaturePlaceholderView)initWithFrame:(CGRect)a3
{
  PXProtoFeaturePlaceholderView *v3;
  uint64_t v4;
  PXPhotoAnalysisStatusController *statusController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXProtoFeaturePlaceholderView;
  v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PXPhotoAnalysisStatusController sharedStatusController](PXPhotoAnalysisStatusController, "sharedStatusController");
    v4 = objc_claimAutoreleasedReturnValue();
    statusController = v3->_statusController;
    v3->_statusController = (PXPhotoAnalysisStatusController *)v4;

    -[PXPhotoAnalysisStatusController registerChangeObserver:context:](v3->_statusController, "registerChangeObserver:context:", v3, PXProtoStatusControllerObservationContext);
    -[PXProtoFeaturePlaceholderView _updateStatusDescription](v3, "_updateStatusDescription");
    v3->_preferredStatusWidth = 250.0;
  }
  return v3;
}

- (void)_updateStatusDescription
{
  int64_t v3;
  void *v4;
  double v5;
  const __CFString *v6;
  __CFString *v7;

  v3 = -[PXPhotoAnalysisStatusController graphStatus](self->_statusController, "graphStatus");
  if (v3 == 3)
  {
    v6 = CFSTR("An unexpected error occurred");
  }
  else if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[PXPhotoAnalysisStatusController graphFractionCompleted](self->_statusController, "graphFractionCompleted");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Analyzing Library (%0.1f%%)"), v5 * 100.0);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (__CFString *)v6;
  -[PXProtoFeaturePlaceholderView _setStatusDescription:](self, "_setStatusDescription:", v6);

}

- (void)_setStatusDescription:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *statusDescription;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_statusDescription;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      statusDescription = self->_statusDescription;
      self->_statusDescription = v6;

      -[PXProtoFeaturePlaceholderView statusDescriptionDidChange](self, "statusDescriptionDidChange");
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXProtoStatusControllerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXProtoFeatureView.m"), 289, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v11 = v9;
    -[PXProtoFeaturePlaceholderView _updateStatusDescription](self, "_updateStatusDescription");
    v9 = v11;
  }

}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (double)preferredStatusWidth
{
  return self->_preferredStatusWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
}

@end
