@implementation PXCMMShowPhotosPickerActionPerformer

- (void)performPhotosPickerActionWithSession:(id)a3 gridPresentation:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gridPresentation"));

  }
  objc_storeStrong((id *)&self->_gridPresentation, a4);
  v14.receiver = self;
  v14.super_class = (Class)PXCMMShowPhotosPickerActionPerformer;
  v12 = -[PXCMMActionPerformer performActionWithSession:completionHandler:](&v14, sel_performActionWithSession_completionHandler_, v9, v11);

}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 221, CFSTR("Photos Picker presentation requires a grid presentation"));

  return 0;
}

- (PXGridPresentation)gridPresentation
{
  return self->_gridPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridPresentation, 0);
}

@end
