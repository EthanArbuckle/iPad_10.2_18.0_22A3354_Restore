@implementation RTPinnedPlace

- (RTPinnedPlace)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_mapItem_);
}

- (RTPinnedPlace)initWithType:(unint64_t)a3 mapItem:(id)a4
{
  id v7;
  RTPinnedPlace *v8;
  RTPinnedPlace *v9;
  RTPinnedPlace *v10;
  NSObject *v11;
  const char *v12;
  objc_super v14;
  uint8_t buf[16];

  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v10 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: mapItem";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_9;
  }
  if (a3 >= 5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: (type >= RTLearnedPlaceTypeUnknown && type <= RTLearnedPlaceTypeGym)";
    goto LABEL_12;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTPinnedPlace;
  v8 = -[RTPinnedPlace init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_mapItem, a4);
  }
  self = v9;
  v10 = self;
LABEL_10:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "placeTypeToString:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type, %@, mapItem, %@"), v4, self->_mapItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
