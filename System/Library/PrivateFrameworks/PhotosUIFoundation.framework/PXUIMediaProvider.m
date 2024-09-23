@implementation PXUIMediaProvider

void __89__PXUIMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGImageRef v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "imageOrientation");
  if (v7)
  {
    v6 = CGImageRetain((CGImageRef)objc_msgSend(objc_retainAutorelease(v7), "CGImage"));
    CFAutorelease(v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__PXUIMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_2514CF398;
  v18 = v13;
  v14 = v13;
  v15 = -[PXUIMediaProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIMediaProvider.m"), 43, CFSTR("Concrete subclass must implement %@"), v10);

  return 0;
}

@end
