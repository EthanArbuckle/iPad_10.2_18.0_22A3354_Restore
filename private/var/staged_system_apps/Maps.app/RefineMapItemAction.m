@implementation RefineMapItemAction

- (RefineMapItemAction)initWithMapItem:(id)a3
{
  id v5;
  RefineMapItemAction *v6;
  RefineMapItemAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RefineMapItemAction;
  v6 = -[RefineMapItemAction init](&v9, "init");
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
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RefineMapItemAction originalMapItem](self, "originalMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForMapItemToRefine:traits:", v8, v7));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100C2B5E4;
  v13[3] = &unk_1011ADA50;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v10, "submitWithHandler:networkActivity:", v13, 0);

}

- (int)analyticsLaunchActionType
{
  return 23;
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
