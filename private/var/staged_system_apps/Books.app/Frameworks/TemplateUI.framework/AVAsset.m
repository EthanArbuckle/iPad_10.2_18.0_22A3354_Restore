@implementation AVAsset

+ (void)tui_createAssetFromURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (qword_2CB6D8 != -1)
    dispatch_once(&qword_2CB6D8, &stru_241310);
  v7 = qword_2CB6D0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_D4B10;
  v10[3] = &unk_23E580;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

@end
