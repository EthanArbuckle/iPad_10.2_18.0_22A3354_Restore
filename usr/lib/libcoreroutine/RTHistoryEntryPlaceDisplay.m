@implementation RTHistoryEntryPlaceDisplay

- (RTHistoryEntryPlaceDisplay)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_usageDate_location_mapItem_);
}

- (RTHistoryEntryPlaceDisplay)initWithIdentifier:(id)a3 usageDate:(id)a4 location:(id)a5 mapItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RTHistoryEntryPlaceDisplay *v15;
  uint64_t v16;
  NSUUID *identifier;
  uint64_t v18;
  NSDate *usageDate;
  RTHistoryEntryPlaceDisplay *v20;
  NSObject *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTHistoryEntryPlaceDisplay initWithIdentifier:usageDate:location:mapItem:]";
      v27 = 1024;
      v28 = 31;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    if (v14)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTHistoryEntryPlaceDisplay initWithIdentifier:usageDate:location:mapItem:]";
      v27 = 1024;
      v28 = 32;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTHistoryEntryPlaceDisplay;
  v15 = -[RTHistoryEntryPlaceDisplay init](&v24, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v16;

    v18 = objc_msgSend(v11, "copy");
    usageDate = v15->_usageDate;
    v15->_usageDate = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_location, a5);
    objc_storeStrong((id *)&v15->_mapItem, a6);
  }
  self = v15;
  v20 = self;
LABEL_13:

  return v20;
}

- (id)description
{
  void *v3;
  NSUUID *identifier;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  -[NSDate stringFromDate](self->_usageDate, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, usageDate, %@, location, %@, mapItem, %@"), identifier, v5, self->_location, self->_mapItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (RTLocation)location
{
  return self->_location;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_usageDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
