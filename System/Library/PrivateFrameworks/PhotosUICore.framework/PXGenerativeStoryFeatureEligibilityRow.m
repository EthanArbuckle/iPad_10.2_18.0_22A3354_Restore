@implementation PXGenerativeStoryFeatureEligibilityRow

- (PXGenerativeStoryFeatureEligibilityRow)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 51, CFSTR("%s is not available as initializer"), "-[PXGenerativeStoryFeatureEligibilityRow init]");

  abort();
}

- (PXGenerativeStoryFeatureEligibilityRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXGenerativeStoryFeatureEligibilityRow *v12;
  PXGenerativeStoryFeatureEligibilityRow *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGenerativeStoryFeatureEligibilityRow;
  v12 = -[PXGenerativeStoryFeatureEligibilityRow init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    -[PXGenerativeStoryFeatureEligibilityRow setTitleKeyPath:](v13, "setTitleKeyPath:", v10);
    -[PXGenerativeStoryFeatureEligibilityRow setImageKeyPath:](v13, "setImageKeyPath:", v11);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXGenerativeStoryFeatureEligibilityRow *v4;
  PHPhotoLibrary *photoLibrary;
  void *v6;
  void *v7;
  PXGenerativeStoryFeatureEligibilityRow *v8;

  v4 = [PXGenerativeStoryFeatureEligibilityRow alloc];
  photoLibrary = self->_photoLibrary;
  -[PXGenerativeStoryFeatureEligibilityRow titleKeyPath](self, "titleKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGenerativeStoryFeatureEligibilityRow imageKeyPath](self, "imageKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXGenerativeStoryFeatureEligibilityRow initWithPhotoLibrary:titleKeyPath:imageKeyPath:](v4, "initWithPhotoLibrary:titleKeyPath:imageKeyPath:", photoLibrary, v6, v7);

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
  v3[2] = __57__PXGenerativeStoryFeatureEligibilityRow_defaultUIAction__block_invoke;
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

uint64_t __57__PXGenerativeStoryFeatureEligibilityRow_defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 82, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("row"), v19, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 82, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("row"), v19);
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
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v11)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXGenerativeStoryFeatureEligibilityRow.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    goto LABEL_5;
  }
  if (!v10)
    goto LABEL_10;
LABEL_5:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1700]), "initWithPhotoLibrary:", v9);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke;
  v28[3] = &unk_1E511A818;
  v29 = v11;
  v13 = v11;
  +[PXGenerativeStoryFeatureEligibilityDataSource generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:photoLibrary:completionHandler:](PXGenerativeStoryFeatureEligibilityDataSource, "generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:photoLibrary:completionHandler:", v12, v9, v28);

  return 1;
}

@end
