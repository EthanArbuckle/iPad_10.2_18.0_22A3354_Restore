@implementation RideBookingPaymentMethod

- (INPaymentMethod)intentsPaymentMethod
{
  return (INPaymentMethod *)objc_getAssociatedObject(self, &unk_100E35168);
}

- (void)setIntentsPaymentMethod:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E35168, value, (void *)3);

}

- (UIImage)icon
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_imageNamed:](UIImage, "_mapkit_imageNamed:", CFSTR("apple-pay")));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy imageCache](RideBookingAccessProxy, "imageCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "icon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageForKey:", v9));

  }
  return (UIImage *)v5;
}

- (NSString)title
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Apple Pay"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  }
  v7 = (void *)v6;

  return (NSString *)v7;
}

- (NSString)subtitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)8)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPaymentMethod intentsPaymentMethod](self, "intentsPaymentMethod"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identificationHint"));

  }
  return (NSString *)v5;
}

@end
