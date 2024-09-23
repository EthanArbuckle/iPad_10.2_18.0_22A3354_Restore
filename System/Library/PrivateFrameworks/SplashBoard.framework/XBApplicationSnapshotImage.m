@implementation XBApplicationSnapshotImage

- (XBApplicationSnapshotImage)initWithSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  XBApplicationSnapshotImage *v14;
  uint64_t v15;
  objc_super v17;
  objc_super v18;

  v7 = a3;
  v8 = XBImageOrientationForInterfaceOrientationRotation(a4, 1);
  objc_msgSend(v7, "_cachedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_retainAutorelease(v9);
    if (objc_msgSend(v11, "CGImage"))
    {
      v12 = objc_retainAutorelease(v11);
      v13 = objc_msgSend(v12, "CGImage");
      objc_msgSend(v12, "scale");
      v14 = -[XBApplicationSnapshotImage initWithCGImage:scale:orientation:](&v18, sel_initWithCGImage_scale_orientation_, v13, v8, v17.receiver, v17.super_class, self, XBApplicationSnapshotImage);
    }
    else
    {
      v15 = objc_msgSend(v11, "ioSurface");
      objc_msgSend(v11, "scale");
      v14 = (XBApplicationSnapshotImage *)-[XBApplicationSnapshotImage _initWithIOSurface:scale:orientation:](&v17, sel__initWithIOSurface_scale_orientation_, v15, v8, self, XBApplicationSnapshotImage, v18.receiver, v18.super_class);
    }
    self = v14;
  }
  if (self)
  {
    self->_interfaceOrientation = a4;
    objc_storeStrong((id *)&self->_snapshot, a3);
    -[XBApplicationSnapshot beginImageAccess](self->_snapshot, "beginImageAccess");
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[XBApplicationSnapshot endImageAccess](self->_snapshot, "endImageAccess");
  v3.receiver = self;
  v3.super_class = (Class)XBApplicationSnapshotImage;
  -[XBApplicationSnapshotImage dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  XBApplicationSnapshotImage *v12;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __41__XBApplicationSnapshotImage_description__block_invoke;
  v10 = &unk_24D7F45F0;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __41__XBApplicationSnapshotImage_description__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v3 = (id)objc_msgSend(v2, "appendSize:withName:", CFSTR("size"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scale");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 1);
  v6 = *(void **)(a1 + 32);
  XBImageOrientationDescription(objc_msgSend(*(id *)(a1 + 40), "imageOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("imageOrientation"));

  v9 = *(void **)(a1 + 32);
  XBStringForInterfaceOrientation(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("interfaceOrientation"));

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "isImageOpaque"), CFSTR("opaque"));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "path");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendObject:withName:skipIfNil:", v15, CFSTR("path"), 1);

}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

@end
