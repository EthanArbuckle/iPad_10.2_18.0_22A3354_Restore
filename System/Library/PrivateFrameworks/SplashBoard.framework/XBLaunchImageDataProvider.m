@implementation XBLaunchImageDataProvider

- (XBLaunchImageDataProvider)initWithRequest:(id)a3 contextID:(unsigned int)a4 opaque:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v9;
  XBLaunchImageDataProvider *v10;
  void *v11;
  CGFloat v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  _FBSSnapshot *snapshot;
  XBSnapshotDataProviderContext *v28;
  XBSnapshotDataProviderContext *context;
  void *v31;
  void *v32;
  void *v33;
  CGAffineTransform m;
  CATransform3D v35;
  CGAffineTransform v36;
  objc_super v37;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v9 = a3;
  if (!(_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageDataProvider.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextID != 0"));

  }
  if ((_DWORD)v6 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageDataProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextID != XBInvalidContextId"));

    if (v9)
      goto LABEL_5;
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageDataProvider.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)XBLaunchImageDataProvider;
  v10 = -[XBLaunchImageDataProvider init](&v37, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "displayConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeScale(&v36, v12, v12);
    v14 = objc_alloc(MEMORY[0x24BE38530]);
    m = v36;
    CATransform3DMakeAffineTransform(&v35, &m);
    v15 = (void *)objc_msgSend(v14, "initWithContextID:baseTransform:", v6, &v35);
    v16 = objc_alloc(MEMORY[0x24BE38528]);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDisplayConfiguration:layers:", v11, v17);

    objc_msgSend(v18, "setOpaque:", v5);
    objc_msgSend(v18, "setScale:", v13);
    objc_msgSend(v9, "referenceSize");
    v20 = v19;
    v22 = v21;
    v23 = objc_msgSend(v9, "interfaceOrientation");
    if ((unint64_t)(v23 - 3) >= 2)
      v24 = v20;
    else
      v24 = v22;
    if ((unint64_t)(v23 - 3) >= 2)
      v25 = v22;
    else
      v25 = v20;
    objc_msgSend(v18, "setSnapshotSize:", v24, v25);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE38520]), "initWithSnapshotContext:", v18);
    snapshot = v10->_snapshot;
    v10->_snapshot = (_FBSSnapshot *)v26;

    v28 = objc_alloc_init(XBSnapshotDataProviderContext);
    context = v10->_context;
    v10->_context = v28;

    -[XBSnapshotDataProviderContext setScale:](v10->_context, "setScale:", v13);
    -[XBSnapshotDataProviderContext setOpaque:](v10->_context, "setOpaque:", v5);

  }
  return v10;
}

- (id)fetchImage
{
  XBLaunchImageDataProvider *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  UIImage *cachedImage;
  _FBSSnapshot *snapshot;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedImage)
  {
    if (-[_FBSSnapshot hasProtectedContent](v2->_snapshot, "hasProtectedContent"))
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithIOSurface:", -[_FBSSnapshot IOSurface](v2->_snapshot, "IOSurface"));
    }
    else
    {
      v4 = -[_FBSSnapshot CGImage](v2->_snapshot, "CGImage");
      if (!v4)
      {
LABEL_7:
        -[_FBSSnapshot invalidate](v2->_snapshot, "invalidate");
        snapshot = v2->_snapshot;
        v2->_snapshot = 0;

        goto LABEL_8;
      }
      v5 = objc_alloc(MEMORY[0x24BDF6AC8]);
      -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
      v3 = objc_msgSend(v5, "initWithCGImage:scale:orientation:", v4, 0);
    }
    cachedImage = v2->_cachedImage;
    v2->_cachedImage = (UIImage *)v3;

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

  return v2->_cachedImage;
}

- (void)invalidateImage
{
  _FBSSnapshot *snapshot;
  UIImage *cachedImage;
  XBLaunchImageDataProvider *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_FBSSnapshot invalidate](obj->_snapshot, "invalidate");
  snapshot = obj->_snapshot;
  obj->_snapshot = 0;

  cachedImage = obj->_cachedImage;
  obj->_cachedImage = 0;

  objc_sync_exit(obj);
}

- (XBSnapshotDataProviderContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
