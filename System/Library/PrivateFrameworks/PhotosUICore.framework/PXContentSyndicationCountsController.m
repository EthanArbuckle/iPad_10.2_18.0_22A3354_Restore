@implementation PXContentSyndicationCountsController

- (PXContentSyndicationCountsController)init
{
  uint64_t v4;
  PXContentSyndicationCountsController *v5;
  PXContentSyndicationCountsController *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationCountsController.m"), 44, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationCountsController init]");

    abort();
  }
  v10.receiver = self;
  v10.super_class = (Class)PXContentSyndicationCountsController;
  v5 = -[PXContentSyndicationCountsController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_savedCount = -1;
    v5->_detailedCounts.othersCount = *((_QWORD *)off_1E50B7ED8 + 2);
    *(_OWORD *)&v5->_detailedCounts.photosCount = *(_OWORD *)off_1E50B7ED8;
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeferredKeyObserver:", v6);

  }
  return v6;
}

- (void)setAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  PXDisplayAssetCollection *v6;
  PXDisplayAssetCollection *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  PXDisplayAssetCollection *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PXDisplayAssetCollection *v16;
  PXDisplayAssetCollection *assetCollection;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  PXContentSyndicationCountsController *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (PXDisplayAssetCollection *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationCountsController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  v6 = self->_assetCollection;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXDisplayAssetCollection isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      PXContentSyndicationCountsControllerGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        v11 = v5;
        -[PXDisplayAssetCollection px_cheapLogIdentifier](v11, "px_cheapLogIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v11);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        *(_DWORD *)buf = 138412802;
        v20 = v10;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p> Set Asset Collection: %{public}@", buf, 0x20u);

      }
      v16 = (PXDisplayAssetCollection *)-[PXDisplayAssetCollection copyWithZone:](v5, "copyWithZone:", 0);
      assetCollection = self->_assetCollection;
      self->_assetCollection = v16;

      -[PXContentSyndicationCountsController didSetAssetCollection:](self, "didSetAssetCollection:", v5);
    }
  }

}

- (NSString)totalCountDescription
{
  BOOL v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[PXContentSyndicationCountsController detailedCounts](self, "detailedCounts");
  v3 = v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL;
  if (v3 || !(v6 + v5 + v7))
    return (NSString *)0;
  PLLocalizedCountDescription();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)savedCountDescription
{
  int64_t v3;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  -[PXContentSyndicationCountsController detailedCounts](self, "detailedCounts");
  v3 = -[PXContentSyndicationCountsController savedCount](self, "savedCount");
  if ((_QWORD)v13 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v13 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    return (NSString *)0;
  }
  v7 = 0;
  if (v3 != -1)
  {
    v8 = *((_QWORD *)&v13 + 1) + v13 + v14;
    if (v8)
    {
      if (!v3)
      {
        v15 = v13;
        v16 = v14;
        v9 = CFSTR("PXContentSyndicationPhotosSavedNoneTitle");
        v10 = CFSTR("PXContentSyndicationVideosSavedNoneTitle");
        v11 = CFSTR("PXContentSyndicationItemsSavedNoneTitle");
        goto LABEL_16;
      }
      if (v8 == v3)
      {
        v15 = v13;
        v16 = v14;
        v9 = CFSTR("PXContentSyndicationPhotosSavedAllTitle");
        v10 = CFSTR("PXContentSyndicationVideosSavedAllTitle");
        v11 = CFSTR("PXContentSyndicationItemsSavedAllTitle");
LABEL_16:
        PXLocalizedStringForDetailedCounts(&v15, v9, v10, v11);
        return (NSString *)(id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v13;
      v16 = v14;
      PXLocalizedStringForDetailedCounts(&v15, CFSTR("PXContentSyndicationPhotosSavedTitleFormat"), CFSTR("PXContentSyndicationVideosSavedTitleFormat"), CFSTR("PXContentSyndicationItemsSavedTitleFormat"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v12, CFSTR("%ld %ld"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v7;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationCountsController;
  -[PXContentSyndicationCountsController performChanges:](&v3, sel_performChanges_, a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedCounts
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v5;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  -[PXContentSyndicationCountsController actualDetailedCounts](self, "actualDetailedCounts");
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mockNumberOfAssetsSaved"))
  {
    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = 2;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)actualDetailedCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[4];
  return self;
}

- (void)setDetailedCounts:(id *)a3
{
  $C8986E5AD9146E03F7E851F39E835596 *p_detailedCounts;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  PXContentSyndicationCountsController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_detailedCounts = &self->_detailedCounts;
  if (self->_detailedCounts.photosCount != a3->var0
    || self->_detailedCounts.videosCount != a3->var1
    || self->_detailedCounts.othersCount != a3->var2)
  {
    PXContentSyndicationCountsControllerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      PXDisplayAssetDetailedCountsDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "<%@:%p> >>> Detailed Counts: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    v11 = *(_OWORD *)&a3->var0;
    p_detailedCounts->othersCount = a3->var2;
    *(_OWORD *)&p_detailedCounts->photosCount = v11;
    -[PXContentSyndicationCountsController signalChange:](self, "signalChange:", 2);
  }
}

- (int64_t)savedCount
{
  int64_t v2;
  void *v3;
  unint64_t v4;

  v2 = -[PXContentSyndicationCountsController actualSavedCount](self, "actualSavedCount");
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "mockNumberOfAssetsSaved"))
  {
    v4 = objc_msgSend(v3, "footerMockType");
    if (v4 < 3)
      v2 = v4;
  }

  return v2;
}

- (int64_t)actualSavedCount
{
  return self->_savedCount;
}

- (void)setSavedCount:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  PXContentSyndicationCountsController *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_savedCount != a3)
  {
    PXContentSyndicationCountsControllerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      if (a3 == -1)
      {
        v7 = CFSTR("-");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%td"), a3);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      v9 = v6;
      v10 = 2048;
      v11 = self;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p> >>> Saved Count: %{public}@", buf, 0x20u);

    }
    self->_savedCount = a3;
    -[PXContentSyndicationCountsController signalChange:](self, "signalChange:", 1);
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[5];

  v5 = a4;
  NSStringFromSelector(sel_mockNumberOfAssetsSaved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_4:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PXContentSyndicationCountsController_settings_changedValueForKey___block_invoke;
    v9[3] = &unk_1E511A860;
    v9[4] = self;
    -[PXContentSyndicationCountsController performChanges:](self, "performChanges:", v9);
    goto LABEL_5;
  }
  NSStringFromSelector(sel_footerMockType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

uint64_t __68__PXContentSyndicationCountsController_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

@end
