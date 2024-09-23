@implementation PXPhotoLibraryProcessingProgressRow

- (PXPhotoLibraryProcessingProgressRow)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 48, CFSTR("%s is not available as initializer"), "-[PXPhotoLibraryProcessingProgressRow init]");

  abort();
}

- (PXPhotoLibraryProcessingProgressRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotoLibraryProcessingProgressRow *v12;
  PXPhotoLibraryProcessingProgressRow *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoLibraryProcessingProgressRow;
  v12 = -[PXPhotoLibraryProcessingProgressRow init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    -[PXPhotoLibraryProcessingProgressRow setTitleKeyPath:](v13, "setTitleKeyPath:", v10);
    -[PXPhotoLibraryProcessingProgressRow setImageKeyPath:](v13, "setImageKeyPath:", v11);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotoLibraryProcessingProgressRow *v4;
  PHPhotoLibrary *photoLibrary;
  void *v6;
  void *v7;
  PXPhotoLibraryProcessingProgressRow *v8;

  v4 = [PXPhotoLibraryProcessingProgressRow alloc];
  photoLibrary = self->_photoLibrary;
  -[PXPhotoLibraryProcessingProgressRow titleKeyPath](self, "titleKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryProcessingProgressRow imageKeyPath](self, "imageKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotoLibraryProcessingProgressRow initWithPhotoLibrary:titleKeyPath:imageKeyPath:](v4, "initWithPhotoLibrary:titleKeyPath:imageKeyPath:", photoLibrary, v6, v7);

  return v8;
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)defaultUIAction
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PXPhotoLibraryProcessingProgressRow_defaultUIAction__block_invoke;
  v3[3] = &unk_1E5141048;
  v3[4] = self;
  v3[5] = a2;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __54__PXPhotoLibraryProcessingProgressRow_defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("row"), v18, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("row"), v18);
  }

LABEL_3:
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v6;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v11)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXPhotoLibraryProcessingProgressRow.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    goto LABEL_5;
  }
  if (!v10)
    goto LABEL_10;
LABEL_5:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_260222;
  v27[3] = &unk_1E5141098;
  v28 = v11;
  v12 = v11;
  +[PXPhotoLibraryProcessingProgressReport requestFullDescriptionForLibrary:resultBlock:](PXPhotoLibraryProcessingProgressReport, "requestFullDescriptionForLibrary:resultBlock:", v9, v27);

  return 1;
}

@end
