@implementation ForwardGeocodeAction

- (ForwardGeocodeAction)initWithMapItem:(id)a3
{
  id v5;
  ForwardGeocodeAction *v6;
  ForwardGeocodeAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ForwardGeocodeAction;
  v6 = -[ForwardGeocodeAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originalMapItem, a3);

  return v7;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForwardGeocodeAction originalMapItem](self, "originalMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "singleLineAddress"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForForwardGeocodeString:traits:", v11, v7));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BD24C8;
  v15[3] = &unk_1011ADA50;
  v16 = v8;
  v17 = v6;
  v13 = v6;
  v14 = v8;
  objc_msgSend(v12, "submitWithHandler:networkActivity:", v15, 0);

}

- (int)analyticsLaunchActionType
{
  return 9;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (void)setOriginalMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMapItem, 0);
}

@end
