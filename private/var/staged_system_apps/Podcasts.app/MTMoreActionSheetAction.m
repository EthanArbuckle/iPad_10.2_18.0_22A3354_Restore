@implementation MTMoreActionSheetAction

+ (id)action
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (MTMoreActionSheetAction)init
{
  void *v3;
  void *v4;
  MTMoreActionSheetAction *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MORE_ACTIONS"), &stru_1004C6D40, 0));
  v12.receiver = self;
  v12.super_class = (Class)MTMoreActionSheetAction;
  v5 = -[IMAction initWithTitle:icon:](&v12, "initWithTitle:icon:", v4, 0);

  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004DB00;
    v9[3] = &unk_1004A6108;
    objc_copyWeak(&v10, &location);
    -[IMAction setActionBlock:](v5, "setActionBlock:", v9);
    -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1004A6148);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004DB84;
    v7[3] = &unk_1004A6170;
    objc_copyWeak(&v8, &location);
    -[IMAction setButtonBlock:](v5, "setButtonBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

+ (id)moreIcon
{
  if (qword_100567248 != -1)
    dispatch_once(&qword_100567248, &stru_1004A61B0);
  return (id)qword_100567240;
}

@end
