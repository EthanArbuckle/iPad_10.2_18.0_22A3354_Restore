@implementation PXForYouBadgeManager

- (unint64_t)unreadBadgeCount
{
  return self->_unreadBadgeCount;
}

- (PXForYouBadgeManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXForYouBadgeManager *v6;
  PXForYouBadgeManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXForYouBadgeManager;
  v6 = -[PXForYouBadgeManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibrary, a3);

  return v7;
}

- (void)startListeningForChanges
{
  id v3;

  -[PXForYouBadgeManager _updateUnreadSharedAlbumsCount](self, "_updateUnreadSharedAlbumsCount");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didFinishPostingNotifications_, *MEMORY[0x1E0D71CF8], 0);

}

- (void)setUnreadSharedAlbumCount:(unint64_t)a3
{
  if (self->_unreadSharedAlbumCount != a3)
  {
    self->_unreadSharedAlbumCount = a3;
    -[PXForYouBadgeManager _updateUnreadBadgeCount](self, "_updateUnreadBadgeCount");
  }
}

- (void)_updateUnreadSharedAlbumsCount
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D719A8], "cloudSharingPhotoLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71908], "filteredAlbumListForContentMode:library:", 1, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouBadgeManager setUnreadSharedAlbumCount:](self, "setUnreadSharedAlbumCount:", objc_msgSend(v3, "unreadAlbumsCount"));

}

- (void)dealloc
{
  objc_super v3;

  -[PXForYouBadgeManager _stopListeningForChanges](self, "_stopListeningForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PXForYouBadgeManager;
  -[PXForYouBadgeManager dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXForYouBadgeManager;
  -[PXForYouBadgeManager performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setUnreadBadgeCount:(unint64_t)a3
{
  if (self->_unreadBadgeCount != a3)
  {
    self->_unreadBadgeCount = a3;
    -[PXForYouBadgeManager signalChange:](self, "signalChange:", 1);
  }
}

- (void)_stopListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_updateUnreadBadgeCount
{
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[5];

  v3 = -[PXForYouBadgeManager unreadSharedAlbumCount](self, "unreadSharedAlbumCount");
  v4 = -[PXForYouBadgeManager unreadMemoriesCount](self, "unreadMemoriesCount") + v3;
  if (v4 != -[PXForYouBadgeManager unreadBadgeCount](self, "unreadBadgeCount"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__PXForYouBadgeManager__updateUnreadBadgeCount__block_invoke;
    v5[3] = &__block_descriptor_40_e39_v16__0___PXMutableForYouBadgeManager__8l;
    v5[4] = v4;
    -[PXForYouBadgeManager performChanges:](self, "performChanges:", v5);
  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchResult)memories
{
  return self->_memories;
}

- (void)setMemories:(id)a3
{
  objc_storeStrong((id *)&self->_memories, a3);
}

- (unint64_t)unreadSharedAlbumCount
{
  return self->_unreadSharedAlbumCount;
}

- (unint64_t)unreadMemoriesCount
{
  return self->_unreadMemoriesCount;
}

- (void)setUnreadMemoriesCount:(unint64_t)a3
{
  self->_unreadMemoriesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memories, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __47__PXForYouBadgeManager__updateUnreadBadgeCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUnreadBadgeCount:", *(_QWORD *)(a1 + 32));
}

+ (PXUbiquitousKeyValueStoreValueAccessor)lastSeenBadgeDateAccessor
{
  if (lastSeenBadgeDateAccessor_onceToken != -1)
    dispatch_once(&lastSeenBadgeDateAccessor_onceToken, &__block_literal_global_258203);
  return (PXUbiquitousKeyValueStoreValueAccessor *)(id)lastSeenBadgeDateAccessor_lastSeenBadgeDateAccessor;
}

+ (NSDate)lastSeenBadgeDate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "lastSeenBadgeDateAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

+ (void)setLastSeenBadgeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "lastSeenBadgeDateAccessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentValue:", v4);

}

void __49__PXForYouBadgeManager_lastSeenBadgeDateAccessor__block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, CFSTR("PXForYouLastSeenBadgeDate"), &__block_literal_global_136_258206, &__block_literal_global_139_258207, &__block_literal_global_141_258208);
  v2 = (void *)lastSeenBadgeDateAccessor_lastSeenBadgeDateAccessor;
  lastSeenBadgeDateAccessor_lastSeenBadgeDateAccessor = v1;

}

void __49__PXForYouBadgeManager_lastSeenBadgeDateAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("PXForYouLastSeenBadgeDate");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PXForYouLastSeenBadgeDateDidChangeNotification"), 0, v5);
}

BOOL __49__PXForYouBadgeManager_lastSeenBadgeDateAccessor__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:") == -1;
}

uint64_t __49__PXForYouBadgeManager_lastSeenBadgeDateAccessor__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
