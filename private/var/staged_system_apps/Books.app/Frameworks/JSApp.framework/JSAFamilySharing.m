@implementation JSAFamilySharing

+ (void)launchFamilySharingSettings
{
  _BOOL8 v2;
  _QWORD block[4];
  Block_layout *v4;

  v2 = +[NSThread isMainThread](NSThread, "isMainThread");
  if (v2)
  {
    sub_16D94((id)v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16E08;
    block[3] = &unk_9DCD0;
    v4 = &stru_9E8B0;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

@end
