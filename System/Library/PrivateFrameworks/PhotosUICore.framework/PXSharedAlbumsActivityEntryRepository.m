@implementation PXSharedAlbumsActivityEntryRepository

- (PXSharedAlbumsActivityEntryRepository)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 722, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumsActivityEntryRepository init]");

  abort();
}

- (PXSharedAlbumsActivityEntryRepository)initWithLogIdentifier:(id)a3
{
  id v5;
  PXSharedAlbumsActivityEntryRepository *v6;
  uint64_t v7;
  NSString *logIdentifier;
  NSMutableArray *v9;
  NSMutableArray *pendingFeedEntriesChangeNotifications;
  NSMutableArray *v11;
  NSMutableArray *pendingCommentsChangeNotifications;
  NSMutableArray *v13;
  NSMutableArray *pendingAssetsChangeNotifications;
  void *v15;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 726, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("logIdentifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXSharedAlbumsActivityEntryRepository;
  v6 = -[PXSharedAlbumsActivityEntryRepository init](&v18, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingFeedEntriesChangeNotifications = v6->_pendingFeedEntriesChangeNotifications;
    v6->_pendingFeedEntriesChangeNotifications = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingCommentsChangeNotifications = v6->_pendingCommentsChangeNotifications;
    v6->_pendingCommentsChangeNotifications = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingAssetsChangeNotifications = v6->_pendingAssetsChangeNotifications;
    v6->_pendingAssetsChangeNotifications = v13;

    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addCloudFeedEntriesObserver:", v6);
    objc_msgSend(v15, "addCloudCommentsChangeObserver:asset:", v6, 0);
    objc_msgSend(v15, "addAssetChangeObserver:", v6);
    objc_msgSend(v15, "addShouldReloadObserver:", v6);
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__didFinishPostingNotifications_, *MEMORY[0x1E0D71CF8], 0);

  }
  return v6;
}

- (void)assetsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logIdentifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v7 = 138543362;
    v8 = logIdentifier;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] assetsDidChange", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableArray addObject:](self->_pendingAssetsChangeNotifications, "addObject:", v4);
}

- (void)cloudCommentsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logIdentifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v7 = 138543362;
    v8 = logIdentifier;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] cloudCommentsDidChange", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableArray addObject:](self->_pendingCommentsChangeNotifications, "addObject:", v4);
}

- (void)cloudFeedEntriesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logIdentifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v7 = 138543362;
    v8 = logIdentifier;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] cloudFeedEntriesDidChange", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableArray addObject:](self->_pendingFeedEntriesChangeNotifications, "addObject:", v4);
}

- (void)shouldReload:(id)a3
{
  NSObject *v4;
  NSString *logIdentifier;
  void *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v7 = 138543362;
    v8 = logIdentifier;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] shouldReload", (uint8_t *)&v7, 0xCu);
  }

  -[PXSharedAlbumsActivityEntryRepository _clearPendingNotifications](self, "_clearPendingNotifications");
  -[PXSharedAlbumsActivityEntryRepository delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityEntryRepositoryDidChange:", self);

}

- (void)_didFinishPostingNotifications:(id)a3
{
  NSObject *v5;
  NSString *logIdentifier;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableArray count](self->_pendingFeedEntriesChangeNotifications, "count");
    v9 = -[NSMutableArray count](self->_pendingCommentsChangeNotifications, "count");
    v10 = -[NSMutableArray count](self->_pendingAssetsChangeNotifications, "count");
    v12 = 138544386;
    v13 = logIdentifier;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[SharedAlbumsActivityEntryRepository - %{public}@] %@ (pendingFeedEntries count: %lu, pendingCommentsChange count: %lu, pendingAssetsChange count: %lu)", (uint8_t *)&v12, 0x34u);

  }
  if (-[NSMutableArray count](self->_pendingFeedEntriesChangeNotifications, "count")
    || -[NSMutableArray count](self->_pendingCommentsChangeNotifications, "count")
    || -[NSMutableArray count](self->_pendingAssetsChangeNotifications, "count"))
  {
    -[PXSharedAlbumsActivityEntryRepository _clearPendingNotifications](self, "_clearPendingNotifications");
    -[PXSharedAlbumsActivityEntryRepository delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityEntryRepositoryDidChange:", self);

  }
}

- (void)_clearPendingNotifications
{
  -[NSMutableArray removeAllObjects](self->_pendingFeedEntriesChangeNotifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingCommentsChangeNotifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingAssetsChangeNotifications, "removeAllObjects");
}

- (PXSharedAlbumsActivityEntryRepositoryDelegate)delegate
{
  return (PXSharedAlbumsActivityEntryRepositoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingCommentsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

@end
