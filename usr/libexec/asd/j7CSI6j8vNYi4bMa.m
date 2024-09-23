@implementation j7CSI6j8vNYi4bMa

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016428;
  block[3] = &unk_1004CE9E0;
  block[4] = a1;
  if (qword_100511578 != -1)
    dispatch_once(&qword_100511578, block);
  return (id)qword_100511570;
}

- (j7CSI6j8vNYi4bMa)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)j7CSI6j8vNYi4bMa;
  return -[j7CSI6j8vNYi4bMa init](&v3, "init");
}

- (id)email
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_primaryEmail"));

  return v4;
}

@end
