@implementation BKBookCacheController

+ (id)sharedInstance
{
  if (qword_1009F5160 != -1)
    dispatch_once(&qword_1009F5160, &stru_1008ED5B8);
  return (id)qword_1009F5158;
}

- (BKBookCacheController)init
{
  BKBookCacheController *v2;
  id v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKBookCacheController;
  v2 = -[BKBookCacheController init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSCountedSet);
    -[BKBookCacheController setOpenBooks:](v2, "setOpenBooks:", v3);

    v4 = dispatch_queue_create("BKBookCacheController.access", 0);
    -[BKBookCacheController setAccessQueue:](v2, "setAccessQueue:", v4);

    v5 = dispatch_queue_create("BKBookCacheController.serial", 0);
    -[BKBookCacheController setSerialQueue:](v2, "setSerialQueue:", v5);

  }
  return v2;
}

- (void)setMetadataForAssetID:(id)a3 withHelper:(id)a4 pageCount:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  v39 = a3;
  v7 = a4;
  if (v39 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v9 = objc_msgSend(v8, "newManagedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NewMOC 2 %s %@"), "-[BKBookCacheController setMetadataForAssetID:withHelper:pageCount:]", v39));
    objc_msgSend(v9, "setName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "libraryMutableAssetWithAssetID:inManagedObjectContext:", v39, v9));
    v12 = v11;
    if (!v11)
    {
LABEL_50:

      goto LABEL_51;
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));
    if (!v13
      || (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "author")),
          v16 = objc_msgSend(v15, "isEqualToString:", BKLibrarySortLastUnknownAuthorString),
          v15,
          v14,
          v16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataAuthorKey, 1));
      if (objc_msgSend(v17, "length"))
        objc_msgSend(v12, "setAuthor:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));

    if (!v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataTitleKey, 1));
      if (v19)
        v20 = (__CFString *)v19;
      else
        v20 = &stru_10091C438;
      objc_msgSend(v12, "setTitle:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "genre"));

    if (!v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataGenreKey, 1));
      if (v22)
        v23 = (__CFString *)v22;
      else
        v23 = &stru_10091C438;
      objc_msgSend(v12, "setGenre:", v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "epubID"));

    if (!v24)
    {
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataBookIdUrlIdentifierKey, 1));
      if (v25)
        v26 = (__CFString *)v25;
      else
        v26 = &stru_10091C438;
      objc_msgSend(v12, "setEpubID:", v26);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "language"));

    if (!v27)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataLanguageKey, 1));
      if (v28)
        v29 = (__CFString *)v28;
      else
        v29 = &stru_10091C438;
      objc_msgSend(v12, "setLanguage:", v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pageProgressionDirection"));

    if (v30)
    {
      v31 = 0;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataPageProgressionKey, 1));
      if (v32)
      {
        objc_msgSend(v12, "setPageProgressionDirection:", v32);
        v31 = objc_msgSend(v32, "isEqualToString:", AEHelperStringMetadataPageProgressionRightToLeftValue);
      }
      else
      {
        v31 = 0;
      }

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "coverWritingMode"));

    if (v33)
    {
      if (!v31)
      {
LABEL_44:
        v38 = objc_msgSend(v12, "pageCount");
        if ((unint64_t)(a5 - 1) <= 0x7FFFFFFFFFFFFFFDLL && !v38 && objc_msgSend(v12, "pageCount") != (id)a5)
          objc_msgSend(v12, "setPageCount:", a5);
        if (objc_msgSend(v9, "hasChanges"))
          objc_msgSend(v9, "saveLibrary");
        goto LABEL_50;
      }
    }
    else
    {
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataCoverWritingModeKey, 1));
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(v12, "setCoverWritingMode:", v34);
        LOBYTE(v31) = objc_msgSend(v35, "imIsVerticalWritingMode");

      }
      if ((v31 & 1) == 0)
        goto LABEL_44;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "temporaryAssetID"));
    if (objc_msgSend(v36, "length"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
      objc_msgSend(v37, "incrementVersionForIdentifier:", v39);

    }
    goto LABEL_44;
  }
LABEL_51:

}

- (void)cachedURLForAssetURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKBookCacheController serialQueue](self, "serialQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001887A0;
  v11[3] = &unk_1008E7680;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

- (NSCountedSet)openBooks
{
  return self->_openBooks;
}

- (void)setOpenBooks:(id)a3
{
  objc_storeStrong((id *)&self->_openBooks, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_openBooks, 0);
}

@end
