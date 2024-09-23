@implementation ResolveMUIDAction

- (ResolveMUIDAction)initWithBusinessID:(id)a3 contentProvider:(id)a4
{
  id v7;
  id v8;
  ResolveMUIDAction *v9;
  ResolveMUIDAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ResolveMUIDAction;
  v9 = -[ResolveMUIDAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_businessID, a3);
    objc_storeStrong((id *)&v10->_contentProvider, a4);
  }

  return v10;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResolveMUIDAction businessID](self, "businessID"));

  if (v8)
  {
    v9 = objc_alloc((Class)MKMapItemIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResolveMUIDAction businessID](self, "businessID"));
    v11 = objc_msgSend(v10, "longLongValue");
    v12 = objc_msgSend(v9, "initWithMUID:resultProviderID:coordinate:", v11, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v19 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ResolveMUIDAction contentProvider](self, "contentProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", v14, 0, v15, v6));

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100BE3144;
      v17[3] = &unk_1011AE268;
      v18 = v7;
      objc_msgSend(v16, "submitWithHandler:networkActivity:", v17, 0);

    }
    else if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 25;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
}

@end
