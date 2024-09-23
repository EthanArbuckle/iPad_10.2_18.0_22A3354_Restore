@implementation MTEpisodeActionFactory

+ (id)playNextAction
{
  void *v2;
  IMAction *v3;
  void *v4;
  void *v5;
  IMAction *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UpNext")));
  v3 = [IMAction alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Play Next"), &stru_1004C6D40, 0));
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_1004A8328);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_1004A8368);

  return v6;
}

+ (id)addToUpNextAction
{
  void *v2;
  IMAction *v3;
  void *v4;
  void *v5;
  IMAction *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UpNext")));
  v3 = [IMAction alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Play Last"), &stru_1004C6D40, 0));
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_1004A8388);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_1004A83A8);

  return v6;
}

+ (id)removeFromUpNext
{
  void *v2;
  IMAction *v3;
  void *v4;
  void *v5;
  IMAction *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UpNext")));
  v3 = [IMAction alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_QUEUE"), &stru_1004C6D40, 0));
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_1004A83C8);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_1004A83E8);

  return v6;
}

+ (id)markUnplayedAction
{
  IMDynamicTitleAction *v2;

  v2 = objc_opt_new(IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_1004A8428);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_1004A8448);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_1004A8468);
  return v2;
}

+ (id)markPlayedAction
{
  IMDynamicTitleAction *v2;

  v2 = objc_opt_new(IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_1004A8488);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_1004A84A8);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_1004A84C8);
  return v2;
}

+ (id)viewAction
{
  IMAction *v2;
  void *v3;
  void *v4;
  IMAction *v5;

  v2 = [IMAction alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VIEW_DOCUMENT"), &stru_1004C6D40, 0));
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1004A84E8);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_1004A8508);
  return v5;
}

+ (id)shareAction
{
  IMPopoverAction *v2;
  void *v3;
  void *v4;
  IMPopoverAction *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v2 = [IMPopoverAction alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Share Episode"), &stru_1004C6D40, 0));
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1004A8528);
  -[IMAction setButtonItemBlock:](v5, "setButtonItemBlock:", &stru_1004A8568);
  objc_initWeak(&location, v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008A5AC;
  v7[3] = &unk_1004A8590;
  objc_copyWeak(&v8, &location);
  -[IMAction setActionBlock:](v5, "setActionBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

@end
