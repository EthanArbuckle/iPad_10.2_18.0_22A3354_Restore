@implementation TAVehicleCategory

+ (unint64_t)speculateTAVehicleCategoryTypeFromVehicleStateNotification:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "vehicularState");
  v5 = v4;
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      if ((objc_msgSend(v3, "vehicularHints") & 0x10) != 0)
      {
        v5 = 2;
      }
      else if (objc_msgSend(v3, "operatorState") == 1)
      {
        v5 = 3;
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (unint64_t)speculateTAVehicleCategoryTypeFromGeoNavigationNotification:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "navState") == 2)
    v4 = 2 * (objc_msgSend(v3, "transportType") == 0);
  else
    v4 = 0;

  return v4;
}

- (TAVehicleCategory)initWithVehicleCategoryType:(unint64_t)a3 andDate:(id)a4
{
  id v6;
  TAVehicleCategory *v7;
  TAVehicleCategory *v8;
  uint64_t v9;
  NSDate *date;
  TAVehicleCategory *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAVehicleCategory;
  v7 = -[TAVehicleCategory init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_vehicleCategoryType = a3;
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

  }
  v11 = v8;
LABEL_6:

  return v11;
}

- (TAVehicleCategory)initWithTAVehicularStateNotification:(id)a3
{
  id v4;
  TAVehicleCategory *v5;
  void *v6;
  uint64_t v7;
  NSDate *date;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAVehicleCategory;
  v5 = -[TAVehicleCategory init](&v10, sel_init);
  if (v5)
  {
    v5->_vehicleCategoryType = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromVehicleStateNotification:](TAVehicleCategory, "speculateTAVehicleCategoryTypeFromVehicleStateNotification:", v4);
    objc_msgSend(v4, "getDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v7;

  }
  return v5;
}

- (TAVehicleCategory)initWithTAGeoNavigationNotification:(id)a3
{
  id v4;
  TAVehicleCategory *v5;
  void *v6;
  uint64_t v7;
  NSDate *date;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAVehicleCategory;
  v5 = -[TAVehicleCategory init](&v10, sel_init);
  if (v5)
  {
    v5->_vehicleCategoryType = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromGeoNavigationNotification:](TAVehicleCategory, "speculateTAVehicleCategoryTypeFromGeoNavigationNotification:", v4);
    objc_msgSend(v4, "getDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v7;

  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)vehicleCategoryType
{
  return self->_vehicleCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
