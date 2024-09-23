@implementation PXPhotosGridSharedAlbumOptionsController

- (PXPhotosGridSharedAlbumOptionsController)initWithAssetCollection:(id)a3
{
  id v5;
  PXPhotosGridSharedAlbumOptionsController *v6;
  PXPhotosGridSharedAlbumOptionsController *v7;
  NSString *systemIconImageName;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosGridSharedAlbumOptionsController;
  v6 = -[PXPhotosGridSharedAlbumOptionsController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    objc_storeStrong((id *)&v7->_actionPerformerType, CFSTR("PXPhotosGridActionManagePeople"));
    systemIconImageName = v7->_systemIconImageName;
    v7->_systemIconImageName = (NSString *)CFSTR("person.crop.circle.badge.checkmark");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
    v10 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (PXPhotosGridSharedAlbumOptionsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridSharedAlbumOptionsController.m"), 50, CFSTR("%s is not available as initializer"), "-[PXPhotosGridSharedAlbumOptionsController init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_hasRegistered)
  {
    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGridSharedAlbumOptionsController;
  -[PXPhotosGridSharedAlbumOptionsController dealloc](&v4, sel_dealloc);
}

- (void)preloadOptions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInvitationRecordsObserver:", self);

  self->_hasRegistered = 1;
  -[PXPhotosGridSharedAlbumOptionsController _updateOptions](self, "_updateOptions");
}

- (void)setActionPerformerType:(id)a3
{
  NSString *v4;
  void *v5;
  BOOL v6;
  NSString *v7;
  NSString *actionPerformerType;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_actionPerformerType;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

  if (!v6)
  {
    v7 = (NSString *)-[NSString copy](v9, "copy");
    actionPerformerType = self->_actionPerformerType;
    self->_actionPerformerType = v7;

    -[PXPhotosGridSharedAlbumOptionsController optionsDelegate](self, "optionsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didChangeActionPerformerTypeForOptionsController:", self);
LABEL_4:

  }
}

- (void)setSystemIconImageName:(id)a3
{
  NSString *v4;
  void *v5;
  BOOL v6;
  NSString *v7;
  NSString *systemIconImageName;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_systemIconImageName;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

  if (!v6)
  {
    v7 = (NSString *)-[NSString copy](v9, "copy");
    systemIconImageName = self->_systemIconImageName;
    self->_systemIconImageName = v7;

    -[PXPhotosGridSharedAlbumOptionsController optionsDelegate](self, "optionsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didChangeSystemItemForOptionsController:", self);
LABEL_4:

  }
}

- (void)_updateOptions
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXPhotosGridSharedAlbumOptionsController__updateOptions__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_workQueue_updateOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  -[PXPhotosGridSharedAlbumOptionsController assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContextForCurrentQueueQoS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedAlbumsRecipientsForAlbumWithObjectID(v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = CFSTR("PXPhotosGridActionManagePeople");
  if (v7)
  {
    v9 = CFSTR("person.crop.circle.badge.checkmark");
  }
  else
  {
    v8 = CFSTR("PXPhotosGridActionAddPeople");
    v9 = CFSTR("person.crop.circle.badge.plus");
  }
  v12 = v8;
  v13 = v9;
  v10 = v13;
  v11 = v12;
  px_dispatch_on_main_queue();

}

- (void)invitationRecordsDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a3, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridSharedAlbumOptionsController assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v9 & 1) != 0)
LABEL_5:
    -[PXPhotosGridSharedAlbumOptionsController _updateOptions](self, "_updateOptions");
}

- (PXPhotosGridOptionsControllerDelegate)optionsDelegate
{
  return (PXPhotosGridOptionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_optionsDelegate);
}

- (void)setOptionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_optionsDelegate, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)actionPerformerType
{
  return self->_actionPerformerType;
}

- (NSString)systemIconImageName
{
  return self->_systemIconImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemIconImageName, 0);
  objc_storeStrong((id *)&self->_actionPerformerType, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_destroyWeak((id *)&self->_optionsDelegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __68__PXPhotosGridSharedAlbumOptionsController__workQueue_updateOptions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActionPerformerType:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setSystemIconImageName:", *(_QWORD *)(a1 + 48));
}

void __58__PXPhotosGridSharedAlbumOptionsController__updateOptions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_updateOptions");

}

@end
