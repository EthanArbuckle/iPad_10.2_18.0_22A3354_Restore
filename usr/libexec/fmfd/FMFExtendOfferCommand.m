@implementation FMFExtendOfferCommand

- (FMFExtendOfferCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMFExtendOfferCommand *v13;
  FMFExtendOfferCommand *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFExtendOfferCommand;
  v13 = -[FMFBaseCmd initWithClientSession:](&v16, "initWithClientSession:", a3);
  v14 = v13;
  if (v13)
  {
    -[FMFExtendOfferCommand setHandles:](v13, "setHandles:", v10);
    -[FMFExtendOfferCommand setExpiresDate:](v14, "setExpiresDate:", v12);
    -[FMFBaseCmd setGroupId:](v14, "setGroupId:", v11);
  }

  return v14;
}

- (id)pathSuffix
{
  return CFSTR("extendOffer");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMFExtendOfferCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v13, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFExtendOfferCommand expiresDate](self, "expiresDate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFExtendOfferCommand expiresDate](self, "expiresDate"));
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 * 1000.0));

  }
  else
  {
    v8 = &off_1000A0F48;
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("expires"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFExtendOfferCommand handleIdentifiers](self, "handleIdentifiers"));
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("handles"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("groupId"));

  return v4;
}

- (id)handleIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFExtendOfferCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("identifier")));

  return v3;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)expiresDate
{
  return self->_expiresDate;
}

- (void)setExpiresDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresDate, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end
