@implementation RideBookingRideOption

- (INRideOption)intentsRideOption
{
  return (INRideOption *)objc_getAssociatedObject(self, &unk_100E39470);
}

- (void)setIntentsRideOption:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E39470, value, (void *)3);

}

- (RideBookingRideOption)initWithApplication:(id)a3 optionName:(id)a4 paymentMethods:(id)a5 estimatedPickupDate:(id)a6 passengersChoice:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RideBookingRideOption *v17;
  NSString *v18;
  NSString *name;
  double v20;
  uint64_t v21;
  NSNumber *etaMinutes;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RideBookingRideOption;
  v17 = -[RideBookingRideOption init](&v24, "init");
  if (v17)
  {
    v18 = (NSString *)objc_msgSend(v13, "copy");
    name = v17->_name;
    v17->_name = v18;

    objc_storeWeak((id *)&v17->_application, v12);
    if (v15)
    {
      objc_msgSend(v15, "timeIntervalSinceNow");
      v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", vcvtpd_u64_f64(v20 / 60.0)));
      etaMinutes = v17->_etaMinutes;
      v17->_etaMinutes = (NSNumber *)v21;

    }
    objc_storeStrong((id *)&v17->_paymentMethods, a5);
    objc_storeStrong((id *)&v17->_passengerChoices, a7);
  }

  return v17;
}

- (id)description
{
  NSString *name;
  id WeakRetained;
  void *v5;

  name = self->_name;
  WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@\nApplication: %@\nPayment Methods: %@\nPassenger Choices: %@\nETA: %@ Minutes"), name, WeakRetained, self->_paymentMethods, self->_passengerChoices, self->_etaMinutes));

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSArray)passengerChoices
{
  return self->_passengerChoices;
}

- (RideBookingApplication)application
{
  return (RideBookingApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSNumber)etaMinutes
{
  return self->_etaMinutes;
}

- (void)setEtaMinutes:(id)a3
{
  objc_storeStrong((id *)&self->_etaMinutes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaMinutes, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_passengerChoices, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (UIImage)iconImage
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption application](self, "application"));
  v4 = objc_opt_class(RideBookingApplication);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption application](self, "application"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iconWithFormat:", 0));

  }
  else
  {
    v7 = 0;
  }
  return (UIImage *)v7;
}

- (NSString)selectionCommandTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userActivityForBookingInApplication"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Open [Ridesharing]");
  else
    v6 = CFSTR("Next [Ridesharing]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return (NSString *)v7;
}

- (NSString)detailedDescription
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "availablePartySizeOptions"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8);
        v11 = (char *)objc_msgSend(v9, "unsignedIntegerValue");
        v12 = (char *)objc_msgSend(v10, "partySizeRange");
        objc_msgSend(v10, "partySizeRange");
        if (v11 <= &v12[v13])
        {
          v15 = (char *)objc_msgSend(v10, "partySizeRange");
          objc_msgSend(v10, "partySizeRange");
          v14 = &v15[v16];
        }
        else
        {
          v14 = (char *)objc_msgSend(v9, "unsignedIntegerValue");
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));

        v8 = (char *)v8 + 1;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption etaMinutes](self, "etaMinutes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingETA:partySize:](NSString, "_maps_ridesharingETA:partySize:", v17, v6));

  return (NSString *)v18;
}

- (NSString)priceRange
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "usesMeteredFare"));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Metered fare [Ridesharing]"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "priceRange"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_formattedStringWithDefaultShortFormatStrings"));
    v10 = (void *)v9;
    v11 = &stru_1011EB268;
    if (v9)
      v11 = (__CFString *)v9;
    v7 = v11;

  }
  return (NSString *)v7;
}

- (NSString)partySizeSelectionPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "availablePartySizeOptionsSelectionPrompt"));

  return (NSString *)v3;
}

- (RidesharingSpecialPricingBadge)specialPricingBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RidesharingSpecialPricingBadge *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy imageCache](RideBookingAccessProxy, "imageCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "specialPricingBadgeImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForKey:", v6));

  v8 = -[RidesharingSpecialPricingBadge initWithTemplateImage:]([RidesharingSpecialPricingBadge alloc], "initWithTemplateImage:", v7);
  return v8;
}

- (NSUserActivity)userActivityForBookingInApplication
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOption intentsRideOption](self, "intentsRideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userActivityForBookingInApplication"));

  return (NSUserActivity *)v3;
}

@end
