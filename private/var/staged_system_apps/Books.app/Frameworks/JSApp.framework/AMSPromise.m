@implementation AMSPromise

- (id)jsa_mapWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12568;
  v7[3] = &unk_9E5E0;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise thenWithBlock:](self, "thenWithBlock:", v7));

  return v5;
}

@end
