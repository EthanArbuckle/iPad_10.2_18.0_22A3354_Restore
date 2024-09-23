@implementation BKAppImportCoordinator

- (BKAppImportCoordinator)init
{
  BKAppImportCoordinator *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKAppImportCoordinator;
  v2 = -[BKAppImportCoordinator init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BKAppImportCoordinator.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v2->_lastImportedBookTimestamp = v7 + -15.0 + -1.0;
  }
  return v2;
}

- (id)mainLibrary
{
  return +[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager");
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (void)importBookFromURL:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 completion:(id)a9
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  BKResolveAssetForImportOperation *v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  id v22;
  _QWORD *v23;
  NSObject *queue;
  _QWORD *v25;
  id v26;
  id v27;
  _QWORD *v28;
  BKResolveAssetForImportOperation *v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  BOOL v33;
  _QWORD block[4];
  id v37;
  BKAppImportCoordinator *v38;
  BKResolveAssetForImportOperation *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD *v44;
  BOOL v45;
  BOOL v46;
  char v47;
  BOOL v48;
  _QWORD v49[5];
  _QWORD *v50;
  _QWORD v51[5];
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  BOOL v58;
  _QWORD v59[4];
  BKResolveAssetForImportOperation *v60;
  BKAppImportCoordinator *v61;
  _QWORD v62[5];
  id v63;

  v12 = a3;
  v13 = a8;
  v14 = a9;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v16 = v15;
  -[BKAppImportCoordinator lastImportedBookTimestamp](self, "lastImportedBookTimestamp");
  v33 = v16 - v17 > 15.0;
  -[BKAppImportCoordinator setLastImportedBookTimestamp:](self, "setLastImportedBookTimestamp:", v16);
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_10004E330;
  v62[4] = sub_10004E218;
  v63 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10009A504;
  v59[3] = &unk_1008E7338;
  v18 = -[BKResolveAssetForImportOperation initWithURL:]([BKResolveAssetForImportOperation alloc], "initWithURL:", v12);
  v60 = v18;
  v61 = self;
  v19 = objc_retainBlock(v59);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10009A530;
  v53[3] = &unk_1008E8588;
  v20 = v14;
  v55 = v20;
  v21 = v19;
  v56 = v21;
  v53[4] = self;
  v58 = a5;
  LOBYTE(v14) = a5;
  v22 = v13;
  v54 = v22;
  v57 = v62;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10009ACC4;
  v51[3] = &unk_1008E85B0;
  v51[4] = self;
  v52 = objc_retainBlock(v53);
  v32 = v52;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009ADD8;
  v49[3] = &unk_1008E8628;
  v49[4] = self;
  v50 = objc_retainBlock(v51);
  v31 = v50;
  v23 = objc_retainBlock(v49);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B1F8;
  block[3] = &unk_1008E86C8;
  v37 = v12;
  v38 = self;
  v41 = v21;
  v42 = v20;
  v45 = a6;
  v39 = v18;
  v40 = v22;
  v46 = v33;
  v47 = (char)v14;
  v48 = a7;
  v43 = v23;
  v44 = v62;
  v25 = v23;
  v26 = v22;
  v27 = v20;
  v28 = v21;
  v29 = v18;
  v30 = v12;
  dispatch_async(queue, block);

  _Block_object_dispose(v62, 8);
}

- (void)_handleImportedAndPotentiallyMigratedAsset:(id)a3 canShow:(BOOL)a4 transaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009B88C;
    v11[3] = &unk_1008E86F0;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    objc_msgSend(v10, "addCustomOperationBlock:", v11);

  }
}

- (double)lastImportedBookTimestamp
{
  return self->_lastImportedBookTimestamp;
}

- (void)setLastImportedBookTimestamp:(double)a3
{
  self->_lastImportedBookTimestamp = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
