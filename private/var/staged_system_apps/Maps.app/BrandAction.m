@implementation BrandAction

- (BrandAction)initWithName:(id)a3 muid:(unint64_t)a4
{
  id v6;
  BrandAction *v7;
  BrandAction *v8;
  NSString *v9;
  NSString *brandName;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BrandAction;
  v7 = -[BrandAction init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_brandMUID = a4;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    brandName = v8->_brandName;
    v8->_brandName = v9;

  }
  return v8;
}

- (void)resolveBrandPOIsWithTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForSearchPoisForBrandMUID:traits:", -[BrandAction brandMUID](self, "brandMUID"), v7));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100459778;
  v11[3] = &unk_1011ADA50;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "submitWithHandler:networkActivity:", v11, 0);

}

- (int)analyticsLaunchActionType
{
  return 5;
}

- (unint64_t)brandMUID
{
  return self->_brandMUID;
}

- (void)setBrandMUID:(unint64_t)a3
{
  self->_brandMUID = a3;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (void)setBrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandName, 0);
}

@end
