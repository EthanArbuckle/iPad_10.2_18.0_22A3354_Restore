@implementation PXCMMInvitationsDataSourceManager

+ (id)emptyDataSourceManager
{
  return objc_alloc_init(PXCMMInvitationsEmptyDataSourceManager);
}

+ (id)currentDataSourceManager
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentDataSourceManagerForPhotoLibrary:momentSharePhotoLibrary:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4
{
  return (id)objc_msgSend(a1, "currentDataSourceManagerForPhotoLibrary:momentSharePhotoLibrary:fetchLimit:", a3, a4, 0);
}

+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4 fetchLimit:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  PXCMMMomentShareInvitationsDataSourceManager *v12;
  PXCMMMomentShareInvitationsDataSourceManager *v13;
  __objc2_class *v14;

  v8 = a3;
  v9 = a4;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "invitationsDataSourceType");

  switch(v11)
  {
    case 0:
      v12 = -[PXCMMMomentShareInvitationsDataSourceManager initWithPhotoLibrary:fetchLimit:]([PXCMMMomentShareInvitationsDataSourceManager alloc], "initWithPhotoLibrary:fetchLimit:", v9, a5);
      goto LABEL_8;
    case 1:
      v14 = PXCMMMomentsInvitationsDataSourceManager;
      goto LABEL_6;
    case 2:
      v14 = PXCMMSharedAlbumsInvitationsDataSourceManager;
LABEL_6:
      v12 = (PXCMMMomentShareInvitationsDataSourceManager *)objc_msgSend([v14 alloc], "initWithPhotoLibrary:", v8);
      goto LABEL_8;
    case 3:
      objc_msgSend(a1, "emptyDataSourceManager");
      v12 = (PXCMMMomentShareInvitationsDataSourceManager *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = v12;
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

+ (NSArray)keyPathsAffectingCurrentDataSourceManager
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_invitationsDataSourceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (PXMediaProvider)mediaProvider
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsDataSourceManager.m"), 95, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCMMInvitationsDataSourceManager mediaProvider]", v6);

  abort();
}

- (int64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(int64_t)a3
{
  self->_filter = a3;
}

@end
