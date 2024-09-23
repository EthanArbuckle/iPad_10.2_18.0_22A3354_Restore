@implementation PresentFlyoverAction

- (PresentFlyoverAction)initWithAnnouncement:(id)a3 muid:(unint64_t)a4
{
  PresentFlyoverAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PresentFlyoverAction;
  result = -[PresentAnnouncementAction initWithAnnouncement:](&v6, "initWithAnnouncement:", a3);
  if (result)
    result->_muid = a4;
  return result;
}

- (void)resolveFlyoverWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PresentAnnouncementAction announcement](self, "announcement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userMessage"));

  v7 = -[PresentFlyoverAction muid](self, "muid");
  v8 = objc_alloc((Class)MKMapItemIdentifier);
  v9 = objc_msgSend(v8, "initWithMUID:resultProviderID:coordinate:", v7, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v17 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForIdentifiers:traits:", v11, 0));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10078455C;
    v13[3] = &unk_1011C6490;
    v14 = v6;
    v16 = v7;
    v15 = v4;
    objc_msgSend(v12, "submitWithHandler:networkActivity:", v13, 0);

  }
}

- (int)analyticsLaunchActionType
{
  return 16;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

@end
