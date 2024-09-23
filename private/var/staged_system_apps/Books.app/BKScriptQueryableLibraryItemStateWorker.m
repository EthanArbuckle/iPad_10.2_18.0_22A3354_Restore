@implementation BKScriptQueryableLibraryItemStateWorker

+ (void)queryForItemStateWithStoreID:(id)a3 completionValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD block[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10018FA80;
  v12[3] = &unk_1008E7338;
  v7 = v5;
  v13 = v7;
  v8 = v6;
  v14 = v8;
  v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v9[2])(v9);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018FC94;
      block[3] = &unk_1008E7818;
      v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

@end
