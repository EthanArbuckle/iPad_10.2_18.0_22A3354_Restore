@implementation BKLibraryManager

- (void)fetchCoverForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012C0E0;
  v16[3] = &unk_1008EBC98;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  v19 = width;
  v20 = height;
  v12 = v10;
  v18 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10012C1C4;
      v14[3] = &unk_1008E7818;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

}

@end
