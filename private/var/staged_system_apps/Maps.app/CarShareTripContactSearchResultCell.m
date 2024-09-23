@implementation CarShareTripContactSearchResultCell

- (void)setSharingHandle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarShareTripContactSearchResultCell;
  -[CarShareTripContactCell setSharingHandle:](&v4, "setSharingHandle:", a3);
  if (!-[CarShareTripContactCell sharingState](self, "sharingState"))
    -[CarShareTripContactCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
}

- (id)_contactNameStringFromContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v4, 0));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
  v6 = (void *)v5;

  return v6;
}

- (id)_subtitleString
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarShareTripContactSearchResultCell;
  v3 = -[CarShareTripContactCell _subtitleString](&v10, "_subtitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CarShareTripContactCell sharingState](self, "sharingState"))
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell sharingHandle](self, "sharingHandle"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell sharingHandle](self, "sharingHandle"));
      objc_msgSend(v6, "addObject:", v8);

    }
    if (v4)
      objc_msgSend(v6, "addObject:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" • ")));

  }
  return v5;
}

- (void)configureWithMSPSharedTripContact:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CarShareTripContactCell setContactValue:](self, "setContactValue:", v4);
  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactSearchResultCell;
  -[CarShareTripContactCell configureWithMSPSharedTripContact:](&v5, "configureWithMSPSharedTripContact:", v4);

}

@end
