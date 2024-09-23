@implementation PXSharedAlbumActivityAccompanyingInboxGadgetProvider

- (PXSharedAlbumActivityAccompanyingInboxGadgetProvider)init
{
  void *v3;
  PXInboxGadgetProvider *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PXSharedAlbumActivityAccompanyingInboxGadgetProvider *v10;
  objc_super v12;

  +[PXInboxViewController createInboxDataSourceManager](PXInboxViewController, "createInboxDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXInboxGadgetProvider initWithDataSourceManager:]([PXInboxGadgetProvider alloc], "initWithDataSourceManager:", v3);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXForYouInboxTitle"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)PXSharedAlbumActivityAccompanyingInboxGadgetProvider;
  v10 = -[PXHorizontalCollectionGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:](&v12, sel_initWithIdentifier_contentGadgetProvider_title_horizontalCollectionGadgetClass_, v7, v4, v8, v9);

  if (v10)
  {
    -[PXHorizontalCollectionGadgetProvider setGadgetType:](v10, "setGadgetType:", 15);
    -[PXHorizontalCollectionGadgetProvider setHeaderStyle:](v10, "setHeaderStyle:", 5);
    -[PXHorizontalCollectionGadgetProvider setDefaultColumnSpan:](v10, "setDefaultColumnSpan:", 1);
  }

  return v10;
}

- (PXSharedAlbumActivityAccompanyingInboxGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumActivityAccompanyingInboxGadgetProvider.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumActivityAccompanyingInboxGadgetProvider initWithContentGadgetProvider:title:]");

  abort();
}

- (PXSharedAlbumActivityAccompanyingInboxGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4 horizontalCollectionGadgetClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumActivityAccompanyingInboxGadgetProvider.m"), 38, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumActivityAccompanyingInboxGadgetProvider initWithContentGadgetProvider:title:horizontalCollectionGadgetClass:]");

  abort();
}

- (PXSharedAlbumActivityAccompanyingInboxGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumActivityAccompanyingInboxGadgetProvider.m"), 42, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumActivityAccompanyingInboxGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:]");

  abort();
}

- (PXSharedAlbumActivityAccompanyingInboxGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumActivityAccompanyingInboxGadgetProvider.m"), 46, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumActivityAccompanyingInboxGadgetProvider initWithIdentifier:]");

  abort();
}

- (NSDate)mostRecentContentDate
{
  return +[PXFeedSectionInfosManager mostRecentCreationDate](PXFeedSectionInfosManager, "mostRecentCreationDate");
}

- (int64_t)forYouContentIdentifier
{
  return 6;
}

@end
