@implementation BMBaseDonor

- (BMBaseDonor)initWithType:(id)a3
{
  id v4;
  BMBaseDonor *v5;
  _TtC19EngagementCollector9BaseDonor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMBaseDonor;
  v5 = -[BMBaseDonor init](&v8, "init");
  if (v5)
  {
    v6 = -[BaseDonor initWithType:]([_TtC19EngagementCollector9BaseDonor alloc], "initWithType:", v4);
    -[BMBaseDonor setDonor:](v5, "setDonor:", v6);

  }
  return v5;
}

- (NSString)type
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "type"));

  return (NSString *)v3;
}

- (NSArray)eventConfigurations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "eventConfigurations"));

  return (NSArray *)v3;
}

- (void)setType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v5, "setType:", v4);

}

- (void)setEventConfigurations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v5, "setEventConfigurations:", v4);

}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v11, "donateWithConfiguration:context:donationCompleteBlock:", v10, v9, v8);

}

- (void)addDonorObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v5, "addDonorObserver:", v4);

}

- (void)removeDonorObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v5, "removeDonorObserver:", v4);

}

- (BOOL)isObservedBy:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  v6 = objc_msgSend(v5, "isObservedBy:", v4);

  return v6;
}

- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BMBaseDonor donor](self, "donor"));
  objc_msgSend(v6, "propertyDidChange:propertyConfiguration:", self, v5);

}

- (_TtC19EngagementCollector9BaseDonor)donor
{
  return self->_donor;
}

- (void)setDonor:(id)a3
{
  objc_storeStrong((id *)&self->_donor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donor, 0);
}

@end
