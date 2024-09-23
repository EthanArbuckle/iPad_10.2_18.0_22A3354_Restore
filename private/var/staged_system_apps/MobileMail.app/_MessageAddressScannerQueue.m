@implementation _MessageAddressScannerQueue

- (_MessageAddressScannerQueue)init
{
  _MessageAddressScannerQueue *v2;
  _MessageAddressScannerQueue *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  _MessageAddressScannerQueue *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MessageAddressScannerQueue;
  v2 = -[_MessageAddressScannerQueue init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[_MessageAddressScannerQueue setMaximumSize:](v2, "setMaximumSize:", 100);
    -[_MessageAddressScannerQueue setMaximumLatency:](v3, "setMaximumLatency:", 2.0);
    v4 = dispatch_queue_create("com.apple.mobilemail.MessageAddressScannerPendingRemovalsQueue", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)setTargetQueue:(id)a3
{
  dispatch_set_target_queue((dispatch_object_t)self->_dispatchQueue, (dispatch_queue_t)a3);
}

- (BOOL)isEmpty
{
  return -[EFMutableInt64Set count](self->_hashes, "count") == 0;
}

- (BOOL)addHash:(int64_t)a3
{
  EFMutableInt64Set *hashes;
  EFMutableInt64Set *v6;
  EFMutableInt64Set *v7;

  hashes = self->_hashes;
  if (!hashes)
  {
    v6 = (EFMutableInt64Set *)objc_alloc_init((Class)EFMutableInt64Set);
    v7 = self->_hashes;
    self->_hashes = v6;

    hashes = self->_hashes;
  }
  if ((-[EFMutableInt64Set containsIndex:](hashes, "containsIndex:", a3) & 1) != 0)
    return 0;
  ++*(_DWORD *)&self->MFBufferedQueue_opaque[OBJC_IVAR___MFBufferedQueue__currentSize];
  -[EFMutableInt64Set addIndex:](self->_hashes, "addIndex:", a3);
  return -[_MessageAddressScannerQueue flushIfNecessary](self, "flushIfNecessary");
}

- (void)removeAllObjects
{
  EFMutableInt64Set *hashes;
  objc_super v4;

  hashes = self->_hashes;
  self->_hashes = 0;

  v4.receiver = self;
  v4.super_class = (Class)_MessageAddressScannerQueue;
  -[_MessageAddressScannerQueue removeAllObjects](&v4, "removeAllObjects");
}

- (BOOL)_flush
{
  id v3;
  BOOL v4;

  if (-[EFMutableInt64Set count](self->_hashes, "count"))
    v3 = -[EFMutableInt64Set copy](self->_hashes, "copy");
  else
    v3 = 0;
  -[_MessageAddressScannerQueue removeAllObjects](self, "removeAllObjects");
  if (v3)
    v4 = -[_MessageAddressScannerQueue handleHashes:](self, "handleHashes:", v3);
  else
    v4 = 1;

  return v4;
}

- (BOOL)handleHashes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *dispatchQueue;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MessageAddressScannerQueue recentsLibrary](self, "recentsLibrary"));
  v6 = objc_alloc_init(off_1005A0758());
  v7 = off_1005A0760();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v6, "setDomains:", v9);

  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10010557C;
  v14[3] = &unk_10051EE70;
  v11 = v4;
  v15 = v11;
  v12 = v5;
  v16 = v12;
  objc_msgSend(v12, "performRecentsSearch:queue:completion:", v6, dispatchQueue, v14);

  return 1;
}

- (CRRecentContactsLibrary)recentsLibrary
{
  return self->_recentsLibrary;
}

- (void)setRecentsLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_recentsLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsLibrary, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
