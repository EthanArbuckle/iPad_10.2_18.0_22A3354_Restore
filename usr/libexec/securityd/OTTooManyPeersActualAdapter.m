@implementation OTTooManyPeersActualAdapter

- (BOOL)shouldPopDialog
{
  if (qword_100341378 != -1)
    dispatch_once(&qword_100341378, &stru_1002E8DF0);
  if (byte_1003400C8)
    return os_variant_has_internal_ui("iCloudKeychain");
  else
    return 0;
}

- (unint64_t)getLimit
{
  return 170;
}

- (void)popDialogWithCount:(unint64_t)a3 limit:(unint64_t)a4
{
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD v8[6];

  global_queue = dispatch_get_global_queue(9, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100147494;
  v8[3] = &unk_1002ECCC0;
  v8[4] = a3;
  v8[5] = a4;
  dispatch_async(v7, v8);

}

@end
