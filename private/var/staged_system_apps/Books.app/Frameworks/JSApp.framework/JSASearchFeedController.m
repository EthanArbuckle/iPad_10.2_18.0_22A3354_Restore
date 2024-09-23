@implementation JSASearchFeedController

- (void)updateSearchText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  const __CFString *v16;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "isString"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toString"));
  else
    v5 = 0;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_16B90;
  v12[3] = &unk_9E888;
  objc_copyWeak(&v14, &location);
  v6 = v5;
  v13 = v6;
  v7 = objc_retainBlock(v12);
  if (v7)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v7[2])(v7);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_16BE0;
      block[3] = &unk_9DCD0;
      v11 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v14);
  if (v6)
  {
    v16 = CFSTR("searchText");
    v17 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  else
  {
    v8 = &__NSDictionary0__struct;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("JSASearchFeedControllerUpdateSearchTextNotification"), self, v8);

  objc_destroyWeak(&location);
}

@end
