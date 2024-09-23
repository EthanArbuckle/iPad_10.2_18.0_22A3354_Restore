@implementation BKLibraryAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKLibrary");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

+ (id)bkaxdefaultManager
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10004E478;
  v9 = sub_10004E2B0;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100161D7C;
  v4[3] = &unk_1008EC6F0;
  v4[4] = &v5;
  v4[5] = a1;
  if (__IMAccessibilityPerformSafeBlock(v4, a2))
    abort();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)bkaxLibraryAssetOnMainQueueWithAssetID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10004E478;
  v14 = sub_10004E2B0;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100161EAC;
  v7[3] = &unk_1008E8848;
  v9 = &v10;
  v7[4] = self;
  v3 = a3;
  v8 = v3;
  if (__IMAccessibilityPerformSafeBlock(v7, v4))
    abort();

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (unint64_t)bkaxCountOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100161FFC;
  v9[3] = &unk_1008EC718;
  v9[4] = self;
  v5 = a3;
  v10 = v5;
  v11 = &v17;
  v12 = &v13;
  if (__IMAccessibilityPerformSafeBlock(v9, v6))
    abort();

  if (a4)
    *a4 = v18[3];
  v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

- (id)_bkaxUiChildContext
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10004E478;
  v9 = sub_10004E2B0;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100162138;
  v4[3] = &unk_1008E75B8;
  v4[4] = self;
  v4[5] = &v5;
  if (__IMAccessibilityPerformSafeBlock(v4, a2))
    abort();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

@end
