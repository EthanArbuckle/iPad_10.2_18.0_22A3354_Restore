@implementation CARSessionConfiguration

- (CARScreenInfo)_maps_primaryScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_displayID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionConfiguration screens](self, "screens"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C19F94;
  v11[3] = &unk_1011BDE90;
  v12 = v5;
  v7 = v5;
  v8 = sub_10039E1FC(v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (CARScreenInfo *)v9;
}

@end
