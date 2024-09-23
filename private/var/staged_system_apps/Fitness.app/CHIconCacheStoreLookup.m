@implementation CHIconCacheStoreLookup

+ (void)initialize
{
  const char *v2;
  dispatch_queue_t v3;
  void *v4;

  v2 = (const char *)HKSingletonDispatchQueueName(a1, CFSTR("icon_queue"));
  v3 = dispatch_queue_create(v2, 0);
  v4 = (void *)qword_10083E030;
  qword_10083E030 = (uint64_t)v3;

}

+ (void)fetchIconWithCHIconParameters:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = qword_10083E030;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AA2E8;
    v8[3] = &unk_100779CB8;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, v8);

  }
}

@end
