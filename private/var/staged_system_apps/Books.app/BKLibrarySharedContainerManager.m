@implementation BKLibrarySharedContainerManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AABF8;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4E78 != -1)
    dispatch_once(&qword_1009F4E78, block);
  return (id)qword_1009F4E70;
}

- (BKLibrarySharedContainerManager)init
{
  void *v3;
  unsigned int v4;
  BKLibrarySharedContainerManager *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *plistQueue;
  uint64_t v8;
  IMLibraryPlist *plist;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
  v4 = objc_msgSend(v3, "_isMultiUser");

  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BKLibrarySharedContainerManager;
    v5 = -[BKLibrarySharedContainerManager init](&v11, "init");
    if (v5)
    {
      v6 = dispatch_queue_create("BKLibrarySharedContainerManager.urlQueue", 0);
      plistQueue = v5->_plistQueue;
      v5->_plistQueue = (OS_dispatch_queue *)v6;

      v8 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", 3));
      plist = v5->_plist;
      v5->_plist = (IMLibraryPlist *)v8;

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)sharedURLForEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *plistQueue;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004E360;
  v20 = sub_10004E230;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist assetIDFromPlistEntry:](IMLibraryPlist, "assetIDFromPlistEntry:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v4));
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length") || v7)
  {
    plistQueue = self->_plistQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AAE70;
    block[3] = &unk_1008E8CF0;
    block[4] = self;
    v12 = v5;
    v13 = v6;
    v14 = v7;
    v15 = &v16;
    dispatch_sync(plistQueue, block);

  }
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (OS_dispatch_queue)plistQueue
{
  return self->_plistQueue;
}

- (IMLibraryPlist)plist
{
  return self->_plist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_plistQueue, 0);
}

@end
