@implementation PUActivitySharingViewModel

- (PUActivitySharingViewModel)initWithActivitySharingConfiguration:(id)a3
{
  id v4;
  PUActivitySharingViewModel *v5;
  uint64_t v6;
  PHFetchResult *collectionListFetchResult;
  uint64_t v8;
  PUPhotoSelectionManager *selectionManager;
  uint64_t v10;
  PXPhotosDataSource *photosDataSource;
  void *v12;
  uint64_t v13;
  NSString *localizedTitle;
  void *v15;
  uint64_t v16;
  NSString *localizedSubtitle;
  uint64_t v18;
  PXDisplayAsset *keyAsset;
  uint64_t v20;
  PHPerson *person;
  uint64_t v22;
  PHSocialGroup *socialGroup;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PUActivitySharingViewModel;
  v5 = -[PUActivitySharingViewModel init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "collectionListFetchResult");
    v6 = objc_claimAutoreleasedReturnValue();
    collectionListFetchResult = v5->_collectionListFetchResult;
    v5->_collectionListFetchResult = (PHFetchResult *)v6;

    objc_msgSend(v4, "selectionManager");
    v8 = objc_claimAutoreleasedReturnValue();
    selectionManager = v5->_selectionManager;
    v5->_selectionManager = (PUPhotoSelectionManager *)v8;

    objc_msgSend(v4, "photosDataSource");
    v10 = objc_claimAutoreleasedReturnValue();
    photosDataSource = v5->_photosDataSource;
    v5->_photosDataSource = (PXPhotosDataSource *)v10;

    objc_msgSend(v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;

    objc_msgSend(v4, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v16;

    objc_msgSend(v4, "keyAsset");
    v18 = objc_claimAutoreleasedReturnValue();
    keyAsset = v5->_keyAsset;
    v5->_keyAsset = (PXDisplayAsset *)v18;

    objc_msgSend(v4, "person");
    v20 = objc_claimAutoreleasedReturnValue();
    person = v5->_person;
    v5->_person = (PHPerson *)v20;

    objc_msgSend(v4, "socialGroup");
    v22 = objc_claimAutoreleasedReturnValue();
    socialGroup = v5->_socialGroup;
    v5->_socialGroup = (PHSocialGroup *)v22;

    v5->_sourceOrigin = objc_msgSend(v4, "sourceOrigin");
    v5->_actionSheet = objc_msgSend(v4, "wantsActionSheet");
  }

  return v5;
}

- (PUActivitySharingViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingViewModel.m"), 39, CFSTR("%s is not available as initializer"), "-[PUActivitySharingViewModel init]");

  abort();
}

- (PUPhotoSelectionManager)selectionManager
{
  void *v5;

  if (-[PUActivitySharingViewModel isActionSheet](self, "isActionSheet"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingViewModel.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.isActionSheet"));

  }
  return self->_selectionManager;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUActivitySharingViewModel;
  -[PUActivitySharingViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setActionSheet:(BOOL)a3
{
  if (self->_actionSheet != a3)
  {
    self->_actionSheet = a3;
    -[PUActivitySharingViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (void)setSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_selectionManager, a3);
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (BOOL)isActionSheet
{
  return self->_actionSheet;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

@end
