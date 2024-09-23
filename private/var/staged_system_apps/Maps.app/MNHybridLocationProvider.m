@implementation MNHybridLocationProvider

+ (id)navdInstance
{
  _QWORD *v2;
  id v3;
  _QWORD v5[4];
  _QWORD *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100786400;
  v7[3] = &unk_1011ACF48;
  v7[4] = a1;
  v2 = objc_retainBlock(v7);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (qword_1014D3258 != -1)
      dispatch_once(&qword_1014D3258, v2);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100786564;
    v5[3] = &unk_1011ADA00;
    v6 = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);

  }
  v3 = (id)qword_1014D3250;

  return v3;
}

@end
