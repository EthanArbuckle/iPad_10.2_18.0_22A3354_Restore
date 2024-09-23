@implementation PUPhotoPickerResizeTaskDescriptorViewModel

- (PUPhotoPickerResizeTaskDescriptorViewModel)init
{
  PUPhotoPickerResizeTaskDescriptorViewModel *v2;
  uint64_t v3;
  PUPhotoPickerResizeTaskDescriptor *resizeTaskDescriptor;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *localizedFileSizeDescriptionUpdaterQueue;
  uint64_t v9;
  PXInfoUpdater *localizedFileSizeDescriptionUpdater;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUPhotoPickerResizeTaskDescriptorViewModel;
  v2 = -[PUPhotoPickerResizeTaskDescriptorViewModel init](&v12, sel_init);
  if (v2)
  {
    +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultActualSizeDescriptor");
    v3 = objc_claimAutoreleasedReturnValue();
    resizeTaskDescriptor = v2->_resizeTaskDescriptor;
    v2->_resizeTaskDescriptor = (PUPhotoPickerResizeTaskDescriptor *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.photopicker.PUPhotoPickerResizeTaskDescriptorViewModel.localizedFileSizeDescriptionUpdaterQueue", v6);
    localizedFileSizeDescriptionUpdaterQueue = v2->_localizedFileSizeDescriptionUpdaterQueue;
    v2->_localizedFileSizeDescriptionUpdaterQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B550]), "initWithInfoProvider:infoKind:", v2, CFSTR("PUResizeTaskDescriptorInfoKind"));
    localizedFileSizeDescriptionUpdater = v2->_localizedFileSizeDescriptionUpdater;
    v2->_localizedFileSizeDescriptionUpdater = (PXInfoUpdater *)v9;

    -[PXInfoUpdater setObserver:](v2->_localizedFileSizeDescriptionUpdater, "setObserver:", v2);
  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resizeTaskDescriptor: %@"), self->_resizeTaskDescriptor);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerResizeTaskDescriptorViewModel;
  -[PUPhotoPickerResizeTaskDescriptorViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setResizeTaskDescriptor:(id)a3
{
  PUPhotoPickerResizeTaskDescriptor *v5;
  PUPhotoPickerResizeTaskDescriptor *v6;
  BOOL v7;
  void *v8;
  PUPhotoPickerResizeTaskDescriptor *v9;

  v9 = (PUPhotoPickerResizeTaskDescriptor *)a3;
  v5 = self->_resizeTaskDescriptor;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUPhotoPickerResizeTaskDescriptor isEqual:](v5, "isEqual:", v9);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_resizeTaskDescriptor, a3);
      -[PUPhotoPickerResizeTaskDescriptorViewModel localizedFileSizeDescriptionUpdater](self, "localizedFileSizeDescriptionUpdater");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateInfo");

      -[PUPhotoPickerResizeTaskDescriptorViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setFileSizeMenu:(id)a3
{
  UIMenu *v5;
  UIMenu *v6;

  v5 = (UIMenu *)a3;
  if (self->_fileSizeMenu != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fileSizeMenu, a3);
    -[PUPhotoPickerResizeTaskDescriptorViewModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)invalidateAssetsForResizing
{
  id v2;

  -[PUPhotoPickerResizeTaskDescriptorViewModel localizedFileSizeDescriptionUpdater](self, "localizedFileSizeDescriptionUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateInfo");

}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  PUPhotoPickerResizeTaskDescriptorViewModel *v25;
  id v26;

  v7 = a3;
  v8 = a4;
  -[PUPhotoPickerResizeTaskDescriptorViewModel delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetsForResizing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PUResizeTaskDescriptorInfoKind")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerResizeTaskDescriptorViewModel.m"), 105, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerResizeTaskDescriptorViewModel resizeTaskDescriptor](self, "resizeTaskDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerResizeTaskDescriptorViewModel localizedFileSizeDescriptionUpdaterQueue](self, "localizedFileSizeDescriptionUpdaterQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PUPhotoPickerResizeTaskDescriptorViewModel_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E58A8C48;
    v15 = v12;
    v22 = v15;
    v23 = v13;
    v24 = v11;
    v25 = self;
    v26 = v8;
    v16 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    PULocalizedString(CFSTR("SIZE_PICKER_DOWNLOADING"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerResizeTaskDescriptorViewModel _infoDictionaryForLocalizedTitle:localizedFileSizeDescription:](self, "_infoDictionaryForLocalizedTitle:localizedFileSizeDescription:", v17, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v18);

    v15 = 0;
  }

  return v15;
}

- (id)_infoDictionaryForLocalizedTitle:(id)a3 localizedFileSizeDescription:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("PUResizeTaskDescriptorInfoLocalizedTitleKey");
  v10[1] = CFSTR("PUResizeTaskDescriptorInfoLocalizedFileSizeDescriptionKey");
  v11[0] = a3;
  v11[1] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a3;
  objc_msgSend(v5, "infoKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUResizeTaskDescriptorInfoKind"));

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerResizeTaskDescriptorViewModel.m"), 139, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_msgSend(v5, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUResizeTaskDescriptorInfoLocalizedTitleKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUResizeTaskDescriptorInfoLocalizedFileSizeDescriptionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PUPhotoPickerResizeTaskDescriptorViewModel_infoUpdaterDidUpdate___block_invoke;
  v14[3] = &unk_1E58A5550;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v11 = v10;
  v12 = v9;
  -[PUPhotoPickerResizeTaskDescriptorViewModel performChanges:](self, "performChanges:", v14);

}

- (PUPhotoPickerResizeTaskDescriptor)resizeTaskDescriptor
{
  return self->_resizeTaskDescriptor;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedFileSizeDescription
{
  return self->_localizedFileSizeDescription;
}

- (UIMenu)fileSizeMenu
{
  return self->_fileSizeMenu;
}

- (PUPhotoPickerResizeTaskDescriptorViewModelDelegate)delegate
{
  return (PUPhotoPickerResizeTaskDescriptorViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXInfoUpdater)localizedFileSizeDescriptionUpdater
{
  return self->_localizedFileSizeDescriptionUpdater;
}

- (void)setLocalizedFileSizeDescriptionUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdater, a3);
}

- (OS_dispatch_queue)localizedFileSizeDescriptionUpdaterQueue
{
  return self->_localizedFileSizeDescriptionUpdaterQueue;
}

- (void)setLocalizedFileSizeDescriptionUpdaterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdaterQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdater, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileSizeMenu, 0);
  objc_storeStrong((id *)&self->_localizedFileSizeDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptor, 0);
}

uint64_t __67__PUPhotoPickerResizeTaskDescriptorViewModel_infoUpdaterDidUpdate___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 13, a1[5]);
  objc_storeStrong((id *)a1[4] + 14, a1[6]);
  return objc_msgSend(a1[4], "signalChange:", 2);
}

void __82__PUPhotoPickerResizeTaskDescriptorViewModel_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedDescriptionForAssets:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_infoDictionaryForLocalizedTitle:localizedFileSizeDescription:", v4, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

@end
