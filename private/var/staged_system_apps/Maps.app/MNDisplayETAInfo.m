@implementation MNDisplayETAInfo

- (void)enumerateLegsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNDisplayETAInfo legInfos](self, "legInfos"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006A9BF4;
  v7[3] = &unk_1011C0020;
  v9 = v10;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

@end
