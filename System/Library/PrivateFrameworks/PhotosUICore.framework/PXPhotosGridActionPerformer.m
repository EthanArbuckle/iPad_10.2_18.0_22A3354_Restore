@implementation PXPhotosGridActionPerformer

- (PXPhotosGridActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  id v7;
  PXPhotosGridActionPerformer *v8;
  PXPhotosGridActionPerformer *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridActionPerformer;
  v8 = -[PXActionPerformer initWithActionType:](&v11, sel_initWithActionType_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_viewModel, a3);

  return v9;
}

- (PXPhotosGridActionPerformer)initWithActionType:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridActionManager.m"), 322, CFSTR("%s is not available as initializer"), "-[PXPhotosGridActionPerformer initWithActionType:]");

  abort();
}

- (PXContentFilterState)currentContentFilterState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXContentFilterState defaultFilterStateForPhotoLibrary:](PXContentFilterState, "defaultFilterStateForPhotoLibrary:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PXContentFilterState *)v4;
}

- (int64_t)menuElementState
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer activityType](self, "activityType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridActionManager.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  v10 = (void *)objc_opt_class();
  -[PXActionPerformer actionType](self, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v10, "canPerformActionType:withViewModel:", v11, v12);

  return (char)v10;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return 0;
}

@end
