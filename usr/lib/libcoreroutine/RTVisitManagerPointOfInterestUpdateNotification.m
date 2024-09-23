@implementation RTVisitManagerPointOfInterestUpdateNotification

- (RTVisitManagerPointOfInterestUpdateNotification)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlaceInference_);
}

- (RTVisitManagerPointOfInterestUpdateNotification)initWithPlaceInference:(id)a3
{
  id v4;
  NSObject *v5;
  RTVisitManagerPointOfInterestUpdateNotification *v6;
  uint64_t v7;
  RTPlaceInference *placeInference;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTVisitManagerPointOfInterestUpdateNotification initWithPlaceInference:]";
      v13 = 1024;
      v14 = 142;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInference (in %s:%d)", buf, 0x12u);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)RTVisitManagerPointOfInterestUpdateNotification;
  v6 = -[RTNotification init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    placeInference = v6->_placeInference;
    v6->_placeInference = (RTPlaceInference *)v7;

  }
  return v6;
}

- (RTPlaceInference)placeInference
{
  return self->_placeInference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInference, 0);
}

@end
