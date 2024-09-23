@implementation BADoNotDisturbHelper

+ (void)fetchCurrentState:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6B94;
    block[3] = &unk_265FF0;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

@end
