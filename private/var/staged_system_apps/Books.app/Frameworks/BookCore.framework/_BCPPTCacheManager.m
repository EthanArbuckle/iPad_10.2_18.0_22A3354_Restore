@implementation _BCPPTCacheManager

- (id)describedImagesFromProductProfile:(id)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_BCPPTFlawlessImageEntry entry](_BCPPTFlawlessImageEntry, "entry", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_BCPPTFlawlessImageEntry entry](_BCPPTFlawlessImageEntry, "entry"));
  v5 = sub_17304((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePath"));
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  else
    v8 = 0;
  v9 = objc_retainBlock(v11);
  v10 = v9;
  if (v9)
    (*((void (**)(id, void *))v9 + 2))(v9, v8);

}

- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  double height;
  double width;
  id v7;
  id v8;
  id v9;

  height = a4.height;
  width = a4.width;
  v7 = objc_alloc_init((Class)CALayer);
  v8 = -[_BCPPTImageSet imageColor]_0();
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v7, "setFrame:", CGPointZero.x, CGPointZero.y, width, height);
  return v7;
}

- (_BCPPTCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8
{
  _BCPPTCacheManager *v9;

  v9 = (_BCPPTCacheManager *)objc_alloc_init((Class)objc_opt_class(self, a2));

  return v9;
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))objc_retainBlock(a5);
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_BCPPTFlawlessImageEntry entry](_BCPPTFlawlessImageEntry, "entry"));
    v6 = sub_17304((uint64_t)v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8[2](v8, v7);

  }
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7
{
  void *v7;
  id v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))objc_retainBlock(a7);
  if (v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_BCPPTFlawlessImageEntry entry](_BCPPTFlawlessImageEntry, "entry"));
    v8 = sub_17304((uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10[2](v10, v9);

  }
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v4 = v5;
  }

}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))objc_retainBlock(a4);
  if (v6)
  {
    v4 = -[_BCPPTImageSet imageColor]_0();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6[2](v6, v5);

  }
}

- (id)metadataForIdentifier:(id)a3
{
  return 0;
}

@end
